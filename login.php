<?php
session_start();

try {
    $pdo = new PDO("mysql:host=localhost;dbname=jackduls", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Koneksi gagal: " . $e->getMessage());
}

$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input_username = $_POST['username'];
    $input_password = $_POST['password'];

    // Cek apakah user adalah admin
    $stmt = $pdo->prepare("SELECT * FROM admin WHERE adminname = ?");
    $stmt->execute([$input_username]);
    $admin = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($admin && isset($admin['password']) && is_string($admin['password'])) {
        if (password_verify($input_password, $admin['password'])) {
            // Login sebagai admin
            $_SESSION['loggedin'] = true;
            $_SESSION['adminname'] = $admin['adminname'];
            $_SESSION['role'] = 'admin';
            header("Location: ADMIN/dashboard.php");
            exit();
        }
    }

    // Jika bukan admin, cek di tabel users
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$input_username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && isset($user['password']) && is_string($user['password'])) {
        if (password_verify($input_password, $user['password'])) {
            // Login sebagai user
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $user['username'];
            $_SESSION['role'] = 'user';
            header("Location: index.php");
            exit();
        }
    }

    // Jika tidak cocok
    $error = "Username atau password salah.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px;
            text-align: center;
        }
        .login-box {
            width: 300px;
            background: white;
            padding: 30px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover { 
            background-color: #218838; 
        }
        .error { 
            color: red; 
            margin-top: 10px; 
        }
    </style>
</head>
<body>

<div class="login-box">
    <h2>Login</h2>
    <?php if (!empty($error)): ?>
        <p class="error"><?= $error ?></p>
    <?php endif; ?>
    <form method="POST">
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
    </form>
    <div style="padding-top:10px;">
        <a href="register.php">Belum Punya Akun</a>
    </div>
</div>

</body>
</html>