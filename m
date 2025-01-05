Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C610170A1A;
	Sun,  5 Jan 2025 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736093037; cv=none; b=U8XcJbBC+/ASMHh9gu5QQOk8gSjcMB1NMmcx4LnMUGKjr1VU5IoiCyu/zQQ0lQxY8wB8kmeCj/Puz6QVt/hmkV88LLNyJyXS8AtK9F7a2J+m4vi+giD6eDqWE9JtW+swUh45wZFJoHaXBmvrxy3jnefYshdoFB4Qx4+9aodAmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736093037; c=relaxed/simple;
	bh=tOL61MgqnuofY11OZxfHCe+181ltQAac8Ymr6cUywAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OT+3K2U8GpKv1PP43GltZJc/II7XeNPOISK2zsf/psVqTAeq4vmxTz16ZLPZ2JFe2+h7XZzE0tvQEISraE45amaZsA7yBrOyNsceHWftJjMVkI9lZR1F6NQgrP8lYC5F4QoN1RmYoqtPKVsuiH9wIVGBLsXHnChXFTaLYr62a28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9SASbhm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9SASbhm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso90104515e9.1;
        Sun, 05 Jan 2025 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093034; x=1736697834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cUvc9znz0E7tKame3aaiF89AtwZ/kSu0btFLEU1OTU=;
        b=T9SASbhmAh+1jOyQQF91izElM8eYLukFCjVENDUMudLo6PaqfgKwbAPJbvVvw+uYkJ
         uYerWstrRGRkAZNTNVaE9lZWpc72Udn0Zl3h2xPUF2XB8GFgb/3znXNFNEsxZXiilM6y
         CGYQnM5Ep1WFSkH+zPW9NRLftmuo7fAEhgrs9sesrQDCuNLPBGiX9dlls3N+z0SK9ei8
         HZr/1EYOrRPWhoBanKUscmF7UnFghKBt3h0o9kzYRJ6GyyczN/tJfF07U/jXy16IAMeg
         PADv8qM+MKKCnG1LJu3bVdsCazNwoWh33UB/HSOWKHj1aJpBsBRVIp7rICUjxIvuBvF5
         Ka5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093034; x=1736697834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cUvc9znz0E7tKame3aaiF89AtwZ/kSu0btFLEU1OTU=;
        b=WvyBkx4FFZ4rOCFr+iPbwnprLmn9afCecqh62xeYZ8zVhjjTiuF4+3NwDRUqc/8xoZ
         BYubNQ+4ntCHnE6MBWQP607LTtH/VZDjp/bkWXtJrxm1hR2klWB9XuCFj0gwwlic4o4i
         kjiVsimPpBc+aaTQI08lP4DfuDtd2bY50u8xvi7hA1glZGEmo4utRMdMgX14RPGIqaog
         dDW61uN12z2V+5YbSiWSxddmiO7OVZ4Q/wt++zZWs/dvFxO4taW7Sp0KKkkXWooQgYuE
         R7JTNUpNN5F/R77PFrB9RxvhnhnqJY+TfyAjq0jinoeoaVjy5mYR+f1VgDiJ5vI5YqOc
         u2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVBubW53cwo6VFW6pyTJcKSp+elkZTKjlDMfEfkcZLcr7rsiqfUgYbk9oiqbdGC89nxsDFVbie22cx3a6M=@vger.kernel.org, AJvYcCW+erChuRTvufpXtP+gSZBg+HDwFI0o14pkRR62FlB2QOgW3zackbGCenEn6rCN9RO2HxbgFZlAnDpyBI3AJQKkBps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaRC0ilUQEvypZB8jLiKmn3zxDxtDby1h5VTta5RpXdADzm/C/
	aIFTrxzuS1HqAuKXEIplleESrc0bAy+UWRtz6GW+JUlzTM4+Rg27kNT7MQ==
X-Gm-Gg: ASbGncvbFdaBaUqfxOsgqnM0ZcICPEhxIyP4UBIHHGeegs6pm+ftB1CiiyAimuPCNKk
	D3NkIYf6QxyYr4Eg5RFLAKBC592uiwHVvmqeKJZE5g2n+HkYffm3GyrIt8EQZhFG14WsLdgNcN6
	xBmyQ53WU2HBTE65sj0sXuQV7nZ2GN1da4yQJswZtN4zdN9D8FdFeBYrTbLlUekuKT6ykXgc8la
	PnXCfTuJLc6/mDhZvwnM9qclBEa/P6cuC1EarcYww4n3CyaiwyAIiPJ0bEXAoEhYCReCTc=
X-Google-Smtp-Source: AGHT+IECdL9oah7LnyKA1Y1FSjtzazMt1aFusJKzejPK6BMfcn4QeUZTfTZ5Wv1FMehXae88IXoshw==
X-Received: by 2002:adf:ab0c:0:b0:38a:5ce8:7a33 with SMTP id ffacd0b85a97d-38a5ce87b43mr11686435f8f.49.1736093034114;
        Sun, 05 Jan 2025 08:03:54 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:53 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Sun,  5 Jan 2025 18:03:45 +0200
Message-ID: <20250105160346.418829-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1).

USIv1, unlike USIv2, doesn't have any known register map. Underlying
protocols that it implements have no offset, like with Exynos850.
Desired protocol can be chosen via SW_CONF register from System
Register block of the same domain as USI.

In order to select a particular protocol, the protocol has to be
selected via the System Register. Unlike USIv2, there's no need for
any setup before the given protocol becomes accessible apart from
enabling the APB clock and the protocol operating clock.

Modify the existing driver in order to allow USIv1 instances in
Exynos8895 to probe and set their protocol.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 65 ++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..3dd8202ef 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -16,6 +16,18 @@
 
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
+/* USIv1: System Register: SW_CONF register bits */
+#define USI_V1_SW_CONF_NONE		0x0
+#define USI_V1_SW_CONF_I2C0		0x1
+#define USI_V1_SW_CONF_I2C1		0x2
+#define USI_V1_SW_CONF_I2C0_1		0x3
+#define USI_V1_SW_CONF_SPI		0x4
+#define USI_V1_SW_CONF_UART		0x8
+#define USI_V1_SW_CONF_UART_I2C1	0xa
+#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
+					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
+					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
+
 /* USIv2: System Register: SW_CONF register bits */
 #define USI_V2_SW_CONF_NONE	0x0
 #define USI_V2_SW_CONF_UART	BIT(0)
@@ -34,7 +46,8 @@
 #define USI_OPTION_CLKSTOP_ON	BIT(2)
 
 enum exynos_usi_ver {
-	USI_VER2 = 2,
+	USI_VER1 = 1,
+	USI_VER2,
 };
 
 struct exynos_usi_variant {
@@ -66,19 +79,39 @@ struct exynos_usi_mode {
 	unsigned int val;		/* mode register value */
 };
 
-static const struct exynos_usi_mode exynos_usi_modes[] = {
-	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
-	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
-	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
-	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+#define USI_MODES_MAX (USI_MODE_UART_I2C1 + 1)
+static const struct exynos_usi_mode exynos_usi_modes[][USI_MODES_MAX] = {
+	[USI_VER1] = {
+		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
+		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
+		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V1_SW_CONF_SPI },
+		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V1_SW_CONF_I2C0 },
+		[USI_MODE_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+		[USI_MODE_I2C0_1] =	{ .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+		[USI_MODE_UART_I2C1] =	{ .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
+	}, [USI_VER2] = {
+		[USI_MODE_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
+		[USI_MODE_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
+		[USI_MODE_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
+		[USI_MODE_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+	},
 };
 
 static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
 static const struct exynos_usi_variant exynos850_usi_data = {
 	.ver		= USI_VER2,
 	.sw_conf_mask	= USI_V2_SW_CONF_MASK,
-	.min_mode	= USI_V2_NONE,
-	.max_mode	= USI_V2_I2C,
+	.min_mode	= USI_MODE_NONE,
+	.max_mode	= USI_MODE_I2C,
+	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
+	.clk_names	= exynos850_usi_clk_names,
+};
+
+static const struct exynos_usi_variant exynos8895_usi_data = {
+	.ver		= USI_VER1,
+	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
+	.min_mode	= USI_MODE_NONE,
+	.max_mode	= USI_MODE_UART_I2C1,
 	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
 	.clk_names	= exynos850_usi_clk_names,
 };
@@ -88,6 +121,10 @@ static const struct of_device_id exynos_usi_dt_match[] = {
 		.compatible = "samsung,exynos850-usi",
 		.data = &exynos850_usi_data,
 	},
+	{
+		.compatible = "samsung,exynos8895-usi",
+		.data = &exynos8895_usi_data,
+	},
 	{ } /* sentinel */
 };
 MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
@@ -109,14 +146,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
 	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
 		return -EINVAL;
 
-	val = exynos_usi_modes[mode].val;
+	val = exynos_usi_modes[usi->data->ver][mode].val;
 	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
 				 usi->data->sw_conf_mask, val);
 	if (ret)
 		return ret;
 
 	usi->mode = mode;
-	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
+	dev_dbg(usi->dev, "protocol: %s\n",
+		exynos_usi_modes[usi->data->ver][usi->mode].name);
 
 	return 0;
 }
@@ -169,9 +207,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 		return ret;
 
 	if (usi->data->ver == USI_VER2)
-		return exynos_usi_enable(usi);
+		ret = exynos_usi_enable(usi);
+	else
+		ret = clk_bulk_prepare_enable(usi->data->num_clks,
+					      usi->clks);
 
-	return 0;
+	return ret;
 }
 
 static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
-- 
2.43.0

