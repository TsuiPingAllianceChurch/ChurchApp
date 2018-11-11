<?php
$servername = "localhost";
$username = "tpac";
$password = "Zpf3sKYQns";
$dbname = "tpac_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT user_id, name_en, `name_zh-hk`, created_date FROM User";
$result = $conn->query($sql);

if (!$result) {
    echo 'Invalid query: ' . $conn->error;
}

echo "TEST123 <br>";

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["user_id"]. " - Name: " . $row["name_en"]. " " . $row["name_zh-hk"]. " :: " . $row["created_date"] . "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>
