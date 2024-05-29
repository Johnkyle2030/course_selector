<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $interest_or_hobby = $_POST['interest_or_hobby'];
    $course_preference = $_POST['course_preference'];

    $sql = "INSERT INTO course_preferences (interest_or_hobby, course_preference) VALUES ('$interest_or_hobby', '$course_preference')";

    if ($conn->query($sql) === TRUE) {
        header("Location: http://localhost/Course%20Selector/Admin/report.php?success=1");
        exit();
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<link rel="stylesheet" href="sty.css">
</head>
<body>
  
    <h1>Add Course</h1>

    <form action="" method="POST">
        <label for="interest_or_hobby">Interest/Hobby:</label>
        <input type="text" id="interest_or_hobby" name="interest_or_hobby" required><br><br>
        <label for="course_preference">Course Preference:</label>
        <input type="text" id="course_preference" name="course_preference" required><br><br>
        <input type="submit" value="Add Course">
    </form>
</body>
</html>
