Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DCC243374
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670758; cv=none; b=KRyzyHXrJfgtc8IC66QcPK9X+bD0EHRD/RFh5LWjSSe9sh5hDc0NdKhDX/nUzWNXcwvMihr5mBTn5j9jEtPz5yqbx2FppjvEJZeZXnUWozvvEjRp6h/6JZKsim9JRwK6F8FH9c9gxFCgjCMhVNNxDEKru3Y8XxicX3tsvedwgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670758; c=relaxed/simple;
	bh=i+oEXaY8LAt9v5xfTUnPr4X70I4bkLZ4jOwueXnpnOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RJhtcg9dgVe2cPekilnqK8KFvHOKMw+9cMMk1KWvmg9CAPP5qIsz6UDwd0MO4wCW0YWDfR3AU7XfuADaYWvT/SHhOpvOvxw2vw6PCkCnHmNZs3Qknh15auTmk0HvAloGhjkPif/hltaeEtrqwty/Z0sNYZSBvVKPFTxAnQYgWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UE7mn0jN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UE7mn0jN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so1078584a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670751; x=1744275551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlfAg/7rLSoS1Ke1F+8yA+aiyZO+gcbIufljerVjsNI=;
        b=UE7mn0jNB92gkHdDr2/StUvd61e8fuMU/Z2A21gQaXjGIMNPKTg/rJxLaGsh6aCbB8
         06XIH0t+vRbOxYLFojY358aU8/ldTrpITtld6InDN3117jlTXvOu1Tlf12Xh3KjwxnlD
         6mZvBDvvGEYoSIgvait/F4Ka1dK4Mt3VeelmwmrrmEZKytItWkyogxlmsP03MSyB/8Mt
         VA7TKjO8fPSM2X1SipXPcZzP5JiFTTdxUAkN8s8+Ppo1ytiPBsk6DPKs3WlFj6Oaww1G
         xqjh77LfwJsaD8hoEdGLowq6E7vZ6UI8FgTsbvh5OHj+tieO7IoBjrSYq8G048/vW9ks
         MUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670751; x=1744275551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlfAg/7rLSoS1Ke1F+8yA+aiyZO+gcbIufljerVjsNI=;
        b=v5BDDFQA5dibde3eyUihJUuYH2+8BxRCKeU7RTurEotmJC6BmRB/D+S+1VCmUCXMkH
         Cbs9A/Ff2XZvLmLQNp3oJFbNGI3iAN7cH7M1sYK1wHhusQ9r2fIYKGA0QElHsTC9iX0I
         0UH1t6oXVx94YE2euZ47KrXT9hQ5/Hl7z4qIjqQjWkORmlyk6P76f21I7q2LEpUVg6aC
         gV1yP2rvxkaOjSlCaqxQTkGpddXqs28OolzynNXS1JJV0BIins9lsmA4Z0weNr59PuoD
         wcWgUqntUL4dRHqH6fmCrCgbl+HqMMSD/0lATHUkTqXI8wMpuI3mbLUAe76Xb42kZgUX
         71kw==
X-Forwarded-Encrypted: i=1; AJvYcCUaHGVQI/dOlqOt6FODb1rx/rDD2MQN3OxSHlL0lnS51KT4bl91UulCHNn9oeHLg6X6vExLNynHvQ+xYh55GG6/iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPYgEkA4tZZtAqJTh3Veh+ClEDPWKlt+RRGt/ubj9D/uavyzX
	0TNXD3zu2tQATHEc9MN3+shQxtb0jvb9l1fgbvfQv5Z+JEsfB3ADPZI9LlZky+Y=
X-Gm-Gg: ASbGncvpn1/epewzjJI9QpFChZAK0VQaWEcBVTtg+TXTZ8G//IoV4qQnddXdfxFOKov
	m6n7VV6SrmJ9c3ZCuRBPUXRndsMA2jJO5vaIyggtvKybfrNS291Q5WVzAi5OgVCBAHCbL/gtrTG
	xTbozXRz2K1V0agcXaaOEA+3wf/VVET1NTHdUHs6hoBceHpcelsYtgt585tvuc70rfjzhdWxvO6
	Lgn8Lj13Tmpc+BWUT5GlgD51x+qevTYGbKFFcPGvwLjm4iEInBuLHIAb8qpYkvYXtU+2V0LKtzh
	jTGln7talmuOlZgigvk+BJ4uEroPwl2cl0HifcIB4g1LotMfnbNlRaMX7/p/cFkJZo6opMO65a3
	awAjonPIO9ndvOTYzjDMcsUbvlxMUFNnoUslzmn8=
X-Google-Smtp-Source: AGHT+IFZLX87fvmQWgnxfZnoDAktzthuhMaNhoMnhSakNJiyYGcGUTZY/GTW98KUU5BWYKgMrjz3Pg==
X-Received: by 2002:a05:6402:51c6:b0:5ec:c990:b578 with SMTP id 4fb4d7f45d1cf-5edfd15767bmr17482749a12.19.1743670750843;
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:09 +0100
Subject: [PATCH v3 17/32] mfd: sec: rework platform data and regmap
 instantiating
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-17-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Instead of a large open-coded switch statement, just add both regmap
config and device type to the OF match data. This allows us to have all
related information in one place, and avoids a long switch() statement.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2: fix typo in platform data for "samsung,s2mps14-pmic"
---
 drivers/mfd/sec-i2c.c | 133 +++++++++++++++++++++++++-------------------------
 1 file changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 81f90003eea2a40f2caaebb49fc9494b89370e7f..41b09f5e3c49f410604a5d47e625cbb37d7f5fa2 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -20,11 +20,16 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
+struct sec_pmic_i2c_platform_data {
+	const struct regmap_config *regmap_cfg;
+	unsigned long device_type;
+};
+
 static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -136,52 +141,20 @@ static const struct regmap_config s5m8767_regmap_config = {
 
 static int sec_pmic_i2c_probe(struct i2c_client *client)
 {
-	const struct regmap_config *regmap;
-	unsigned long device_type;
+	const struct sec_pmic_i2c_platform_data *pdata;
 	struct regmap *regmap_pmic;
 
-	device_type = (unsigned long)of_device_get_match_data(&client->dev);
-
-	switch (device_type) {
-	case S2DOS05:
-		regmap = &s2dos05_regmap_config;
-		break;
-	case S2MPA01:
-		regmap = &s2mpa01_regmap_config;
-		break;
-	case S2MPS11X:
-		regmap = &s2mps11_regmap_config;
-		break;
-	case S2MPS13X:
-		regmap = &s2mps13_regmap_config;
-		break;
-	case S2MPS14X:
-		regmap = &s2mps14_regmap_config;
-		break;
-	case S2MPS15X:
-		regmap = &s2mps15_regmap_config;
-		break;
-	case S2MPU02:
-		regmap = &s2mpu02_regmap_config;
-		break;
-	case S2MPU05:
-		regmap = &s2mpu05_regmap_config;
-		break;
-	case S5M8767X:
-		regmap = &s5m8767_regmap_config;
-		break;
-	default:
+	pdata = device_get_match_data(&client->dev);
+	if (!pdata)
 		return dev_err_probe(&client->dev, -ENODEV,
-				     "Unsupported device type %lu\n",
-				     device_type);
-	}
+				     "Unsupported device type\n");
 
-	regmap_pmic = devm_regmap_init_i2c(client, regmap);
+	regmap_pmic = devm_regmap_init_i2c(client, pdata->regmap_cfg);
 	if (IS_ERR(regmap_pmic))
 		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
 				     "regmap init failed\n");
 
-	return sec_pmic_probe(&client->dev, device_type, client->irq,
+	return sec_pmic_probe(&client->dev, pdata->device_type, client->irq,
 			      regmap_pmic, client);
 }
 
@@ -190,35 +163,61 @@ static void sec_pmic_i2c_shutdown(struct i2c_client *i2c)
 	sec_pmic_shutdown(&i2c->dev);
 }
 
+static const struct sec_pmic_i2c_platform_data s2dos05_data = {
+	.regmap_cfg = &s2dos05_regmap_config,
+	.device_type = S2DOS05
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpa01_data = {
+	.regmap_cfg = &s2mpa01_regmap_config,
+	.device_type = S2MPA01,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps11_data = {
+	.regmap_cfg = &s2mps11_regmap_config,
+	.device_type = S2MPS11X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps13_data = {
+	.regmap_cfg = &s2mps13_regmap_config,
+	.device_type = S2MPS13X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps14_data = {
+	.regmap_cfg = &s2mps14_regmap_config,
+	.device_type = S2MPS14X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mps15_data = {
+	.regmap_cfg = &s2mps15_regmap_config,
+	.device_type = S2MPS15X,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpu02_data = {
+	.regmap_cfg = &s2mpu02_regmap_config,
+	.device_type = S2MPU02,
+};
+
+static const struct sec_pmic_i2c_platform_data s2mpu05_data = {
+	.regmap_cfg = &s2mpu05_regmap_config,
+	.device_type = S2MPU05,
+};
+
+static const struct sec_pmic_i2c_platform_data s5m8767_data = {
+	.regmap_cfg = &s5m8767_regmap_config,
+	.device_type = S5M8767X,
+};
+
 static const struct of_device_id sec_pmic_i2c_of_match[] = {
-	{
-		.compatible = "samsung,s2dos05",
-		.data = (void *)S2DOS05,
-	}, {
-		.compatible = "samsung,s2mpa01-pmic",
-		.data = (void *)S2MPA01,
-	}, {
-		.compatible = "samsung,s2mps11-pmic",
-		.data = (void *)S2MPS11X,
-	}, {
-		.compatible = "samsung,s2mps13-pmic",
-		.data = (void *)S2MPS13X,
-	}, {
-		.compatible = "samsung,s2mps14-pmic",
-		.data = (void *)S2MPS14X,
-	}, {
-		.compatible = "samsung,s2mps15-pmic",
-		.data = (void *)S2MPS15X,
-	}, {
-		.compatible = "samsung,s2mpu02-pmic",
-		.data = (void *)S2MPU02,
-	}, {
-		.compatible = "samsung,s2mpu05-pmic",
-		.data = (void *)S2MPU05,
-	}, {
-		.compatible = "samsung,s5m8767-pmic",
-		.data = (void *)S5M8767X,
-	},
+	{ .compatible = "samsung,s2dos05", .data = &s2dos05_data, },
+	{ .compatible = "samsung,s2mpa01-pmic", .data = &s2mpa01_data, },
+	{ .compatible = "samsung,s2mps11-pmic", .data = &s2mps11_data, },
+	{ .compatible = "samsung,s2mps13-pmic", .data = &s2mps13_data, },
+	{ .compatible = "samsung,s2mps14-pmic", .data = &s2mps14_data, },
+	{ .compatible = "samsung,s2mps15-pmic", .data = &s2mps15_data, },
+	{ .compatible = "samsung,s2mpu02-pmic", .data = &s2mpu02_data, },
+	{ .compatible = "samsung,s2mpu05-pmic", .data = &s2mpu05_data, },
+	{ .compatible = "samsung,s5m8767-pmic", .data = &s5m8767_data, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);

-- 
2.49.0.472.ge94155a9ec-goog

