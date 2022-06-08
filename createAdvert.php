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
	<title>Создание объявления</title>
	<link rel="stylesheet" type="text/css" href="style/createAdvert/uiWindows.css">
	<link rel="stylesheet" type="text/css" href="style/main.css">
	<link rel="stylesheet" type="text/css" href="style/buttons.css">
</head>
<body>
<header>
	<div><a href='http://domstroi.github.io'><img src="style/image/logo.png" height="60px" width="60px"></a></div>
		<div id="companyName">Dom<span>Stroi</span></div>
		<?
		if (isset($login)) echo "<div>", $login,"</div><a class='btn cancleBtn' href='php/logout.php'>Выйти</a>";
		else echo "<a class='btn acceptBtn' href='enterUser.html'>Войти</a>
		<a class='btn acceptBtn' href='registerUser.html'>Регистрация</a>";
		?>
	</header>
	<form class="mainWindow" method="post" action="php/admin/createAdvert.php" enctype="multipart/form-data">
		<div class="inputDataWindow">
			<div><input type="text" name="name" placeholder="Название..." maxlength="32" required></div>
			<div><input type="text" name="address" placeholder="Адрес..." maxlength="64" required></div>
			<div><input type="text" name="price" placeholder="Цена..." maxlength="10" pattern="[0-9]{1,10}" required></div>
		</div>
		<div>Тип недвижимости</div>
		<div class="type">
			<input type="radio" name="type" value="office" id="office" required><label for="office" class="btn acceptBtn">Офис</label>
			<input type="radio" name="type" value="new" id="new" required><label for="new" class="btn acceptBtn">Новая квартира</label>
			<input type="radio" name="type" value="second" id="second" required><label for="second" class="btn acceptBtn">Вторичный рынок</label>
		</div>
		<div class="blockBranching">
			<div>Фотографии</div>
			<div>Количество комнат</div>
			<div><input type="file" name="image[]" accept=".png, .jpg, .jpeg" multiple required></div>
			<div class="capacity">
				<input type="radio" name="capacity" value="1" id="one-room" required><label for="one-room" class="btn acceptBtn">1</label>
				<input type="radio" name="capacity" value="2" id="two-room" required><label for="two-room" class="btn acceptBtn">2</label>
				<input type="radio" name="capacity" value="3" id="three-room" required><label for="three-room" class="btn acceptBtn">3</label>
				<input type="radio" name="capacity" value="4" id="four-room" required><label for="four-room" class="btn acceptBtn">4</label>
			</div>
		</div>
		<div>Описание</div>
		<textarea class="description" name="description" placeholder="описание..." maxlength="512" required></textarea>
		<input class="btn acceptBtn" type="submit" value="Создать">
	</form>
</body>
</html>
<script type="text/javascript" src="script/jquery.js"></script>
<script type="text/javascript" src="script/createAdvert.js"></script>