Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF12165E0;
	Tue,  4 Feb 2025 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690151; cv=none; b=b68CBFnFRmZ9ys7HAN4ZXoKr8r5dNCVOP9hLbSURI/UMhDRspbLGuqsnTAVYjw4mMy7mcf/+M92iLae9sL9zA+PQR3iNNA86uasYxRiN2YIQ96+bMZsta8/rO0jp/myjSFFYpKjOvvZcZb61ZjR+F/1r75UzHBipF+vepnOKlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690151; c=relaxed/simple;
	bh=sxfCXycmikLKxWWsIM3zyfph3dsElGFzfO51jEySvWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLJxjZgDouXBOHi+h06juJ95v7kIXSwmEhMzS+RlSSbFMMo0rRVFEdVnZX3x8plFLULKFnWaDACtecHeyNefpvDoFIrwRnpim5g6gGmt5/4gYp7hRXBPQir23M879a4/RncCQsOxTiVmFcz4OXD2eeNTogljNvA2TO7OB0RkAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZivTVage; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZivTVage"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dc82e38c10so9034320a12.3;
        Tue, 04 Feb 2025 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690147; x=1739294947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PYzXjvsquXcuMSC+z/lM7F/lFFrKruUQntDKpcfZBw=;
        b=ZivTVageI3oNxXzf45+KlVOukX+U8J3gMIapUaEaoExwei7q81Adx355vLsqXE++/c
         jsWuZuI9bJce5LN2JwRHH5+QWKjol5mmyFlO0R/Cd+gfdWhH+pB6X9C5IbgYRTB+wBni
         xxy1RZN6uT8rQI3mFJZcIzv6GRTmGgxTw1nSs4s8ULB/v2wVN3STAx6He8clBY0XKJJ2
         9XdezHvLWFsEQvmxvj2wk2yumJ6Qt6aZ6HS6eQteIGDz9LcVn33HdGt8J0gcLVVcbyXV
         cMR5dtM7Fnph98TCW4PfLHtwZkeJTAi4c35PF5Dl1yYuyygxDJO1bEpkly4v96tZR/32
         LdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690147; x=1739294947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PYzXjvsquXcuMSC+z/lM7F/lFFrKruUQntDKpcfZBw=;
        b=P1nZ7n4j/hyTDk2u8mSVQzWrNdlF6Sa1xajyVpx2qauaR0JYFsE+v3XP9QF8t7ghGc
         GEOPBG1M7dlDMCwYiYxStEeGIHpsyRY+WRFVz8dD9UEuHRZfD9+udBCAO+cQy2EQp9I3
         dpN5akmxEGSI8xcRPVg9sy7syLSxicQgP6BXSSYCWN9uKdSYX2mLn1mua7M63Pc5xfGv
         c/aStf5iUjkUd6GssCWhhnlOS/TeXJ8gOyd7ylm6mcltRA6Xh6+1+OkgHeTcsjNcJ0wH
         ect/uZfDZeHRsLi7iwzwSylpwOdPgnST2Q5iqPlhwPy/+EfDu10H8AYRtB196ZOknD9F
         sNKw==
X-Forwarded-Encrypted: i=1; AJvYcCUN3tzr8Ty4tq6/fKDPlhaTcAtK5aANwZuu43qZTie1fgyXZuqlWjsw+lz1Akj85LVK/Nk5ce4jTOuIdjiMvBrw6V4=@vger.kernel.org, AJvYcCWiTR0SlG4Ew2lVQuoqiT3qHQ8gIGlHPbxlmsu0HhzrIW9trqsjmSeoOwVftFdv2EDP9rihBtRZ/9IfBDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5kFV84OwGGD6Kh+Rd4ytyPq7/q0LjKYlwYLj6mwoQDOhkzAjU
	FcpkUHeI2t3+w/ZW6k7IAWsO7g9O3nK+RVssT3VfluDGQUv+6Gvh
X-Gm-Gg: ASbGncsOOZZr+B7SZYWhxBcs22Vw29DQgdwUFnp6PuGf5Nzk9Ip3nLkRwIQw0o8dYl5
	oANGqCqGe4yr/eIlwnQd1s5D/G325qgNTvmTjaveovJ91RRAReVWlhtCbsKMIaL95l3q8uSUa/Z
	73JDJnmUCbXtfIDmxKlHV6f3dYHopyjtK4Ro8mqIkJSrE2y8GA3p6SRAi8CxNOoWDNxrDr2TxYS
	7lvFxmbUq1UewghwRI63KLMBEZoFVrxNotqYC5fPaOvOTRXiqMhbKb52cmUBvzxIwX3r359PCgv
	nDSKY3g00LtoElCUWmrzqXsuF63fl5ATbpxSuJD/lzKQPkBt24sDfqZB2+Vc0REhSwY=
X-Google-Smtp-Source: AGHT+IGKE1UpcPEwktj0pXPn+Jx+dBmAbbftJr17dD9s3ZCquQy0mlrfmNUjz/1zZKoEyVZO7n5A4A==
X-Received: by 2002:a05:6402:388c:b0:5dc:90e7:d43 with SMTP id 4fb4d7f45d1cf-5dc90e7101amr15411085a12.26.1738690147137;
        Tue, 04 Feb 2025 09:29:07 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Tue,  4 Feb 2025 19:28:02 +0200
Message-ID: <20250204172803.3425496-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
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
Exynos8895 to probe and set their protocol. While we're at it,
make use of the new mode constants in place of the old ones.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 71 ++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 85329d4e8..773038770 100644
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
+	USI_VER1 = 0,
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
@@ -87,6 +120,9 @@ static const struct of_device_id exynos_usi_dt_match[] = {
 	{
 		.compatible = "samsung,exynos850-usi",
 		.data = &exynos850_usi_data,
+	}, {
+		.compatible = "samsung,exynos8895-usi",
+		.data = &exynos8895_usi_data,
 	},
 	{ } /* sentinel */
 };
@@ -109,14 +145,15 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
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
@@ -168,10 +205,13 @@ static int exynos_usi_configure(struct exynos_usi *usi)
 	if (ret)
 		return ret;
 
-	if (usi->data->ver == USI_VER2)
-		return exynos_usi_enable(usi);
+	if (usi->data->ver == USI_VER1)
+		ret = clk_bulk_prepare_enable(usi->data->num_clks,
+					      usi->clks);
+	else if (usi->data->ver == USI_VER2)
+		ret = exynos_usi_enable(usi);
 
-	return 0;
+	return ret;
 }
 
 static void exynos_usi_unconfigure(void *data)
@@ -180,6 +220,11 @@ static void exynos_usi_unconfigure(void *data)
 	u32 val;
 	int ret;
 
+	if (usi->data->ver == USI_VER1) {
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+		return;
+	}
+
 	ret = clk_bulk_prepare_enable(usi->data->num_clks, usi->clks);
 	if (ret)
 		return;
-- 
2.43.0

