Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0107732F740
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766838284; cv=none; b=rVhAg0h4ZIZyZgqr7EDfnbHK3h3PKKX+T2VVQeaZ0IiHEX1T09+IrtBAMiV7ia+btGa1Ew9BMpoUQcbkjRCsWe8F3UBOgFJakP998zfofPb1sCVqYB3hGIcAz24ToYBc0hQstvcHmI2mkYkAG2sLx/RMpFDvXX7IhRWiUP3DbnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766838284; c=relaxed/simple;
	bh=gcmMj0lW5ijk42JS1tB+r6D2gRIG50rpU99wl7DZYkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hoc6CljgzBCt3CX/4jQ2zbjrEwwU+aow5AdLNco5APWm3u/tvQomdc+bUxcoamYAhistCUz5QRKZQRKhRosqJDPQvL49D//K/2NKotFp93giiol8BU2sS0oG9pe8NwVn3MYMBSMlH1iWv0eQC5D3byH+8TU4uaEAjQ+nPLLZWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtG3zIUO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtG3zIUO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso12645392a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Dec 2025 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766838277; x=1767443077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNIKQi6FypzlBSQpep9GNEuVSqSkRmoCXE/UOfNk9wU=;
        b=VtG3zIUOypfrUk1CaQsF6pzeuW4feyPaItKvO3yoFzyppD6JCWL4Fru4ty/x19n2zN
         Mr61FrAPuAVoqxvONwwKZwN0JnEpoIPSxZxw9nUDUuIxYUz2Otz6Psd4kcKH+HArfCjx
         9sV7kKkLEyJY1gbIICdqbskpwjv3BoIAh/y7bPg7ZKyf1ARLjYSK7ooQAwFSkWFPu+Jb
         apXV46L9fSGrSMAp02YNFPZ/DkokO1BEwRMB3UtO7X75Ba526l7cp9BJAjBwignZnKVL
         XxJm5GnBFsGmnTjRIF+EfjXK9FWAHeu8Ii08+tcb9vTEdjtUWJgxIAWwGRRgn+a085sy
         H5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766838277; x=1767443077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eNIKQi6FypzlBSQpep9GNEuVSqSkRmoCXE/UOfNk9wU=;
        b=NBcrsz9ZR5RCYeb2o65xLM7Okk0oFb4oqRwg8wGt3R8EzUEXYiZJ7TMeE7vgS5y88h
         qsrIMMSzg8kSOCBnHbSQOsLB1MU1CX/9XTaQGKpU2Ljt79vI6OZp9/8nYS3n6OjTafvN
         q9X4BUE9A43a/Zj3iKsgjEyS9dYGTFjfF8+ICSD43yC0okIOHkrf/rgYFJI64IvbYiAS
         QewYL+rk3MqtHyZcHHtE54cBJmUcPZ94quTLUswQU55AqRUcGPGKmdVNN1DeXZSCcQdN
         lgRYqJKrXs0r5ayA/L0fQz8XeTqYhuyNaNqPIAiCiLufzKYTYYkYprof2VvcCZVPLHaM
         swcg==
X-Forwarded-Encrypted: i=1; AJvYcCWuVEoI7jTizkENMYc21Bf0bqdlvuXq4KcbzrlFXZXqWU5YCo/+ztb/m85tI7U9P7EOvT0c5mAIply8MySJMkvhsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlZs/cTF2kSqSHeuwMJe2qVblkq9EI2hnvNSbtV5V8P1zw2V/2
	G/32MytoKoharv/qXKn2wFAdvZG8TxWVYBYtEhqb6fe1meHqbdr1ZbZuKLXOOBImGrQ=
X-Gm-Gg: AY/fxX5UBvgG8YHcivbgxVI9tqhQCaKiTe1D8cYyFz8ol1D/Gp1n91xPiQIue41kTOt
	4nMK8uA2slK2qdF/Fxmh/4AVNcTukkkTTseuAxSCVP/CnW8y5tsg6nSVde+hUppOIC4N82GAktM
	MM0ZM3/5jW/c/GbN9mHKHfodaPwcUPyvvEetrgTan1cYKEOjOCPFb3xcbko920pxTi6Myx4HFVv
	F34eJoqRIvDzv6RSQ3ZXVT/F6w/vlYCAch2w6ZITuxyi6WLwJKlPdHZfbgviVkO9IffiomFHnN+
	x9+duzdysY29xIcEGKsk1Vj+Y04b3Zq9ul/2GLizbQULUuSR7A47aFrDn/6UKbT8bRryRuI7UKF
	mw9Q+ZD/dEdC77KltLPOAdivksJwTzih3s7POHxSernvWap3jip/ZiBbdqBix5S3u/YsW2fUpr8
	GwyoZ/Zs9U76Xyt5cHWe5qntcdGZ9ExSBXmIH3qD9ogdtTuvAW8uTwJqv+ksWqtMDwiKR0XybJj
	76h4A==
X-Google-Smtp-Source: AGHT+IGqWTGCZOPY2JQdi50khJ1KN4h2RSLhajLM1rIsDEEW0RykHTL4Lf3cTVEpMQkeptRnlkYXCA==
X-Received: by 2002:a05:6402:1454:b0:649:b492:70b1 with SMTP id 4fb4d7f45d1cf-64b8e2a6fb8mr27864621a12.0.1766838276650;
        Sat, 27 Dec 2025 04:24:36 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm25932659a12.31.2025.12.27.04.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:24:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 27 Dec 2025 12:24:37 +0000
Subject: [PATCH v5 15/21] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251227-s2mpg1x-regulators-v5-15-0c04b360b4c9@linaro.org>
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Refactor s2mps14_pmic_enable_ext_control() and s2mps11_of_parse_cb()
slightly as a preparation for adding S2MPG10 and S2MPG11 support, as
both of those PMICs also support control of rails via GPIOs.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 86 ++++++++++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 88e21c90832a45547e5791b15cd1de274f81fed6..bb0a4f35ef47551f7171321fdde2c0202ce86ede 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -328,27 +328,13 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 				  rdev->desc->enable_mask, state);
 }
 
-static int s2mps11_of_parse_cb(struct device_node *np,
-			       const struct regulator_desc *desc,
-			       struct regulator_config *config)
+static int s2mps11_of_parse_gpiod(struct device_node *np,
+				  const struct regulator_desc *desc,
+				  struct regulator_config *config)
 {
-	const struct s2mps11_info *s2mps11 = config->driver_data;
 	struct gpio_desc *ena_gpiod;
 	int ret;
 
-	if (s2mps11->dev_type == S2MPS14X)
-		switch (desc->id) {
-		case S2MPS14_LDO10:
-		case S2MPS14_LDO11:
-		case S2MPS14_LDO12:
-			break;
-
-		default:
-			return 0;
-		}
-	else
-		return 0;
-
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
 					   "samsung,ext-control", 0,
 					   GPIOD_OUT_HIGH |
@@ -380,6 +366,28 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 	return 0;
 }
 
+static int s2mps11_of_parse_cb(struct device_node *np,
+			       const struct regulator_desc *desc,
+			       struct regulator_config *config)
+{
+	const struct s2mps11_info *s2mps11 = config->driver_data;
+
+	if (s2mps11->dev_type == S2MPS14X)
+		switch (desc->id) {
+		case S2MPS14_LDO10:
+		case S2MPS14_LDO11:
+		case S2MPS14_LDO12:
+			break;
+
+		default:
+			return 0;
+		}
+	else
+		return 0;
+
+	return s2mps11_of_parse_gpiod(np, desc, config);
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -903,10 +911,16 @@ static const struct regulator_desc s2mps15_regulators[] = {
 };
 
 static int s2mps14_pmic_enable_ext_control(struct s2mps11_info *s2mps11,
-		struct regulator_dev *rdev)
+					   struct regulator_dev *rdev)
 {
-	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
-			rdev->desc->enable_mask, S2MPS14_ENABLE_EXT_CONTROL);
+	int ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				     rdev->desc->enable_mask,
+				     S2MPS14_ENABLE_EXT_CONTROL);
+	if (ret < 0)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to enable GPIO control over %d/%s\n",
+				     rdev->desc->id, rdev->desc->name);
+	return 0;
 }
 
 static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
@@ -1244,6 +1258,26 @@ static const struct regulator_desc s2mpu05_regulators[] = {
 	regulator_desc_s2mpu05_buck45(5),
 };
 
+static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
+				      struct regulator_dev *rdev)
+{
+	int ret;
+
+	switch (s2mps11->dev_type) {
+	case S2MPS14X:
+		if (!rdev->ena_pin)
+			return 0;
+
+		ret = s2mps14_pmic_enable_ext_control(s2mps11, rdev);
+		break;
+
+	default:
+		return 0;
+	}
+
+	return ret;
+}
+
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
@@ -1314,15 +1348,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 					     regulators[i].id,
 					     regulators[i].name);
 
-		if (regulator->ena_pin) {
-			ret = s2mps14_pmic_enable_ext_control(s2mps11,
-							      regulator);
-			if (ret < 0)
-				return dev_err_probe(&pdev->dev, ret,
-						     "failed to enable GPIO control over %d/%s\n",
-						     regulator->desc->id,
-						     regulator->desc->name);
-		}
+		ret = s2mps11_handle_ext_control(s2mps11, regulator);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;

-- 
2.52.0.351.gbe84eed79e-goog

