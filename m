Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9862561B6;
	Fri, 25 Apr 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587728; cv=none; b=czLmoxiuv9dteqgEj4YLS0EOfidfKejofbb1YPOvIYEYqpd6XVtT8zQxkxwqzN2IslY2yU3BmuJP6fdMid7qk7CyTLbj42++cRQd9sKRrAhtDMKskT6g1QJRaqL5wN0IWQafsM+fO3N0W8R7VubQuJgByl7U1auszeIpI8RSsgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587728; c=relaxed/simple;
	bh=+7MfPaYawWgTssLveOVRkVOOBsCsaLlHoGA13hhP+sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PU6MbpJdqzKDnkG4Vr3BRIeWEqWemikLRSISfM3HiRb8QQkqhDGZFhQVi0NCVBM1xNZQVKfqr5SkdqL/0iPw5jR4vyZlFTBkUOlqDi8ordW/XoM2AEMRR0Sdr927TCT6OQ1qU+uJO5IRT7eHjhbHNn5wn/Mvw9ymc74MUx+P+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ2VV80R; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ2VV80R"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so2058757a91.3;
        Fri, 25 Apr 2025 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587726; x=1746192526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NT846XJMJyRwOcvkyShrYdeH9LcPT4dyvZSiDKPIbs=;
        b=nQ2VV80R3J4DhqYx6cwtvbWKvWZ162dvbHSuuIhI4TgvM0JaYvew4hq3Iw798zTB5q
         yNQPQhBhCgjatKpJ8O0FcKNH9OY2Yb7YOBIfMEYDp1A675wUvLMQXMwzAxgYunRRmnKS
         NPRaCGXyt3o7f3dR4uOufIjTOlgZjFvZzHPv2SfPATH5BJyWaQ8i+y3HDYSnPsT3Xr+7
         wy315Xm2/NRBUiURJ+ZT+3Tv0dA0bkrzNjvhsqzgLrvOBH4qAj3dvPsQOXzoV2xMcJps
         cv4i7dwsEbVbyvnLhiUZl01cxg99v0zemyl8T9bAmILttPtRZ4kbu38p7JklpI7iKqvE
         XjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587726; x=1746192526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NT846XJMJyRwOcvkyShrYdeH9LcPT4dyvZSiDKPIbs=;
        b=KqqwvS1Xkwoy61n9H3HQcyQwjgvHIjoLKcqeZlnJ1zgpabQPg6k+WHHYLJqGmWS3zy
         OUxqTGgzxIGJv7z9iA9ZWmgoe9XtzNjrpCaIPJxxKFK4p87EzBqPMcGPH1uH6o/HRTME
         z675PiJ3OWE9dysLzdj8UlPqKB26II/blsgpqerta4rP1WkhUOSrf8/F2SXuSGw5wG7f
         JvsYHendh9l9AdcS31Nx1yJWH4JYppVBDSeL5uDmVgn8Uh8i/ZDTtLigcOVojBUZ0Pdw
         U6pLmXQEJeAe/fqrlXnecfM3cgxpiFLSqrpouOQ4kJUR2VLGyo9xuDPsKzQvSQ3mgnWd
         sweg==
X-Forwarded-Encrypted: i=1; AJvYcCUxSqXcGwRQb83WkAlp3xEDr3DpdN5U/zU+nzUdQe52I1bMOcRXQORA3a7tv4sdOpjTcmuhHYehiKJwI1DS2NpqIgM=@vger.kernel.org, AJvYcCWOYte7AwCkNwIBOLozkFgQi8oymy2HXW4ALYo8hfjYD9xkAMS9vgnbw+AtphHu5ab3pbL19+aS4jLy@vger.kernel.org, AJvYcCXJn9qsFMUZ2rhMRjZWnSdDY9AK1cE9ZEWLGsHpmnP/u4z1wX4VcTnaWLQdwNox/G4c4QPebLpUsjfX@vger.kernel.org, AJvYcCXwU4wLWdnV8JHADB68H7WeO2X9amNkm4Unn8uCCIO7ZOXkJeKuzlh0uuOpNevCzhMH8B5/J0rRZEM1lg4m@vger.kernel.org
X-Gm-Message-State: AOJu0YznzTHzjEd+v6mkiy5syOzZkVzIXw5ymYARP3S0Hu6fJ5/3142l
	5+ZA2NGxJaHlHWbAilZdK+x2t0wLXhWWyUaK3Y2fO3UEGdTC9H1K
X-Gm-Gg: ASbGncuSptf5OyMs/aqNgtXFQYy/1ANNSOu3QOFtE+MH61f72/qKrIeYWAn2158IL0W
	SJvAEv3kZCqa99QZrbMi9bSDcsuBMkSsQUH5Dt8RxBnOadiT6M5TuFhCZRbLcvuT4wuGDvXsl/e
	nDeIF0v3JMuZSY+lvEhfQmvNiUxNAVrB6D55IrrcWLRLAYDa4a498TbjMIdHSDipF5qrY6xpyEO
	hclnG8o15EBp7oVUNA/315yZidjdx0hx47tsfmE6nJQ0FzXbxXcHkdM8bTVmeXGClCc/zNjLp/X
	t+E8xrd97YixM9xX8xIOt9B15XXgeUQJM8bGyizFFwWe5HkVGDm4m4mzsAf0KrCJ
X-Google-Smtp-Source: AGHT+IHttHJvBg7oJGJnjpRaAv/YqhM1f5TNlRh7Cgzv7Dvtu3uvjcx0fbmj+uAs8hxnqYl2XkBYeA==
X-Received: by 2002:a17:90b:2f10:b0:2fe:b937:2a51 with SMTP id 98e67ed59e1d1-309f7e8eefbmr4181494a91.33.1745587725988;
        Fri, 25 Apr 2025 06:28:45 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:45 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 07/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos5250 smdk5250
Date: Fri, 25 Apr 2025 18:56:27 +0530
Message-ID: <20250425132727.5160-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index bb623726ef1e..d41409019671 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -145,6 +145,13 @@ max77686: pmic@9 {
 		#clock-cells = <1>;
 		wakeup-source;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "P1.0V_LDO_OUT1";
-- 
2.49.0

