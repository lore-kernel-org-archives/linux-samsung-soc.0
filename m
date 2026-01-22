Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9F4508FC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096643; cv=none; b=CJKYBFHyT3FRUa55ZKU2PMJa6N1hOKqiIJIUQhy1WZmk+NeSC6YDLi6cGL9ERNvHgk/nvfCx0t25VGcE90lfCbULU3cyjMhjXiwc5R/QByQiZ3L5dnLMNVP/O92Bz9UvbbAJHY1Kq+VWr04Z/0Hc03n6tGTabHCJq8acmTUnN+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096643; c=relaxed/simple;
	bh=qZwi0VBdEjXKYAJmcVLy03jwB2048b4QRMXyR5EnHQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZkXKD/rVenWYfiaVhBmoy5Zaff9qZD6d07kPcHNiwmOvLHK1+Gd+beEmwGi7YnXzSxU36du/nNAhaSKU8mY26oJVtaRZUCO18cgWI9G32KCzeN3j0+AxV9epxLMVZflAX6qcWT7eCfd46V30+DqYclBxCCbOSCTQ1WEur9vvNQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MID5vbQF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MID5vbQF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so1749841a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096626; x=1769701426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbATD9gH/jg77F2vOXb69VjDypI/0O8i8+As0LO3lMk=;
        b=MID5vbQFsDMz35KD2z4l5ykRaDPTNQqqeR7q+DPXdU7fdSr4zVkf9V3I0rzFz6uT2H
         0tqdw1pF858TMcfWi5uDuxWH+fNMk/1MgXncI39eiqri8FDklAQO1uuPqxRQhfjmAYXu
         3MikbyEbDnMfTUr0dZa74CQd9dT555rul2EiI7Yh7uXFim6lvQElrNnUJNWPbRX/Ky2G
         cbWy9+UudeAP7Oom8AmVPCGs0oIlKElSvtTgJlE3eWsUDeFWcs8SDOL5xgMzMFVi9qHZ
         KMrlPn7WkaGpzNvpIm/W4u4jUmJDf2hXcCfpi4XEvExQySpnOgjWEVHW5MTQkvm/n/tl
         DmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096626; x=1769701426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbATD9gH/jg77F2vOXb69VjDypI/0O8i8+As0LO3lMk=;
        b=YvKmqdu8g0Uhfmf81RMy3czkpeuf9AuaruBUaBM3cPbn0Rit59twgfFwVL7aa8irHN
         Mx3JBMp0W/bXfGDxwi2r/a68U53Ka0GHne7rnoFIBZAtFJW6GtZhoSbTKu+CwMfkZPpf
         YTwycr9GFAH2ET8YLeFiGsh9hdSq+7dt1vYJlgtUlH90CCYjnvZc3HjGgDLZYFnv9zam
         gjptbo/KxtgYsE16ke4jtcPfR1vm+6W66Ht1PHiE5vfbfc8c/lxypjIRlUhCSslvHU3r
         gTN5VE5XZRAm4glBIHbYx3+mHalKr9aI0qENzVPrjZDl6RO5zxL/feyrBj2nKklq7PEb
         Z2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUseAFxZvWZv57zoTff48iK598cZa6zZ7i7uRWs6ljiH0mCyvdE8h+gcTVvAbFEXR+5OZ4g4zpfcCnGoE8NIedJ2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKFlFPbVD/XX5mm1OCP+KpASR5uzqyULLG8hKoxjcdb0gtZR9
	J2f2/Ok1Y3J/XrW30Hm8vxVE805fLFF9IJ0arZOZd5flhkZf1e+RTmz7VsFboutiOkI=
X-Gm-Gg: AZuq6aIg49sSsvOEyT1fHT2GEwONS87dbdZINvqUgtv1OyQRDPRXDi06IlX7Zuo+Yc8
	b6EpW3vzDnlNadPtKNpe71+0MngjbOZUsb3xHgYavQ1D40CYTnY9VwTiChuJEKEf8VctS7aL1xt
	KSAJvGWWPhfen1dK/zKzm0Iw5hAn+sKiy5nSGPXUFbugTxJuqNPoJzj2wUY+Mc1lKYqYHCJ29gz
	GIdsXEVSIG2FG1WTVYLRnx3jBF+9pLUJuk169TQwRwh6PkwwXaxzQYqr1HIWYAi4UXsRs+w4VTW
	9PozLeUIL0Axx9cJk/0Lr4EYeU+v45Y2DTXTikp6R3Rc0Vei05IENyNEAclKqEneGqPg9K+SxRl
	bn1IM4zJo4FlYBMc+LI7sq0zpaGHx9Lj62htJfAKfN84Kn+SRjUdh0JjwwaqFg53ZW6rCV9g+vx
	bNVrOaue8tYtV+4nxsd575Cd++LGzRJFltRj7UG5Gq2DUwipK2eJEqdCRKaaXKPQJy8KhnTeh6C
	qDDEQ==
X-Received: by 2002:a05:6402:2552:b0:64f:cfa0:9008 with SMTP id 4fb4d7f45d1cf-6584874e1bbmr49315a12.4.1769096626312;
        Thu, 22 Jan 2026 07:43:46 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c49f4sm16334363a12.31.2026.01.22.07.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:43:46 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 22 Jan 2026 15:43:42 +0000
Subject: [PATCH v7 15/20] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260122-s2mpg1x-regulators-v7-15-3b1f9831fffd@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Refactor s2mps14_pmic_enable_ext_control() and s2mps11_of_parse_cb()
slightly as a preparation for adding S2MPG10 and S2MPG11 support, as
both of those PMICs also support control of rails via GPIOs.

This also includes the following to avoid further updates in follow-up
commits:
* On S2MPG10 and S2MPG11, external rail control can be via GPIO or via
  non-GPIO signals, hence passing a GPIO is allowed to be optional.
  This avoids inappropriate verbose driver messages.
* Prepare to allow use of standard DT property name 'enable-gpios' for
  newer platforms instead of vendor-specific 'samsung,ext-control'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add 'optional' flag to this commit (Bartosz)
- add 'con_id' to this commit
---
 drivers/regulator/s2mps11.c | 100 +++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 88e21c90832a45547e5791b15cd1de274f81fed6..7f4db6673b43ebd533c2afb568ae3481351a9c60 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -328,29 +328,15 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 				  rdev->desc->enable_mask, state);
 }
 
-static int s2mps11_of_parse_cb(struct device_node *np,
-			       const struct regulator_desc *desc,
-			       struct regulator_config *config)
+static int s2mps11_of_parse_gpiod(struct device_node *np,
+				  const char *con_id, bool optional,
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
-	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
-					   "samsung,ext-control", 0,
+	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 					   "s2mps11-regulator");
@@ -361,14 +347,19 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 		if (ret == -EPROBE_DEFER)
 			return ret;
 
-		if (ret == -ENOENT)
+		if (ret == -ENOENT) {
+			if (optional)
+				return 0;
+
 			dev_info(config->dev,
 				 "No entry for control GPIO for %d/%s in node %pOF\n",
 				 desc->id, desc->name, np);
-		else
+		} else {
 			dev_warn_probe(config->dev, ret,
 				       "Failed to get control GPIO for %d/%s in node %pOF\n",
 				       desc->id, desc->name, np);
+		}
+
 		return 0;
 	}
 
@@ -380,6 +371,29 @@ static int s2mps11_of_parse_cb(struct device_node *np,
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
+	return s2mps11_of_parse_gpiod(np, "samsung,ext-control", false, desc,
+				      config);
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -903,10 +917,16 @@ static const struct regulator_desc s2mps15_regulators[] = {
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
@@ -1244,6 +1264,26 @@ static const struct regulator_desc s2mpu05_regulators[] = {
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
@@ -1314,15 +1354,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
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
2.52.0.457.g6b5491de43-goog

