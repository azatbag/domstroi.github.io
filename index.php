<?
session_start();
if(isset($_SESSION['login'])){
	$login = $_SESSION['login'];
	$role = $_SESSION['role'];
}
else $role = 'user';
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Главная</title>
	<link rel="stylesheet" type="text/css" href="style/mainPage/<? echo $role?>UiWindows.css">
	<link rel="stylesheet" type="text/css" href="style/main.css">
	<link rel="stylesheet" type="text/css" href="style/buttons.css">
</head>
<body>
<style>
body {
background: #c7b39b url(style/image/74.jpg); /* Цвет фона и путь к файлу */
background-size: 100%;
background-attachment: fixed;

}
</style>
	<header>
	<div><a href='http://domstroi.github.io'><img src="style/image/logo.png" height="60px" width="60px"></a></div>
		<div id="companyName">Dom<span>Stroi</span></div>
		<?
		if (isset($login)) echo "<div>", $login,"</div><a class='btn cancleBtn' href='php/logout.php'>Выйти</a>";
		else echo "<a class='btn acceptBtn' href='enterUser.html'>Войти</a>
		<a class='btn acceptBtn' href='registerUser.html'>Регистрация</a>";
		?>
	</header>
		<? require_once("php/".$role."/renderUi.php")?>
</body>
</html>
<script type="text/javascript" src='script/jquery.js'></script>
<script type="text/javascript" src='script/mainPage.js'></script>
<script type="text/javascript" src='script/<?echo $role?>Functional.js'></script>