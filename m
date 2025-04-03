Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861124889A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670766; cv=none; b=b5anNupZVl4M5fDi01cOtffLyyD6/j4YESCkiZoaAxts91IGjfdqGebRCUmHxTpx2eazerGhAotxDDN13xSCTM3CDHlU8ddQBXGmED3I+uuTvT+6ijBBvKsyvG0JD7q0vyEUkdbUVytxwCFbxCR7OggCVrtHmMl5mRD00j8MQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670766; c=relaxed/simple;
	bh=XY+ty2A6DQsXp5psWmWSxlDWQ8KjYhDNZ4NRtatMswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4pcTF6OPAr8D27Cv7WMN/P3Mxw8kEprzW5PahDjJ5beGdIg5XXkGniRB84oaP5wAXX6C7KPI9sBUEAUTKuXTJTBMJ9gcPPRQsH8h00XdKbRprUBy9CNvjCS+/C1W0tZML5aY0HZGF0rKuEvG7Mts93dkauCVEHqUATSeLc+bg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MK9oQ5Ll; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MK9oQ5Ll"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abec8b750ebso106540466b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670756; x=1744275556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=MK9oQ5LlNoFVd/eiMrTIFte5DX5KBItDdT5nwdslQOV0d74+Rv6+RE8WRrGV1zk/MV
         fUWV+fldEyWoycNJF1zNTQEOHIKPcfQShWUfdd/4lSVIUBAQsN8MB9WMqq3MxOIoixcw
         E3sK899aMCyIENr4RWnal14aRubHIRzVFsP+mwIGeE+7FNnOm3+yvVDmcebmOrB29fxj
         gwegwC857GTWxfjk78BTXuZuqUeOW0y6aFFbao+Jb/BDZIh8MnUUX5T0PUKvSPigU3Nh
         pKcMGmktO+m6HLrf3ujS2hbuaUmQFOz1L5Am8GBtIpYyjzkqUNNDsp9PjKEl8fQQH1SI
         A6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670756; x=1744275556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=QDoIlydfcVXLSkGuj8xulLZU8ur3btCr6vPKY8/lnM4pvz3NIGk356sBvKiB/sc4tQ
         AlDU81pqsJZPT5sCLhjLIwweuciY7aktBqwTBjbozwXqcq+wdZm+p7hr09sguKi2+sKM
         YuP5gXWHDaSr1hFQSx1NJBSmqxAWA54PnKwPV05iqdxtPNZjKJYXShUC/ok3ZeounyDH
         hKhbpLu/98rYQCAZlLy6ha7dLs/UZRorWD9OBgOXZgGKQCpEUd+xqMxauDAIED8wr3Nc
         kKCjxYntLDRrMgTTN2npDiEwl/Dxt8e/To/4zcevgjLzOVGiC0uQEFwYNv/XkAyDx+6w
         4NIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0TTf4VA4SDQ7sqbHPDBIxY09/4SPdQxGkg3m7q2lvf1TcxOGRyJwOSquyEMxqtIbb9Q9MD9uInNsaTMnoFJRXgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTTq1dXHuiw2rMJUOhCK6CkckqY+mTOuQZtAn9iHv2oU9Ulsc
	4OZgvRolK9xFoeRj1Vj0L82sYEORjWVt3q25aAvZDPKm4YYDTU2As3gld1mtkzM=
X-Gm-Gg: ASbGncvCqbyMr6v3qtxHJ20OKG00GlKV3V9Kpv/Coi4PVfnxX6bRw8WkgtzXKyfvMsq
	KoXgMGMJ57b2JgmAux0mPtGx3nOFqMRb+o6fJB130hq1uhLp48WQlx6fb70SZVBxhPXaSzPfFLQ
	wZZGxG6jjzzuSOG5Bta2CoSteA3bJRg5hTN5Z2MItMsgrEzoqX+AYrknMk9a6sqO/hXfdWhfUXQ
	Vao7NpTqH4fxJztLEMIphzwyIgsYF8J1XzdUXXSUJ00gptlZrQ3LRSb/1Zw7ZJNx3qxGSBQfq9j
	CtgQHaRoed7Vvz/86+wG/JT/SzoPJZ+4EjbWzrFCPJQBq/fjhjoA+tpcG3RmH35+23gfe+CBMTI
	q2Ok5VVBBoyiPo4tcvzc4IdDgnzks
X-Google-Smtp-Source: AGHT+IGxqvs9WDVLgnZbd0Q1P61p74Sjm20wNP22/EBrrIOH4ecB3274nitjn+0Tvp+BuQBO2JC0vA==
X-Received: by 2002:a17:907:c23:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac7a165e83fmr473122266b.3.1743670756231;
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:18 +0100
Subject: [PATCH v3 26/32] rtc: s5m: prepare for external regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-26-b542b3505e68@linaro.org>
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

The Samsung S2MPG10 PMIC is not connected via I2C as this driver
assumes, hence this driver's current approach of creating an I2C-based
regmap doesn't work for it, and this driver should use the regmap
provided by the parent (core) driver instead for that PMIC.

To prepare this driver for s2mpg support, restructure the code to only
create a regmap if one isn't provided by the parent.

No functional changes, since the parent doesn't provide a regmap for
any of the PMICs currently supported by this driver. Having this change
separate will simply make the addition of S2MPG10 support more
self-contained, without additional restructuring.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 81 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 53c76b0e4253a9ba225c3c723d35d9182d071607..86ccf666c68059408907c97f2647716ffaad10c6 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -640,52 +640,61 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	const struct platform_device_id	* const id =
 		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
-	struct i2c_client *i2c;
-	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
-	switch (id->driver_data) {
-	case S2MPS15X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps15_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS14X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps14_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S2MPS13X:
-		regmap_cfg = &s2mps14_rtc_regmap_config;
-		info->regs = &s2mps13_rtc_regs;
-		alarm_irq = S2MPS14_IRQ_RTCA0;
-		break;
-	case S5M8767X:
-		regmap_cfg = &s5m_rtc_regmap_config;
-		info->regs = &s5m_rtc_regs;
-		alarm_irq = S5M8767_IRQ_RTCA1;
-		break;
-	default:
+	info->regmap = dev_get_regmap(pdev->dev.parent, "rtc");
+	if (!info->regmap) {
+		const struct regmap_config *regmap_cfg;
+		struct i2c_client *i2c;
+
+		switch (id->driver_data) {
+		case S2MPS15X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps15_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS14X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps14_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S2MPS13X:
+			regmap_cfg = &s2mps14_rtc_regmap_config;
+			info->regs = &s2mps13_rtc_regs;
+			alarm_irq = S2MPS14_IRQ_RTCA0;
+			break;
+		case S5M8767X:
+			regmap_cfg = &s5m_rtc_regmap_config;
+			info->regs = &s5m_rtc_regs;
+			alarm_irq = S5M8767_IRQ_RTCA1;
+			break;
+		default:
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "Unsupported device type %lu\n",
+					     id->driver_data);
+		}
+
+		i2c = devm_i2c_new_dummy_device(&pdev->dev,
+						s5m87xx->i2c->adapter,
+						RTC_I2C_ADDR);
+		if (IS_ERR(i2c))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
+					     "Failed to allocate I2C\n");
+
+		info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
+		if (IS_ERR(info->regmap))
+			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
+					     "Failed to allocate regmap\n");
+	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
-				     "Device type %lu is not supported by RTC driver\n",
+				     "Unsupported device type %lu\n",
 				     id->driver_data);
 	}
 
-	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					RTC_I2C_ADDR);
-	if (IS_ERR(i2c))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c),
-				     "Failed to allocate I2C for RTC\n");
-
-	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
-	if (IS_ERR(info->regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
-				     "Failed to allocate RTC register map\n");
-
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
 	info->device_type = id->driver_data;

-- 
2.49.0.472.ge94155a9ec-goog

