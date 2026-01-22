Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478644A707
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096640; cv=none; b=jjMaYhfu+NXV6ZDeE2A4zot698HJ28KNw4/XV80xj0E570Rmrl8izOsVXOo2CDu0yM18nofFbQKXi7zvgX6rkxbDJ45LlL1uJHw1GLS/n6Sz88VeC1XIjveuVGLwtndH9byjKv856bw3dwW1hEmYCpuK/XYgoYI86wltnFNJjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096640; c=relaxed/simple;
	bh=nXl8zH7iFzy229o62R7F4gj8miBQeEJTl9anBMuQRqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+q2xmRqXF3BXgbidEgqNF/rTuy71Z6zBtUq93sMe2RpbFvmSxfq6J+OyUByJ0m1c+Mape+AMdjP65WRR+V7jyGBrnZZyVY0MOfKnL04Sq8rEeipa3Se1yNE/Es2krBopr2gBZ3kinHhkuaPccFFIs2w03vrC75gJHJOAeEYWo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tO2LSVuG; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tO2LSVuG"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b883787268fso131203366b.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096625; x=1769701425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXknWTh3C9IVP1+uTVL0nex1jtU7FLYUPa9Q3sm6Lzo=;
        b=tO2LSVuGx5cP1FioAQVwAi0naXXshHkUE5pkByQqralZGQ/nhKQ9Pb3nEPMPB7qc3Y
         MOPAN8rDcaIh9bS7TxU9mm3YDfmZn6WzMP9xFQzutOBdf1xHmAicpbiSlUiaeZYrFmLd
         cdX/oFZW3Bl0oprKRuilltjCkuhd6H1qoAY9t3iRIYUC2X8nDO21OxNeWo843PyI3Ali
         sDg+fo4WYKlJInY7UUvHQN/QzmeiwWNO2KCiHJx4aBcBEGGZe6tJVG7xzOGLMX0YEif4
         GCfGwGyfGsY836+mdkIGvAmtHQXG6lqQOPBbc5hkx9p6AfwBSe8dEOE2gILP+/2ZOVDY
         Ih8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096625; x=1769701425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tXknWTh3C9IVP1+uTVL0nex1jtU7FLYUPa9Q3sm6Lzo=;
        b=MQa701lwGiUX6q01geg7iYh7TMS87kgfgyLmrE00gf2b3PZfhFFow+PUSfaEvTTlE0
         GWBU2vH5kJL3iP/K2GiMmuhZjsGM6gn7kDdAp/UWzEzd4FnuU5E6xkM8lzwTz5qIXaim
         af/FAxLvXwjn0zDTmVMzMUVs8HwQB7tY64wxaAAtiK/5Bc9rCxfTwoITAubufGprg+G+
         /4xIEW2sxQBpEGy/W2vbAV6PQPSrVO9S+vRNJDi8ivFNmfTYFqZmb0fJ+oZqUUiXYklH
         clHatklSrfoXCJQ2oNiWA39uuowuFmKVs9vQmBksxCQlhFiooij3BohyaAM/zSC9mbUn
         r5WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaMC8CGuc2SNahsop1jcHmzH4g29AhBPT6NV1uEtt+UQcrI7rMF7qdBQCxeb1kbRbPdoVZT+MBJGLbJKiZCwP6sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKlmc2BIlpgHACYeTl9OntH+G5uQe9grsyfvul/9XMpUOIXUZ/
	EyxIyykdVYXri2KL93FDIuoICaxWzldgtkTG/sMilAqjPbFZl0/61uooHE650ap+BKE=
X-Gm-Gg: AZuq6aIhg5+Ie5tEuRJiGOV64Vz7fXmy4Q0hE16LT94NKlN8hj3brZe7ZVJQJ9mywgR
	PfURQAZ81OAc2JrM4eqnrEBCNwtWSkgFKM5tHkjEwfN2m/rNDfGPh0lo9jf0g4v5bdSikMdrRl+
	nAX2XBamAIf1GubQL31QEwHIbnv2wgw1Cj60Vz4YrxSeIdPL1rHRVmhJRp9xzHByM/0Nsgw/GYn
	kw/ILswgR8jly9l3RVKUYqsYmRlqzYJjjS2VQCf2g5K71h/9Ri7K3ph62m7ZZrBAYL04LjMmJxr
	Cw87GcPTb9SBxYy1dmZNXGUZifDehJZeZpJ6Sd3p01tdew/Vo+FSvosQOtPXQ/PSBjvp2xOoDoy
	sCrh7SDEDekDcCP2dFwtOEpqqm8P2jiC0J8MixJd7X+iG5QnRhqLQl4hqyblX83XRd1F6crsI43
	nYTlvCA79UWEC7ujjZyTtr0ddVSDLqmWYhOvREfHSsUx2uf5XRs70hNdOAcu/vhHHw5uEZD+z2W
	zfoH6HSmmZrvAXD
X-Received: by 2002:a17:907:724e:b0:b88:47b4:7626 with SMTP id a640c23a62f3a-b8847b48388mr122935766b.27.1769096625207;
        Thu, 22 Jan 2026 07:43:45 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:40 +0000
Subject: [PATCH v7 13/20] regulator: s2mps11: place constants on right side
 of comparison tests
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-13-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2

For the lines being changed, checkpatch reports:

    WARNING: Comparisons should place the constant on the right side of the test

Update the code accordingly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
- new patch
---
 drivers/regulator/s2mps11.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 30586e9884bfb998ff07e3148813344b307506c0..8a36ab67b73e4151c7f67af0555a6465ee1e7a04 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1221,32 +1221,32 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps11_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps11_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS13X:
 		rdev_num = ARRAY_SIZE(s2mps13_regulators);
 		regulators = s2mps13_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps13_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps13_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS14X:
 		rdev_num = ARRAY_SIZE(s2mps14_regulators);
 		regulators = s2mps14_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps14_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps14_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPS15X:
 		rdev_num = ARRAY_SIZE(s2mps15_regulators);
 		regulators = s2mps15_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mps15_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU02:
 		rdev_num = ARRAY_SIZE(s2mpu02_regulators);
 		regulators = s2mpu02_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu02_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu02_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	case S2MPU05:
 		rdev_num = ARRAY_SIZE(s2mpu05_regulators);
 		regulators = s2mpu05_regulators;
-		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
+		BUILD_BUG_ON(ARRAY_SIZE(s2mpu05_regulators) > S2MPS_REGULATOR_MAX);
 		break;
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,

-- 
2.52.0.457.g6b5491de43-goog

