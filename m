Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqhxvu0N"
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB191729
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2023 02:09:39 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50c04ebe1bbso1756910e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2023 02:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030177; x=1702634977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhnbSO3Q2zosi6qhruoMo38E3T6MCIF3EEqxHYrVBSs=;
        b=tqhxvu0N5RN00Lx9EK4Zon2mIxkdgCQc+gLVwwqvT9OtkPMrYnRAipCAjUJdB3WhLa
         9gY2f/EbYR79V/qIYm7pSyDRXd5GCLpw1K/LnESEC3+iUrvws+IWKpGt9VjSqe8ePcs6
         hq6oibMaBDdQRwhICgHYOEcrOAiZWwgfH2pfQHEMQoaRIF10ZR827FBRlUtKdJq27cMq
         JvmxIflZCoDbt9RARK9grwq0M6VWEn4YoxCAC+s/Z0p2CUMAEaZjONLpauUyDVL0tsDG
         01SHy/agejkXDHmMlXEcYdJdYnyImOhsYaO3rFF3lg23v+q14LcjJ4Wnj8VOO79Tzhg6
         X3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030177; x=1702634977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhnbSO3Q2zosi6qhruoMo38E3T6MCIF3EEqxHYrVBSs=;
        b=Fv4/J115a2cB2agLUfFHiho5zZzxrWmlKO9G2UDGZuhHUMW3QAvCkQUVNK9SNsNgDE
         KmR4/phBMc7OZEzgcujowGYfxEdfYMadK4NWa7/qY9ElWTx2bOQ8XggcPIRGbvki6S6Z
         nB23bfXDskX/S56xRNKKElwf90x/BBnF24KQdgjAyBMhA39dEdR8Y66y3T7UtlGSnPaw
         XdNMMroQ8UoSQ5myfpDAFZToHmUAIV5DWJ/tBSHApKVa3LTNJ3OKEBBixO9JYWApM9fa
         zWv4+4p5aG0uMR4QghpvD2nDdTWKKXPgrpp7VkSqHVUY+7VUj13TekhSTMeoUTuzpdrd
         DS6w==
X-Gm-Message-State: AOJu0YwhFEzBuzyj7RpFdh/svM/dkQwX0E1abfmaWCe1hp0wa1FwS1fG
	hBB34qbXNQMPvWyH8wX097C8GQ==
X-Google-Smtp-Source: AGHT+IHDQiaJfoevWBU3VZl6wKHvb+DBei29sDxTYazUuIBszOHOw9PxM/7XaZKgWi/zg8gufY0MLA==
X-Received: by 2002:a05:6512:3e1e:b0:50b:e92c:de18 with SMTP id i30-20020a0565123e1e00b0050be92cde18mr352888lfv.22.1702030177312;
        Fri, 08 Dec 2023 02:09:37 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id m4-20020a194344000000b0050bfd7d8873sm174295lfj.254.2023.12.08.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:09:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Dec 2023 11:09:28 +0100
Subject: [PATCH 4/5] ASoC: wm5100: Convert to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-descriptors-sound-wlf-v1-4-c4dab6f521ec@linaro.org>
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

This converts the WM5100 codec to use GPIO descriptors, a pretty
straight-forward conversion with the following peculiarities:

- The driver is instantiating a GPIO chip named wm5100, and the
  headphone polarity detection GPIO is lifted from there. We add
  this to the GPIO descriptor table as well, and we can then get
  rid of also the base address for the GPIO chip from the
  platform data and just use dynamic numbering.

- Fix up the only in-tree user which is the Cragganmore 6410
  module.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410-module.c |  17 +++--
 include/sound/wm5100.h                   |   4 --
 sound/soc/codecs/wm5100.c                | 107 +++++++++++--------------------
 3 files changed, 52 insertions(+), 76 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 1df6b7e52c9d..59456fbebf1b 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -70,10 +70,19 @@ static struct spi_board_info balblair_devs[] = {
 	},
 };
 
+static struct gpiod_lookup_table wm5100_gpiod_table = {
+	.dev_id = "1-001a", /* Device 001a on I2C bus 1 */
+	.table = {
+		GPIO_LOOKUP("GPION", 7,
+			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("wm5100", 3,
+			    "hp-pol", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct wm5100_pdata wm5100_pdata = {
-	.ldo_ena = S3C64XX_GPN(7),
 	.irq_flags = IRQF_TRIGGER_HIGH,
-	.gpio_base = CODEC_GPIO_BASE,
 
 	.in_mode = {
 		WM5100_IN_DIFF,
@@ -82,7 +91,6 @@ static struct wm5100_pdata wm5100_pdata = {
 		WM5100_IN_SE,
 	},
 
-	.hp_pol = CODEC_GPIO_BASE + 3,
 	.jack_modes = {
 		{ WM5100_MICDET_MICBIAS3, 0, 0 },
 		{ WM5100_MICDET_MICBIAS2, 1, 1 },
@@ -366,7 +374,8 @@ static const struct {
 	{ .id = 0x3a, .rev = 0xff, .name = "1259-EV1 Tobermory",
 	  .i2c_devs = wm1259_devs, .num_i2c_devs = ARRAY_SIZE(wm1259_devs) },
 	{ .id = 0x3b, .rev = 0xff, .name = "1255-EV1 Kilchoman",
-	  .i2c_devs = wm1255_devs, .num_i2c_devs = ARRAY_SIZE(wm1255_devs) },
+	  .i2c_devs = wm1255_devs, .num_i2c_devs = ARRAY_SIZE(wm1255_devs),
+	  .gpiod_table = &wm5100_gpiod_table },
 	{ .id = 0x3c, .rev = 0xff, .name = "1273-EV1 Longmorn" },
 	{ .id = 0x3d, .rev = 0xff, .name = "1277-EV1 Littlemill",
 	  .i2c_devs = wm1277_devs, .num_i2c_devs = ARRAY_SIZE(wm1277_devs),
diff --git a/include/sound/wm5100.h b/include/sound/wm5100.h
index b94badf72947..1c48090fdb2c 100644
--- a/include/sound/wm5100.h
+++ b/include/sound/wm5100.h
@@ -36,11 +36,7 @@ struct wm5100_jack_mode {
 #define WM5100_GPIO_SET 0x10000
 
 struct wm5100_pdata {
-	int reset;      /** GPIO controlling /RESET, if any */
-	int ldo_ena;    /** GPIO controlling LODENA, if any */
-	int hp_pol;     /** GPIO controlling headset polarity, if any */
 	int irq_flags;
-	int gpio_base;
 
 	struct wm5100_jack_mode jack_modes[2];
 
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index ff63723928a1..7ee4b45c0834 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -15,7 +15,7 @@
 #include <linux/pm.h>
 #include <linux/gcd.h>
 #include <linux/gpio/driver.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -55,6 +55,9 @@ struct wm5100_priv {
 	struct snd_soc_component *component;
 
 	struct regulator_bulk_data core_supplies[WM5100_NUM_CORE_SUPPLIES];
+	struct gpio_desc *reset;
+	struct gpio_desc *ldo_ena;
+	struct gpio_desc *hp_pol;
 
 	int rev;
 
@@ -205,9 +208,9 @@ static void wm5100_free_sr(struct snd_soc_component *component, int rate)
 
 static int wm5100_reset(struct wm5100_priv *wm5100)
 {
-	if (wm5100->pdata.reset) {
-		gpio_set_value_cansleep(wm5100->pdata.reset, 0);
-		gpio_set_value_cansleep(wm5100->pdata.reset, 1);
+	if (wm5100->reset) {
+		gpiod_set_value_cansleep(wm5100->reset, 1);
+		gpiod_set_value_cansleep(wm5100->reset, 0);
 
 		return 0;
 	} else {
@@ -1974,7 +1977,7 @@ static void wm5100_set_detect_mode(struct wm5100_priv *wm5100, int the_mode)
 	if (WARN_ON(the_mode >= ARRAY_SIZE(wm5100->pdata.jack_modes)))
 		return;
 
-	gpio_set_value_cansleep(wm5100->pdata.hp_pol, mode->hp_pol);
+	gpiod_set_value_cansleep(wm5100->hp_pol, mode->hp_pol);
 	regmap_update_bits(wm5100->regmap, WM5100_ACCESSORY_DETECT_MODE_1,
 			   WM5100_ACCDET_BIAS_SRC_MASK |
 			   WM5100_ACCDET_SRC,
@@ -2299,11 +2302,7 @@ static void wm5100_init_gpio(struct i2c_client *i2c)
 	wm5100->gpio_chip = wm5100_template_chip;
 	wm5100->gpio_chip.ngpio = 6;
 	wm5100->gpio_chip.parent = &i2c->dev;
-
-	if (wm5100->pdata.gpio_base)
-		wm5100->gpio_chip.base = wm5100->pdata.gpio_base;
-	else
-		wm5100->gpio_chip.base = -1;
+	wm5100->gpio_chip.base = -1;
 
 	ret = gpiochip_add_data(&wm5100->gpio_chip, wm5100);
 	if (ret != 0)
@@ -2349,35 +2348,20 @@ static int wm5100_probe(struct snd_soc_component *component)
 		snd_soc_dapm_new_controls(dapm, wm5100_dapm_widgets_noirq,
 					  ARRAY_SIZE(wm5100_dapm_widgets_noirq));
 
-	if (wm5100->pdata.hp_pol) {
-		ret = gpio_request_one(wm5100->pdata.hp_pol,
-				       GPIOF_OUT_INIT_HIGH, "WM5100 HP_POL");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request HP_POL %d: %d\n",
-				wm5100->pdata.hp_pol, ret);
-			goto err_gpio;
-		}
+	wm5100->hp_pol = devm_gpiod_get_optional(&i2c->dev, "hp-pol",
+						 GPIOD_OUT_HIGH);
+	if (IS_ERR(wm5100->hp_pol)) {
+		ret = PTR_ERR(wm5100->hp_pol);
+		dev_err(&i2c->dev, "Failed to request HP_POL GPIO: %d\n",
+			ret);
+		return ret;
 	}
 
 	return 0;
-
-err_gpio:
-
-	return ret;
-}
-
-static void wm5100_remove(struct snd_soc_component *component)
-{
-	struct wm5100_priv *wm5100 = snd_soc_component_get_drvdata(component);
-
-	if (wm5100->pdata.hp_pol) {
-		gpio_free(wm5100->pdata.hp_pol);
-	}
 }
 
 static const struct snd_soc_component_driver soc_component_dev_wm5100 = {
 	.probe			= wm5100_probe,
-	.remove			= wm5100_remove,
 	.set_sysclk		= wm5100_set_sysclk,
 	.set_pll		= wm5100_set_fll,
 	.seq_notifier		= wm5100_seq_notifier,
@@ -2460,26 +2444,26 @@ static int wm5100_i2c_probe(struct i2c_client *i2c)
 		goto err;
 	}
 
-	if (wm5100->pdata.ldo_ena) {
-		ret = gpio_request_one(wm5100->pdata.ldo_ena,
-				       GPIOF_OUT_INIT_HIGH, "WM5100 LDOENA");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request LDOENA %d: %d\n",
-				wm5100->pdata.ldo_ena, ret);
-			goto err_enable;
-		}
+	wm5100->ldo_ena = devm_gpiod_get_optional(&i2c->dev, "wlf,ldo1ena",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(wm5100->ldo_ena)) {
+		ret = PTR_ERR(wm5100->ldo_ena);
+		dev_err(&i2c->dev, "Failed to request LDOENA GPIO: %d\n", ret);
+		goto err_enable;
+	}
+	if (wm5100->ldo_ena) {
+		gpiod_set_consumer_name(wm5100->ldo_ena, "WM5100 LDOENA");
 		msleep(2);
 	}
 
-	if (wm5100->pdata.reset) {
-		ret = gpio_request_one(wm5100->pdata.reset,
-				       GPIOF_OUT_INIT_HIGH, "WM5100 /RESET");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request /RESET %d: %d\n",
-				wm5100->pdata.reset, ret);
-			goto err_ldo;
-		}
+	wm5100->reset = devm_gpiod_get_optional(&i2c->dev, "reset",
+						GPIOD_OUT_LOW);
+	if (IS_ERR(wm5100->reset)) {
+		ret = PTR_ERR(wm5100->reset);
+		dev_err(&i2c->dev, "Failed to request /RESET GPIO: %d\n", ret);
+		goto err_ldo;
 	}
+	gpiod_set_consumer_name(wm5100->reset, "WM5100 /RESET");
 
 	ret = regmap_read(wm5100->regmap, WM5100_SOFTWARE_RESET, &reg);
 	if (ret < 0) {
@@ -2619,15 +2603,9 @@ static int wm5100_i2c_probe(struct i2c_client *i2c)
 	if (i2c->irq)
 		free_irq(i2c->irq, wm5100);
 	wm5100_free_gpio(i2c);
-	if (wm5100->pdata.reset) {
-		gpio_set_value_cansleep(wm5100->pdata.reset, 0);
-		gpio_free(wm5100->pdata.reset);
-	}
+	gpiod_set_value_cansleep(wm5100->reset, 1);
 err_ldo:
-	if (wm5100->pdata.ldo_ena) {
-		gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 0);
-		gpio_free(wm5100->pdata.ldo_ena);
-	}
+	gpiod_set_value_cansleep(wm5100->ldo_ena, 0);
 err_enable:
 	regulator_bulk_disable(ARRAY_SIZE(wm5100->core_supplies),
 			       wm5100->core_supplies);
@@ -2643,14 +2621,8 @@ static void wm5100_i2c_remove(struct i2c_client *i2c)
 	if (i2c->irq)
 		free_irq(i2c->irq, wm5100);
 	wm5100_free_gpio(i2c);
-	if (wm5100->pdata.reset) {
-		gpio_set_value_cansleep(wm5100->pdata.reset, 0);
-		gpio_free(wm5100->pdata.reset);
-	}
-	if (wm5100->pdata.ldo_ena) {
-		gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 0);
-		gpio_free(wm5100->pdata.ldo_ena);
-	}
+	gpiod_set_value_cansleep(wm5100->reset, 1);
+	gpiod_set_value_cansleep(wm5100->ldo_ena, 0);
 }
 
 #ifdef CONFIG_PM
@@ -2660,8 +2632,7 @@ static int wm5100_runtime_suspend(struct device *dev)
 
 	regcache_cache_only(wm5100->regmap, true);
 	regcache_mark_dirty(wm5100->regmap);
-	if (wm5100->pdata.ldo_ena)
-		gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 0);
+	gpiod_set_value_cansleep(wm5100->ldo_ena, 0);
 	regulator_bulk_disable(ARRAY_SIZE(wm5100->core_supplies),
 			       wm5100->core_supplies);
 
@@ -2681,8 +2652,8 @@ static int wm5100_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	if (wm5100->pdata.ldo_ena) {
-		gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 1);
+	if (wm5100->ldo_ena) {
+		gpiod_set_value_cansleep(wm5100->ldo_ena, 1);
 		msleep(2);
 	}
 

-- 
2.34.1

