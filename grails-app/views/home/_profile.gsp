<div class="panel panel-default " style="height:auto">
    <div class="panel-heading">
        <h3 class="panel-title">Profile</h3>
    </div>

    <div class="panel-body ">
        <g:form class="form" method="post" name="myForm" controller="home" action="edit" enctype="multipart/form-data">
            <label>First Name :</label>
            <g:textField name="firstName" required="true"/><br>
            <label>Last Name :</label>
            <g:textField name="lastName" required="true"/><br>
            <label>User Name :</label>
            <g:textField name="username" required="true"/><br>
            <input type="file" name="image"/><br>
            <input type="submit" value=" done"/>
        </g:form>
    </div>

</div>

<div class="panel panel-default" style="height:auto">

    <div class="panel-heading">
        <h3 class="panel-title">Change Password</h3>
    </div>

    <div class="panel-body">
        <g:form class="form" method="post" name="myForm" controller="home" action="editPassword">
            <label>Confirm Password :</label>
            <g:textField name="confirmPassword" required="true"/><br>
            <label>Password :</label>
            <g:textField name="password" required="true"/><br>
            <input type="submit" value="change"/>
        </g:form>
    </div>

</div>