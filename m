Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9FF321422
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762197298; cv=none; b=ZLkRvgzlu3P8OE/p5e7HxBqNpCOOp7trD12d4H740Fu+UOGlxV5iNoJEfGulzLmduO5g6S2Vy9AvbC1C9KMQH5PKbZlPVJq5MUZ19Bkp3qraML+lNcBTklArc1UD/Ae2ZrPLyePenRSRKddGUfNSxjA4OdDsrY0sKmiPhCboq9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762197298; c=relaxed/simple;
	bh=bNbZLBlOh8aHiChZU7kk7ga82xzwPKmO1X6PcccdfUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bf68ivyUiUdX/DtnkNd/GYw3RALZ9NB3IJadnK/8aTDdrWChK9lKWpE1GBQnfHI9tkH1kX0ANa7KcER19T0q2Svq1pdBihw9uS3Z06dS46cU4x0LeM+ZYHn6GjTxG0xLO5lph/pV/dm7G0qOtkCoKXhtWzBz76TjCnjg9A8FiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HW+GLHzD; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HW+GLHzD"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b72134a5125so28227666b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762197289; x=1762802089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0KbWJf/+NZy5gbyur7GEAAJPtKRAWXvUdUh0UXe1eU=;
        b=HW+GLHzDs1heZTvQGhjDPks6XgQdIGeVQL7GZRlB6ED+ap/ILpz2tcZwxRCDk33HEI
         LGA5r7v+1AGw+5D//H16HaXfaJuS5WWCWJ9wfG6o8dxIFRxEf1II6ZBn5hNGDwqZ0qfc
         dBbNU/iaCDUzabf2QfrXRCWh199RlhSCxNZmgE0UWJuKIaRbm6iSpc5l5Oen2KPSGEqC
         g1pTUGAC+YdKV+SZj6bsnd4DD371oom42Nu9sRUKikWivW0oI5lLopskjzeCb6ucFwBL
         5i5mlWmavNhonjHyU9yGl8T2wV9HwebH2I55mt/L/goWxsDy3ahjJFuF23NeExyRvJKh
         0D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197289; x=1762802089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0KbWJf/+NZy5gbyur7GEAAJPtKRAWXvUdUh0UXe1eU=;
        b=QDV2XDt+qxgt04g+5K07V0ErX8dEqNGNL6a4c3rlOYobbqmvKUgmQXD7i4tgUp6gV4
         nR3ATknHiS5IiRPHye4IiNEx4eWAoIijXbgCN3S+BXlNVNEe5JHk1vNkOqVpoxlY+gyx
         fXSfYms/VtC8sLjy4kBa9m6YlJcnPxAtOtjsSnlgPFGl4/sQAPe+NpDHdgxvmhpy8/kW
         HoUx4gcMANBtErI13RBN11W/jvyURftVTzvAOTRKXFDujCo+vS3Ybgo6ROddVfyTG0RL
         W67EXXBHlPuHJaMDWFtRNLzMAqWHYvsT7CkXm252sD9LuZjztUEf/ioUC2TVjNhdIv1i
         fbkA==
X-Forwarded-Encrypted: i=1; AJvYcCUPqc/M0tG5QEqCRsfKeRlgw2X4+AooEyFxOqm6IhrbBE0771XXnTk/ce5OzIS/FlLAdkSRaagkbLe1SeM2u41meQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaNkgDQXGjKGwuAWslrzBtaThJuqPamyCcFhlwjXFBP/kN+4SX
	75TSSvtVP0FfUSfwIbxrVUCbJvJlYp2O0Z4PhI3x+z85MDtEFLdCNeAiOXF8ppEmm8U=
X-Gm-Gg: ASbGnct7pk9dIif4j6H4gYDuReGP1HEYoVoPaM1o9W1wloG0HzV9XtXub7CiLJmj1Cn
	hdj7HCez7gUBarw2nET/cwc2hKj+I5L2S4Siu/hrbaPjK1KBEZJJ0V9+ibGzCjTcGHSjdYT5o43
	T2Im2L9ayMQAhLVuOjY8a+k31OKVsi3rYHB9Xuev05rCjsWKi7VWykiEaRL9uIrG5gPfqu5z9cf
	jgwaD4z5GLpZq1N8pIuXS8W2mYHE+lhAk8de5xSaqERBo0htIBKB7m4JXryvkOBSK/W2xw8li5c
	HJkbaKCYrLO/R98qHZeKypeUZAxIK8RYTOlL9E2lTsLJodSxcigsl8/d4ynETd0nSwkWHeUf7AL
	/nyX278ww/Qy+naS1lKRAqD48IbkK7qhgg8dLUFfZ45mj0n5AsD+/ogQAEotyfjAYk1ORL+8f0O
	1zH+hFQrGHMx+Mf1MeWuyuUQOKPxGZ+oE7XLdUwhy9TRCG/LLMOZCE3JhuUecntahQtrHMJpI=
X-Google-Smtp-Source: AGHT+IFfcf8kPIcx3o/lKhX8Dl2PmPr0jcmin5FgIW/unByF7E6CX8l3uCTtwQdjdzu0yG9z2ioa2w==
X-Received: by 2002:a17:907:7252:b0:b46:8bad:6981 with SMTP id a640c23a62f3a-b70701917e6mr1534994266b.20.1762197289291;
        Mon, 03 Nov 2025 11:14:49 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm466765066b.8.2025.11.03.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:14:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 03 Nov 2025 19:14:51 +0000
Subject: [PATCH v3 12/20] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251103-s2mpg1x-regulators-v3-12-b8b96b79e058@linaro.org>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
In-Reply-To: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages to add regulator name and ID
like in other messages in this driver, and update messages to be more
similar to other child-drivers of this PMIC (e.g. RTC).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 1f51fbc6c7b6e158f9707c04d9f030b9eee5e842..30586e9884bfb998ff07e3148813344b307506c0 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1249,9 +1249,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mpu05_regulators));
 		break;
 	default:
-		dev_err(&pdev->dev, "Invalid device type: %u\n",
-				    s2mps11->dev_type);
-		return -EINVAL;
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unsupported device type %d\n",
+				     s2mps11->dev_type);
 	}
 
 	s2mps11->ext_control_gpiod = devm_kcalloc(&pdev->dev, rdev_num,
@@ -1290,21 +1290,20 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 			devm_gpiod_unhinge(&pdev->dev, config.ena_gpiod);
 		regulator = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
-		if (IS_ERR(regulator)) {
-			dev_err(&pdev->dev, "regulator init failed for %d\n",
-				i);
-			return PTR_ERR(regulator);
-		}
+		if (IS_ERR(regulator))
+			return dev_err_probe(&pdev->dev, PTR_ERR(regulator),
+					     "regulator init failed for %d/%s\n",
+					     regulators[i].id,
+					     regulators[i].name);
 
 		if (config.ena_gpiod) {
 			ret = s2mps14_pmic_enable_ext_control(s2mps11,
-					regulator);
-			if (ret < 0) {
-				dev_err(&pdev->dev,
-						"failed to enable GPIO control over %s: %d\n",
-						regulator->desc->name, ret);
-				return ret;
-			}
+							      regulator);
+			if (ret < 0)
+				return dev_err_probe(&pdev->dev, ret,
+						     "failed to enable GPIO control over %d/%s\n",
+						     regulator->desc->id,
+						     regulator->desc->name);
 		}
 	}
 

-- 
2.51.2.997.g839fc31de9-goog

