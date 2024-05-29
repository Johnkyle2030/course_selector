<?php
// Start the session
session_start();

// Include database connection
include 'db_connect.php';

// Function to delete a row based on ID
function deleteRow($conn, $id) {
    $sql = "DELETE FROM student_grades WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        return true;
    } else {
        return false;
    }
}

// Process delete action and confirmation
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['action']) && $_GET['action'] == 'delete' && isset($_GET['id'])) {
    $id = $_GET['id'];
    // Prompt message for delete confirmation
    echo "<script>
    var confirmDelete = confirm('Are you sure you want to delete this record? Click OK to continue or Cancel to stop.');
    if (confirmDelete) {
        var deleteUrl = 'alter.php?action=delete_confirm&id=' + id;
        fetch(deleteUrl)
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    throw new Error('Error deleting record.');
                }
            })
            .then(data => {
                // Display success message if deletion is successful
                document.getElementById('successMessage').innerText = 'Record deleted successfully!';
                // Remove the deleted row from the table
                document.getElementById('row' + id).remove();
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
    </script>";
    exit(); // Stop further execution
}

// Process delete confirmation
if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['action']) && $_GET['action'] == 'delete_confirm' && isset($_GET['id'])) {
    $id = $_GET['id'];
    if (deleteRow($conn, $id)) {
        // Set a session variable to indicate successful deletion
        $_SESSION['delete_success'] = true;
        // Redirect back to alter.php if needed
        // header("Location: alter.php");
        // exit();
    } else {
        echo "Error deleting record.";
    }
}
?>
