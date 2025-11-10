Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4189B338932
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 19:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802955; cv=none; b=BpGLIpWi79+jP8UmLZ0IsXNAPqk2PrEajpvrIJlgEa6jqs5+om9G0R93a663FtwvGDvc0DXS/73HAT1KXeyi5Dp0LKEV/MoIbzcgnAuuQBfA5PzgYukIAjueWOQDpscJj+68s+kyacXEs1r59Xa6qw2R0p3m9zcIC2zyaRlJd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802955; c=relaxed/simple;
	bh=wVMc/YTlaTEMex4oHDoEHr7zer0I+mYn1CiO98T0AMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AyfoZLjul5jXl+8cA7QlYQHRkSm2JMw1PWmjgvZvKsdg0kiz/w2/l9xO9YoNKuyCeGsQg4QjmBambHGWx2KCTxgt2T4Z2QWgSBQPkcA0mT2wf+Zf6dsquvVRtwVAtlVaxNTAQOhp5oBfA9XDPnDx0h99oH/IK5kYIEvNkep/AGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iU/GYjl8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iU/GYjl8"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7277324204so602712966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762802947; x=1763407747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYc61bsLfbL5sJG2LJrbzhJSNbSYD8i6qXPvbkxGWDs=;
        b=iU/GYjl8OPfXrQhKe/y6WvppxzKlEJLgVoG+klqwYhbyXQ9wpj0m52OlRuUOqQPjMe
         a/S31MPDOrUiyLBY+Hy8hqKRfF//+eb5/J0CchqGlsmMv8qFaMQ9XOd7+H+bMwqnwoMl
         h9KXmo8M35UndWpEZqz3gFkerTI6NwVg4jlX75k0jNq/Uv3XRwa5euu6Jsks+Gt731fE
         kG5PAiLhbvtAp13FuH0gUMtLwSNaC60HhXzog0mYYAykXqhqK7CZCCsf+gcNCbnofkcY
         OKV4YbFy8QMjr2+CCsg6RNSfCL840B+vwm8Q+cTDrvnplCnsKFDYWGR/qx4gATJhZejL
         bxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802947; x=1763407747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rYc61bsLfbL5sJG2LJrbzhJSNbSYD8i6qXPvbkxGWDs=;
        b=ZmPnYVDgEpuq+fuCQIqRFxoqbZybb8CMSsB+Estv1KBLOKDG0gCDl6k+TbuntivNGT
         FnDN0klODXsDbG4qxAtjxsZk5O8V+obchzCBnFNGQqVNn+ds3EiHr7LB0rpoQHJ57EI4
         MR2d1OMfgMQZX6Liu4DMjb5f3ozrXp6qfkL2h+6547RjGj7SUiTVrZY4ALrR1ihfg2DZ
         K6vRorLo9ay9+TadzCj8yH67HufnI+VuypZMiWodIlsV9Rl1Dku1PIqY6ev94GiA4lJO
         2VS21zYEZ87EH/hVPmQe9aq5N0ffFaI6xqb39KGiWmgiT5TIxylt2IFWxPpmcyNaiII7
         P51g==
X-Forwarded-Encrypted: i=1; AJvYcCUZrwGToKuVHaWwHP0P2rpqvSUtW+qZFN2+lBpNqdNYpBpaIjuQebbjekqLKSrZho/KrD+vAayxa164ORvvt9B/1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDVwa5UG7mqKzmZNygFalNWmCj1SlN5NX5EAkp1eKMVo4Bkuk
	AD1ZlAUYEVlpAShUgkfVOVVQvZEUCKa3CXMyWsJAmcqcr4eXoVbe1RlCVKG/tX+x/Rc=
X-Gm-Gg: ASbGncv782FXh4ljKQKOD1XJtEQ/8lI+oRwk9R+qWOFLE7Xb8EP4noNAR8Pxw4wICO6
	JrwKuUdCVodNRibKcxQwiCmYDZrYRaR3a17sb6CPq2B56fV4SlULjaDhDQMj9FYBYYb4VLztFgL
	aPQjsdjpK+qALAAN0BoxO617bJwnxn3EURNmxNU/3SC1aCYKWom9Y1yuHrWA687sdPT7ZM+I07v
	Fu2lEH8m708tLU8fnLVvdksJ0AvGuJz4LFAi8n/T19NxWFD8Ge5SYnx7Toy/yP/NyHfNleFSAp7
	RG1LvUEbGFTfX4w3vEEvnv7ZDP/kkLH4kYpIotO8uF+Pgjw82IJGfvb2BVIxFVHc6ZkhlZNJtHA
	nTZGCfKeLkLIBDDCBFd6OK/EgYKul0AXymoJ7KauXpzm7UyMwUUva5QWeegSBXyKwlA2uDotaV4
	CNxiayzpZ3eZiQiRo+5qgzpiKg4MBiOyo2lRX6JTeEXm6yR+RrBsCqqHexNpyNSks5LQ5GjsQ=
X-Google-Smtp-Source: AGHT+IFCcJj1UTjOz/txpq7yc2viWAuPPC4vfOzrW0++zY10diqEOPy2u0SlBkqekUyaGXgWnmvE8g==
X-Received: by 2002:a17:907:7f26:b0:b70:7d61:b8a5 with SMTP id a640c23a62f3a-b72e0565a65mr921461866b.62.1762802946994;
        Mon, 10 Nov 2025 11:29:06 -0800 (PST)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d16esm1168178166b.35.2025.11.10.11.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:29:06 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Nov 2025 19:28:58 +0000
Subject: [PATCH v4 15/20] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251110-s2mpg1x-regulators-v4-15-94c9e726d4ba@linaro.org>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
In-Reply-To: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
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
2.51.2.1041.gc1ab5b90ca-goog

