Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B0C2DA761
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030976; cv=none; b=gsf7vL7f095lcK90uFa0K4qy4oWMTCpe3f6gZtunjyYY5m7EzDsm1WqJH45DCeMCeF6fc5OsE44knx4nBF+Vn3LASc58A8M8cMxU4cAcn8A5PLOT04LO2q4bSzEKN6SHp5O7LIe2PmpcWJVAodX9xlQjtSJym0JGuw5dCWZ37Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030976; c=relaxed/simple;
	bh=I6faurzbIoxv3qYMgbdH4NSLMkzOIqpRf6fwnaEn4tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgQ9WCfBOGlvj0j7weOCZ1BgQavKhyt8UIaVwMMQzuw2clNauVlrzH7p451GYNedPefY0uumqq/LrNVngkwam5RRMchxAqHjPBHkMJJuakvoqrped7nuFWlM9FJzd1+SFRsco57VxrjyqM2W1IJWx+AJYkuX1vsCqo24swQt+Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD/jjKPz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD/jjKPz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so4639929a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030972; x=1751635772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=;
        b=dD/jjKPzNV4V/F9SglPG59Q8nNBKFpHusM304vQFUftlJT8zhQFmGJBjHYYRNBrxkN
         b3nw+4du4Ph2AB1gRC2QXffwdEtqob6e7iaQeDu3yNJ5GQWmLgappSgU0nEACy62vgLr
         r6vUR04IeVbgBqddAL6o1qDFl3sIMAOipLd4s8XhdarsUBDnmv182L8lCdC9nuwOs03y
         yX2uvRBPy8v9wLgeEpJvSe4hWOMkCw00ni5UA01GCDu0pfJNGGMg5u/3GhKTmomG9HV9
         arPNZNHlR04+VhUs/6RC2ubOau+UWo49rUwBHIhzXX1o5Uo/xmJLvDzF7KL+/5HYDe8K
         ZUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030972; x=1751635772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=;
        b=b3e8ECCzwE2+mgSNsP71csdlbMobmFAMRE0qsGzul7au7LfXsEr0zdIgCjRU1Bz+4L
         I0d5eDE/5Wa29VST0k22llkm2GNE8F+kJ08forrJsLo4kEf71gDTwZo+7ZIKLpQ8npHT
         8Jx4yfOOPAnIjB41gsuylL5SnYwMX2F0bzh/Ve19AqX+7BKcNX7rUIIAaeFdxUI8QWdk
         R6UNbYJn8vx7GP6f6i6Ew5LpLUG3cNaII4fVAerwiKybcAtbtpkR3TfJMXr22wg3YFl6
         kkLnD9ZjnqWRkQUa5fSBmTcgoP5Gbtcdnds8waKznnGJnzspF8ACHGE170M04PhdWKCY
         /MKg==
X-Forwarded-Encrypted: i=1; AJvYcCVDUNU28yzpkc5RkRV0JXii/6XjkBbYVRxUjR8+fu3fFTtn7hnA5k7hZ0J9m9k/geYdqIn6uSbG0zZAhybT/moIcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcjmPN4mvsNyq6u0muLwUq6szTjZKDaL/O85aVROsBoaaYSx2n
	60DAdjH3C72Yw5nGE9Ml7QmTpHzh2R4rdXsX5bAxaUkpI4Aay5Ro0TiE4HXsuM0Fon0=
X-Gm-Gg: ASbGnctboBWGu0r8ZePc7Iukcc/FRjxvK61DR1IzmeNqEkEZd9bBxeDAK+b7Cv/bKTl
	14EuaiMgiONWzlsAHpXBeN7SAOdbHujGhJKITAEt/CnemJtnTmEhhNFjmtAzAnc4eJ7gWzBy6d5
	edu4/7RlhCmRMdaQnb6MLTw21JAOHpnrOsTZQfDWhXFQ8sC7XmtJjdKAi2yYDAt5heR7C2Ym7J0
	HL/AGM5PH89YLqPgrwm++yIN5HpyZPmZyMZtNS0KrxkhXvew0EWQkMsY2WLiVuDMWjGTjrWEDHv
	uRwmK9+KhuCgGlIkk7KL96eGYod2AddHlcWQ8rnhyhRRPIuX7Ezslkn13d71iH2hNBRn0QejTMk
	UdgX2PfWc6wpJp/LBEZchyeXphfm+gh3LMbycQE2syCXFdA==
X-Google-Smtp-Source: AGHT+IFqqEN1CabLkuRpa4qT0ns50eEJVky5F6nDsnGYV38k/xhyp5qqKgZNhwr44qSRdsoEwoz0Ew==
X-Received: by 2002:a05:6402:3124:b0:60c:68bc:7fca with SMTP id 4fb4d7f45d1cf-60c88e72e9bmr2087602a12.27.1751030972308;
        Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:30 +0100
Subject: [PATCH 1/3] arm64: defconfig: enable Samsung PMIC over ACPM
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Enable the Samsung s2mpg1x driver as this is used by the gs101-oriole
and gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards.

It communicates over ACPM instead of I2C, hence the additional
defconfig item.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a86cab889eac60256b28619b2cd2703765b081ee..557b592821d5d1fe8a5fab0619967e4f98894bc1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -775,6 +775,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
+CONFIG_MFD_SEC_ACPM=m
 CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y

-- 
2.50.0.727.gbf7dc18ff4-goog

