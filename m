Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD4F279DAE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756552192; cv=none; b=C7mtMbKfFVc51A29XWZzZhyvYBCiwf3oVghPYk6nQHVimB6cL7Q4xqts4p+eF1aWz8Am1qfKSbcNwequsoBLeDrMr1itugBQrzD52Metf7ngOfzCEEQNGkCxQ9x9IOwXfGMimQ2sHShzL0MwU+F+sl7Be1sD8FaSRVCAjbNIhXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756552192; c=relaxed/simple;
	bh=xlL9W2A8Ervk1zk4ml7XK13XijuLbMR6cMtKEKCqU4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9n92ipUisJxAT5QWgEQpWW0jMolZRmpQk3U8/X2LETdReJBPPA4+HMp8qDHXNqg2WLCiFsyBk/XkWo2lCNleEFkxYTMPXDnAXCuWBzlHsW3JBYPXpdQ1kSAKjfEVncru0x38qw29m75vUuYq+LKny7BCU+6IG+IZm7BRT1Vv5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gl1aNLPI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gl1aNLPI"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61cb4348ac4so365065a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 04:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756552190; x=1757156990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt6BHImGK+4nyxlNYHkaJPBTdr1Pfx4Jy5o27YwNXXE=;
        b=Gl1aNLPIA9RKqFJ6b65526ZRotII9ojjwEFgfbRYASAtskcnnBV82vj4GAW436iR+J
         xK3RzWnTKj9Ibho2T7uJeqhv0U8SK19nvgZ91/jZY6yGy/aC4++6v8camjbmJ9mq/j29
         V9r3Uf6cAsOxq4yG7q4l0m4Mv1ld/Jt2q2JA3NpOMf1TWbYip7FJNKAwJ/ZVHGlOU0lD
         Kgv/vd/ZGT6yirTI5V74wu6D/9A1DG8YaENSiorFPq2LNN8yLORLSXvxDwIVFKix7nkX
         tJ/+3LukGgkMq39v+ld0aged/SQZRqwb9VA4CbBT6Ak+yNu4tM7QMK/jop+Hpk2ajw7m
         2fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756552190; x=1757156990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mt6BHImGK+4nyxlNYHkaJPBTdr1Pfx4Jy5o27YwNXXE=;
        b=VYGrUN/M3M4QqoOQCo5lf5LG9sHoi9DiXOGT/BFplaelxJVQE53oMKQwzSBFd/zNLZ
         nnTfYg0A1mUWhcopC3oBId9Rqk/Ya+5kKetIiie7ARY6UENj+Y+/QFB6HCiq0MsF/sBa
         HDekb418FVG2vKvAPLHgpnJZTLbfWwSmVT9Ax5M/erVTqD8Zr63c/aFPC9pXcyfJF/aM
         S6wzVXDPAayYFhcDnhko6T9w/rWKy5zUs/gJ7WP5i4s3OkFpkcer1K3Ef40Ua29UA38v
         kPTto8jPdkYYFl4wL/H9ZiO6QMwklmiiFcueLP7yTDG3mZH6+iXvPTfoL+XYyUwiQvOt
         tfSA==
X-Forwarded-Encrypted: i=1; AJvYcCWBDj/PQ5glAOeJR7k8Y5TIS1m7ZD4scdoQMOFaHfTX99iFzmjsYwHMHRuTZVxfiKaC9QiYFRZOgrI+rY2Rykv6KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1LtigUCjs+JX8XQ4RlCcO8vIsmu6Q/3rIP3WCBWeu8a31Ly8
	GqtNqU+X2jvjbZ5oIxECL/PcltczGWHGuVhk2j5Oi0OskgrvfUDhYZIaq3alhQMXBc0=
X-Gm-Gg: ASbGnculEmOWt/pozpJ8R2qbstbFeFVqVEKAybhe/GcdvknZrQbTtmVVO3Y6p/59zcJ
	8XRef4fGWX9yk+/j8mJIj7fTDRo0rWSEoSmtR3rgLXCvHWW5vdmZwKJxXGBQwUylze5GQiiJbuT
	pCGjOHiE1vqBO7hUBljb8P/ogQvRcNPujSXVseBxg/eltjPEh1TiFYaXyrQzKh99oLAg1d4RS/E
	gwInxAg6v7tc2JSOJWXBhSa0DaObXa1Gnw+peud6R+uuxXy2+qNDURWpmfWuZHs8PWMJHouwtj6
	gO1d/wF1TKNmoe3loFA9pNEY0GYN3cTLDrIJLx+R/jJJ85MECw2c+s0+VTitaXhER73K/symyIW
	pkUJB4Vlcr7WS+E3H7cpHmFHPA6Sd61gBczIxrguTGkVpuy+RJg==
X-Google-Smtp-Source: AGHT+IFm3KrQiJLTnoLMRt7QTIhNFVWdnibXFvne96elYLkhnCNgt8ifCrnPRnxK3Ji1sk6Eo0cXfA==
X-Received: by 2002:a05:6402:2546:b0:61c:ba89:fc81 with SMTP id 4fb4d7f45d1cf-61cfe99a87dmr2234309a12.4.1756552189591;
        Sat, 30 Aug 2025 04:09:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc21542asm3285666a12.18.2025.08.30.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:09:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 13:09:38 +0200
Subject: [PATCH 1/5] iio: adc: exynos_adc: Drop S3C2410 support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v1-1-de54dfb1d9ea@linaro.org>
References: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v1-0-de54dfb1d9ea@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4216;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xlL9W2A8Ervk1zk4ml7XK13XijuLbMR6cMtKEKCqU4U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostv00r+mskd3qVXrYKZh1HyJjhQB2ZnbjdkDE
 GI5PiaBKZ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLb9AAKCRDBN2bmhouD
 11sLD/9HygQMMQRy9yLtFTmoijHCENaBVNvBPHQaTRIreeQUCqjjaiB/JtgGUDjf/6iWHt3e0v6
 7GnfvISOZWlWUAHxggNlJVJrUbVUSNXIxLlwoqWoG0inQ9G8+Hm0M/4PTJFuJMvTmgOonzehjo0
 99VEr8iVewZjA/93YCSw65d9h391VcVlDsyNQk3RNiChvkp2D0qwmIgGHpm5r0pSW5SZ0c3+z/M
 buEcjSS3nrDH82fc5oVxf9udiI/XmQKuYWOyXD99UbNekSBZkVEYE9OqXD1AFutGTaqTcvwoQo8
 0JvJhc9dF8tiR8EdIiKkMoeIdqw22l/jgwLzhlDXGQsAUdpjL38qNJ1JHkrHXFxXg2EugAmx8CT
 aJki8VRB3EwCOtVX/OHlcbT9rqUsfC29p/O/++NHecMyKYxl8ygmrOHA0bE/jFJqt0G3B6uWTnn
 NJ3BypW755mW4TYgeLui8nOCAu5cRqeZoOs9r2l9p7LmVAL0i+QTaCQJrDLHFBBKg7npC/i5aBK
 +RnKyWQzRR13gMTc079rIZohXogU/kNpdlWM5itsmZ3l0SX9TUxOiToxUmyZokzqj7Zes7VjsxU
 4x5q0JF1GRV72ifLNu1qF7eqLnJwWmCkwnV34tY1+066g5SxfGvGhC8tKnVDTmI01dw2BNVNZCE
 RKP77oFSoBRPdlw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of its compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 75 +-------------------------------------------
 1 file changed, 1 insertion(+), 74 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 4614cf848535944a41e0ab19f35c5ca0546000c0..17fd33c6bd6d0dcf41771331ecb328e58d820ed0 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -44,9 +44,6 @@
 #define ADC_V1_MUX(x)		((x) + 0x1c)
 #define ADC_V1_CLRINTPNDNUP(x)	((x) + 0x20)
 
-/* S3C2410 ADC registers definitions */
-#define ADC_S3C2410_MUX(x)	((x) + 0x18)
-
 /* Future ADC_V2 registers definitions */
 #define ADC_V2_CON1(x)		((x) + 0x00)
 #define ADC_V2_CON2(x)		((x) + 0x04)
@@ -61,10 +58,8 @@
 #define ADC_V1_CON_PRSCLV(x)	(((x) & 0xFF) << 6)
 #define ADC_V1_CON_STANDBY	(1u << 2)
 
-/* Bit definitions for S3C2410 ADC */
+/* Bit definitions for S3C2410 / S3C6410 ADC */
 #define ADC_S3C2410_CON_SELMUX(x) (((x) & 7) << 3)
-#define ADC_S3C2410_DATX_MASK	0x3FF
-#define ADC_S3C2416_CON_RES_SEL	(1u << 3)
 
 /* touch screen always uses channel 0 */
 #define ADC_S3C2410_MUX_TS	0
@@ -307,53 +302,6 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.start_conv	= exynos_adc_v1_start_conv,
 };
 
-static void exynos_adc_s3c2416_start_conv(struct exynos_adc *info,
-					  unsigned long addr)
-{
-	u32 con1;
-
-	/* Enable 12 bit ADC resolution */
-	con1 = readl(ADC_V1_CON(info->regs));
-	con1 |= ADC_S3C2416_CON_RES_SEL;
-	writel(con1, ADC_V1_CON(info->regs));
-
-	/* Select channel for S3C2416 */
-	writel(addr, ADC_S3C2410_MUX(info->regs));
-
-	con1 = readl(ADC_V1_CON(info->regs));
-	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
-}
-
-static struct exynos_adc_data const exynos_adc_s3c2416_data = {
-	.num_channels	= MAX_ADC_V1_CHANNELS,
-	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
-
-	.init_hw	= exynos_adc_v1_init_hw,
-	.exit_hw	= exynos_adc_v1_exit_hw,
-	.start_conv	= exynos_adc_s3c2416_start_conv,
-};
-
-static void exynos_adc_s3c2443_start_conv(struct exynos_adc *info,
-					  unsigned long addr)
-{
-	u32 con1;
-
-	/* Select channel for S3C2433 */
-	writel(addr, ADC_S3C2410_MUX(info->regs));
-
-	con1 = readl(ADC_V1_CON(info->regs));
-	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
-}
-
-static struct exynos_adc_data const exynos_adc_s3c2443_data = {
-	.num_channels	= MAX_ADC_V1_CHANNELS,
-	.mask		= ADC_S3C2410_DATX_MASK, /* 10 bit ADC resolution */
-
-	.init_hw	= exynos_adc_v1_init_hw,
-	.exit_hw	= exynos_adc_v1_exit_hw,
-	.start_conv	= exynos_adc_s3c2443_start_conv,
-};
-
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
 					  unsigned long addr)
 {
@@ -365,15 +313,6 @@ static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
 	writel(con1 | ADC_CON_EN_START, ADC_V1_CON(info->regs));
 }
 
-static struct exynos_adc_data const exynos_adc_s3c24xx_data = {
-	.num_channels	= MAX_ADC_V1_CHANNELS,
-	.mask		= ADC_S3C2410_DATX_MASK, /* 10 bit ADC resolution */
-
-	.init_hw	= exynos_adc_v1_init_hw,
-	.exit_hw	= exynos_adc_v1_exit_hw,
-	.start_conv	= exynos_adc_s3c64xx_start_conv,
-};
-
 static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.num_channels	= MAX_ADC_V1_CHANNELS,
 	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
@@ -486,18 +425,6 @@ static const struct exynos_adc_data exynos7_adc_data = {
 
 static const struct of_device_id exynos_adc_match[] = {
 	{
-		.compatible = "samsung,s3c2410-adc",
-		.data = &exynos_adc_s3c24xx_data,
-	}, {
-		.compatible = "samsung,s3c2416-adc",
-		.data = &exynos_adc_s3c2416_data,
-	}, {
-		.compatible = "samsung,s3c2440-adc",
-		.data = &exynos_adc_s3c24xx_data,
-	}, {
-		.compatible = "samsung,s3c2443-adc",
-		.data = &exynos_adc_s3c2443_data,
-	}, {
 		.compatible = "samsung,s3c6410-adc",
 		.data = &exynos_adc_s3c64xx_data,
 	}, {

-- 
2.48.1

