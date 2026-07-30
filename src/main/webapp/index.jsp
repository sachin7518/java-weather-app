
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weather Application</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: Arial, Helvetica, sans-serif;
	background: linear-gradient(to right, #141e30, #243b55);
}

/* WEATHER CARD */
.weather-card {
	width: 340px;
	height: 420px;
	border-radius: 25px;
	padding: 30px;
	color: white;
	background: linear-gradient(190deg, #17d1a5, #4facfe, #586fae);
	background-size: 600% 600%;
	animation: gradientMove 8s ease infinite;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
	transition: transform .4s ease, box-shadow .4s ease;
}

.weather-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 30px 60px rgba(0, 0, 0, 0.7);
}

/* gradient animation */

/* SEARCH BAR */
.search-bar {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.search-bar input {
	flex: 1;
	border: none;
	padding: 12px 18px;
	border-radius: 25px;
	background: #ecf0f1;
	outline: none;
	font-size: 14px;
	margin-right: 10px;
}

.search-btn {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: none;
	background: #ecf0f1;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* WEATHER ICON */
.weather-icon {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.weather-icon img {
	width: 120px;
	animation: floatIcon 3s ease-in-out infinite;
}

/* icon floating animation */
@
keyframes floatIcon { 0%{
	transform: translateY(0px);
}

50



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


%
{
transform



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


:



	


translateY



	


(



	


-12px



	


)



	


;
}
100



	


%
{
transform



	


:



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


translateY



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


(



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


0px



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


)



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


;
}
}

/* TEMPERATURE */
.temperature {
	text-align: center;
	font-size: 70px;
	font-weight: 300;
	animation: fadeTemp 1.5s ease;
}

.city {
	text-align: center;
	font-size: 35px;
	margin-top: -10px;
}

/* temp fade animation */
@
keyframes fadeTemp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* BOTTOM INFO */
.info {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.info-box {
	display: flex;
	align-items: center;
}

.info-box i {
	font-size: 30px;
	margin-right: 10px;
}

.info-text {
	display: flex;
	flex-direction: column;
}

.info-value {
	font-size: 22px;
	font-weight: bold;
}

.info-label {
	font-size: 14px;
	opacity: 0.9;
}
</style>
</head>

<body>
	<form action="weatherServlet" method="post">

		<div class="weather-card">

			<!-- Search -->

			<div class="search-bar">

				<input type="text" name="city" placeholder="Search city">

				<button type="submit" class="search-btn">
					<i class="fa fa-search"></i>
				</button>

			</div>


			<!-- Icon -->

			<div class="weather-icon" style="display: block; text-align: center;">
				<img
					src="${pageContext.request.contextPath}/Image/${weatherCondition}.png"
					width="120">
			</div>
			<!-- Temperature -->

			<div class="temperature">${temperature }°C</div>

			<div class="city">${city}</div>


			<!-- Bottom Info -->

			<div class="info">

				<div class="info-box">

					<i class="fa-solid fa-water"></i>

					<div class="info-text">

						<div class="info-value">${humidity }%</div>
						<div class="info-label">Humidity</div>

					</div>

				</div>


				<div class="info-box">

					<i class="fa-solid fa-wind"></i>

					<div class="info-text">

						<div class="info-value">${windSpeed}m/s</div>
						<div class="info-label">Wind Speed</div>

					</div>

				</div>

			</div>
		</div>
	</form>


</body>
</html>
