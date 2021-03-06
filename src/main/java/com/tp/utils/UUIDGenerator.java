package com.tp.utils;

import java.security.SecureRandom;
import java.util.UUID;

public class UUIDGenerator {

	private static SecureRandom random = new SecureRandom();

	private UUIDGenerator() {
	}

	public static String generateUUID() {
		return UUID.randomUUID().toString();
	}

	public static String uuid2() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static long randomLong() {
		return Math.abs(random.nextLong());
	}

	public static String randomBase62(int length) {
		byte[] randomBytes = new byte[length];
		random.nextBytes(randomBytes);
		return Encodes.encodeBase62(randomBytes);
	}

}
