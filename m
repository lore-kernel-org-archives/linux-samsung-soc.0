Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A119B2D23B7
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756572529; cv=none; b=tXVbTXfmbVx4QkpmQWMGIFjkpvOT9yw0WrZ+Q+Z5Ps/L5+Wrv0gdw5wixDOZBh1TBJsVo0uzpMEwhcIHeaw4Wq1jhadDBR7vzgUdYWShfrq9YAAzTYPo7igxNwHef8DjgxB3oDPs8p1P9EyrYdfR9+eYZzheAloxXpzg8YL1GbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756572529; c=relaxed/simple;
	bh=6AT9ywUCC32xDJqdhfxsK5Br7bqJJTl+mGHOc7ie3tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sZOWRsRro4ATba4WhYdw39ZCcjB5SFphJhkzAOFcYrB27N/d0iHj6SHklxECuNcbEePBs/w7BnMjmPI89F3p5rb7E4YHhjZyoCcHHjc5xn0vwMXpgLVklSldly/dwye7C/b8HjYtgOOHZuIxmCgVHwEehtu/0rmCvFGP7YESNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfp8KxBH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfp8KxBH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ceed75169cso252508f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Aug 2025 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756572526; x=1757177326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NHu7s5gw1lYyul9BgLj8lXh4B9A4kmI9Hzn2CmTilU=;
        b=yfp8KxBHPzQt5lj82AMgIyuB07k6OnSjbmPRv1lDG1o4Lu9j1Jn6R2G8TDVphmwfw9
         dCBZPDZY2ahJ4yHDqUt2vf9xYr1IvMm6gtVaNyC2RYEkv1x4GbP5QKCJOHvbFZCX9ZjT
         IXjUAIc6xRK2vY22GqGu5BAhwoa4CmwsMw2MMEihn+LL5lwSeyaqTt0wmIoNgWyXlsgU
         wX0pOXWzuLFphA6IexzrTIcN9PJuNFUoSAT6FB2BFzaD6CmCkv5UqkbwNRTWN9veEcRJ
         fXnj2qk1HJGQ9dhtnxsIPEzSBIySqNaCOFNGImYTrxgFOVE7gfhlGcer3zhc6JqEPZbn
         vmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756572526; x=1757177326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NHu7s5gw1lYyul9BgLj8lXh4B9A4kmI9Hzn2CmTilU=;
        b=w5+6fkZqQtRUKgeaxYUgkxWrDJHo8G9Bm0xrfi47Do+M3xo5K+DqSc4WSsn29MzuR/
         GPqUME0WHu52SE2ZXT5r2SklKq4QhAWJcpt19lVSTBWv7EZ2R1e3/kE5/hQatZgkZ/dc
         LN/ThT9EFDBmScRtn3cLbBDH5TOPB6MpCSSE3GzJo9+1FD6VwYdvm26CcjwjLxvLWfaJ
         ZRZAP+AE5kmqEA65lJPmj5+oJBxIAxMNJ2EzVMc7U4lzbxyUL28m2k2M1mYJIKcIMRX+
         Oqrred7uNJaNgloUtwRb8lUTsy0I78pdYfxKV3tAHMzTn9CYyZ03BLvcRRvJOCHA25my
         guUA==
X-Forwarded-Encrypted: i=1; AJvYcCVBoGZJMAfQZIktkIYRHWW7HFuf5Mzo68k7CWMtNZYUCeKmIhj1SJxfbk8kiGmWYWki+8vP+1jELk7t7vuaBFCasA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqLQdwxwbQexhUnWxeM3IuKNaOaG+VDl97odCmP+jExp0X3kP
	uRwZjARWjIECA+Tc//kylZ5Gie5giwA2ELKtFhar52QJ3AVgL/tUmBCbBH35jrE82cs=
X-Gm-Gg: ASbGncvvjhRlmL01Kho8Br96yNicD3oO/NHIWwLlNY9KFOXZMrPLMDHYT6Nz9YMdfC8
	x+/mDXn811CFkIFZnxM8fXCc5RFvaRcYSJ/6GlM9pH2ic88JFxQ418cgML1kmUgUe48HfU6OMST
	VaQssuI8rXD2xr3cizpAA8a4487KsSJYy40Wim3h0Iw4Zw/CoZeoA0CaPxCfDSZ1+60yJed1/zm
	vBfqBya/43VfB7K9RxNPf79FkdledDkaaudf4/aN48bw/TIecAApAoz/Js7z4KI5v3WzMI0/oyK
	JoShzrTwnwYmgdFBW6QQqAZ6eZZi7J31JRlo1m0B12sP/IvNOmpNixUXZ/roXG/mpc0mDuPDEWC
	6ZiQSj2AYjzXS89e578uFsAxRv3qeutDZkvYi2R8AawtQ506J9Q==
X-Google-Smtp-Source: AGHT+IG3g/r5+Z44VCwqW8bkfFPUWtY+KFSor7fLqkk/9p70DkqbZxuqtb7Kgq+CTTE5OETkMakrhg==
X-Received: by 2002:a05:6000:4203:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3d0fbdc8122mr2137741f8f.8.1756572525902;
        Sat, 30 Aug 2025 09:48:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf274dde69sm7818129f8f.14.2025.08.30.09.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:48:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 18:48:32 +0200
Subject: [PATCH v2 3/5] iio: adc: exynos_adc: Drop platform data support
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-adc-v2-3-4f8299343d32@linaro.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6AT9ywUCC32xDJqdhfxsK5Br7bqJJTl+mGHOc7ie3tI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosytk+UfhpJZqsZdbJJIvPyy0MxlR8ZzP7Y9vk
 SaMD1TerjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMrZAAKCRDBN2bmhouD
 1xDHD/0XrX2T5NZEXND6PIik1dMDmd+0HGE2tUYES27XFPsmniDxAgSEe6eVzk9lgqe21JZJIc1
 LcsHr7luK3WjAUNcGYdK9aHIC9n97w6ANM/pqV+4LNHb+ZJaT2EA4yoa72a3vhHpROsEkoqycY4
 uDUyvzYWoY4YczYfj5PT53HZiBeMTPKP0HhmTl4Dyo7ip1UGM9PdgU5OSYmF0D6nB0dYjvI8+ZM
 zF8A+FGUtP6a5oSE2M0QJqfPOuKXEXX/Zdjs5Gx1W8mub0mnfQZbO7iX9L6ASlIhF037rIw0F2S
 mDlh8XipmgQIo+suj0MbhueFwkS9zhGP1oMimFhJUsd0Oidg5VLIHYmPV19XMCSgbTwChCdcjlT
 C6XINIdpWP36Qc8S/2rL/bP0lXLTEqqDlAGDHKhm+yto3OeZIGwqEIzKgEiP64ZZ7zdv/dcsYal
 CDkGJlMhxKa/FH7Zc3JBJ9GzIefC2NE1Wc9RCRd/dptcFJJgDz2ghqblRzlIfsUmtGQniVxcjw4
 8lOfUgWqxA+ltVIXYaFEzZKKo8BGDeVgF5hil3sn7LwO37UM4R4JEtL3CDAs5deIMXNUUyDZJ46
 bH7bcFxXb6Z/cG9Q/Ju62WPMus5oiQSl9FFMLAEaxO/jTNdfWpNBpyHYcWhJN4f3IGMxeUuiC6E
 zQ2aBWIdFVu3qPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

There are no Samsung Exynos SoC ADC driver users which bind via platform
ID, thus platform data is never set and can be dropped.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. Drop touchscreen-s3c2410.h
---
 drivers/iio/adc/exynos_adc.c                      | 11 +----------
 include/linux/platform_data/touchscreen-s3c2410.h | 22 ----------------------
 2 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index 30f6d8436e775a8d2177951b436cd45152307ea2..d21a9f3621d96c8051f2062aa6a069e8c29faf9b 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -29,8 +29,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
-#include <linux/platform_data/touchscreen-s3c2410.h>
-
 /* S3C/EXYNOS4412/5250 ADC_V1 registers definitions */
 #define ADC_V1_CON(x)		((x) + 0x00)
 #define ADC_V1_DLY(x)		((x) + 0x08)
@@ -106,7 +104,6 @@ struct exynos_adc {
 	struct clk		*clk;
 	struct clk		*sclk;
 	unsigned int		irq;
-	unsigned int		delay;
 	struct regulator	*vdd;
 
 	struct completion	completion;
@@ -213,7 +210,7 @@ static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 	writel(con1, ADC_V1_CON(info->regs));
 
 	/* set touchscreen delay */
-	writel(info->delay, ADC_V1_DLY(info->regs));
+	writel(10000, ADC_V1_DLY(info->regs));
 }
 
 static void exynos_adc_v1_exit_hw(struct exynos_adc *info)
@@ -556,7 +553,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 {
 	struct exynos_adc *info = NULL;
 	struct device_node *np = pdev->dev.of_node;
-	struct s3c2410_ts_mach_info *pdata = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = NULL;
 	int ret;
 	int irq;
@@ -657,11 +653,6 @@ static int exynos_adc_probe(struct platform_device *pdev)
 	if (info->data->init_hw)
 		info->data->init_hw(info);
 
-	if (pdata)
-		info->delay = pdata->delay;
-	else
-		info->delay = 10000;
-
 	ret = of_platform_populate(np, exynos_adc_match, NULL, &indio_dev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed adding child nodes\n");
diff --git a/include/linux/platform_data/touchscreen-s3c2410.h b/include/linux/platform_data/touchscreen-s3c2410.h
deleted file mode 100644
index bf8d3b9d7c6a98fc2392786df2c0cdf128047645..0000000000000000000000000000000000000000
--- a/include/linux/platform_data/touchscreen-s3c2410.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2005 Arnaud Patard <arnaud.patard@rtp-net.org>
-*/
-
-#ifndef __TOUCHSCREEN_S3C2410_H
-#define __TOUCHSCREEN_S3C2410_H
-
-struct s3c2410_ts_mach_info {
-	int delay;
-	int presc;
-	int oversampling_shift;
-	void (*cfg_gpio)(struct platform_device *dev);
-};
-
-extern void s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
-extern void s3c64xx_ts_set_platdata(struct s3c2410_ts_mach_info *);
-
-/* defined by architecture to configure gpio */
-extern void s3c24xx_ts_cfg_gpio(struct platform_device *dev);
-
-#endif /*__TOUCHSCREEN_S3C2410_H */

-- 
2.48.1

