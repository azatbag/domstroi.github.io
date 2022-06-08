<?
require_once("php/dbconnect.php");
session_start();
if(isset($_SESSION['login'])){
	$login = $_SESSION['login'];
	$role = $_SESSION['role'];
	$userData = $connect->query("SELECT * FROM `users` WHERE `id` = '".$_SESSION['userId']."'")->fetch_assoc();
	$name = $userData['name'];
	$phone = $userData['phone'];
}
else{
	$role = 'user';
	$name = '';
	$phone = '';
}
$advert = $connect->query("SELECT * FROM `adverts` WHERE `id` = '".$_GET['id']."'")->fetch_assoc();
$pictures = $connect->query("SELECT `url` FROM `pictures` WHERE `idAdvert` = '".$advert['id']."'");
$firstPicture = $pictures->fetch_assoc();
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Объявление</title>
	<link rel="stylesheet" type="text/css" href="style/advert/uiWindows.css">
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
	<div id="supportWindow" class="supportWindow hidden">
		<div><input type="text" id="name" maxlength='20' value="<? echo $name?>" placeholder="Имя..."></div>
		<div>+7<input type="tel" id="phone" maxlength='10' size='10' value="<? echo $phone?>" pattern='[0-9]{1,10}'></div>
		<div class="btn acceptBtn" onclick="createSupportMassage(<? echo $advert['id']?>)">Отправить</div>
	</div>
	<div class="mainWindow">
		<div id="pictureWindow" class="pictures">
			<div id="selectedPic" style="background-image: url(image/<? echo $firstPicture['url']?>.jpg)"></div>
			<div>
				<?
				echo "<div class='selectedPic' style='background-image: url(image/", $firstPicture['url'],".jpg)' onclick='swicthPic($(this))'></div>";
				while($row = $pictures->fetch_assoc()){
					echo "<div style='background-image: url(image/", $row['url'],".jpg)' onclick='swicthPic($(this))'></div>";
				}?>
			</div>
		</div>
		<div class="title"><? echo $advert['name']?></div>
		<div class="type">
			<?
			if ($advert['type'] == 'new') echo 'Новая квартира';
			else if ($advert['type'] == 'second') echo 'Вторичный рынок';
			else echo 'Офис';
			?>
		</div>
		<div class="price"><? echo $advert['price']?>₽</div>
		<?
			if ($advert['type'] == 'office') echo '<div class="addressAndCapacityWindow address">', $advert['address'],'</div>';
			else echo '<div class="addressAndCapacityWindow withCapacity">
			<div class="capacity">Количество комнат: ', $advert['capacity'],'</div>
			<div class="address">', $advert['address'],'</div></div>';
			if ($role == 'user') echo "<div class='functionBtn btn acceptBtn' onclick='supportWindowManager($(this))'>Записаться на консультацию</div>";
			else if ($role == 'admin') echo "<div class='functionBtn btnSeparation'><a class=' btn acceptBtn' href='editAdvert.php?id=", $advert['id'],"'>Редактировать объявление</a>
			<div class='btn cancleBtn' onclick='deleteAdvert(", $advert['id'],")'>Удалить</div></div>";
		?>
		<div class="description"><div>Описание</div><div><? echo $advert['description']?></div></div>
	</div>
</body>
</html>
<script type="text/javascript" src="script/jquery.js"></script>
<script type="text/javascript" src="script/advert.js"></script>