$(document).ready(function () {
    validateLoginForm();
    validateRegisterForm();
    $(".forget").click(function () {
        $.ajax({
            url: $(this).data("ajax-forget-url"),
            success: function (data) {
                $(".loginDetails").html(data);
            },
            error: function () {
                var errorData = "There are some errors try after Some time";
                alert(errorData);
            }
        });
    });
});


function validateRegisterForm() {
    var $form = $("#registerForm");
    $form.validate({
        rules: {
            firstName: {
                required: true
            },
            lastName: {
                required: true

            },
            username: {
                required: true
            },

            email: {
                required: true,
                email: true,
                remote: {
                    type: 'POST',
                    url: $form.attr('data-ajax-url'),
                    data: {
                        userEmail: function () {
                            return $("#email").val();
                        }
                    }
                }
            },
            password: {
                required: true,
                minlength: 6
            },
            confirmPassword: {
                required: true
            }
        },
        messages: {
            email: {
                remote: "Email id already exist"
            },
            password: {
                minlength: "Must be of atleast 6 characters"
            }
        }
    });
}
function validateLoginForm() {
    var $form = $("#loginForm");
    $form.validate({
        rules: {
            userEmail: {
                required: true,
                email: true,

                remote: {
                    type: 'POST',
                    url: $form.attr('data-ajax-url'),
                    data: {
                        userEmail: function () {
                            return $("#userEmail").val();
                        }
                    }
                }
            },
            password: {
                required: true
            }
        },
        messages: {
            userEmail: {
                remote: "Email id doesn't exist"
            }
        }
    });
}

function validateForgetForm() {
    var $form = $("#forgetForm");
    $form.validate({
        rules: {
            emailId: {
                required: true,
                email: true,

                remote: {
                    type: 'POST',
                    url: $form.attr('data-ajax-url'),
                    data: {
                        userEmail: function () {
                            return $("#emailId").val();
                        }
                    }
                }
            }
        },
        messages: {
            emailId: {
                remote: "Email id doesn't exist"
            }
        }
    });
}