<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if credentials match admin
    if ($_POST['name'] == 'admin' && $_POST['password'] == 'admin') {
        // Redirect to alter.php
        header('Location:report.php');
        exit();
    } else {
        echo '<script>alert("Invalid credentials. Please try again.");</script>';
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<link rel="stylesheet" href="sty.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Login">
                <a href="Admin/admin.php">Admin</a>
            </div>
        </form>
    </div>
</body>
</html>
