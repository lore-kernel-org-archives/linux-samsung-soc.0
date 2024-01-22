Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372CC381C0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964255; cv=none; b=GcZUJNehlKdixW49//Yl+codecdN7cXjlolCiHBRsPCuRJCtHkb3PSt7v/DzodQSonbHWlgziiTsrHRdnfznGl7gnvuPE8ALV4KpJCWXMEcQW6XErJxcdclgEPcQg3IsnZ0h/CEXQFj+njo5GNqNJrMkHna7zDZd/y8GkARVxVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964255; c=relaxed/simple;
	bh=BoHzIuF9/gjqWNPMlzNp4FmNG1UNGUTagv+K3rRO0Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYJ5GHEEkRj8e4m2YfHMKd1px4uNA3H8fM8bRKJFdp/nxL8XzvryLTcNYrjxLsyPE2u3XcP+tWy6mIR865Z86nV/deoBDw2hcTbNlIgSdTV1TPtzqxNoyM/l20bjvNBdWm81dNYxCkw40+cv0AgG5kX8yp5s5um1OJ/hJ6/D+mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mcmFjQTl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mcmFjQTl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40eacb4bfa0so16648805e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964251; x=1706569051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4bTzUw+MKMULDVrOGqPlspEn1WsvCRNgroEJ1fsBHQ=;
        b=mcmFjQTlw5O3sD4pXK8wVxzni0TDCUA8+MWev8ndkjg4jzx6W5Cptz/p2dQUnBvg3i
         q1tDBpRcYP7XeKkuR2itCEICt7WTXgJQSwgtgFLZs656hVK5GmA9IIp5aVj2F0Tah6uB
         Ou9efJEBz/GvO6t2nUnNX0BfPCjJUtbAId+6Wfw9/c9rqJ5KViEsAemrqDJetfLqs6v4
         5Z1FLep+pbSo4wuFN0A6IIeNS/HVYCBAnPrvEmQ2Fe/fI0NMPt+fLC6Lf0I7qvM/ErF8
         05VWBqdMYJ83d4NBmXeOBfgc2rhqas5rbCpB5EZH/zTGIjkvZj/7mTius1P6J/abPYGR
         6tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964251; x=1706569051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4bTzUw+MKMULDVrOGqPlspEn1WsvCRNgroEJ1fsBHQ=;
        b=j8/rTuRDm2uw9/1BfzIN4rxy8SNDMEtwrC9Mf9CvHVhH2zPWKrwYggD1QXEYm2kOtw
         Eam7zbRfdr2pamy9W1NuJvkOG2gNbCeg1Fa03VK1nGJA9Dw43B6C75IejYKHJ9/pB29d
         qnyBqGCYtQzGDdrPEy51gl/v4Qhs5NvIlG1exHmyWr4dvZQQFAg1eOVJMFXAKyqwfMwo
         zB79WjPKjS3Rdg6cwN+jvwOwGs5A6WwC1nW5mAC6GgCi4KHucZO2j4uzRceK5ytTd3iY
         e6GbdujEAr8XgYQFsiJ4FobkTJfvoWheAvPdpLWPDZwAG6b9AeUQKLP1aO5yjlS8r7pK
         LZQw==
X-Gm-Message-State: AOJu0Ywf+FXiyGgAZbRgDW1BY/jGfArEJMK83OE6Cnl0Bm23KTCPrwUo
	Ut5QyeqRNCP+ObJ9NlFSnsmvTtosUwW/fRdaV7c377UeYQR/RS4nGfL9OsC8Big=
X-Google-Smtp-Source: AGHT+IETd2PX8JmJBxIqCh7S7rWJGs2+2BZQchWv4xtVboyS/6Q+VsUVSnmnkjvLrWfcHXbLQv6r8g==
X-Received: by 2002:a7b:cd0e:0:b0:40d:3dd7:46f8 with SMTP id f14-20020a7bcd0e000000b0040d3dd746f8mr2773352wmj.127.1705964251630;
        Mon, 22 Jan 2024 14:57:31 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:30 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: fsd: remove deprecated samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:05 +0000
Message-ID: <20240122225710.1952066-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240122225710.1952066-1-peter.griffin@linaro.org>
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung,syscon-phandle is no longer used by the Samsung watchdog driver
to access PMU registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index aaffb50b8b60..9b55e44c1db0 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -625,7 +625,6 @@ watchdog_0: watchdog@100a0000 {
 			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
 			reg = <0x0 0x100a0000 0x0 0x100>;
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			clocks = <&fin_pll>;
 			clock-names = "watchdog";
 		};
@@ -634,7 +633,6 @@ watchdog_1: watchdog@100b0000 {
 			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
 			reg = <0x0 0x100b0000 0x0 0x100>;
 			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			clocks = <&fin_pll>;
 			clock-names = "watchdog";
 		};
@@ -643,7 +641,6 @@ watchdog_2: watchdog@100c0000 {
 			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
 			reg = <0x0 0x100c0000 0x0 0x100>;
 			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
-			samsung,syscon-phandle = <&pmu_system_controller>;
 			clocks = <&fin_pll>;
 			clock-names = "watchdog";
 		};
-- 
2.43.0.429.g432eaa2c6b-goog

