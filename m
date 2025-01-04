Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75821CEADA;
	Sat,  4 Jan 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736008166; cv=none; b=U797f5yI2+uSI+oWsy5VKo201SPLTvqZKP2805e8MkxcIG/ifMgdtY3kkoEy2evWgX/RmJEVyA3G61TWkyVZpgNEh9HbvE6/Ywpogwhld0atckoZO0+JQyiGuC4esI9BYEWfXVsR8WdVe9PqCjja/tyFBl+N5J264bqbOaO8Nbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736008166; c=relaxed/simple;
	bh=DyLm57u0rTQ9KAWlUiAyGV6jOKfQ6nv7MGT06siWOI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VukrhhY0QcN+yPoXQUHbQ7sk4VfxJM/U+hsG1A6eg3kTR8GPW2kijiHXE2ql91JMasjtL1u/xHZf6nhiE3TCeaRtMjusL8bdw4PkgJmA9+SAzeYSUdiwAslw58km8X5uTTR0KHEEIDERa4EjhJzYLCkQRcDjGOP2h5M7YSV7/ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdWnN7mn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdWnN7mn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so137626445e9.3;
        Sat, 04 Jan 2025 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736008163; x=1736612963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmwJdSWcH80KR9c9ophGs9zgU8sQ51fKGw8dpXKN/Fw=;
        b=bdWnN7mni0BY1od5MRZmpc+XC7SO1cYm+uY9QeqzP4exZldJeBxNJR8tOZ5vut0NLL
         SULXq9i8IZS1W49DunrLEh4FVD+Z6SZQ79TbiEFaIhFKfy8vRT1Nt+/rzNQPVAz84oKN
         uTtQD9t1OoVGxOM8qQP4deF9VTly+mhvjxzPeynzpaYAry+anVQ77JTOGWNFF4D4lkaA
         8mI0MP/oXTAyYpzl2OId156eFTz36kmVfnyFegpH0NlGtcrYOyJrPc1ENj8xRddUqb7x
         ckxmomxHeiuXXy+1xRg0YuxR4soALiwCMe4VT33pgvc6nfcGdLvlIWbsO4HCocXigmwO
         rnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736008163; x=1736612963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmwJdSWcH80KR9c9ophGs9zgU8sQ51fKGw8dpXKN/Fw=;
        b=fkggB0GddHI44pGvL/5GcSywm272jFo1ijq4paiIqb0nZsFkKQ0F5GX6mMQuUQzSEg
         lkvnyuGSCjLda904g4+VIQTtXNYPw18wUz2hTmV4uNPDmt/JttOZcGsgQZ/lR5uQg4wM
         5UqEogO+RHLlXgkKWzUVPpiHVPxmOeSxjAJkd2mtAS1bMqoAsP/0CvdPI+IF2StXgI0J
         DcK/R/6ikBXx4nnqlpq9bSM1ghqeNZ46hwPsyLOkBs/zvZdt/JnXXWnFgJsmCoPCs3Ju
         KKkD1xLEyeL+G6hM07li6X26ENOlyxCpSnjFavrKbj0Lx6SL1fvah3YKxGdZ7lhoe1Y3
         a8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7ikAy3e6Qm/BjAFYzwu8TQdO3RPVNUEEkPd/BgjJC2FExBoetAo9eEYZjf7qdrseYXOMOQyB66jGl8qI=@vger.kernel.org, AJvYcCXRfSP6y+qZ1T/V8miiQMuCECnGlm1jHtH0q8Pkp8qjR/Nmu1W8fhY3fFew/4GO7JR1OrW5xGRrFCD3+Hqr36thKRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlpznBm6PzJXKlsxRIViuifPHE9xnGhl/EKnvjsm6r/+0+ffqU
	fXI8SzUvL1HZMizFP0rPguzIy1y5p6281YtJnf7b4T6Rt/ea/R4b
X-Gm-Gg: ASbGncsB6p9PNudAbYjtnym4AjPnaaEEaZpMQ40o64BIJmZ0yHcd4WR1DsI4y/ZH27O
	pUeBUBlCJvhZknu7QfyaN7MUfDVnlB5WLyn65VPUAxa7Uv7WUkORC0huhVFc9YObf9hF6zKfujy
	iufI/fXxGEBGnkMxC/1zlhm8KC6gZ80UeoGno7TuUk/wSedy1s00qtr0Iq1bMJ1ncl4vQhuiIl1
	/XnczWmUcn1FMOtm7ArJO9XSKAdbhHdztLrfIcSTSzV8rCI2SX2/PCdw5ZDlMh/JlSo+qo=
X-Google-Smtp-Source: AGHT+IF04mnEX9YaKH4594VC9VtYs+3GhiR+7PJ1S6ap8REf6mYZMEBFBnoifIGMwao8P0+yM/FY2w==
X-Received: by 2002:a5d:5f51:0:b0:385:dedb:a12f with SMTP id ffacd0b85a97d-38a221e27a4mr43531508f8f.6.1736008162851;
        Sat, 04 Jan 2025 08:29:22 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4fcsm522807895e9.29.2025.01.04.08.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:29:22 -0800 (PST)
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
Subject: [PATCH v2 3/3] soc: samsung: usi: implement support for USIv1
Date: Sat,  4 Jan 2025 18:29:15 +0200
Message-ID: <20250104162915.332005-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104162915.332005-1-ivo.ivanov.ivanov1@gmail.com>
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

Modify the existing driver in order to allow USIv1 to probe and set
its protocol.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/soc/samsung/exynos-usi.c | 42 +++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695..e57d2c274 100644
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
@@ -71,6 +84,13 @@ static const struct exynos_usi_mode exynos_usi_modes[] = {
 	[USI_V2_UART] =	{ .name = "uart", .val = USI_V2_SW_CONF_UART },
 	[USI_V2_SPI] =	{ .name = "spi",  .val = USI_V2_SW_CONF_SPI },
 	[USI_V2_I2C] =	{ .name = "i2c",  .val = USI_V2_SW_CONF_I2C },
+	[USI_V1_NONE] =	{ .name = "none", .val = USI_V1_SW_CONF_NONE },
+	[USI_V1_I2C0] =	{ .name = "i2c0", .val = USI_V1_SW_CONF_I2C0 },
+	[USI_V1_I2C1] =	{ .name = "i2c1", .val = USI_V1_SW_CONF_I2C1 },
+	[USI_V1_I2C0_1] = { .name = "i2c0_1", .val = USI_V1_SW_CONF_I2C0_1 },
+	[USI_V1_SPI] =	{ .name = "spi", .val = USI_V1_SW_CONF_SPI },
+	[USI_V1_UART] =	{ .name = "uart", .val = USI_V1_SW_CONF_UART },
+	[USI_V1_UART_I2C1] = { .name = "uart_i2c1", .val = USI_V1_SW_CONF_UART_I2C1 },
 };
 
 static const char * const exynos850_usi_clk_names[] = { "pclk", "ipclk" };
@@ -83,11 +103,24 @@ static const struct exynos_usi_variant exynos850_usi_data = {
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
@@ -169,9 +202,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
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

