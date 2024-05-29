<?php
$host = 'localhost';
$dbname = 'course_selector';
$username = 'root';
$password = '';

$coursePreferences = [];

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Check if all grade fields are set and not empty
        if (
            isset($_POST['english_grade']) && !empty($_POST['english_grade']) &&
            isset($_POST['math_grade']) && !empty($_POST['math_grade']) &&
            isset($_POST['kiswahili_grade']) && !empty($_POST['kiswahili_grade']) &&
            isset($_POST['physics_grade']) && !empty($_POST['physics_grade']) &&
            isset($_POST['chemistry_grade']) && !empty($_POST['chemistry_grade']) &&
            isset($_POST['biology_grade']) && !empty($_POST['biology_grade']) &&
            isset($_POST['history_grade']) && !empty($_POST['history_grade']) &&
            isset($_POST['geography_grade']) && !empty($_POST['geography_grade']) &&
            isset($_POST['cre_grade']) && !empty($_POST['cre_grade'])
        ) 
            // Your previous code for handling grades and course recommendations

            $grade_points = [
                'A' => 12,
                'A-' => 11,
                'A+' => 13,
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

            // First, check if the user's interests match any course preferences
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
              // Apply the recommendation logic based on cluster points and course preferences
              $recommended_courses = []; 

              // Check each search term and recommend courses 
              if (in_array("law", $searchTerms) && $weighted_cluster_points >= 45 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+' && $_POST['history_grade'] >= 'C+')) {
                  // Recommend law-related courses
                  $cluster = "Cluster 1 - Law and Related Fields";
                  $recommended_courses[] = "Bachelor of Laws (LL.B.)";
              } 
              else if (in_array("business", $searchTerms) && $weighted_cluster_points >= 44 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+' && $_POST['math_grade'] >= 'C+')) {
                  // Recommend business-related courses
                  $cluster = "Cluster 2 - Business and Related Fields";
                  $recommended_courses[] = "Bachelor Of Business Administration"; 
                  $recommended_courses[] = "Bachelor of Economics";
                  $recommended_courses[] = "Diploma in Economics";
              } 
              else if (in_array("engineering", $searchTerms) && $weighted_cluster_points >= 43 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+' && $_POST['math_grade'] >= 'C+')) {
                  // Recommend engineering-related courses
                  $cluster = "Cluster 3 - Engineering and Technology";
                  $recommended_courses[] = "Bachelor of Civil Engineering"; 
                  $recommended_courses[] = "Bachelor of Electrical Engineering"; 
                  $recommended_courses[] = "Bachelor of mechanical Engineering";
                } 
              else if (in_array("computer", $searchTerms) && $weighted_cluster_points >= 40 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+' && $_POST['math_grade'] >= 'C+')) {
                  // Recommend computer-related courses
                  $cluster = "Cluster 2 - Computer and IT";
                  $recommended_courses[] = "Bachelor Of Computer Science";
                  $recommended_courses[] = "Bachelor Of Science in Information Technology";
                  $recommended_courses[] = "Bachelor Of Software Engineering";
                  $recommended_courses[] = "Bachelor Of Business Information Technolgy";
                  $recommended_courses[] = "Bachelor Of Computer Technolgy";
              } 
              else if (in_array("gaming", $searchTerms) && $weighted_cluster_points >= 40 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+' && $_POST['math_grade'] >= 'C+')) {
                  // Recommend gaming-related courses
                  $cluster = "Cluster 2 - Computer and IT";
                  $recommended_courses[] = "Bachelor Of Computer Science";
                  $recommended_courses[] = "Bachelor Of Software Engineering";
                 
                  
              } 
              else if (in_array("painting", $searchTerms) && $weighted_cluster_points >= 38 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+')) {
                  // Recommend arts-related courses
                  $cluster = "Cluster 11 - Arts and Performing Arts";
                  $recommended_courses[] = "Bachelor of Arts and Humanities";
              } 
              else if (in_array("medicine", $searchTerms) && $weighted_cluster_points >= 42 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+' && $_POST['biology_grade'] >= 'C+')) {
                  // Recommend medicine-related courses
                  $cluster = "Cluster 5 - Medicine and Health Sciences";
                  $recommended_courses[] = "Bachelor of Nursing";
                  $recommended_courses[] = "Bachelor of Medicine";
              } 
              else if (in_array("teaching", $searchTerms) && $weighted_cluster_points >= 39 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+')) {
                  // Recommend teaching-related courses
                  $cluster = "Cluster 7 - Education and Teaching";
                  $recommended_courses[] = "Bachelor of Education Arts";
                  $recommended_courses[] = "Bachelor of Education Science";
              } 
              else if (in_array("adventure", $searchTerms) && $weighted_cluster_points >= 39 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+')) {
                  // Recommend adventure-related courses
                  $cluster = "Cluster 12 - Hospitality and Tourism";
                  $recommended_courses[] = "Bachelor of Hospitality and Tourism";
              } 
              else if (in_array("journalism", $searchTerms) && $weighted_cluster_points >= 34 && ($_POST['english_grade'] >= 'C+' || $_POST['kiswahili_grade'] >= 'C+')) {
                  // Recommend journalism-related courses
                  $cluster = "Cluster 13 - Media and Communication";
                  $recommended_courses[] = "Bachelor of Journalism and mass communication";
              } 
              else {
                  // Cluster points are below the thresholds, recommend diploma based on interests
                  if (in_array("journalism", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Education Arts";
                      $recommended_courses[] = "Diploma in Education Science";
                  }
                  if (in_array("adventure", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Hospitality and Tourism ";
                  }
                  if (in_array("teaching", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Education Arts";
                  }
                  if (in_array("medicine", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Nursing";
                      $recommended_courses[] = "Diploma in Medicine";
                  }
                  if (in_array("painting", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Arts and humanities";
                  }
                  if (in_array("gaming", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Software Engineering";
                      $recommended_courses[] = "Diploma in Computer Science";
                  }
                  if (in_array("computer", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Computer Science";
                      $recommended_courses[] = "Diploma in Software Engineering";
                      $recommended_courses[] = "Diploma in Information Communication Technology";
                      $recommended_courses[] = "Diploma in Computer Technolgy";
                  }
                  if (in_array("engineering", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Civil Engineering";
                      $recommended_courses[] = "Diploma in Electrical Engineering";
                      $recommended_courses[] = "Diploma in Mechanical Engineering";
                  }
                  if (in_array("business", $searchTerms)) {
                      $recommended_courses[] = "Diploma in Business Entrepreneurship";
                      $recommended_courses[] = "Diploma in Economics";
                  }
                  if (in_array("law", $searchTerms) && $weighted_cluster_points < 45) {
                      $recommended_courses[] = "Diploma in Law";
                  }
              }
              
              // Display recommended courses if they are set
              if (!empty($recommended_courses)) {
                  foreach ($recommended_courses as $course) {
                      // Logic to handle recommendation
                      
                  }
              } else {
                  // Display all search terms if no recommended courses found
                  foreach ($searchTerms as $term) {
                      // Logic to handle display of search terms
                      echo "Search Term: $term<br>";
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

 catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
} finally {
    // Close the database connection
    $pdo = null;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course Selector DSS</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        #position {
            position: absolute;
            bottom: -700px; /* Adjust as needed */
            left: 450px; /* Adjust as needed */
            /* Other styling properties */
        }
    </style>
    <script>
        // Function to show the output
        function showOutput() {
            var outputElement = document.getElementById('output');
            if (outputElement) {
                outputElement.style.display = 'block'; // Make the output visible
            }
        }

        // Check if the output should be displayed on load (e.g., when the form was submitted)
        window.onload = function () {
            <?php if ($_SERVER["REQUEST_METHOD"] == "POST") ?>
            showOutput(); // Show the output if the form was submitted
        };
    </script>
</head>
<body>


<div class="container">
    <h1 color="green">Course Selection Assistant</h1>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post" onsubmit="showOutput()">
        <label for="interests">Your Interests:</label>
        <input type="text" id="interests" name="interests" placeholder="e.g., Computer Science, Biology">

        <label for="strengths">Academic Strengths:</label>
        <input type="text" id="strengths" name="strengths" placeholder="e.g., Mathematics, Chemistry">

        <label for="hobby">Hobby:</label>
        <input type="text" id="hobby" name="hobby" placeholder="e.g., Painting, Coding">
        <label style="color: green;">Student Enter Your Grades Below</label>

        <label></label>
        <label for="english_grade">English Grade:</label>
        <input type="text" id="english_grade" name="english_grade">

        <label for="math_grade">Math Grade:</label>
        <input type="text" id="math_grade" name="math_grade">

        <label for="kiswahili_grade">Kiswahili Grade:</label>
        <input type="text" id="kiswahili_grade" name="kiswahili_grade">

        <label for="physics_grade">Physics Grade:</label>
        <input type="text" id="physics_grade" name="physics_grade">

        <label for="chemistry_grade">Chemistry Grade:</label>
        <input type="text" id="chemistry_grade" name="chemistry_grade">

        <label for="biology_grade">Biology Grade:</label>
        <input type="text" id="biology_grade" name="biology_grade">

        <label for="history_grade">History Grade:</label>
        <input type="text" id="history_grade" name="history_grade">

        <label for="geography_grade">Geography Grade:</label>
        <input type="text" id="geography_grade" name="geography_grade">

        <label for="cre_grade">CrE Grade:</label>
        <input type="text" id="cre_grade" name="cre_grade">

        <input type="submit" value="Submit">

    </form>

    <div id="output">
        <?php
        if (!empty($coursePreferences)) {
            echo "<p>Your Recommended Course :</p><ul>";
            foreach ($coursePreferences as $preference) {
                echo "<li>" . htmlspecialchars($preference) . "</li>";
            }
            echo "</ul>";
        }

        // Display recommended courses based on cluster points if available
        if (!empty($recommended_courses)) {
            echo "<h2>Recommended Courses:</h2>";
            echo "<ul>";
            foreach ($recommended_courses as $course) {
                echo "<li>Recommended Course: " . htmlspecialchars($course) . "</li>";
            }
            echo "</ul>";
        } else {
            echo "No recommended courses found.";
        }
        if (!empty($cluster)) {
            echo "<h3>Your Cluster is:</h3>";
            echo "<li>Cluster: " . htmlspecialchars($cluster) . "</li>";
        }
        if (!empty($weighted_cluster_points)) {
            echo "<h3>Weighted Cluster Points:</h3>";
            echo "<p>Cluster Points: " . htmlspecialchars($weighted_cluster_points) . "</p>";
        }
        ?>
    </div>
</div>
</body>
</html>



