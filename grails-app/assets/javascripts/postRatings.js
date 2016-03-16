initializeAllRating()

$(document).ready(function () {
    $(document).on("click", ".pagination-steps a", function () {
        initializeAllRating()
    });
    initializeAllRating()
});


//$(".media-body")
function initializeAllRating() {
    var self = this;
    console.log("DDDDDDDDDDDDDDD",$('.rating-divs'))
    $('.rating-divs').each(function() {
            console.log("kkkkk", $(this))
            initializeRating($(this))
        }
        //initializeRating($(this))
    );
}

function initializeRating($ratings) {
    console.log( jQuery($ratings).attr("data-avg-score"))
    $ratings.raty({
        half: true,
        click: function (score, data) {
            $.get($ratings.data('rating-url'), {rating: score})
        },
        score: $ratings.attr("data-avg-score"),
        showHalf: true,
        starHalf: "/assets/ratings/Star-Half-Full-ic.png",
        starOn: "/assets/ratings/rating1.png",
        starOff: "/assets/ratings/star_rating_empty.png"
    });
}
