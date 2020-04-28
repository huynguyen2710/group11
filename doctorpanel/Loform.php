<html>
<head>
<title>CI Validation LOGIN</title>
</head>
<body>

<form action="" method="post">
<div>
<label for="username">Username</label><br>
<input type="text" name="username" value="<?php echo set_value('username')?>" placeholder="Enter Username">
<?php echo form_error('username') ?>
</div>
<div>
<label for="password">Password</label><br>
<input type="password" name="password" value="" placeholder="Enter Password">
<?php echo form_error('password') ?>
</div>

<button type="login">Login</button>
</form>

</body>
</html>