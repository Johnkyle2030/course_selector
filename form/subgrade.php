<?php


$host = 'localhost';
$dbname = 'course_selector';
$username = 'root';
$password = ''; // Update with your actual password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Check if form submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Check if all grade fields are set and not empty
        if (isset($_POST['english_grade']) && !empty($_POST['english_grade']) &&
            isset($_POST['math_grade']) && !empty($_POST['math_grade']) &&
            isset($_POST['kiswahili_grade']) && !empty($_POST['kiswahili_grade']) &&
            isset($_POST['physics_grade']) && !empty($_POST['physics_grade']) &&
            isset($_POST['chemistry_grade']) && !empty($_POST['chemistry_grade']) &&
            isset($_POST['biology_grade']) && !empty($_POST['biology_grade']) &&
            isset($_POST['history_grade']) && !empty($_POST['history_grade']) &&
            isset($_POST['geography_grade']) && !empty($_POST['geography_grade']) &&
            isset($_POST['cre_grade']) && !empty($_POST['cre_grade'])) {

                if (!empty($_POST['coursePreferences'])) {
                    $coursePreferences = json_decode(htmlspecialchars_decode($_POST['coursePreferences']), true);
                    echo "<p>Your Course Preferences are:</p><ul>";
                    foreach ($coursePreferences as $preference) {
                        echo "<li>" . htmlspecialchars($preference) . "</li>";
                    }
                    echo "</ul>";
                } else {
                    echo "<p>No course preference found for your interests or hobby.</p>";
                }
                // Convert user input grades to grade points
            $grade_points = [
                'A' => 12,
                'A-' => 11,
                'A+'=> 13,
                'B+' => 10,
                'B' => 8,
                'B-' => 7,
                'C+' => 6,
                'C' => 4,
                'C-' => 3,
                'D' => 2,
                'E' => 0,
            ];

            $english_grade = $grade_points[$_POST['english_grade']];
            $math_grade = $grade_points[$_POST['math_grade']];
            $kiswahili_grade = $grade_points[$_POST['kiswahili_grade']];
            $physics_grade = $grade_points[$_POST['physics_grade']];
            $chemistry_grade = $grade_points[$_POST['chemistry_grade']];

            // Calculate the sum of points for the four cluster subjects
            $sum_of_points = $english_grade + $math_grade + $kiswahili_grade + $physics_grade;

            // Constants for maximum points and grade points
            $max_points = 48;
            $max_grade_points = 84;

            // Calculate the total score
            $total_score = $sum_of_points / $max_points;

            // Calculate the weighted cluster points
            $weighted_cluster_points = sqrt($total_score * ($max_grade_points / $max_points)) * 48;

            // Determine the cluster based on the weighted cluster points
           
if ($weighted_cluster_points >= 45) {
    $cluster = "Cluster 1 - Law and Related Fields";
} elseif ($weighted_cluster_points >= 44) {
    $cluster = "Cluster 2 - Business and Related Fields";
} elseif ($weighted_cluster_points >= 43) {
    $cluster = "Cluster 3 - Engineering and Technology";
} elseif ($weighted_cluster_points >= 42) {
    $cluster = "Cluster 4 - Medicine and Health Sciences";
} elseif ($weighted_cluster_points >= 41) {
    $cluster = "Cluster 5 - Architecture and Design";
} elseif ($weighted_cluster_points >= 40) {
    $cluster = "Cluster 6 - Computer Science and IT";
} elseif ($weighted_cluster_points >= 39) {
    $cluster = "Cluster 7 - Education and Teaching";
} elseif ($weighted_cluster_points >= 38) {
    $cluster = "Cluster 8 - Social Sciences";
} elseif ($weighted_cluster_points >= 37) {
    $cluster = "Cluster 9 - Natural Sciences";
} elseif ($weighted_cluster_points >= 36) {
    $cluster = "Cluster 10 - Agriculture and Environmental Studies";
} elseif ($weighted_cluster_points >= 35) {
    $cluster = "Cluster 11 - Arts and Performing Arts";
} elseif ($weighted_cluster_points >= 34) {
    $cluster = "Cluster 12 - Hospitality and Tourism";
} elseif ($weighted_cluster_points >= 33) {
    $cluster = "Cluster 13 - Media and Communication";
} elseif ($weighted_cluster_points >= 32) {
    $cluster = "Cluster 14 - Sports Sciences";
} else {
    $cluster = "Cluster 15 - General Studies";
}

// Example recommendation based on the cluster
if ($cluster === "Cluster 1 - Law and Related Fields") {
    $recommended_course = "Bachelor of Laws (LL.B.)";
} elseif ($cluster === "Cluster 2 - Business and Related Fields") {
    $recommended_course = "Business Administration";
} elseif ($cluster === "Cluster 3 - Engineering and Technology") {
    $recommended_course = "Engineering";
} elseif ($cluster === "Cluster 4 - Medicine and Health Sciences") {
    $recommended_course = "Medicine";
} elseif ($cluster === "Cluster 5 - Architecture and Design") {
    $recommended_course = "Architecture";
} elseif ($cluster === "Cluster 6 - Computer Science and IT") {
    $recommended_course = "Computer Science";
} elseif ($cluster === "Cluster 7 - Education and Teaching") {
    $recommended_course = "Teaching";
} elseif ($cluster === "Cluster 8 - Social Sciences") {
    $recommended_course = "Social Sciences";
} elseif ($cluster === "Cluster 9 - Natural Sciences") {
    $recommended_course = "Natural Sciences";
} elseif ($cluster === "Cluster 10 - Agriculture and Environmental Studies") {
    $recommended_course = "Agriculture";
} elseif ($cluster === "Cluster 11 - Arts and Performing Arts") {
    $recommended_course = "Performing Arts";
} elseif ($cluster === "Cluster 12 - Hospitality and Tourism") {
    $recommended_course = "Hospitality";
} elseif ($cluster === "Cluster 13 - Media and Communication") {
    $recommended_course = "Communication";
} elseif ($cluster === "Cluster 14 - Sports Sciences") {
    $recommended_course = "Sports Sciences";
} else {
    $recommended_course = "General Studies";
}
$interests = ''; 
$hobby = ''; 
// Check if the interests or hobby matches with the cluster
$matchingCluster = '';
if (stripos($interests, $cluster) !== false || stripos($hobby, $cluster) !== false) {
    $matchingCluster = $cluster;
}

$matchingCourse = '';
if (!empty($matchingCluster)) {
    
    $stmt = $pdo->prepare("SELECT recommended_course FROM course_selector WHERE cluster = ?");
    $stmt->execute([$matchingCluster]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($row) {
        $matchingCourse = $row['recommended_course'];
    }
}

            // Prepare and bind the SQL statement to insert data into the table
            $stmt = $pdo->prepare("INSERT INTO student_grades (english_grade, math_grade, kiswahili_grade, physics_grade, chemistry_grade, biology_grade, history_grade, geography_grade, cre_grade, weighted_cluster_points, cluster, recommended_course) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // Bind parameters
            $stmt->bindParam(1, $_POST['english_grade']);
            $stmt->bindParam(2, $_POST['math_grade']);
            $stmt->bindParam(3, $_POST['kiswahili_grade']);
            $stmt->bindParam(4, $_POST['physics_grade']);
            $stmt->bindParam(5, $_POST['chemistry_grade']);
            $stmt->bindParam(6, $_POST['biology_grade']);
            $stmt->bindParam(7, $_POST['history_grade']);
            $stmt->bindParam(8, $_POST['geography_grade']);
            $stmt->bindParam(9, $_POST['cre_grade']);
            $stmt->bindParam(10, $weighted_cluster_points);
            $stmt->bindParam(11, $cluster);
            $stmt->bindParam(12, $recommended_course);

            // Execute the statement
            if ($stmt->execute()) {
                echo "Grades submitted successfully!";
            } else {
                echo "Error: " . $stmt->errorInfo()[2];
            }

            // Close statement
            $stmt = null;
        } else {
            echo "Please fill in all grade fields.";
        }
    }
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
} finally 

{
    // Close the database connection
    $pdo = null;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Student Grades</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Student Grades</h1>
        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST">
            <table>
                <tr>
                    <th>Subject</th>
                    <th>Grade</th>
                </tr>
                <tr>
                    <td>English/Kiswahili</td>
                    <td><input type="text" name="english_grade"></td>
                </tr>
                <tr>
                    <td>Math</td>
                    <td><input type="text" name="math_grade"></td>
                </tr>
                
                <tr>
                  <?php  echo "<td>" . htmlspecialchars($Strengths) . "</td>";?>
                    <td><input type="text" name="physics_grade"></td>
                </tr>
                <tr>
                    <td id="dataBody"></td>
                    <td><input type="text" name="chemistry_grade"></td>
                </tr>
                <tr>
                    <td>Biology</td>
                    <td><input type="text" name="biology_grade"></td>
                </tr>
                <tr>
                    <td>History</td>
                    <td><input type="text" name="history_grade"></td>
                </tr>
                <tr>
                    <td>Geography</td>
                    <td><input type="text" name="geography_grade"></td>
                </tr>
                <tr>
                    <td>CrE</td>
                    <td><input type="text" name="cre_grade"></td>
                </tr>
            </table>
            <input type="submit" value="Submit Grades" >
        </form>
    </div>
    <?php
    if (!empty($matchingCourse)) {
        echo "<h3>Recommended Course Based on Interests or Hobby Matching with Cluster:</h3>";
        echo "<p>Your recommended course is: " . htmlspecialchars($matchingCourse) . "</p>";
    }

    if (!empty($weighted_cluster_points)) {
        echo "<h3>Weighted Cluster Points:</h3>";
        echo "<p>Cluster Points: " . htmlspecialchars($weighted_cluster_points) . "</p>";
    }
    if (!empty($recommended_course)) {
        echo "<h3>Recommended Course:</h3>";
        echo "<p>Your recommended course is: " . htmlspecialchars($recommended_course) . "</p>";
    }
    if (!empty($_POST['coursePreferences'])) {
        $coursePreferences = json_decode(htmlspecialchars_decode($_POST['coursePreferences']), true);
        echo "<p>Your Course Preferences are:</p><ul>";
        foreach ($coursePreferences as $preference) {
            echo "<li>" . htmlspecialchars($preference) . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>No course preference found for your interests or hobby.</p>";
    }

    ?>
</body>
</html>
