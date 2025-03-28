Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD22356D9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168682; cv=none; b=QuuR2V6yqPhvvfYThXtcUl0zAuPsHpK68eZcOgQQpbJrp5QUdMiT5j8gHLA36VTZzCMtUxcw0+qvnw7OJbwkCPgsDqs0i6fw9MwQMcKTrCGwTXRNoloTEBR9Gnt2pLZ/dRZ6VT+ABNNyHEpbKAc8mQEjvYD41a8OePQyLpnJHO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168682; c=relaxed/simple;
	bh=XY+ty2A6DQsXp5psWmWSxlDWQ8KjYhDNZ4NRtatMswk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyKU+aIqHWAlSU5z5vG4Du5bujWRFYRaPm8wyiamjA9XNDGvN75g64BIE2f1dBfFVyNeTeUjCz08uESyiSe6YvPrtQSOoDRmE0/hDH9NuC7cXu46aKjDMCOL9Fe0oBCcZ4RwfsGrINX+qMRgzQUUskuKZQ1f20nGrH6ZOwKpUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htuI/5Kj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htuI/5Kj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso3340384a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168668; x=1743773468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=htuI/5Kj+N4M9iQ5qZsneFvMhkGiG/Dvah7wWJMKzFBvwI510nAHZ5AUuhuaqWwWlJ
         2X0Rozmqiv9JHUciOoMO6ufGvwmdBJHtYriBGNohYh22Qc+Mk5RyJ2OtlYIkRmz5ZX6O
         A4iJAXDUsncgula5qYVi+pRl5CfS09LsLz594rq0TpLT3kauYHsvs+rfJpLXSOUXHoil
         l4IPK6KBuGAc95SDQvOiTzipo9gfDWJ92h5zkFxi7ry9F1BEb58/ATYbpWpSpT7ZNNKv
         CCrlGkO7l3lhbtOBAWms5mBXCtUzKRiG3KgcDSR6lcnSd8N6Y09WXbX2CQ5DA+8D/Wj/
         UEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168668; x=1743773468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwiQ684ZfeWSIriRYeiGWHceehqqEuabrmdfgVRjbUU=;
        b=mPQsvoEwuF9lQoYTynvLW5xyWTBmIUuMLBsypJtAALLE4IhoB/axLLu7wPVbHihvYC
         yE+LSBQcrz4R09rupOPjbhRbBOdWqTiIYA8OSSDyUnNEmxuBIl5D8vAjaPV1S8mZ/Yl2
         Y/iBaX/F0/DHGuLdKnP7UArVxFVyiNCpByeOWeOzFFQQV7notgxNMwAbSB+NxkDl9lMh
         RvcxBoQJbz07XBCFPs3TqnJFuBcgY8aRYX0w5xBt531JP4ocASeqSnvFvNDZ3ykfG81s
         HAyASqLjigE5/he/BUkMKDo6CdlOIboRjQ5y5LE1Ojiiwj8vGJUVVvCd6sYPI5FBbrjl
         Ulcw==
X-Forwarded-Encrypted: i=1; AJvYcCVGc7cWy9XCPMCrDARszOncGIep+XRuqFDqpUuAfw4pH690cT2M+w8fSuuuuhcZlUQujIt1iHL44oZK8IP32SZ6Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGObwqIYmTK8tdv3zPE7/yRc4FFaUfVAYvG9vOXTGXLF6/71/
	7CZ5wMx3rp8iw6/9TMGW8b2qAd8LmHRN0sSAS/iPvKbZiEnuhnnhU8GkLa+sUU4=
X-Gm-Gg: ASbGncu9uM9vuESYgAl8Ap0l34sb6WX+OJ+2TZCilacUQVU+7c++wuMDgwSiyI92Ux5
	2zTgR7NAO2uuZzOHEVaQZq4rkctv+Ho6u5YTxhO+euY52khT8WLfO2Ak0yrAVLEePGJX4lvrOvu
	klPxZT/kU9pC4IWiOO+ACP8imjENR0d1zzTDBp6AoKiPr/cbmFSU3q53snDJ8c8rqhxLFoCK0ks
	7R+nwnXaVXnlsV2RB5MWC/Oyei3/5KUawKH1aC1Bd2XUhABON2P45YT5tOKxGIIkAQD+zRumpj8
	nhB4g5JsR1k6FmHDMm4MHBCqGnjtVLSENunD+qLmfqN47/em+kEsOxG4siRD7qY4Qe8+yMKqEsN
	TG2hrMFuOWmnsx6EXpEsQmGcXsB4kKjn+4pfPHUM=
X-Google-Smtp-Source: AGHT+IGGNzjfKLDz9VEqvXIc5x4+us5D+sfcsDSKvKIds4Ov17i1NhheRxJHbrgm44PnOKBE2PxwXA==
X-Received: by 2002:a05:6402:350c:b0:5e4:9348:72c3 with SMTP id 4fb4d7f45d1cf-5ed8e27b242mr8087751a12.10.1743168667494;
        Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:12 +0000
Subject: [PATCH v2 26/32] rtc: s5m: prepare for external regmap
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-26-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

