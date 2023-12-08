Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmpzSRjy"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B271723
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2023 02:09:37 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bf69afa99so2242911e87.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2023 02:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030175; x=1702634975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQi4Bvr4o7N2h0y8BjsD9/kOWN0argg174NFoe2194o=;
        b=PmpzSRjy0ukOAqyi4ZcGUpilRjBTlmC/gZveGV/0C2N1WK7M0WV15+jP1Hq47omOyZ
         e244QestoVKkSUmiBAq2Vu1X0M6GtKpiKyMx43Aymhow2pONajmufFWpr9o/bPv5GAmy
         /iL/qiQQGF6NZoQ+R/1CqGZ4daKHfaDiOhcAtOJM1oRW+DxqXAzl28K7vM4jChpg1HkN
         kY7m6DKOzn9Fx2x0Jh9nN3epYw5qEBkAOdUyCUOF/0JTe46MYfFRfdKYQgza4/bm95Sz
         3Rbbs5XzfUpuOKLZ6JcwJOfBeoyUodYMI/0qekhbMwQuCfWaTOmAhaXI7Sao/S9yV8+z
         SbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030175; x=1702634975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQi4Bvr4o7N2h0y8BjsD9/kOWN0argg174NFoe2194o=;
        b=qM1W04RNmq3/klUgzYa5VHhdGI5STZxENVuULFXKVojpghEvB4asAmJ/RtV71kYe5V
         RSPJFbusjMh1Ik1LAB7fn4/6UcvUyURZQ7ODxkgTeZPwRAdL+x8dRB3Wik1yOvnwxoVN
         AU7NwKBYEyEO6xwm8UtTFNPyVB0EK46tMnkmymqAvrZbNm2HS5CsswXPLR+7f6t+G2Ml
         0jmREihig8nrDESalEeMUYVPk8D+8SOcC/QTTdpkaTbIoVKilRrlfB3pzORvrzRJrlV2
         l3lK7R0m8wMj1Li1CsTVdbBH81+tXYODIdKJR2bpk7jJJ/3Gbc3RBtRpn6a4Jv038NY2
         qo6Q==
X-Gm-Message-State: AOJu0YzMKAEc5JFgC3nZT+vHdI7rvR658SxKObPkifS44hQo9zDF61xF
	7cAXfJh7rQghQHZeFJEdvn3OT+u9Lw0CxkDM0NY=
X-Google-Smtp-Source: AGHT+IEShC8xpu2Hj2OxW7FGnp8m+UY3PWR5rPIW092l7ksr6bktsYxCnNAz69CWQG7dQQ9IDpxpIw==
X-Received: by 2002:a05:6512:3481:b0:50b:f130:52fc with SMTP id v1-20020a056512348100b0050bf13052fcmr2102615lfr.82.1702030175563;
        Fri, 08 Dec 2023 02:09:35 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id m4-20020a194344000000b0050bfd7d8873sm174295lfj.254.2023.12.08.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:09:35 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Dec 2023 11:09:26 +0100
Subject: [PATCH 2/5] ASoC: wm1250-ev1: Convert to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-descriptors-sound-wlf-v1-2-c4dab6f521ec@linaro.org>
References: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
In-Reply-To: <20231208-descriptors-sound-wlf-v1-0-c4dab6f521ec@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

This converts the WM1250-EV1 codec to use GPIO descriptors.
It turns out that the platform data was only used to pass some
global GPIO numbers from a board file, so we get rid of this
and also switch over the single in-tree user in the S3C
Cragganmore module for S3C 6410.

The driver obtains two GPIO lines named OSR and master and just
pull them low, we leave this behaviour as it was.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410.c |  24 ++++----
 include/sound/wm1250-ev1.h        |  24 --------
 sound/soc/codecs/wm1250-ev1.c     | 118 ++++++++++++++------------------------
 3 files changed, 56 insertions(+), 110 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 7c4bed4370a1..e5df2cb51ab2 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -39,8 +39,6 @@
 #include <linux/mfd/wm831x/irq.h>
 #include <linux/mfd/wm831x/gpio.h>
 
-#include <sound/wm1250-ev1.h>
-
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
 
@@ -713,13 +711,16 @@ static struct wm831x_pdata glenfarclas_pmic_pdata = {
 	.disable_touch = true,
 };
 
-static struct wm1250_ev1_pdata wm1250_ev1_pdata = {
-	.gpios = {
-		[WM1250_EV1_GPIO_CLK_ENA] = S3C64XX_GPN(12),
-		[WM1250_EV1_GPIO_CLK_SEL0] = S3C64XX_GPL(12),
-		[WM1250_EV1_GPIO_CLK_SEL1] = S3C64XX_GPL(13),
-		[WM1250_EV1_GPIO_OSR] = S3C64XX_GPL(14),
-		[WM1250_EV1_GPIO_MASTER] = S3C64XX_GPL(8),
+static struct gpiod_lookup_table crag_wm1250_ev1_gpiod_table = {
+	/* The WM1250-EV1 is device 0027 on I2C bus 1 */
+	.dev_id = "1-0027",
+	.table = {
+		GPIO_LOOKUP("GPION", 12, "clk-ena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOL", 12, "clk-sel0", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOL", 13, "clk-sel1", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOL", 14, "osr", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOL", 8, "master", GPIO_ACTIVE_HIGH),
+		{ },
 	},
 };
 
@@ -733,9 +734,7 @@ static struct i2c_board_info i2c_devs1[] = {
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x24) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x25) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x26) },
-
-	{ I2C_BOARD_INFO("wm1250-ev1", 0x27),
-	  .platform_data = &wm1250_ev1_pdata },
+	{ I2C_BOARD_INFO("wm1250-ev1", 0x27), },
 };
 
 static struct s3c2410_platform_i2c i2c1_pdata = {
@@ -862,6 +861,7 @@ static void __init crag6410_machine_init(void)
 
 	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
+	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
 	samsung_keypad_set_platdata(&crag6410_keypad_data);
diff --git a/include/sound/wm1250-ev1.h b/include/sound/wm1250-ev1.h
deleted file mode 100644
index d16614ebecb4..000000000000
--- a/include/sound/wm1250-ev1.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/wm1250-ev1.h - Platform data for WM1250-EV1
- *
- * Copyright 2011 Wolfson Microelectronics. PLC.
- */
-
-#ifndef __LINUX_SND_WM1250_EV1_H
-#define __LINUX_SND_WM1250_EV1_H
-
-#define WM1250_EV1_NUM_GPIOS 5
-
-#define WM1250_EV1_GPIO_CLK_ENA  0
-#define WM1250_EV1_GPIO_CLK_SEL0 1
-#define WM1250_EV1_GPIO_CLK_SEL1 2
-#define WM1250_EV1_GPIO_OSR      3
-#define WM1250_EV1_GPIO_MASTER   4
-
-
-struct wm1250_ev1_pdata {
-	int gpios[WM1250_EV1_NUM_GPIOS];
-};
-
-#endif
diff --git a/sound/soc/codecs/wm1250-ev1.c b/sound/soc/codecs/wm1250-ev1.c
index d7eeb41ba60f..a2a8b2a4b19b 100644
--- a/sound/soc/codecs/wm1250-ev1.c
+++ b/sound/soc/codecs/wm1250-ev1.c
@@ -9,34 +9,23 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/wm1250-ev1.h>
-
-static const char *wm1250_gpio_names[WM1250_EV1_NUM_GPIOS] = {
-	"WM1250 CLK_ENA",
-	"WM1250 CLK_SEL0",
-	"WM1250 CLK_SEL1",
-	"WM1250 OSR",
-	"WM1250 MASTER",
-};
 
 struct wm1250_priv {
-	struct gpio gpios[WM1250_EV1_NUM_GPIOS];
+	struct gpio_desc *clk_ena;
+	struct gpio_desc *clk_sel0;
+	struct gpio_desc *clk_sel1;
+	struct gpio_desc *osr;
+	struct gpio_desc *master;
 };
 
 static int wm1250_ev1_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level)
 {
 	struct wm1250_priv *wm1250 = dev_get_drvdata(component->dev);
-	int ena;
-
-	if (wm1250)
-		ena = wm1250->gpios[WM1250_EV1_GPIO_CLK_ENA].gpio;
-	else
-		ena = -1;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -46,13 +35,11 @@ static int wm1250_ev1_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (ena >= 0)
-			gpio_set_value_cansleep(ena, 1);
+		gpiod_set_value_cansleep(wm1250->clk_ena, 1);
 		break;
 
 	case SND_SOC_BIAS_OFF:
-		if (ena >= 0)
-			gpio_set_value_cansleep(ena, 0);
+		gpiod_set_value_cansleep(wm1250->clk_ena, 0);
 		break;
 	}
 
@@ -80,28 +67,20 @@ static int wm1250_ev1_hw_params(struct snd_pcm_substream *substream,
 
 	switch (params_rate(params)) {
 	case 8000:
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL0].gpio,
-			       1);
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL1].gpio,
-			       1);
+		gpiod_set_value(wm1250->clk_sel0, 1);
+		gpiod_set_value(wm1250->clk_sel1, 1);
 		break;
 	case 16000:
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL0].gpio,
-			       0);
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL1].gpio,
-			       1);
+		gpiod_set_value(wm1250->clk_sel0, 0);
+		gpiod_set_value(wm1250->clk_sel1, 1);
 		break;
 	case 32000:
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL0].gpio,
-			       1);
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL1].gpio,
-			       0);
+		gpiod_set_value(wm1250->clk_sel0, 1);
+		gpiod_set_value(wm1250->clk_sel1, 0);
 		break;
 	case 64000:
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL0].gpio,
-			       0);
-		gpio_set_value(wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL1].gpio,
-			       0);
+		gpiod_set_value(wm1250->clk_sel0, 0);
+		gpiod_set_value(wm1250->clk_sel1, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -150,45 +129,43 @@ static int wm1250_ev1_pdata(struct i2c_client *i2c)
 {
 	struct wm1250_ev1_pdata *pdata = dev_get_platdata(&i2c->dev);
 	struct wm1250_priv *wm1250;
-	int i, ret;
+	int ret;
 
 	if (!pdata)
 		return 0;
 
 	wm1250 = devm_kzalloc(&i2c->dev, sizeof(*wm1250), GFP_KERNEL);
-	if (!wm1250) {
-		ret = -ENOMEM;
-		goto err;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(wm1250->gpios); i++) {
-		wm1250->gpios[i].gpio = pdata->gpios[i];
-		wm1250->gpios[i].label = wm1250_gpio_names[i];
-		wm1250->gpios[i].flags = GPIOF_OUT_INIT_LOW;
-	}
-	wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL0].flags = GPIOF_OUT_INIT_HIGH;
-	wm1250->gpios[WM1250_EV1_GPIO_CLK_SEL1].flags = GPIOF_OUT_INIT_HIGH;
-
-	ret = gpio_request_array(wm1250->gpios, ARRAY_SIZE(wm1250->gpios));
-	if (ret != 0) {
-		dev_err(&i2c->dev, "Failed to get GPIOs: %d\n", ret);
-		goto err;
-	}
+	if (!wm1250)
+		return -ENOMEM;
+
+	wm1250->clk_ena = devm_gpiod_get(&i2c->dev, "clk-ena", GPIOD_OUT_LOW);
+	if (IS_ERR(wm1250->clk_ena))
+		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->clk_ena),
+				     "failed to get clock enable GPIO\n");
+
+	wm1250->clk_sel0 = devm_gpiod_get(&i2c->dev, "clk-sel0", GPIOD_OUT_HIGH);
+	if (IS_ERR(wm1250->clk_sel0))
+		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->clk_sel0),
+				     "failed to get clock sel0 GPIO\n");
+
+	wm1250->clk_sel1 = devm_gpiod_get(&i2c->dev, "clk-sel1", GPIOD_OUT_HIGH);
+	if (IS_ERR(wm1250->clk_sel1))
+		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->clk_sel1),
+				     "failed to get clock sel1 GPIO\n");
+
+	wm1250->osr = devm_gpiod_get(&i2c->dev, "osr", GPIOD_OUT_LOW);
+	if (IS_ERR(wm1250->osr))
+		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->osr),
+				     "failed to get OSR GPIO\n");
+
+	wm1250->master = devm_gpiod_get(&i2c->dev, "master", GPIOD_OUT_LOW);
+	if (IS_ERR(wm1250->master))
+		return dev_err_probe(&i2c->dev, PTR_ERR(wm1250->master),
+				     "failed to get MASTER GPIO\n");
 
 	dev_set_drvdata(&i2c->dev, wm1250);
 
 	return ret;
-
-err:
-	return ret;
-}
-
-static void wm1250_ev1_free(struct i2c_client *i2c)
-{
-	struct wm1250_priv *wm1250 = dev_get_drvdata(&i2c->dev);
-
-	if (wm1250)
-		gpio_free_array(wm1250->gpios, ARRAY_SIZE(wm1250->gpios));
 }
 
 static int wm1250_ev1_probe(struct i2c_client *i2c)
@@ -221,18 +198,12 @@ static int wm1250_ev1_probe(struct i2c_client *i2c)
 				     &wm1250_ev1_dai, 1);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret);
-		wm1250_ev1_free(i2c);
 		return ret;
 	}
 
 	return 0;
 }
 
-static void wm1250_ev1_remove(struct i2c_client *i2c)
-{
-	wm1250_ev1_free(i2c);
-}
-
 static const struct i2c_device_id wm1250_ev1_i2c_id[] = {
 	{ "wm1250-ev1", 0 },
 	{ }
@@ -244,7 +215,6 @@ static struct i2c_driver wm1250_ev1_i2c_driver = {
 		.name = "wm1250-ev1",
 	},
 	.probe =    wm1250_ev1_probe,
-	.remove =   wm1250_ev1_remove,
 	.id_table = wm1250_ev1_i2c_id,
 };
 

-- 
2.34.1

