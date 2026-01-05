Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88E32B98C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Jan 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603721; cv=none; b=IbOz2lJ1mBUrVvzXao9Q1DpOjPvMUsEzNdf3i0TxhHdCS0NgQwXd2O1m5qCSfB4SctdGm0c9BQsfxARlA5AU1h20XBfBJDYPyFH6sWMhB74CVw+R5sh/oSIjsgPM+l94jJTLTpafqwtnLhixhQQeub1soQAx4y8St0D8O+V3T28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603721; c=relaxed/simple;
	bh=RBiblDYuoL7LiB6An/b16TWoN7ju2Vuj/2Yriz+avcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEef5grgTi+PvhB+E2whkZYFmR5SCax6onqyXkRv6X68suNs2uM3mAWxRSYNYj3VpYXgLg0FvA3T/K4SguZVqElCgaeOtJZaRdfPQbnpGGbDq8JMXcchxP6BekSL04ZEwhVkPKt9DlLN+H2cmxk+CN+J+fGTW/TptK/+SoBupss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJARZl2v; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJARZl2v"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7355f6ef12so2651659266b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jan 2026 01:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603709; x=1768208509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCOif9oxn9Ts49wbKRM5kmB/vgWlHk9jFqT6IaUcSpc=;
        b=cJARZl2vlRj5yAtAmwO0+6xn7F7n9mlhRNHE5R3EVZIr/8c6v5w9VGxYDqBXSU/So3
         kdYi+4IFzX55p5hM/31ZmFG3zm7Co3aKT7iK2zHfiBh7FTxNihTGlplDFTrBrShajhO4
         z0uJH1h6bAlQebLBU5UWq0daTZwZogBHl6R+L9Jx14dx8DJEy90Hebmos2EeqAwRsgly
         e60EQDZMmvcoQ1mrbkMkOsY/POMqwUEJBeAEXuSmMRuvK5BnZp1iZI50xpzA/6E3hnkm
         g7PDYFGGhas1p5KvVliQ39J3WWqzzDhR2aHL9pOR4p2no/MUhg0abXNSCRR3+BrD8Xnn
         eJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603709; x=1768208509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QCOif9oxn9Ts49wbKRM5kmB/vgWlHk9jFqT6IaUcSpc=;
        b=J8Ww8dMvh8Dq2sJRnkE2NWtLwnE4o4hKRXqMq+sFaZ2exoCFK8GQ8CkM24rp2FJyTr
         IbzJrK2uPUaOp6ptMnCNg1QMEe2s/AIAMbtx4onPLVmEO+KWZ6MrBgTIKclIQI5SGFSn
         WBy64PJASX6Uyk55nhxMKUmGZxcZ1mq3ctSY5P+nGznTE5Af2PmjRUtlOaDFBb6QycnF
         YYal2rZz0DSygHllvSsMgxyTstCxqi839ZwJ7tMz21TsxUjLZE6MAD8OPjRbzohsEf9Z
         20g7ZSpKYm0a8Ib8tZom35x/i7NwSRiYtW8PiBCGxOWALolGG2SiBiAK1Xd3RJsA6eGr
         KWRA==
X-Forwarded-Encrypted: i=1; AJvYcCUKDFsRE45pcbFCff0p32UxGvjVtfgGCFhaOxgt8bHvB9ZnYvEGwEpTwqq16RE2qsh+np1lbtZ/kr5Y+EKW7P0OlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmjwgxnjJpeO9/QGY0SrmDn4qvNYMQGI2hDcyxDrek6UFd16BJ
	YxJSoMbTSEG6gZrPNLz5hxIOSFgyTWtOwKwl1l65tL2R2hmkWexBWlHliVPl8Oy4X1c=
X-Gm-Gg: AY/fxX7q4XOU16vq8j02u2ucQ2TI7auPW2wt6xhgm3yUkwNDvfuraSvPnQm7tnPEWnS
	riSYacz16JGkWLGpclwXm26cRPawK78BqBNxiS6NHBumSwH7wdYxE/luCnEoiCRoYSfzGczPJMa
	Ndc91mx/jOIqUArycKdEPx6XQRGGg19+vmLDzgsWPKvNj/9rFJRwWfSS5hUk1xEG8Sg5ylWahKZ
	bpMtxz9DTR6TDBFoBLy+OJ4NRfoWjancnIQEN74eIy/2XmjUWoBPMk8an3HggUJapg/G8zIhq3k
	fwoRxz9gb0osl/QFRcgDneAk7v/HLPekPDZ3K3fQeZ+Xq7Z1pI4ya0WAVRGOJVx55MYAyf64qmP
	EpcHOQuA17Bt2M+g0h8F1A7nFAASYCoT18IHFQ8qU9bHIfpzU7KJ1Rlu5rVuQT4ivLU9ymivJ6s
	SuB5l+1w7MIf6BpwujCWYLCV738lImAH278eJReTkQ10lGgFXRfJvAeF2dfXQ5jAxojC2GBs5Zw
	lHboQ==
X-Google-Smtp-Source: AGHT+IFUVIMSn/sV3dFiXZcscsT3hGk0kSrJJy4RRYZc736gdsQg7/QBdwgX43lVqJFHn1pNi85KIg==
X-Received: by 2002:a17:907:948d:b0:b83:95c7:e984 with SMTP id a640c23a62f3a-b8395c7ed4dmr1656276066b.49.1767603708754;
        Mon, 05 Jan 2026 01:01:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:51 +0000
Subject: [PATCH v6 15/20] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-15-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
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
2.52.0.351.gbe84eed79e-goog

