package MyPackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class weatherServlet
 */
@WebServlet("/weatherServlet")
public class weatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public weatherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// Api Setup
		String apiKey = "ad70d8e992594cb1d926f50443e36bd8";

		// Encode city properly
		String apiCity = URLEncoder.encode(request.getParameter("city"), "UTF-8");

		// Create correct API URL
		String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=" + apiCity + "&appid=" + apiKey
				+ "&units=metric";

		System.out.println(apiUrl); // Debug

		// API Intergration
		URL url = new URL(apiUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");

		// Reading data from network

		InputStream inputStream = connection.getInputStream();
		InputStreamReader reader = new InputStreamReader(inputStream);

		// Storing in String

		StringBuilder responseContent = new StringBuilder();

		// To take input , creating scanner object

		Scanner scanner = new Scanner(reader);

		while (scanner.hasNext()) {
			responseContent.append(scanner.nextLine());

		}
		scanner.close();

		// System.out.print(responseContent);

		// Casting data into Json

		Gson gson = new Gson();
		JsonObject jsonObject = gson.fromJson(responseContent.toString(), JsonObject.class);

		long dateTimeStamp = jsonObject.get("dt").getAsLong() * 1000;
		String date = new Date(dateTimeStamp).toString();

		double tempKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
		int tempCelcius = (int) tempKelvin;

		int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();

		double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();

		String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main")
				.getAsString();

		// Set the data as request attributes (for sending to the jsp page)

		request.setAttribute("date", date);
		request.setAttribute("city", apiCity);
		request.setAttribute("weatherCondition", weatherCondition);
		request.setAttribute("temperature", tempCelcius);
		request.setAttribute("humidity", humidity);
		request.setAttribute("windSpeed", windSpeed);
		request.setAttribute("weatherDate", responseContent.toString());

		connection.disconnect();

		// farward the request to the weather.jsp page for rendering
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

}
