Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD351C84AF
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769582; cv=none; b=RzgYPq23NGp8jCw0PsaUj2zgP7pknY81hPxOgImvUYHmmMl781OHrmvKdZ3up096n7/2dC8EGI9QSWWuuztux0dAS7mCmqHxEw4rF67xEdKlfWtTLDMfEhaLZiKtEHuYDN4ffjgMRFAvYXYPw3vvsjklPIneq+IrCLGyS7pDIYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769582; c=relaxed/simple;
	bh=QKL8Ytaf6dGtPsAh1+74H/LNJepm9+/T3Tzf5JXAhIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=doU5+iTosKY60aFpClSVTCyybXY7EA1bBp2qZSE7q+goHH3HSSR4EwHi5CUBLKVKuAKjHn8YSMSEeGPt2LimDGWiFuuMU8es/O95Q7Sjpn180hJG7hSLH/+TGEd6spv/nDtg5yNyfmSwQokhsq76AU6sJ8rA3xImWR2sa0PQLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHd0oSTl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHd0oSTl"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbd96bef64so675918566b.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769573; x=1743374373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTxU1W+gue/BWMRsVQK9iOH//Nw2cf3wcu3aMwThOM8=;
        b=wHd0oSTldpBEK5QJca6xnISTHeraeFQFVQnjZt+SY6MY7+JUtabMdmulosGwhZ9DA6
         9bPOBIXY2zbcSv3Vbbqg1w47xaMHu4BHi2AvF2hZgb+kQg/OvBD+hZzHNwNoBRdTUCKj
         i5b+VrluoDcovZV0C8feIAsVHAx6hBKqBbrgxEQ4viTtYtqNCY4ZmyIdWh07fZtgFEAI
         ytyTII+kLIGQDFmXwgD5GT/D4LaiV0C4tUAQITML60U1piwk+rW94KiMti2AcrwgoFFu
         zp9eEBDIHmNIMkTmy9MWF5L6+KSxxOCBEkvCht0d1Qo2kfoExM8ziQTPDf8dsgHnNVhQ
         rNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769573; x=1743374373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTxU1W+gue/BWMRsVQK9iOH//Nw2cf3wcu3aMwThOM8=;
        b=lMCQM5YaW/Qbp1bQ00z2FUpC34AXFzbaVX6mIjc/xetCIk1veV0Mh3JP9YG+gV89KQ
         wZJCJN8mbSq9sTlYhRlAsA15dLjIj/ovz0JGKvQOSBi1ZL1OV0EyK9MbjrE2eGt9B2xE
         wZ9h7dS3JYpWXBM6guZalvgVhhbRgd1H1FisPLFY16Ws8tjleYbQbedbF58KWbKVTuep
         7J4AlDQtjBkyIuX84hXbPUiGkA1FsR+eFIzpnX4pVunYDN0YD6MivdNKf9Icsbyp9mPm
         P6IKFFl5OTgxc5KxwrNcVbY/M2+4FS/Voc+OLrMyLMS97OokD4hp2+4N+PItlA3e8nmK
         Z5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtQzf6bLSgOeH9jCi6J5IYsJZNUpQFTS9HuLOhFfhdV5iX8HDT6erxh2Qq5JCdioxxClzC4bzC98+LUlEt+S9iJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzInZATLYbqLDsgO0AHYmrcSsdA+9EUOLvBv0uh+t0AUiURgz5d
	XW0kShKS2Ao7AnQslugsHMqtPAsDb0I2JHqVkVb04Bk8gj4WoKNw7IMZvvTWl0I=
X-Gm-Gg: ASbGncu+ga32MDIggSJufDITOhWbnclIkVY8dSyT7/moi8+oWkDYmOV3yrB9o8zHKjA
	+b9z20UtWTFPtR+IBRsIqq6Bq99/gaMZaK8B54BQ9wbZGGJ2QyQ+GsJZtbxxD/4Hrk1uBsAHWmt
	TIShbpdY2JsaH+6DjJQ2FhlJcAoVjwhe806GbABP0KT/E+OGPEf5+1QFhLlH1zwdT8pFAs6PVYm
	ey++6GiHdqZhhk9+FpN3/pBvSHiOv1qSvg1FwqBahVudB9HuXj7ky9wRy4iI5xNqZt2gFI5z/KO
	MsKZG4DrPWXcalbk7wBt6/PsOP5wySN81n6Aj+My/NpinyjUR3Bg1Cok6Pvl/ssxhlnR/0RR32F
	A+9bXT3bG7gMyDkepqfEoWpyEgJxD
X-Google-Smtp-Source: AGHT+IFRwsk7g0/V5N71R/aeNk5DfXRJnWzrEBdlGqW+YmGP+K8r15zEhceKjqCGxIHr3ot1FPPH7A==
X-Received: by 2002:a17:907:96a5:b0:ac3:5c8e:d3f5 with SMTP id a640c23a62f3a-ac3f2238ac9mr1051718066b.27.1742769573042;
        Sun, 23 Mar 2025 15:39:33 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:32 +0000
Subject: [PATCH 16/34] mfd: sec: s2dos05/s2mpu05: use explicit regmap
 config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-16-d08943702707@linaro.org>
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

When support for PMICs without compatibles was removed in
commit f736d2c0caa8 ("mfd: sec: Remove PMICs without compatibles"),
sec_regmap_config effectively became an orphan, because S5M8763X was
the only user left of it before removal, using the default: case of the
switch statement.

When s2dos05 and s2mpu05 support was added in commit bf231e5febcf
("mfd: sec-core: Add support for the Samsung s2dos05") and commit
ed33479b7beb ("mfd: sec: Add support for S2MPU05 PMIC"), they ended up
using that orphaned regmap_config in a non-obvious way due to the
default: case of the device type switch matching statement taking
effect again.

To make things more obvious, and to help the reader of this code while
reasoning about what the intention might be here, and to ensure future
additions to support new devices in this driver don't forget to add a
regmap config, add an explicit regmap config for these two devices, so
that we can ultimately remove the generic regmap config.

Note that this commit doesn't fix the issue that s2dos05_regmap_config
ands2mpu05_regmap_config really are incomplete, but I have no
documentation on them.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-i2c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index ce1e5af9215a305fbb55157ae4e7bfb9aace86b8..3912baa5c2f918b7ad345e2bbbbe4daf2e49ca6d 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -66,6 +66,11 @@ static const struct regmap_config sec_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config s2dos05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s2mpa01_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -120,6 +125,11 @@ static const struct regmap_config s2mpu02_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static const struct regmap_config s2mpu05_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct regmap_config s5m8767_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -158,6 +168,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	device_type = (unsigned long)of_device_get_match_data(&client->dev);
 
 	switch (device_type) {
+	case S2DOS05:
+		regmap = &s2dos05_regmap_config;
+		break;
 	case S2MPA01:
 		regmap = &s2mpa01_regmap_config;
 		break;
@@ -176,6 +189,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *client)
 	case S2MPU02:
 		regmap = &s2mpu02_regmap_config;
 		break;
+	case S2MPU05:
+		regmap = &s2mpu05_regmap_config;
+		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
 		break;

-- 
2.49.0.395.g12beb8f557-goog

