Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC3244CAF5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096637; cv=none; b=QDnVAfRbqtEzP2mL5MP2lVv+fSYKNvKtfLn+SKLGhenIsMK70Arr5PNJVHemoYWDZOrbBP7FFkBID3G9whgV8xlz8eZP06rQADsF7WXyWRBj+8f8esRyeiC6tDQzNjHblOnQkmDlLW0fr1dEqv0enQth85XJQ/rO7c5I9Syo10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096637; c=relaxed/simple;
	bh=Uql4wLrPIchDLzM+Qxxz/zEpZfEFgb0aDGiWtLWAr5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acCz/q462bM7A2ZoeCpAmAtVFwJ5yc0IuA3r1+8Ef+gEGmZqDCvYZe1ddUXa6vZGFQxyK59/Y5DcE4699mjNt9Ibe+akLK1p62yb9umaSHnMCj4MYpPk0d3EhtDcrEb9MnHpXM+qHoVfDaf6Lju3K2eCTAj5+k+MNkqlv7NN83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W24v/O/6; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W24v/O/6"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65832e566edso1639827a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096625; x=1769701425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bweKrz1EAxpVR/K3C13UOoNEyjPdH8YKZynfcS9WhMU=;
        b=W24v/O/6peMIUrlUcf8CRKAPI1riHUG+qu6g6zRwcglS9UEOX5aOsSdP6Z5k974Xx3
         D11Z6LiUKmo4Mn6Cpj9/YLCi2VjhrNe8LAo4U7xVcN5eW08++PdvzXGGMWKT9hozqSqE
         S3oA9udxnFa9749495UFEJTW+J37AE1/Fw2IhPYBt3U0EShBVL1zpw6a0QDy/0vwcioI
         ObgnSAhaHTSBHqTHyQAE43uYyGdokUGm3PsZkleQCXHzTF1HDVoQFlkOAFmxZh5RqYan
         K7o9g3aaHNS93+yfu8jSYPhnPSy4qQcY2yZk+7rzpc8iexrBtivcL3TQJyl+cKJ5fezy
         iISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096625; x=1769701425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bweKrz1EAxpVR/K3C13UOoNEyjPdH8YKZynfcS9WhMU=;
        b=EpPn0lsWyId8iqN3SGTMhXHpcfxgivwQeWmt9Y/xP2sxAXiAQDkROotox94AOHhiH4
         dIzlVYZ8/xvshgkdz8GWqY5WOumuhiTiUSsPbF39qJOA6AufUzs6A8yvs33YEJDvJCBv
         onn961h76EDINp15x1+4lxT+Eg0gVdkdwXLba0C6g0AvOZMoFdRuWCUUPFpPwD9zijLE
         ZWs8NdxYyAnaZa3OsiuWso0ohB1UU0XMqYSDyu9TL2b/8NTNfyao71SwjrmlimidUSI4
         F/ebLWLC0sLYkQLtG9/CebSpr026JztqBH7ZIsMgpnl3cb1xsYmTqTpHMsc0IEMsOuFW
         yeag==
X-Forwarded-Encrypted: i=1; AJvYcCV7EF3h/9CXHwWq4DtEBaL0X050jaCdCaTdyBZU79MXWdInFkLGt8AMjoRUNMSjkBMfWyuF/OzgKcHI/OXqbfGz0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaLswxb/tA6eocE5UKr7g0I7u4m68ml+2PLEnogNN8gTlwTU9I
	Hhmhtn9oP8fP5tuMpCY3r10FlJKI60nm/wrXMIN/6kn17IDa/aQbv/LjE7AIq+h62m4=
X-Gm-Gg: AZuq6aJP4EmY8T69MOwkNdrw5zzudtbz9eMQa54Jfb3fchk9tNO2XdH593+vAF2NoZp
	iDvxhXBFpho/kGBX3UOEtCkAzWm2K8KDtio6/vB8OUNzIFQsWBSOjanrrXBJcf0rSWGqkaeYJU/
	3WDXO6F8n3O06u3g2QmVhjJB/ET6HxATOMAmilOe51PEBWB991Db10eTXi7w5ScVQ8V7aEoOJ3/
	eU399ad4SBf/0+2gA7oFhnDhPOaBSt50P4CBsQoYrDkiCaNlXnYFkDm0LeXDk5pcBjFMhnWK2Ew
	h7Vbd9CU2Qcbx5aELH+Wu936MB0jvJvnurjCieF+XSSCBcLSyB+brW3TWUL/JMmOJiQmS+vUKgv
	ywqTO1ybk5VMvtboRY55KszWJyYMq+1Nd0ShozaOtqWpXAEbCVZHOId0kej9k9PaEjAD9lMuRdN
	i3KlM0ysKxq0nKaxZ4KXhB88QId1Ge0eThfjAm6PegXgetaQsfYx2traobnAVMtU8+iTBX6QEsq
	Nyx32GDwT2X0uF1
X-Received: by 2002:a05:6402:1468:b0:64d:ab6b:17cf with SMTP id 4fb4d7f45d1cf-658487d5f67mr15227a12.33.1769096624685;
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:44 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:39 +0000
Subject: [PATCH v7 12/20] regulator: s2mps11: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-12-3b1f9831fffd@linaro.org>
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

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

While at it, harmonise some error messages to add regulator name and ID
like in other messages in this driver, and update messages to be more
similar to other child-drivers of this PMIC (e.g. RTC).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.52.0.457.g6b5491de43-goog

