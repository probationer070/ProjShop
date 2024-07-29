package com.ecom6.service.PaymentSys;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Service
public class PgApiService {
public Map<String,Object> JsonApi(String url, Map<String,String> map) {


		Map<String,Object> returnMap = new HashMap<>();

		

		OkHttpClient client = new OkHttpClient();

        // JSON 데이터를 담은 문자열

		//Map > JSON string 으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
        String jsonBody = "";
		try {

			jsonBody = objectMapper.writeValueAsString(map);

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}


        // JSON 헤더 설정
        MediaType JSON = MediaType.get("application/json; charset=utf-8");
        RequestBody requestBody = RequestBody.create(jsonBody, JSON);

        // POST 요청 생성
        Request request = new Request.Builder()
                .url(url)
                .post(requestBody)
                .build();

        try {
            // 동기적으로 POST 요청 보내기
            Response response = client.newCall(request).execute();

            returnMap = objectMapper.readValue(response.body().string(), Map.class);

        } catch (IOException e) {
            e.printStackTrace();
        }


        return returnMap;
	}


	public String getSHA256Hash(String input) throws NoSuchAlgorithmException {
        // SHA-256 해시 함수 생성
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // 입력 문자열을 바이트 배열로 변환
        byte[] bytes = md.digest(input.getBytes(StandardCharsets.UTF_8));

        // 바이트 배열을 16진수 문자열로 변환
        StringBuilder hexStringBuilder = new StringBuilder();
        for (byte b : bytes) {
            String hex = String.format("%02x", b);
            hexStringBuilder.append(hex);
        }

        return hexStringBuilder.toString();
    }
}