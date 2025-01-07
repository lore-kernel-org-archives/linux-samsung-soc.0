Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7561EF09E;
	Tue,  7 Jan 2025 11:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249729; cv=none; b=g9f2UAWg8y3vS/9rKQ6lp+4ca76kFUXJwSP4Cxvn6jqRsBa49A7YqNTZzl0jAabh0xJHoahHKPXasieUgAkXHjzOPKCGKb9v0Tae06quG0i9VvtFPUJj610UXyUx5Ij4I0/vgjNllQM1iHYGKhqC1jfzTScOmV2SDFfnkGDRnQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249729; c=relaxed/simple;
	bh=RJiev2XrWDkPvI2UW9pqQE4qEXdkcPxJmY3/K3wZAcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTAzc+0sTEfS9EH8zrQM0je6vKOUSvZksvnH0zm+3WFZxhCgXs51/JRxCRa1aw9zw/94HKN+TZAL/SzGR7o/VcuG9a4uO7uDup8VGvv1mlLKNlaxeBaEaW9DXTJQ3/Q2WEq+2f4oE+b8fM1Hv9C5PLJAt2qPr+2zI3aIvOnRghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU/OyrWE; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU/OyrWE"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so3189899a12.2;
        Tue, 07 Jan 2025 03:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736249725; x=1736854525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqDmrb7wdqzZK6I0pwduaWYZCuiYxjV8FAOJs0XrSB4=;
        b=cU/OyrWEUhKN6K5YE7akWSIWy9cwPiB56tHCEtDZ5trPxAhitUPqK8ke9wjSxxePUQ
         ogTXD5S0cg3GxrIveC/HnKKyw6OZMeEak0X7AdQpI60imhWSQHYWvidzTp0QfgoHN+Y7
         /qWBsR2jZeftc3Qp4GUhAf66uEN1UWxKItY7o1nh799+qCo69TX+A41v1oVRXqY5YwF4
         tDYc05JXXIMsq0o2UbfJRG4DwkoqywCnkxS443BTDuBMyagdv0Vz40DX/JuZ5vZ1A5Db
         GOyXcKFXBL/An7jAZNx01XFA1LhFXBxHyVPJ+xgrxu8qaQlJMA4tLZDJY7ULCFzsh8Xw
         Bqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249725; x=1736854525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqDmrb7wdqzZK6I0pwduaWYZCuiYxjV8FAOJs0XrSB4=;
        b=SS21u08IawiZfKsZ1opYhYqBahUb2jv8f1nZIUMUCh0gJYelkVZ2qQQetDDYiqXzfz
         roQYtedbQjWWzdo2OIEaGM2eg+85ZtsPHBsMXg/JsdEl0ZC0D3o5ktmg7MDqfu3rLaX2
         dcKAZMmH+POARDBHkq+DsUKaqh5DnRcxlGvEkgZoLdC0ybHmzHdWJlptdDwfWBrCUZE2
         z84oKFkyC05f4wgg2mCjoLeOZ56ZCr6tyDgmCZ7gbYtrXKzn3UkJxHc6o4JqkVgpuec3
         bNvd+ZdAmk8ITvLvElrLFfafTim2nO+Ox4n+eJOXqn8RKfHY0HWWbs8tHpMquglgCOGG
         /rgw==
X-Forwarded-Encrypted: i=1; AJvYcCUGacl96hFuHSTsC0u+H5R/bGVpoDy2o4aZaiM+8s5BhhMmR5HoyaPlMU3cFuVgEdbku0hh78fUChE4ElDeCU6+2mA=@vger.kernel.org, AJvYcCXf444UzUWqvrgNl94Pl71WtoY7Jijytf2OCsnQmBjYwEDZxOzN45owBj2GoVcI5KH1DH2y20JTRvsh5N4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEnc0Kd1a49ozBytw8S33Rg77aMsI/EKV1q7iHJPvbOxZqwebm
	f1+xGdawBP5e6iZSLYwdD57hVa71OsVnuoHKay3tb0ixK44ikMaIrguARw==
X-Gm-Gg: ASbGncs3MWJebOKDnarPo4yxV90+ihUJyuQOG79xW30dOGuWdelqfOIQFAOCqCFJHhD
	wt3uRsL6zOCTKoTU/linlviIzXzQJ13aZCytnRfeil/MKSvlXVNdi2VvWvzzo14FdQQp0atebak
	mHawQQi0xvWJRyZRQxsnPm7oMBr42siS26rFU1bq70B+2x577NlMYE6SBvhWErQA7KQ+Asu1QVw
	i49mBS5EZ+db65h+AI9mKUG4q3uZGCFcLeZCSpjC0ofJhGuNU3yKSN/5iOi7tYFYvuO8b6srXrg
	zrO+Qq5wvMtrIR/A1WM=
X-Google-Smtp-Source: AGHT+IHrIOLxERc8tVUVtsdAXxpA9NaC14eGzQzXpbh6TJ88dSeqElmNGQhgVuxRdUwM8UEkZybv9w==
X-Received: by 2002:a05:6402:50d2:b0:5d3:d917:dd90 with SMTP id 4fb4d7f45d1cf-5d81dd642e4mr56018413a12.6.1736249724400;
        Tue, 07 Jan 2025 03:35:24 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm24881055a12.32.2025.01.07.03.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:23 -0800 (PST)
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
Subject: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Tue,  7 Jan 2025 13:35:11 +0200
Message-ID: <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
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
make use of the new mode constants in place of the old ones
and add a removal routine.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..43c17b100 100644
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
@@ -160,6 +198,30 @@ static int exynos_usi_enable(const struct exynos_usi *usi)
 	return ret;
 }
 
+/**
+ * exynos_usi_disable - Disable USI block
+ * @usi: USI driver object
+ *
+ * USI IP-core needs the reset flag cleared in order to function. This
+ * routine disables the USI block by setting the reset flag. It also disables
+ * HWACG behavior. It should be performed on removal of the device.
+ */
+static void exynos_usi_disable(const struct exynos_usi *usi)
+{
+	u32 val;
+
+	/* Make sure that we've stopped providing the clock to USI IP */
+	val = readl(usi->regs + USI_OPTION);
+	val &= ~USI_OPTION_CLKREQ_ON;
+	val |= ~USI_OPTION_CLKSTOP_ON;
+	writel(val, usi->regs + USI_OPTION);
+
+	/* Set USI block state to reset */
+	val = readl(usi->regs + USI_CON);
+	val |= USI_CON_RESET;
+	writel(val, usi->regs + USI_CON);
+}
+
 static int exynos_usi_configure(struct exynos_usi *usi)
 {
 	int ret;
@@ -169,9 +231,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
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
@@ -253,10 +318,26 @@ static int exynos_usi_probe(struct platform_device *pdev)
 
 	ret = exynos_usi_configure(usi);
 	if (ret)
-		return ret;
+		goto fail_probe;
 
 	/* Make it possible to embed protocol nodes into USI np */
 	return of_platform_populate(np, NULL, NULL, dev);
+
+fail_probe:
+	if (usi->data->ver != USI_VER2)
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+
+	return ret;
+}
+
+static void exynos_usi_remove(struct platform_device *pdev)
+{
+	struct exynos_usi *usi = platform_get_drvdata(pdev);
+
+	if (usi->data->ver == USI_VER2)
+		exynos_usi_disable(usi);
+	else
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
 }
 
 static int __maybe_unused exynos_usi_resume_noirq(struct device *dev)
@@ -277,6 +358,7 @@ static struct platform_driver exynos_usi_driver = {
 		.of_match_table	= exynos_usi_dt_match,
 	},
 	.probe = exynos_usi_probe,
+	.remove = exynos_usi_remove,
 };
 module_platform_driver(exynos_usi_driver);
 
-- 
2.43.0

