Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CE1EEA2C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769591; cv=none; b=Y1aCt5h4rGCH4uCksTPXrN54+1CdwwnsD65RuQtNXzBkffeG3UUGc57iWr5aVJ20S5qW2V6muJolXO/TjBPeUfE40aN9Bn+00odDbgaEQdyBBRjO/OKNKgBzaYXTOCNubHryPmdQo0FUjfpHi71pwW/hRMod9t59HWuWMN+EHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769591; c=relaxed/simple;
	bh=2SEWJHOQRVHtm1hZDIQV8G5h9Ihj/ZSId7FCsdh0cUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cSlquTdP9Zj6xi7XQlGXQ+/ElkVf+uFKzEPJLsK/Kcn/0pBHK3W0u6Lur4vMSAJ2uIVX5yhM3/5V4wBv444q8Xy/kFP5A4Wj8wu3L61czI2XNLhEhhd/NCax4gJAlWI5tKa7Qd8JMWYBMEcDoCak6F07xbcU5mF3hH8lweSaKuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdIo1ocr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdIo1ocr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2aeada833so704468766b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769580; x=1743374380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=;
        b=DdIo1ocr6oN1WklNPRlM4v5d7MVDSh5ol+XMGFqEPShgIb3z9VDnKq7j64GpehYkeo
         V7Q5zwbhXHjozJGe31PomdnLA9V3GY3+tRPOhlJ+Qq0YjXtmb0jS/i+9iiPblgToXjk7
         CwspOU3w2RNjPAhm2uf1eMc4CN1t1vlgIZHXsuh1N5QqHqQrZJklXZZXj+OrdnAXHR32
         Tv3qChqTcYXJeUhcyLBcu4syBqo+0hEupi7kPld0J4sMva324Fg8HBJcZrA7zj3hyqwM
         qRqNrvtOvb0RTJ+RXY1S6zSzrzSimFoKBSn4Ld1lIRcRIJOyKX161RHBMqlC7QsR3yt3
         8LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769580; x=1743374380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFi/wIa2zliLVLaoNCXevujk62BEru73nW/QKRcDHsY=;
        b=iAZdFZIqSj3JoOiIcUi/pKLzGsqC+MYhWjHrg1kOyYa9GSo+DN4bysfUzhso0KAZ2h
         UGtIK6bqsPMGkNdcCcNeCm8V3SnKYpHq3VQK1EVuOi7IdDIxf2OE5/YK2zbFAZSwZG27
         weveY8KoqLDWF5F4WytUFKp6KxzhiNrKJ/WLnI7VO/8Gxay9ePyMGJmPqrBCG0wnH5rk
         EBSD2g7pV97yMEdQ+NoS8QgyZpdvSUmrLnUoqezFjedQCllLIRNpe3/jUrk8pnBDCNuD
         NgTcRp1jjCSLxF+W7sGFbUbPWOXAVue3OAbPHF+D5nLFSWnca06PC1eQwwsM3km80Ug/
         R67g==
X-Forwarded-Encrypted: i=1; AJvYcCXI+ybMduOSZLeg6KFpLWBjlb+ZwBxCxhkWU+Sctu9TMeXliBPmG5cWuZzQPWd4Y/OkY9gXLGvbu3WSV2U5dQpzcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybKk3xxqJpP71vu9PrSB5+p7v7JxieIhlQ0RKZOyfPfZGovUVt
	mp+R6kxxRT7uQevj9hnqsXlB8zwTYGdvs/o6fFY1OkookJNJ1D2W+bD5d0XPFdo=
X-Gm-Gg: ASbGncsmNDtpJbnJm6lzU0uILbnO4L5+fW/W4RoIyu8zNkAysOPRh3MKud+Pvl15Kaz
	5c9gSH7NudGP3daRolxgJY6NtjdNTsxYWekS8GeFl57eIwnBOY3Hn0qCSx1nHtef+1jJrASYwUP
	kyLmUdP9907k/BnnL5BPPNeRgKDm8y9x/jeu/MpexLnLbG178KALg0hfzDMTBesBQwqcFlOsW/j
	5zZTL8tGEJ6ti5FhKh8SgwiOhlh6L9iiPP9mIlmMsuqtGIKLS7xOgSG62MfNvxQGCZESAuPp6rn
	ONK4L0TaxHMDHEvaLNnQW8oVzhLtuMkZGpuO9iXsAXUXTVxcwadZjfnE3sDPAfhs5vMLePidEKm
	82BO+rP11XucgdvyGilKd02LjFqfe
X-Google-Smtp-Source: AGHT+IExdWMeq50KMSeL2g8X5YzwdCsnSfpgrljF2A0N/7BkwT1ZoOB/F1xNUkswffcMZkq5HeqMZw==
X-Received: by 2002:a17:907:86a7:b0:ac3:c6a2:a02d with SMTP id a640c23a62f3a-ac3cdb95075mr1563087566b.7.1742769579644;
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:43 +0000
Subject: [PATCH 27/34] rtc: s5m: cache value of platform_get_device_id()
 during probe
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-27-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

platform_get_device_id() is called mulitple times during probe. This
makes the code harder to read than necessary.

Just get the ID once, which also trims the lengths of the lines
involved.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index db5c9b641277213aa1371776c63e2eda3f223465..31bdceac7aa245175a30eb13eaaf1f52f70e22c2 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -637,6 +637,8 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
+	const struct platform_device_id	* const id =
+		platform_get_device_id(pdev);
 	struct s5m_rtc_info *info;
 	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
@@ -646,7 +648,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	switch (platform_get_device_id(pdev)->driver_data) {
+	switch (id->driver_data) {
 	case S2MPS15X:
 		regmap_cfg = &s2mps14_rtc_regmap_config;
 		info->regs = &s2mps15_rtc_regs;
@@ -670,7 +672,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 	default:
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Device type %lu is not supported by RTC driver\n",
-				     platform_get_device_id(pdev)->driver_data);
+				     id_entry->driver_data);
 	}
 
 	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
@@ -686,7 +688,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 	info->s5m87xx = s5m87xx;
-	info->device_type = platform_get_device_id(pdev)->driver_data;
+	info->device_type = id->driver_data;
 
 	if (s5m87xx->irq_data) {
 		info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);

-- 
2.49.0.395.g12beb8f557-goog

