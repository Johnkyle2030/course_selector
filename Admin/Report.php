<?php
include 'db_connect.php';
// Check if the success parameter is present in the URL
if(isset($_GET['success']) && $_GET['success'] == 1) {
    // Display the success message
    echo '<div class="message-container" style="text-align: center; margin-top: 5px;"><p style="color: green;">Course added successfully!</p></div>';
} elseif(isset($_GET['error']) && $_GET['error'] == 1) {
    // Display an error message
    echo '<div class="message-container" style="text-align: center; margin-top: 5px;"><p style="color: red;">Error adding course. Please try again.</p></div>';
}


// Fetch data for the report table (student_grades)
$sql_grades = "SELECT * FROM student_grades";
$result_grades = $conn->query($sql_grades);

// Fetch data for the login table
$sql_login = "SELECT * FROM login";
$result_login = $conn->query($sql_login);

$sql = "SELECT * FROM course_preferences";
$result = $conn->query($sql);

// Initialize natural number counter for student_grades
$naturalNumberGrades = 1;

// Initialize natural number counter for login table
$naturalNumberLogin = 1;
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Report</title>
<link rel="stylesheet" href="sty.css">
<a href="addcourse.php" class="add-course-btn">Add Course</a>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <h1>Admin Report</h1>

    <!-- Student Grades Table -->
    <h2>Student Grades</h2>
    <table>
        <tr>
            <th>Number</th>
            
            <th>English Grade</th>
            <th>Math Grade</th>
            <th>Kiswahili Grade</th>
            <th>Physics Grade</th>
            <th>Chemistry Grade</th>
            <th>Biology Grade</th>
            <th>History Grade</th>
            <th>Geography Grade</th>
            <th>CRE Grade</th>
            <th>Weighted Cluster Point</th>
            <th>Cluster</th>
            <th>Recommended Course</th>
        </tr>
        <?php
        if ($result_grades->num_rows > 0) {
            while ($row = $result_grades->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $naturalNumberGrades . "</td>"; // Display natural number
              
                
                echo "<td>" . $row['english_grade'] . "</td>";
                echo "<td>" . $row['math_grade'] . "</td>";
                echo "<td>" . $row['kiswahili_grade'] . "</td>";
                echo "<td>" . $row['physics_grade'] . "</td>";
                echo "<td>" . $row['chemistry_grade'] . "</td>";
                echo "<td>" . $row['biology_grade'] . "</td>";
                echo "<td>" . $row['history_grade'] . "</td>";
                echo "<td>" . $row['geography_grade'] . "</td>";
                echo "<td>" . $row['cre_grade'] . "</td>";
                echo "<td>" . $row['weighted_cluster_points'] . "</td>";
                echo "<td>" . $row['cluster'] . "</td>";
                echo "<td>" . $row['recommended_course'] . "</td>";
                echo "</tr>";
                $naturalNumberGrades++; // Increment natural number for student_grades
            }
        } else {
            echo "<tr><td colspan='15'>No records found for student grades.</td></tr>";
        }
        ?>
    </table>

    <!-- Login Table -->
    <h2>Login Details</h2>
    <table>
        <tr>
            <th>Number</th>
            <th>Student_Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>County</th>
            <th>D.O.B</th>
          
        </tr>
        <?php
        if ($result_login->num_rows > 0) {
            while ($row = $result_login->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $naturalNumberLogin . "</td>"; // Display natural number
                echo "<td>" . $row['full_name'] . "</td>";
                echo "<td>" . $row['email'] . "</td>";
                echo "<td>" . $row['phone_number'] . "</td>";
                echo "<td>" . $row['county_born'] . "</td>";
                echo "<td>" . $row['dob'] . "</td>";
                echo "</tr>";
                $naturalNumberLogin++; // Increment natural number for login table
            }
        } else {
            echo "<tr><td colspan='4'>No login details found.</td></tr>";
        }
        ?>
    </table>

    <h2>Course Preferences</h2>
    <table>
    <tr>
      <th>Number</th>
      <th>Interest/Hobby</th>
      <th>Course Preferences</th>
      
    </tr>
    <?php
      if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          echo "<tr id='row" . $row['id'] . "'>";
          echo "<td>" . $row['id'] . "</td>";
          echo "<td>" . $row['interest_or_hobby'] . "</td>";
          echo "<td>" . $row['course_preference'] . "</td>";
          
          echo "</tr>";
        }
      } else {
        echo "<tr><td colspan='5'>No records found.</td></tr>";
      }
      $conn->close();
    ?>
  </table>
    
</body>
</html>
