<?php

include 'conn.php';

$coursePreferences = [];

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $interests = trim($_POST['interests']);
    $strengths = trim($_POST['strengths']);
    $hobby = trim($_POST['hobby']);

    // Combine interests, strengths, and hobby for a broad search
    $searchTerms = array_unique(array_filter(explode(' ', $interests . ' ' . $strengths . ' ' . $hobby))); 
    $searchConditions = [];
    foreach ($searchTerms as $term) {
        $searchConditions[] = "interest_or_hobby LIKE ?";
    }
    $searchSql = implode(' OR ', $searchConditions);

    // Prepare a select statement to find course preferences
    $selectSql = "SELECT course_preference FROM course_preferences WHERE $searchSql";
    $stmt = $pdo->prepare($selectSql);

    // Bind each term to the query
    $index = 1;
    foreach ($searchTerms as $term) {
        $stmt->bindValue($index++, "%$term%");
    }

    // Execute the select statement and fetch the results
    try {
        if ($stmt->execute()) {
            $coursePreferences = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
        } else {
            throw new PDOException("Query execution failed.");
        }
    } catch (PDOException $e) {
        die("ERROR: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course Selector DSS</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        // Function to show the output
        function showOutput() {
            var outputElement = document.getElementById('output');
            if (outputElement) {
                outputElement.style.display = 'block'; // Make the output visible
            }
        }
        
        // Check if the output should be displayed on load (e.g., when the form was submitted)
        window.onload = function() {
            <?php if ($_SERVER["REQUEST_METHOD"] == "POST") ?>
                showOutput(); // Show the output if the form was submitted
            
        };
    </script>
</head>
<body>
    <div class="container">
        <h1>Course Selection Assistant</h1>
        <form id="my form" action="" method="post" onsubmit="showOutput()">
            <label for="interests">Your Interests:</label>
            <input type="text" id="interests" name="interests" placeholder="e.g., Computer Science, Biology">

            <label for="strengths">Academic Strengths:</label>
            <input type="text" id="strength" name="strengths" placeholder="e.g., Mathematics, Chemistry">

            <label for="hobby">Hobby:</label>
            <input type="text" id="hobby" name="hobby" placeholder="e.g., Painting, Coding">

            <button type="submit">Submit</button>
        </form>
       
        <div id="output" style="display: none;"> <!-- Initially hide the output -->
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                if (!empty($coursePreferences)) {
                    echo "<p>Your Course Preferences are:</p><ul>";
                    foreach ($coursePreferences as $preference) {
                        echo "<li>" . htmlspecialchars($preference) . "</li>";
                    }
                    echo "</ul>";
                } else {
                    echo "<p>No course preference found for your interests or hobby.</p>";
                }
            }
            ?>
        </div>
    </div>
</body>
</html>
