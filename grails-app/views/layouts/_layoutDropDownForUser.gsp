<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
            data-toggle="dropdown" aria-expanded="true">
        ${currentUser}
        <span class="caret"> </span>
    </button>

    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
        <li role="presentation"><g:link controller="home" action="editProfile">Profile</g:link></li>
        <li role="presentation"><g:link controller="login" action="logout">Logout</g:link></li>
    </ul>

</div>