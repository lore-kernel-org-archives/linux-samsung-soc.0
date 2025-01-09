Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB52153C4;
	Thu,  9 Jan 2025 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413448; cv=none; b=E08KA/TcwKnvmPjaBbQwhIaiFxKh7FedVMvcotCkK6w5GZqVvDIy5xCWRUDFi35DmfLe1zu5qnSgB0LnJL4pKQc23Q0iNeXvUgoa+q2y+xk3o2FznKv3EKTBOlLZEq29WPUUpnYNgNw3oxg3++uuAxqO4fokr9P0yXH9PmFIepg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413448; c=relaxed/simple;
	bh=OGpKO9Z7JdxXgcieDwF8szlH+cDJjkbPKu4fRSrlCPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYBKFxqxIF1SFghnkya7LOvY3aumNcwlhef5hU34yHW06IrZvg0x16rYereqY9jQU8XsiUAkyT268FM6PMY6PVlE6715p6WL6Uf+paN92NchRsQY/9RW/CkiOouQZzl6V5oZiIHpSsVZfUP1Kq8vKSjwD8Wgp3VlzXMEzDmKIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zxoh/FDf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zxoh/FDf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so400762f8f.1;
        Thu, 09 Jan 2025 01:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736413445; x=1737018245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCpmmMifUuuJ9+tjCbBNOmX8W+9L1QauRjSWCr7/+E4=;
        b=Zxoh/FDfOb1TU47mGY73SVGrYjG5yh5x7FF2R/xeaMSjpHEnHsTnxMVsbbfAxsS7T7
         DaidgrTtXHL17/EZRY2kM60iJK/LpoxJUFdMAK4Je5LUIlROLTpGh4FeF4KCEdPGXwrF
         gc9liCqdBVY0vmE5pImOP3VdWCIac0HtxXlcOK7tPHc+pYTVYge5VSjrgYybOJzn7awv
         Fong8Xm1wqt8uO/hqZZM2IfXK0k9re0fuzn+VZDUbHqCsRTtzN/rhB4JYqtCUvzAqHue
         or723jCbYndyiXH7t+mU6153sNP5jF4Z78mORXnn4Gqx/bKMFGWXuJqXwJVU1euId73i
         LYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413445; x=1737018245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCpmmMifUuuJ9+tjCbBNOmX8W+9L1QauRjSWCr7/+E4=;
        b=iabOdckJRcMLkG+q19bN2hK2K2w1eD3Eqn8XguiBu/vdqfp/7ndQgMIf4ice9QXkvO
         roy5/XH1a1MBS1gAVXcF72VC8e2x29/Q3EKpxsOfeZ6jzeNxR4/E2lcBtqSCSjtnolYS
         bWfYn+Ds43bwDb5OEGH+oe483juiXdDQMN3YE7NDK5eft50lWaar2+pyFjp7NNCLOTU9
         K/ft2vBTBNO3P7vEfrym/Sja0Ru1iSWgmx+qdO8mXjnuTKrfJDvPsp7Hr05WmrTyTw9f
         2Ldi/7X7JdtCPzE07r+6+mcJGmla0eUKEHBcv5QgfDqHgAkJvdrml7LBMNH7MfW0fVA3
         G7gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbyr+fZ1WZTUJCHbA9/0/7xi31I+Jd+KgrZD5xsOmqAcyUAtPvE1pf1X+6QnxEEqp/nFk5IFNE9+QYSHw=@vger.kernel.org, AJvYcCX55wjn8WnoGvUDZHpnKwdvxY+iTNgU6c+jnjdC+A4+p+VxD7wKt91r9DdkFq78EQNKpLRrRejYN4+VrLhZH6G+4kA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxzb99J1+DUkPTd11MPdFT1kXOIZppSZDlzDMSAYF7OyAYykff
	Ch5HAY5yijHtGLh5OMZMcnDi3eN4j5KTowWHArr8r1cJH+LPjH3L
X-Gm-Gg: ASbGncubjpzpPvr5WCu3XYYAlZl12zxOvPWKmW6y1/2MgvLH9R9m+FWhNGS5bFp1AOT
	tsfDPgF7fqeUqNOVaUvpOESwnRjv+yHN0cGRs3EDaIH+KgNmzjGdBq9mzuyFnKxRsPB+kYT6wee
	vWtbUf4tIKiC6JE3gFYNY0WGoO5aGchd/limqanQWvoBuYj8bcysVv6G+glVtS/5C1drG65MwTe
	fG/8cUf4mOHV6kYjoGy0Y60tuvHAaNVeW71ODGzNfDKGbeCesU1j+RQT1j5OXYkdPjIuIWXV85p
	YroFFWRBAe9rnSp+sNU=
X-Google-Smtp-Source: AGHT+IEaR7svee5aX+rCiKsRbOx8w2O2GiuW0Y3cJUpXD1c0W5ZNdo+enti2VyZXNrnvGKRyED0uZw==
X-Received: by 2002:a5d:6da2:0:b0:385:fc70:7f6 with SMTP id ffacd0b85a97d-38a872fadf3mr5135537f8f.7.1736413444389;
        Thu, 09 Jan 2025 01:04:04 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm1196692f8f.80.2025.01.09.01.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 01:04:03 -0800 (PST)
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
Subject: [PATCH v5 3/4] soc: samsung: usi: implement support for USIv1 and exynos8895
Date: Thu,  9 Jan 2025 11:03:24 +0200
Message-ID: <20250109090325.595475-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250109090325.595475-1-ivo.ivanov.ivanov1@gmail.com>
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
index 4b84f481b..8a56d6040 100644
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
@@ -179,6 +219,11 @@ static void exynos_usi_unconfigure(void *data)
 	struct exynos_usi *usi = data;
 	u32 val;
 
+	if (usi->data->ver == USI_VER1) {
+		clk_bulk_disable_unprepare(usi->data->num_clks, usi->clks);
+		return;
+	}
+
 	/* Make sure that we've stopped providing the clock to USI IP */
 	val = readl(usi->regs + USI_OPTION);
 	val &= ~USI_OPTION_CLKREQ_ON;
-- 
2.43.0

