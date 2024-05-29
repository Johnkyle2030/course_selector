<?php
// maintain state between redirects
session_start();


$host = 'localhost'; 
$dbname = 'course_selector'; 
$usernameDB = 'root'; 
$passwordDB = ''; 

$message = ''; 
$resetSuccessful = false; 
// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['newPassword'])) {
    
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $newPassword = $_POST['newPassword']; 
    
    if (!validatePassword($newPassword)) {
        $message = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special symbol.";
    } else {
        
        $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

        try {
          
            $conn = new PDO("mysql:host=$host;dbname=$dbname", $usernameDB, $passwordDB);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            
            $sql = "UPDATE login SET password = :newPassword WHERE email = :email";
            $stmt = $conn->prepare($sql);
            
            
            $stmt->bindParam(':newPassword', $hashedPassword);
            $stmt->bindParam(':email', $email);

            
            $stmt->execute();
            if ($stmt->rowCount()) {
                $message = "Password updated successfully.";
                $resetSuccessful = true; 
            } else {
                $message = "No changes made. Please check the email provided.";
            }
        } catch (PDOException $e) {
            $message = "Error: " . $e->getMessage();
        }

        
        $conn = null;
    }
}


function validatePassword($password) {
    // Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special symbol
    $passwordRegex = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]|\\:;"\'<,>.?\/`~-]).{8,}$/';
    return preg_match($passwordRegex, $password);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
    <div class="container">
        <h1>Reset Password</h1>
        <?php 
        if ($message) {
            echo "<p>$message</p>"; 
            
            if ($resetSuccessful) {
                echo '<a href="login.php" class="button">Continue</a>';
            }
        }
        ?>
       
        <?php if (!$resetSuccessful): ?>
        <form action="reset.php" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Enter new password" required>
            <span id="password-error" style="color: red;"></span> <!-- Display password error message -->
            
            <button type="submit">Reset Password</button>
        </form>
        <?php endif; ?>
    </div>

    <script>
    // Function to validate password strength
    function validatePassword(password) {
       
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]|\\:;"'<,>.?\/`~-]).{8,}$/;
        return passwordRegex.test(password);
    }

    document.querySelector('form').addEventListener('submit', function(event) {
        var newPasswordInput = document.getElementById('newPassword');
        var passwordError = document.getElementById('password-error');

        if (!validatePassword(newPasswordInput.value)) {
            passwordError.innerText = "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special symbol.";
            event.preventDefault(); // Prevent form submission
        }
    });
    </script>
</body>
</html>
