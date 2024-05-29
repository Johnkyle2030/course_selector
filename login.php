<?php
$servername = "localhost";
$username = "root"; // Your MySQL username
$password = ""; // Your MySQL password
$dbname = "course_selector"; // Database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$message = 'Student Login Detail or sign up'; // Message to display to the user

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = $_POST['action'] ?? '';

    if ($action == 'login') {
        if (isset($_POST['email'], $_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            // Use prepared statements for security
            $stmt = $conn->prepare("SELECT id, password FROM login WHERE email = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($row = $result->fetch_assoc()) {
                if (password_verify($password, $row['password'])) {
                    header('Location: form/test.php'); // Redirect to home page or dashboard
                    exit;
                } else {
                    $message = "Invalid login credentials.";
                }
            } else {
                $message = "Invalid login credentials.";
            }
        } else {
            $message = "Email and password must be provided.";
        }
    } elseif ($action == 'signup') {
        if (isset($_POST['email'], $_POST['password'], $_POST['full_name'], $_POST['phone_number'], $_POST['dob'], $_POST['county_born'])) {
            $full_name = $_POST['full_name'];
            $email = $_POST['email'];
            $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
            $phone_number = $_POST['phone_number'];
            $dob = $_POST['dob'];
            $county_born = $_POST['county_born'];

            // Check if the email already exists
            $checkEmail = $conn->prepare("SELECT email FROM login WHERE email = ?");
            $checkEmail->bind_param("s", $email);
            $checkEmail->execute();
            $checkEmail->store_result();

            if ($checkEmail->num_rows > 0) {
                $message = "";
            } else {
                // Insert user using prepared statement
                $stmt = $conn->prepare("INSERT INTO login (full_name, email, password, phone_number, dob, county_born) VALUES (?, ?, ?, ?, ?, ?)");
                $stmt->bind_param("ssssss", $full_name, $email, $password, $phone_number, $dob, $county_born);

                if ($stmt->execute()) {
                    $message = "Account created successfully. Please log in.";
                } else {
                    $message = "Error: " . $stmt->error;
                }
            }
        } else {
            $message = "All fields must be provided for signup.";
        }
    } elseif ($action == 'forgot') {
        header('Location: reset.php'); // Redirect to the reset password page
        exit;
    }
}

$conn->close();
?>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Login and Signup Form</title>
<link rel="stylesheet" href="style.css">
</head>
<style></style>
<body>
<div class="login-container">
<p> Login As Admin <a href="Admin/admin.php">click here</a></p>

    <?php if ($message): ?>
        <p><?php echo $message; ?></p>
    <?php endif; ?>

    <!-- Login Form -->
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="login-form">
        <input type="hidden" name="action" value="login">

        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>

        <a href="#" onclick="this.closest('form').action.value='forgot';this.closest('form').submit();">Forgot password?</a>

        <button type="submit">Login</button>

        <!-- Signup Link -->
        <p><a href="#" id="signup-link">Signup now</a></p>
    </form>

    <!-- Signup Form -->
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" class="signup-form" id="signup-fields" style="display: none;" onsubmit="return validateForm();">
        <input type="hidden" name="action" value="signup"> <!-- Set action to signup -->

        <input type="text" name="full_name" placeholder="Full Name">
        <input type="number" name="phone_number" placeholder="Phone Number">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <span id="password-error" style="color: red;"></span> <!-- Display password error message -->
        <input type="date" name="dob" placeholder="D.O.B">
        <input type="text" name="county_born" placeholder="County Born">

        <button type="submit">Sign Up</button>
    </form>
    
</div>

<script>
    function validatePassword(password) {
        // Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special symbol
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]|\\:;"'<,>.?/`~-]).{8,}$/;
        return passwordRegex.test(password);
    }

    function validateForm() {
        var fullNameInput = document.getElementsByName('full_name')[0].value;
        var phoneNumberInput = document.getElementsByName('phone_number')[0].value;
        var emailInput = document.getElementsByName('email')[0].value;
        var passwordInput = document.getElementById('password').value;
        var passwordError = document.getElementById('password-error');

        // Validate full name (letters only)
        if (!/^[A-Za-z ]+$/.test(fullNameInput)) {
            alert("Full Name should contain letters only.");
            return false; // Prevent form submission
        }

        // Validate phone number (only numbers)
        if (!/^\d{10}$/.test(phoneNumberInput)) {
            alert("Phone number must contain 10 digits.");
            return false; // Prevent form submission
        }

        // Validate email format
        function validateEmail() {
    var emailInput = document.getElementById('email');
    var email = emailInput.value.trim(); // Trim whitespace from the input
    
    // Regular expression pattern for valid email addresses with lowercase letters only
    var pattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
    
    if (pattern.test(email)) {
        alert('Valid email address: ' + email);
    } else {
        alert('Invalid email address. Please enter a valid email address with lowercase letters.');
    }
}
        // Validate password strength
        if (!validatePassword(passwordInput)) {
            passwordError.innerText = 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special symbol.';
            return false; // Prevent form submission
        } else {
            passwordError.innerText = ''; // Clear error message
        }

        return true; // Allow form submission
    }

    document.getElementById('signup-link').addEventListener('click', function(event) {
        event.preventDefault(); // Prevent the default anchor action
        var loginForm = document.querySelector('.login-form');
        var signupForm = document.getElementById('signup-fields');
        
        // Toggle display
        if (signupForm.style.display === 'none' || signupForm.style.display === '') {
            loginForm.style.display = 'none';
            signupForm.style.display = 'block';
        } else {
            loginForm.style.display = 'block';
            signupForm.style.display = 'none';
        }
    });
</script>




</body>
</html>
