Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149852475C2
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670755; cv=none; b=LLPDol8p6jt/i3K5r+AnE28TpoUuB6TysGsfSVNTBaJrbKmFLKxJTk51HGasbaEpx2nU5OCa8xgFRtnqIykb/PoBHW9Lru0Og/aq1lwRGdpFLjFye3faPMVcLTWBF0vdWfcHuRZ4ulq3h+0RY1HgBCzXyYlUljahmMfH3D6xgPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670755; c=relaxed/simple;
	bh=y6yU6lYRyqEHU2RYOfcRxwcasP7T27SnGV4OR5isOHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQpP75hWw4/sVKjNNh3IMbzLAyAIvbFik0ICJu1VP3LkDgiVZXH9n3kr7jGo4Xvdv+LB07fZlEz1rzTxrlQ2ZHPLsf4F7OTvEA81rmkFaHfIs2LS058DG4VyUDON+BzYdFQR9rum133ygjKeSITP3Ki9yxssBmTXIgb3eACuLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g070MNra; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g070MNra"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac34257295dso124387066b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670748; x=1744275548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=g070MNraLUu9C+TbpnMBlzKxN/8ckq+vfpi6i2v7e2IfEW66QjhDjw2e3vyMuw5G4A
         Sh/4V0dCc7MpUs9VHiLL97WtrYMgj+dCOQXTKItOZrsyEx6RbIZjhX4wsAIhXCypARga
         BQQmlrYMejWYoYvFKyjcRzECEOHF9p3Yn8UorQ2wGQAwBwoeFYfzxehbHgcEMO/LsYc7
         pgs9+mbQd5GJUbcnVCPCdotUdlWfWF5XCbb5vUhdDHz+yWfZKSXPyOOIxKnjrLG7KtVu
         xJHWgfbt1jpSE8AVPbQ/zw8+xfdbVFAEZzQjzHtpaOckeWoDNPtczPqKlOY5a2LE2C73
         wJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670748; x=1744275548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7gFyupIzWsX2vSOEGK7q4UbjZdy1MRwKTSd+TQnVk=;
        b=Lp5A+8TS6BInbSb3unQlG9q+TzlsBmVzyNWbWw571hFS0y/SXRI9C8TuirMq2Q2Lto
         sNyRaNO4DuALE4rNJ+QF3twyyRe/VuFLJ+lLzf5FFmQdizX3WiqnpcLpwsxULgvNf+uL
         2r9sgDyc7GbK080DBsXH4AR+SBh7mY64T8JVO5c0eSmRz7ZpEj4QoodecEAWeR0TLo+E
         SWRcsURdZZTZPjCpzmQwB6hAr/i5furhSO9Ssa/UaSos9jdZOa8qdY1Ov9YbPYxNpWvt
         ycYkaL97hiVIacC0d0JEddOpnrsBC0bdgDywvB1MdwjwXuqt7Zt1jlCsrrLwJSaLF5Og
         oidg==
X-Forwarded-Encrypted: i=1; AJvYcCUtMJvcFmp6mr5/ZywbVauYT+a0nuDR1XbQV/0bnyiyk38Bg0rvT3ppKp2KIDTGmGh6NRSlqQd1Vyz7/2CIktoQzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZa8T/fcR3HBLDKp9V8xnCFU/k8hyr5tpy0H8SdzvTKj5U4ly
	3o+RHKtT1iHtVTNqCiSS/7KbxW+IcEyIyhtMxpZlKTcUQPvbl3BXEOF6JyOQzfk=
X-Gm-Gg: ASbGncvNnX57VTZD2W6HfsFMIdkMMtYSYjJWa1o+8iI/nng6YaO1gw8rGeblarx1TRp
	T5D/UoLoajA4h6Yd/8mqTqkJeNsOyyrx4CptGA1mYxS3cpcSxEyUaDC6Q+f0b+gVdMH06iVXbze
	kpjwnZJ2f78oCGnuRbV9/W7D2PJYRxNkuV38S/7VFSaHqDKgZaOiCLB4BCeYSlUs41TtxwYIQ7O
	cppHyw4Wp88w1Xd9gGEpTFAqzx8ZnHE7YWZUuHuPxqXsJphf0JhRWN04a1VH5qr1g1W/Z1lBn8L
	9jB4iyq/dMBHRG74XVapH79Wh2iAQYJvKdtoEpO5juETU9js+7UP23vAgjP28uVEXYK+TzQnCmW
	PsIlFkZdOMzIVkuNCl80NSaU9kX+Ga/t8kKvODa4=
X-Google-Smtp-Source: AGHT+IHJBM6wgjWYZps6ri5VFfxoUgvh5j0PdsJYHzhGp7CXuLgrnxXEuXRPTmCkvL8y435madc/FA==
X-Received: by 2002:a17:907:9708:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac738a50828mr1837746066b.25.1743670747866;
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:04 +0100
Subject: [PATCH v3 12/32] mfd: sec: sort struct of_device_id entries and
 the device type switch
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-12-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Sort struct of_device_id entries and the device type switch in _probe()
alphabetically, which makes it easier to find the right place where to
insert new entries in the future.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 8e3a365ff3e5533e27d94fa8a15dbfa639518a5f..966d116dd781ac6ab63453f641b2a68bba3945a9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -154,12 +154,12 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPS15X:
 		regmap = &s2mps15_regmap_config;
 		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S5M8767X:
+		regmap = &s5m8767_regmap_config;
+		break;
 	default:
 		regmap = &sec_regmap_config;
 		break;
@@ -184,11 +184,11 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	{
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	}, {
 		.compatible = "samsung,s2dos05",
 		.data = (void *)S2DOS05,
+	}, {
+		.compatible = "samsung,s2mpa01-pmic",
+		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
@@ -201,15 +201,15 @@ static const struct of_device_id sec_pmic_i2c_of_match[] = {
 	}, {
 		.compatible = "samsung,s2mps15-pmic",
 		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
 	}, {
 		.compatible = "samsung,s2mpu02-pmic",
 		.data = (void *)S2MPU02,
 	}, {
 		.compatible = "samsung,s2mpu05-pmic",
 		.data = (void *)S2MPU05,
+	}, {
+		.compatible = "samsung,s5m8767-pmic",
+		.data = (void *)S5M8767X,
 	},
 	{ },
 };

-- 
2.49.0.472.ge94155a9ec-goog

