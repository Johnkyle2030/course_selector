<?php
include 'conn.php';


$coursePreferences = [];

// Check if form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $mainSubject = trim($_POST['mainSubject']);
    $minorSubject = trim($_POST['minorSubject']);
    $otherSubject = trim($_POST['otherSubject']);

    // Combine subjects for search
    $searchTerms = array_unique(array_filter([$mainSubject, $minorSubject, $otherSubject])); // Remove duplicates and empty values

    if (!empty($searchTerms)) {
        $searchConditions = [];
        foreach ($searchTerms as $term) {
            $searchConditions[] = "sub1 = ? OR sub2 = ? OR sub3 = ?";
        }
        $searchSql = implode(' OR ', $searchConditions);

        // Prepare a select statement to find course preferences
        $selectSql = "SELECT course_name,cluster_name FROM cluster WHERE $searchSql";
        $stmt = $pdo->prepare($selectSql);

        // Bind each term to the query
        $index = 1;
        foreach ($searchTerms as $term) {
            $stmt->bindValue($index++, $term);
            $stmt->bindValue($index++, $term);
            $stmt->bindValue($index++, $term);
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
    } else {
        echo "No subjects selected for search.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Subject Selection Form</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container" style="max-width: 400px;">
    <h2>Subject Selection Form</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
      <div class="form-group">
        <label for="mainSubject">Enter Main Subject:</label>
        <select class="form-control" id="mainSubject" name="mainSubject">
          <option value="">Select Main Subject</option>
          <option value="Mathematics">Mathematics</option>
          <option value="English">English</option>
          <option value="Physics">Physics</option>
          <option value="Biology">Biology</option>
          <option value="Chemistry">Chemistry</option>
          <option value="History">History</option>
        </select>
      </div>
      <div class="form-group">
        <label for="minorSubject">Enter Minor Subject:</label>
        <select class="form-control" id="minorSubject" name="minorSubject">
          <option value="">Select Minor Subject</option>
          <option value="Physics">Physics</option>
          <option value="Biology">Biology</option>
          <option value="Mathematics">Mathematics</option>
          <option value="English">English</option>
          <option value="Chemistry">Chemistry</option>
          <option value="History">History</option>
        </select>
      </div>
      <div class="form-group">
        <label for="otherSubject">Enter Other Subject:</label>
        <select class="form-control" id="otherSubject" name="otherSubject">
          <option value="">Select Other Subject</option>
          <option value="Chemistry">Chemistry</option>
          <option value="History">History</option>
          <option value="Mathematics">Mathematics</option>
          <option value="English">English</option>
          <option value="Physics">Physics</option>
          <option value="Biology">Biology</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <?php
    // Display course preferences if available
    if (!empty($coursePreferences)) {
        echo "<h3>Course Preferences:</h3>";
        echo "<ul>";
        foreach ($coursePreferences as $preference) {
            echo "<li>" . htmlspecialchars($preference) . "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>No course preferences found.</p>";
    }
