Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6011B87E3;
	Thu,  2 Jan 2025 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735850456; cv=none; b=ebDyn26koN74CEkDYw6d4L5hbNTNpySZTGPnluzJetSSCiOqa0K/fCMGxDLkwClt599HqCZByDhpFyeqEDFmhEVQBvzyfPurJjkFQbqPe2FpmvEePNUTb0kefMa3T2o/HRe900iBaDdVRCrjgW79fnURAQcsd8jZ9E9gqMnsiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735850456; c=relaxed/simple;
	bh=8XLM3hutgXdBDf4BY5jp86iLhgiaLPTRJEAyXFzWx54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuUQDZqEDGDYpsU19SAZY6e4H3Cr0Jm8TSKsTkBn28cw9g3AXwk4WxUJgqT0w/lgYMbegsnVLsvu475QeB1zeZdhRs71o4QVqV2eh1re6IfE03lR+2ytV6ANI84PqmqXNl7E55dbmr6KJh3CMN9+TZ+1kWGXdQ2dnqJQdQIc0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZfhu1C3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZfhu1C3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa679ad4265so2288557866b.0;
        Thu, 02 Jan 2025 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850452; x=1736455252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SWMDb5TwBTJZaeNs4VRkHzpMH/ioBBi8zegRfy/sYU=;
        b=OZfhu1C3TNrI2Ze08tY0aKC4Z6Fmcfm8/biCuudfcOEq6Ix0PIAYt/NJIWsDV08wGd
         XiYjlMZ7oHXECDgpL/GLVYff6zVKa/W4J0hMGldSwIF/v6Cc1qCwp5b82iOP3afEkmWp
         h0N3KeNju9YGsn7+Lov3CAze2OGwMBUfTKCPxORZ1Y2mgIPh8hmUoCeAzVL2jVguYRb3
         a1/vW59+5s94M9hmeqtRFsCE4rKudzRYXmuAcxUktDmXKOruZQQJ3fIaUOcbgOBSQDfJ
         kPOS7Mz/te7Tg0EeHpoFZL2qNBxHaqm8YSYNq4rDlQT05pRKGm+2lBWDhoQ6ZuR8pW+Q
         jcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850452; x=1736455252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SWMDb5TwBTJZaeNs4VRkHzpMH/ioBBi8zegRfy/sYU=;
        b=L4ZhLC9vz329ETgcLjoBMGY3oFN2GmjMNVjv7sanvF54/2WESd6b5BZjG5RimAzJBY
         XLenLUwIYLioGA9CRu7tBSAzLO7Reyx9bjjoM3h1xvEKSD7zXWM8NVQhnO7KBpHGVmPU
         CQsLvlb0I+hvNP53htJxWeDno/EWOITn8laYZtzmmT7lVyFH5B42/FutqpNQQ1nVgxxV
         t8DzjFsGNHl4P7TZhcZkdFwIv+uv1YhGUdFxXvmalA2AtG1+XopJXXSoXUbylFL/JR5F
         zzpiymJBvYlL7/j6Q3UQyf04obhUjI6uKGFs5Xi02/r3bYqslOJ56pLJKeVZ2oZhUSy7
         b7DA==
X-Forwarded-Encrypted: i=1; AJvYcCUKSVlrFxi84CQtGpLT9Ats+69HfuJ5I6Vuy6dR/w0mZ9/c/PkWBNmcnmJQnEqyYrkJK/9gx0dGnlXLdHAZzZR0DFY=@vger.kernel.org, AJvYcCW7xpTGyKBZSSvf/vu4UOO1KASs0a76ySdxA02HAJjdOU1i/XK1ZsX/5eXK9r0uDr46lAUTTAjrepzRjUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGPVQ4AvphxkkUnmSXiv5FRy5hIqOg6nOnQH75EgPzjHP4Z2uF
	KmF6BpmkDYnh8rjBuJRLIjJ8jpcqiCeX+XMBxP8a5UuIZT3nxFGB
X-Gm-Gg: ASbGncuItcuCtxYlLrnlUYMx33/FRZ+gzlCG8VVgVlyinSGopn7KYHxJ6dQvEgehnfu
	l+qy0aCV19ErgHOkjeyy4rYhdXGkGXrBMUB4Vkxtt384PLXflTN+71jGC2plkYtbOTFn1wnIzE5
	1MumY0TVJfhepGSuXwtM8FE/4GK9FfZiZmCO/a0TK74yGugaVo5hUdBelPJtKuqD2CFFT8Vd2AN
	8fpkDEoc/mA7DRPkUQKF5/W7GKjy+WORtRBp4VRMJ/5+kTu120i8YULg3pFfHxNN++Q5elvvRRz
	Iw0edvT5/m0=
X-Google-Smtp-Source: AGHT+IG0vgfb4FgN57tXEfkHjnmpOfckgtD12j0nD5bwvPiabxtx4gUIJFAmIiVnbYZPp6OFyrGsUQ==
X-Received: by 2002:a17:907:9482:b0:aa6:8096:2049 with SMTP id a640c23a62f3a-aac3350c059mr4142824666b.13.1735850452149;
        Thu, 02 Jan 2025 12:40:52 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:51 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] soc: samsung: usi: implement support for USIv1
Date: Thu,  2 Jan 2025 22:40:15 +0200
Message-ID: <20250102204015.222653-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
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
any setup before the given protocol becomes accessible.

Modify the existing driver in order to allow USIv1 to probe and set
its protocol.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 58 +++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..29c3770e3 100644
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
@@ -66,6 +79,16 @@ struct exynos_usi_mode {
 	unsigned int val;		/* mode register value */
 };
 
+static const struct exynos_usi_mode exynos_usi_v1_modes[] = {
+	[USI_V1_NONE]		= { .name = "none", .val = USI_V1_SW_CONF_NONE },
+	[USI_V1_I2C0]		= { .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
+	[USI_V1_I2C1]		= { .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+	[USI_V1_I2C0_1]		= { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+	[USI_V1_SPI]		= { .name = "spi", .val = USI_V1_SW_CONF_SPI },
+	[USI_V1_UART]		= { .name = "uart", .val = USI_V1_SW_CONF_UART },
+	[USI_V1_UART_I2C1]	= { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
+};
+
 static const struct exynos_usi_mode exynos_usi_modes[] = {
 	[USI_V2_NONE] =	{ .name = "none", .val = USI_V2_SW_CONF_NONE },
 	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
@@ -83,11 +106,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
 	.clk_names	= exynos850_usi_clk_names,
 };
 
+static const struct exynos_usi_variant exynos8895_usi_data = {
+	.ver		= USI_VER1,
+	.sw_conf_mask	= USI_V1_SW_CONF_MASK,
+	.min_mode	= USI_V1_NONE,
+	.max_mode	= USI_V1_UART_I2C1,
+	.num_clks	= ARRAY_SIZE(exynos850_usi_clk_names),
+	.clk_names	= exynos850_usi_clk_names,
+};
+
 static const struct of_device_id exynos_usi_dt_match[] = {
 	{
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
@@ -105,18 +141,32 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
 {
 	unsigned int val;
 	int ret;
+	const char *name;
 
+	usi->mode = mode;
 	if (mode < usi->data->min_mode || mode > usi->data->max_mode)
 		return -EINVAL;
 
-	val = exynos_usi_modes[mode].val;
+	switch (usi->data->ver) {
+	case USI_VER1:
+		val = exynos_usi_v1_modes[mode].val;
+		name = exynos_usi_v1_modes[usi->mode].name;
+		break;
+	case USI_VER2:
+		val = exynos_usi_modes[mode].val;
+		name = exynos_usi_modes[usi->mode].name;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	ret = regmap_update_bits(usi->sysreg, usi->sw_conf,
 				 usi->data->sw_conf_mask, val);
+
 	if (ret)
 		return ret;
 
-	usi->mode = mode;
-	dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].name);
+	dev_dbg(usi->dev, "protocol: %s\n", name);
 
 	return 0;
 }
-- 
2.43.0

