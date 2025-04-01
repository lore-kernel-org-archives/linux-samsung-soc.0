Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617B1F0982
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Apr 2025 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502274; cv=none; b=cNfxZFo2eIg/oJJel7msutU8+C4h51V9uB/qmEb/bvuBA0O9y9vwKBNXEa157vnnLhBzlxb7q0Mok3hBKmmvw4ERpzumqbZhlHJAcB0XTmUeTQ4ISmina/TmM2125cpObDbc9+W2BKu0rxngRGtHvGYslXY5Jl8ZxK/zuP+cPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502274; c=relaxed/simple;
	bh=HRG8oyx+Mi+MU4biPMgGQvsmz+b2lSbgekhPGs2M778=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kp3g2XQlOSTprp//BOLEm4hNLMEKUxZttsVeBqpaqA0lnFdSft5inO32Q01GL26K3ani6rzOhDIeKLG2B3QuVtXqJaNVCJDqtna5C6WTveSo4bxcvBzCGu4Ft2QZUpFAWH3EQtQ0acoHY07e0XZSU2DWRvpsRIGI4W6jaLRMyg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGVnOt1H; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGVnOt1H"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2aeada833so1029734766b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Apr 2025 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743502271; x=1744107071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSsT7QLwFrGtJXgYzLTDttFLB1HtTy9nHcX9oWhHWK8=;
        b=yGVnOt1HGOcMEujFQdJiNC7MZmS3VlF5OT05LEG6wZchwxsIvyHnPGqdQATkHzKivs
         oNHjxkwo42l1kJFmf7ZNqAFCNqYPYlDOpNhwYEhZ1l9TWrirf6xD3O3Y+wNwV6TNP9iM
         Hr2hDTvMVxIWDKSHirh4+OXFSORBgQYmPtCcccOKPtSBz0YBvA6U2iG3HaxqpapdPO50
         sRlxdrYySX+yYDOZmJpdIioD8Uf52353I8Shq31ZEZd/gpl7MGXX8CAx0k1oHaW63uQr
         kQorHGGGLK0d89xzSxdorwrmeNKQqs0y6OBAqo29Vyy60E1yJBnbbrgvVpjTGidisH7a
         gfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502271; x=1744107071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSsT7QLwFrGtJXgYzLTDttFLB1HtTy9nHcX9oWhHWK8=;
        b=UDaZlj5LN6wJRVGWDGy85Vwzzb8NFav6U8DmKWL2h113gdOVMmt0hg40RtkzEz9IcF
         nMV3MJww22ToDhpS23VdUyYHIhr+KF0jJvPDUM+ZWG02uDVobQkol2JQP24ykLuSCbsq
         bSMOPOe3Lgl41vojM97h8LUAXsW2qubACWXqUiIDmufLSp5GZfN531s6a+GONuym3wHR
         dVeSJXufss+rT5Lg45sDmY3EOC3JFNQyuQ52R8vV8SUc7KGECtNEeiA9519SrPtGV2lC
         mjNIBNzrA1Xn8LPVT3kgRCYA2bHOXUqpfzcNRe8b8h464KRKSMAAI0LfJZJS6l7i29rl
         asRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYszHqZ4gy4tb/A9DDqvZJgt3Z9UZ4jdzxmXqZtjv5Ri4bqu0l0kPkotjD642R+ojbPKptyp+60fvPzYLZbOQE5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF9HdI9EdGafhE+c61KiO4xWiQNk6R8brlEyBUAHq605cKffB3
	+2FzcErLFJbIwTN3DvqYDT7DgQI3G75MMmzDXmtuJ+KQb9g+87rxPtjURMx0kmc=
X-Gm-Gg: ASbGncsj8rflkz7cggJDtgEVMCRmp/zqYV++HwMO0jJ68iH9wuQewJayZfffvJbVyDN
	aARzh1+ZpD3XIgSXoBj7roKoIjUxuRIhVnsHmCF8fTRwypOV4766LG2EfhpekzqR0PsjfUNJRRj
	KmLa4pODBqY6eNDh9Q6Q2pMIUQg3MHZ7akJ4k3NGrccm57S9Vbb1NzHI8PNkfvGaKPHANRuayoK
	bRGCzeOGxwe77YgOUOcOmB7w9T3HKZuvnvGyjiTkliUoQsDYuIqDa+81JHfJqkxGFhzLSH5I4Me
	hC1ztcqAAl/5JNncZJH2w3kbmBDJK7V97+Mzucdl07fzD9aTjrmrmCTwjn1lWgLJWk21vIButs3
	KmvVVYMyFRJHBMlEXLQgPf4R5l9/r
X-Google-Smtp-Source: AGHT+IGNz7sYkiZJ5SyCXOSh3R3E7uqsbcgG7MH73jgfKQy0aOMK7a6G6QNeK4q3SoREpDx6w1RXWQ==
X-Received: by 2002:a17:907:9482:b0:ac1:e45f:9c71 with SMTP id a640c23a62f3a-ac73670d581mr1256026066b.1.1743502270478;
        Tue, 01 Apr 2025 03:11:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ffcdsm757406966b.140.2025.04.01.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:11:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 01 Apr 2025 11:11:03 +0100
Subject: [PATCH v5 2/2] power: reset: syscon-reboot: add gs101-specific
 reset
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250401-syscon-reboot-reset-mode-v5-2-5b9357442363@linaro.org>
References: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
In-Reply-To: <20250401-syscon-reboot-reset-mode-v5-0-5b9357442363@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Linux supports a couple different reset modes, but this driver here
doesn't distinguish between them and issues the same syscon register
write irrespective of the reset mode requested by the kernel.

Since DTs should not encode register writes (see e.g. [1]), update this
driver to support different reset modes based on DT compatible match.

At the same time, add support for Google GS101, which does support
cold, hard, warm, and soft.

As an example why this is useful, other than properly supporting the
Linux reboot= kernel command line option or sysfs entry, this change
allows gs101-platforms to default to a more secure cold-reset, but also
to warm-reset in case RAM contents needs to be retained across the
reset.

Link: https://lore.kernel.org/all/20250227132644.GA1924628-robh@kernel.org/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/reset/syscon-reboot.c | 98 +++++++++++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 21 deletions(-)

diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
index d623d77e657e4c233d8ae88bb099bee13c48a9ef..2e2cf5f62d733c7c07110f3052583607e25afd5d 100644
--- a/drivers/power/reset/syscon-reboot.c
+++ b/drivers/power/reset/syscon-reboot.c
@@ -14,11 +14,24 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 
-struct syscon_reboot_context {
-	struct regmap *map;
+struct reboot_mode_bits {
 	u32 offset;
-	u32 value;
 	u32 mask;
+	u32 value;
+	bool valid;
+};
+
+struct reboot_data {
+	struct reboot_mode_bits mode_bits[REBOOT_SOFT + 1];
+	struct reboot_mode_bits catchall;
+};
+
+struct syscon_reboot_context {
+	struct regmap *map;
+
+	const struct reboot_data *rd; /* from of match data, if any */
+	struct reboot_mode_bits catchall; /* from DT */
+
 	struct notifier_block restart_handler;
 };
 
@@ -28,9 +41,21 @@ static int syscon_restart_handle(struct notifier_block *this,
 	struct syscon_reboot_context *ctx =
 			container_of(this, struct syscon_reboot_context,
 					restart_handler);
+	const struct reboot_mode_bits *mode_bits;
+
+	if (ctx->rd) {
+		if (mode < ARRAY_SIZE(ctx->rd->mode_bits) &&
+		    ctx->rd->mode_bits[mode].valid)
+			mode_bits = &ctx->rd->mode_bits[mode];
+		else
+			mode_bits = &ctx->rd->catchall;
+	} else {
+		mode_bits = &ctx->catchall;
+	}
 
 	/* Issue the reboot */
-	regmap_update_bits(ctx->map, ctx->offset, ctx->mask, ctx->value);
+	regmap_update_bits(ctx->map, mode_bits->offset, mode_bits->mask,
+			   mode_bits->value);
 
 	mdelay(1000);
 
@@ -42,7 +67,6 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 {
 	struct syscon_reboot_context *ctx;
 	struct device *dev = &pdev->dev;
-	int mask_err, value_err;
 	int priority;
 	int err;
 
@@ -60,24 +84,33 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 	if (of_property_read_s32(pdev->dev.of_node, "priority", &priority))
 		priority = 192;
 
-	if (of_property_read_u32(pdev->dev.of_node, "offset", &ctx->offset))
-		if (of_property_read_u32(pdev->dev.of_node, "reg", &ctx->offset))
-			return -EINVAL;
+	ctx->rd = of_device_get_match_data(dev);
+	if (!ctx->rd) {
+		int mask_err, value_err;
 
-	value_err = of_property_read_u32(pdev->dev.of_node, "value", &ctx->value);
-	mask_err = of_property_read_u32(pdev->dev.of_node, "mask", &ctx->mask);
-	if (value_err && mask_err) {
-		dev_err(dev, "unable to read 'value' and 'mask'");
-		return -EINVAL;
-	}
+		if (of_property_read_u32(pdev->dev.of_node, "offset",
+					 &ctx->catchall.offset) &&
+		    of_property_read_u32(pdev->dev.of_node, "reg",
+					 &ctx->catchall.offset))
+			return -EINVAL;
 
-	if (value_err) {
-		/* support old binding */
-		ctx->value = ctx->mask;
-		ctx->mask = 0xFFFFFFFF;
-	} else if (mask_err) {
-		/* support value without mask*/
-		ctx->mask = 0xFFFFFFFF;
+		value_err = of_property_read_u32(pdev->dev.of_node, "value",
+						 &ctx->catchall.value);
+		mask_err = of_property_read_u32(pdev->dev.of_node, "mask",
+						&ctx->catchall.mask);
+		if (value_err && mask_err) {
+			dev_err(dev, "unable to read 'value' and 'mask'");
+			return -EINVAL;
+		}
+
+		if (value_err) {
+			/* support old binding */
+			ctx->catchall.value = ctx->catchall.mask;
+			ctx->catchall.mask = 0xFFFFFFFF;
+		} else if (mask_err) {
+			/* support value without mask */
+			ctx->catchall.mask = 0xFFFFFFFF;
+		}
 	}
 
 	ctx->restart_handler.notifier_call = syscon_restart_handle;
@@ -89,7 +122,30 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 	return err;
 }
 
+static const struct reboot_data gs101_reboot_data = {
+	.mode_bits = {
+		[REBOOT_WARM] = {
+			.offset = 0x3a00, /* SYSTEM_CONFIGURATION */
+			.mask = 0x00000002, /* SWRESET_SYSTEM */
+			.value = 0x00000002,
+			.valid = true,
+		},
+		[REBOOT_SOFT] = {
+			.offset = 0x3a00, /* SYSTEM_CONFIGURATION */
+			.mask = 0x00000002, /* SWRESET_SYSTEM */
+			.value = 0x00000002,
+			.valid = true,
+		},
+	},
+	.catchall = {
+		.offset = 0x3e9c, /* PAD_CTRL_PWR_HOLD */
+		.mask = 0x00000100,
+		.value = 0x00000000,
+	},
+};
+
 static const struct of_device_id syscon_reboot_of_match[] = {
+	{ .compatible = "google,gs101-reboot", .data = &gs101_reboot_data  },
 	{ .compatible = "syscon-reboot" },
 	{}
 };

-- 
2.49.0.472.ge94155a9ec-goog

