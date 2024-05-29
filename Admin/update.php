<?php
include 'db_connect.php';

// Fetch data for the selected ID
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM student_grades WHERE id=$id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Record not found.";
        exit();
    }
} else {
    echo "ID parameter missing.";
    exit();
}

// Process form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $english_grade = $_POST['english_grade'];
    $math_grade = $_POST['math_grade'];
    $kiswahili_grade = $_POST['kiswahili_grade'];
    $physics_grade = $_POST['physics_grade'];
    $chemistry_grade = $_POST['chemistry_grade'];
    $biology_grade = $_POST['biology_grade'];
    $history_grade = $_POST['history_grade'];
    $geography_grade = $_POST['geography_grade'];
    $cre_grade = $_POST['cre_grade'];
    $weighted_cluster_points = $_POST['weighted_cluster_points'];
    $cluster = $_POST['cluster'];
    $recommended_course = $_POST['recommended_course'];

    $sql = "UPDATE student_grades SET english_grade='$english_grade', math_grade='$math_grade', kiswahili_grade='$kiswahili_grade', physics_grade='$physics_grade', chemistry_grade='$chemistry_grade', biology_grade='$biology_grade', history_grade='$history_grade', geography_grade='$geography_grade', cre_grade='$cre_grade', weighted_cluster_points='$weighted_cluster_points', cluster='$cluster', recommended_course='$recommended_course' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        header("Location: http://localhost/Course%20Selector/Admin/alter.php?update_success=1");
        exit();
    } else {
        echo "Error updating record: " . $conn->error;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Student Grade</title>
<link rel="stylesheet" href="sty.css">
</head>
<body>
  
    <h1>Update Student Grade</h1>

    <form action="" method="POST">
    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
    <label for="english_grade">English Grade:</label>
    <input type="text" id="english_grade" name="english_grade" value="<?php echo $row['english_grade']; ?>" required><br><br>
    <label for="math_grade">Math Grade:</label>
    <input type="text" id="math_grade" name="math_grade" value="<?php echo $row['math_grade']; ?>" required><br><br>
    <label for="kiswahili_grade">Kiswahili Grade:</label>
    <input type="text" id="kiswahili_grade" name="kiswahili_grade" value="<?php echo $row['kiswahili_grade']; ?>" required><br><br>
    <label for="physics_grade">Physics Grade:</label>
    <input type="text" id="physics_grade" name="physics_grade" value="<?php echo $row['physics_grade']; ?>" required><br><br>
    <label for="chemistry_grade">Chemistry Grade:</label>
    <input type="text" id="chemistry_grade" name="chemistry_grade" value="<?php echo $row['chemistry_grade']; ?>" required><br><br>
    <label for="biology_grade">Biology Grade:</label>
    <input type="text" id="biology_grade" name="biology_grade" value="<?php echo $row['biology_grade']; ?>" required><br><br>
    <label for="history_grade">History Grade:</label>
    <input type="text" id="history_grade" name="history_grade" value="<?php echo $row['history_grade']; ?>" required><br><br>
    <label for="geography_grade">Geography Grade:</label>
    <input type="text" id="geography_grade" name="geography_grade" value="<?php echo $row['geography_grade']; ?>" required><br><br>
    <label for="cre_grade">CrE Grade:</label>
    <input type="text" id="cre_grade" name="cre_grade" value="<?php echo $row['cre_grade']; ?>" required><br><br>
    <label for="weighted_cluster_points">Weighted Cluster Point:</label>
    <input type="text" id="weighted_cluster_points" name="weighted_cluster_points" value="<?php echo $row['weighted_cluster_points']; ?>" required><br><br>
    <label for="cluster">Cluster:</label>
    <input type="text" id="cluster" name="cluster" value="<?php echo $row['cluster']; ?>" required><br><br>
    <label for="recommended_course">Recommended Course:</label>
    <input type="text" id="recommended_course" name="recommended_course" value="<?php echo $row['recommended_course']; ?>" required><br><br>
    <input type="submit" value="Update Grade">
</form>


</body>
</html>
