package com.obn.kidscafe.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Geocording {

	public static JSONObject geocording(String adrs) throws ParseException, UnsupportedEncodingException {
		String addr = URLEncoder.encode(adrs, "utf-8");
		String api = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
		StringBuffer sb = new StringBuffer();
		String x = "";
		String y = "";
		try {
			URL url = new URL(api);
			HttpsURLConnection http = (HttpsURLConnection)url.openConnection();
			http.setRequestProperty("Contetn-Type", "application/json");
			http.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "t3nlm386dg");
			http.setRequestProperty("X-NCP-APIGW-API-KEY", "JZhaUiggtD784wafqRcQFUxNN6Qc65cYmtuQ7VWn");
			http.setRequestMethod("GET");
			http.connect();
			InputStreamReader in = new InputStreamReader(http.getInputStream(),"utf-8");
			BufferedReader br = new BufferedReader(in);
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject;
			JSONObject jsonObject2;
			JSONArray jsonArray;
			
			jsonObject = (JSONObject)parser.parse(sb.toString());
			jsonArray = (JSONArray)jsonObject.get("addresses");
			for(int i = 0; i<jsonArray.size(); i++) {
				jsonObject2 = (JSONObject)jsonArray.get(i);
				if(null != jsonObject2.get("x")) {
					x = (String) jsonObject2.get("x").toString();
				}
				if(null != jsonObject2.get("y")) {
					y = (String) jsonObject2.get("y").toString();
				}
			}
			br.close();
			in.close();
			http.disconnect();
		}catch (IOException e) {
			e.printStackTrace();
		}
		JSONObject returnJson = new JSONObject();
		returnJson.put("lat", y);
		returnJson.put("lng", x);
		return returnJson;
			
			

	}

}
