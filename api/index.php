<h1>Hello Tsui Ping Alliance Church !</h1>
<h4>Attempting MySQL connection from php...</h4>
<?php
$host = 'tpac_db';
$user = 'root';
$pass = 'rootpassword';
$conn = new mysqli($host, $user, $pass);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Connected to MySQL successfully!";
?>
