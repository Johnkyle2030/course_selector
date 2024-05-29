<?php
session_start(); // Start the session

// Include database connection
include 'db_connect.php';

// Check if the success parameter is present in the URL
if(isset($_GET['success']) && $_GET['success'] == 1) {
    // Display the success message
    echo '<div class="message-container" style="text-align: center; margin-top: 5px;"><p style="color: green;">Course added successfully!</p></div>';
} elseif(isset($_GET['error']) && $_GET['error'] == 1) {
    // Display an error message
    echo '<div class="message-container" style="text-align: center; margin-top: 5px;"><p style="color: red;">Error adding course. Please try again.</p></div>';
}


// Check if the update_success parameter is present in the URL
if(isset($_GET['update_success']) && $_GET['update_success'] == 1) {
  
    echo '<div class="message-container" style="text-align: center; margin-top: 5px;"><p style="color: green;">updated successfully!</p></div>';
}


// Function to delete a row based on ID
function deleteRow($conn, $id) {
    $sql = "DELETE FROM student_grades WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        return false;
    }
}

// Process delete action
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['action']) && $_GET['action'] == 'delete' && isset($_GET['id'])) {
    $id = $_GET['id'];
    if (deleteRow($conn, $id)) {
      
        $_SESSION['delete_success'] = true;
       
        echo "Record deleted successfully!";
        exit(); // Stop further execution
    } else {
        echo "Error deleting record.";
        exit(); // Stop further execution
    }
}

// Fetch data for the table
$sql = "SELECT * FROM student_grades";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Page</title>
<link rel="stylesheet" href="sty.css">
<style>
    .success-message {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        margin-bottom: 10px;
    }
</style>
</head>
<body>
  <a href="Report.php" class="add-course-btn">Report Admin</a>
  <h2>Welcome, Admin!</h2>
  <h1>Check Student Cluster Point</h1>
  <?php
 
  if (isset($_SESSION['delete_success']) && $_SESSION['delete_success']) {
      echo "<div class='success-message'>Record deleted successfully!</div>";
   
      unset($_SESSION['delete_success']);
  }
  ?>
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
    <th>CrE Grade</th>
    <th>Weighted Cluster Point</th>
    <th>Cluster</th>
    <th>Recommended Course</th>
    <th>Delete</th>
    <th>Update</th>
  </tr>
  <?php
  $naturalNumber = 1; // Initialize natural number
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      echo "<tr id='row" . $row['id'] . "'>";
      echo "<td>" . $naturalNumber . "</td>"; // Display natural number
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
      echo "<td><button onclick=\"confirmDelete(" . $row['id'] . ")\" class='delete-btn'>Delete</button></td>";
      echo "<td><a href='update.php?id=" . $row['id'] . "' class='update-btn'>Update</a></td>";
      echo "</tr>";
      $naturalNumber++; // Increment natural number
    }
  } else {
    echo "<tr><td colspan='15'>No records found.</td></tr>";
  }
  $conn->close();
  ?>
</table>


  <!-- JavaScript for delete confirmation -->
  <script>
    function confirmDelete(id) {
        var confirmDelete = confirm('Are you sure you want to delete this record? Click OK to continue or Cancel to stop.');
        if (confirmDelete) {
            // Send AJAX request to delete.php for deletion
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // Check if deletion was successful
                    if (this.responseText.trim() === 'Record deleted successfully!') {
                        // Remove the deleted row from the table
                        document.getElementById('row' + id).remove();
                        // Display success message if needed
                        location.reload(); // Optional: Reload the page to reflect changes
                    } else {
                        alert('Error deleting record.');
                    }
                }
            };
            xhr.open('GET', 'alter.php?action=delete&id=' + id, true);
            xhr.send();
        }
    }
  </script>
</body>
</html>

