Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsr3xlwh"
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021DF11D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2023 02:09:40 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50c0f6b1015so2072587e87.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2023 02:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030178; x=1702634978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQhBLJIefmvzYA/Py58YBQIvfKjKbstgbICKsncNOPs=;
        b=fsr3xlwh9pTsNU18JOHu6/2JIydlEZ/rUWpxptc+HXlVyeZX141LRdZRB3aZIZC0u9
         PV3faL+g1XuHd2ytkGJNNztltWftdcdOROyKvN2D+mZ+JzE3UWFOF39gqz+ESr3EwR9a
         OUY18tbxYhQ04TXCD7HeVm/koH55Nv0jRFy4tdgUOVvvBnh97Ska6dGvnSHwCyBbXnW2
         UBBxu6hd0v9TaVFJyS7Jwtr9vo+efPDgtMU234UoQbTixnWy6SCA0c4Hgl3K43Uxa7qk
         rnh7MHG4Sj7QSp4hd9HE+o+KyCtwUlIXTcvHmXZb29XXRoFYatvFuUDqg0yIJdulVkFE
         VmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030178; x=1702634978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQhBLJIefmvzYA/Py58YBQIvfKjKbstgbICKsncNOPs=;
        b=VtTHct0xPChb6kCEv2K4WLRKUPB6+okzfoWPMK5rscZXvs5Fuq5D0HdUL6HHsMzJeS
         KBokfa1rqMSkkJcTTMsvQTUP3RA68XrDZlhlLsfKiQweTbnktOfICsjJC5/4rvicdJly
         lPgiy5B0XbHcSDV8Yi83uQoODB1aexJXVOo4FIp0V8lAMJsO2Rg5U+5ul+Cnj2WTSjhm
         /lkUbzOG72WXQKuhcWAMYwg9kdULMnHYkV9VB2SFedIaseVLQnJEu0OmuZ1jbnp93KGe
         27Jbr+11aw9EO8ETCv5WE/vZf6rTCQ856HZq+yUQMHp21NXSpFpx+udUEIgZVZVHAodI
         gLZQ==
X-Gm-Message-State: AOJu0Yy2+lLcWwW1kKO7g5h+kOO8pORVSMk7kaksD18rEwwm5CAcafga
	6J7/Wr0Jo/VqcTIpjYsp9fHhtw==
X-Google-Smtp-Source: AGHT+IF3QhztmwDh6phbnNL/MSIHXHVpg1ufEn+gEmm8xgnt7lUT27GO3nRwVTmsFz+TX/dx8idZEQ==
X-Received: by 2002:ac2:44ce:0:b0:50b:f380:c3b2 with SMTP id d14-20020ac244ce000000b0050bf380c3b2mr1882935lfm.46.1702030178344;
        Fri, 08 Dec 2023 02:09:38 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id m4-20020a194344000000b0050bfd7d8873sm174295lfj.254.2023.12.08.02.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:09:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Dec 2023 11:09:29 +0100
Subject: [PATCH 5/5] ASoC: wm8996: Convert to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-descriptors-sound-wlf-v1-5-c4dab6f521ec@linaro.org>
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

This converts the WM8996 codec to use GPIO descriptors, an a similar
way to WM5100.

The driver is instantiating a GPIO chip named wm8996, and we get
rid of the base address for the GPIO chip from the platform data and
just use dynamic numbering. Move base and ngpio into the static
gpio_chip template.

Fix up the only in-tree user which is the Cragganmore 6410 module.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 14 ++++++--
 include/sound/wm8996.h                   |  3 --
 sound/soc/codecs/wm8996.c                | 58 ++++++++++++++------------------
 3 files changed, 36 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 59456fbebf1b..2de1a89f6e99 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -127,9 +127,16 @@ static struct wm8996_retune_mobile_config wm8996_retune[] = {
 	},
 };
 
+static struct gpiod_lookup_table wm8996_gpiod_table = {
+	.dev_id = "1-001a", /* Device 001a on I2C bus 1 */
+	.table = {
+		GPIO_LOOKUP("GPION", 7,
+			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct wm8996_pdata wm8996_pdata __initdata = {
-	.ldo_ena = S3C64XX_GPN(7),
-	.gpio_base = CODEC_GPIO_BASE,
 	.micdet_def = 1,
 	.inl_mode = WM8996_DIFFERRENTIAL_1,
 	.inr_mode = WM8996_DIFFERRENTIAL_1,
@@ -370,7 +377,8 @@ static const struct {
 	  .spi_devs = balblair_devs,
 	  .num_spi_devs = ARRAY_SIZE(balblair_devs) },
 	{ .id = 0x39, .rev = 0xff, .name = "1254-EV1 Dallas Dhu",
-	  .i2c_devs = wm1254_devs, .num_i2c_devs = ARRAY_SIZE(wm1254_devs) },
+	  .i2c_devs = wm1254_devs, .num_i2c_devs = ARRAY_SIZE(wm1254_devs),
+	  .gpiod_table = &wm8996_gpiod_table },
 	{ .id = 0x3a, .rev = 0xff, .name = "1259-EV1 Tobermory",
 	  .i2c_devs = wm1259_devs, .num_i2c_devs = ARRAY_SIZE(wm1259_devs) },
 	{ .id = 0x3b, .rev = 0xff, .name = "1255-EV1 Kilchoman",
diff --git a/include/sound/wm8996.h b/include/sound/wm8996.h
index 247f9917e33d..342abeef288f 100644
--- a/include/sound/wm8996.h
+++ b/include/sound/wm8996.h
@@ -33,8 +33,6 @@ struct wm8996_retune_mobile_config {
 struct wm8996_pdata {
 	int irq_flags;  /** Set IRQ trigger flags; default active low */
 
-	int ldo_ena;  /** GPIO for LDO1; -1 for none */
-
 	int micdet_def;  /** Default MICDET_SRC/HP1FB_SRC/MICD_BIAS */
 
 	enum wm8996_inmode inl_mode;
@@ -42,7 +40,6 @@ struct wm8996_pdata {
 
 	u32 spkmute_seq;  /** Value for register 0x802 */
 
-	int gpio_base;
 	u32 gpio_default[5];
 
 	int num_retune_mobile_cfgs;
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index df6195778c57..e738326e33ed 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -14,7 +14,7 @@
 #include <linux/pm.h>
 #include <linux/gcd.h>
 #include <linux/gpio/driver.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -51,7 +51,7 @@ struct wm8996_priv {
 	struct regmap *regmap;
 	struct snd_soc_component *component;
 
-	int ldo1ena;
+	struct gpio_desc *ldo_ena;
 
 	int sysclk;
 	int sysclk_src;
@@ -1596,9 +1596,9 @@ static int wm8996_set_bias_level(struct snd_soc_component *component,
 				return ret;
 			}
 
-			if (wm8996->pdata.ldo_ena >= 0) {
-				gpio_set_value_cansleep(wm8996->pdata.ldo_ena,
-							1);
+			if (wm8996->ldo_ena) {
+				gpiod_set_value_cansleep(wm8996->ldo_ena,
+							 1);
 				msleep(5);
 			}
 
@@ -1615,8 +1615,8 @@ static int wm8996_set_bias_level(struct snd_soc_component *component,
 
 	case SND_SOC_BIAS_OFF:
 		regcache_cache_only(wm8996->regmap, true);
-		if (wm8996->pdata.ldo_ena >= 0) {
-			gpio_set_value_cansleep(wm8996->pdata.ldo_ena, 0);
+		if (wm8996->ldo_ena) {
+			gpiod_set_value_cansleep(wm8996->ldo_ena, 0);
 			regcache_cache_only(wm8996->regmap, true);
 		}
 		regulator_bulk_disable(ARRAY_SIZE(wm8996->supplies),
@@ -2188,6 +2188,8 @@ static const struct gpio_chip wm8996_template_chip = {
 	.direction_input	= wm8996_gpio_direction_in,
 	.get			= wm8996_gpio_get,
 	.can_sleep		= 1,
+	.ngpio			= 5,
+	.base			= -1,
 };
 
 static void wm8996_init_gpio(struct wm8996_priv *wm8996)
@@ -2195,14 +2197,8 @@ static void wm8996_init_gpio(struct wm8996_priv *wm8996)
 	int ret;
 
 	wm8996->gpio_chip = wm8996_template_chip;
-	wm8996->gpio_chip.ngpio = 5;
 	wm8996->gpio_chip.parent = wm8996->dev;
 
-	if (wm8996->pdata.gpio_base)
-		wm8996->gpio_chip.base = wm8996->pdata.gpio_base;
-	else
-		wm8996->gpio_chip.base = -1;
-
 	ret = gpiochip_add_data(&wm8996->gpio_chip, wm8996);
 	if (ret != 0)
 		dev_err(wm8996->dev, "Failed to add GPIOs: %d\n", ret);
@@ -2771,15 +2767,15 @@ static int wm8996_i2c_probe(struct i2c_client *i2c)
 		memcpy(&wm8996->pdata, dev_get_platdata(&i2c->dev),
 		       sizeof(wm8996->pdata));
 
-	if (wm8996->pdata.ldo_ena > 0) {
-		ret = gpio_request_one(wm8996->pdata.ldo_ena,
-				       GPIOF_OUT_INIT_LOW, "WM8996 ENA");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request GPIO %d: %d\n",
-				wm8996->pdata.ldo_ena, ret);
-			goto err;
-		}
+	wm8996->ldo_ena = devm_gpiod_get_optional(&i2c->dev, "wlf,ldo1ena",
+						  GPIOD_OUT_LOW);
+	if (IS_ERR(wm8996->ldo_ena)) {
+		ret = PTR_ERR(wm8996->ldo_ena);
+		dev_err(&i2c->dev, "Failed to request LDO ENA GPIO: %d\n",
+			ret);
+		goto err;
 	}
+	gpiod_set_consumer_name(wm8996->ldo_ena, "WM8996 ENA");
 
 	for (i = 0; i < ARRAY_SIZE(wm8996->supplies); i++)
 		wm8996->supplies[i].supply = wm8996_supply_names[i];
@@ -2814,8 +2810,8 @@ static int wm8996_i2c_probe(struct i2c_client *i2c)
 		goto err_gpio;
 	}
 
-	if (wm8996->pdata.ldo_ena > 0) {
-		gpio_set_value_cansleep(wm8996->pdata.ldo_ena, 1);
+	if (wm8996->ldo_ena) {
+		gpiod_set_value_cansleep(wm8996->ldo_ena, 1);
 		msleep(5);
 	}
 
@@ -2847,8 +2843,8 @@ static int wm8996_i2c_probe(struct i2c_client *i2c)
 	dev_info(&i2c->dev, "revision %c\n",
 		 (reg & WM8996_CHIP_REV_MASK) + 'A');
 
-	if (wm8996->pdata.ldo_ena > 0) {
-		gpio_set_value_cansleep(wm8996->pdata.ldo_ena, 0);
+	if (wm8996->ldo_ena) {
+		gpiod_set_value_cansleep(wm8996->ldo_ena, 0);
 		regcache_cache_only(wm8996->regmap, true);
 	} else {
 		ret = regmap_write(wm8996->regmap, WM8996_SOFTWARE_RESET,
@@ -3054,12 +3050,10 @@ static int wm8996_i2c_probe(struct i2c_client *i2c)
 	wm8996_free_gpio(wm8996);
 err_regmap:
 err_enable:
-	if (wm8996->pdata.ldo_ena > 0)
-		gpio_set_value_cansleep(wm8996->pdata.ldo_ena, 0);
+	if (wm8996->ldo_ena)
+		gpiod_set_value_cansleep(wm8996->ldo_ena, 0);
 	regulator_bulk_disable(ARRAY_SIZE(wm8996->supplies), wm8996->supplies);
 err_gpio:
-	if (wm8996->pdata.ldo_ena > 0)
-		gpio_free(wm8996->pdata.ldo_ena);
 err:
 
 	return ret;
@@ -3070,10 +3064,8 @@ static void wm8996_i2c_remove(struct i2c_client *client)
 	struct wm8996_priv *wm8996 = i2c_get_clientdata(client);
 
 	wm8996_free_gpio(wm8996);
-	if (wm8996->pdata.ldo_ena > 0) {
-		gpio_set_value_cansleep(wm8996->pdata.ldo_ena, 0);
-		gpio_free(wm8996->pdata.ldo_ena);
-	}
+	if (wm8996->ldo_ena)
+		gpiod_set_value_cansleep(wm8996->ldo_ena, 0);
 }
 
 static const struct i2c_device_id wm8996_i2c_id[] = {

-- 
2.34.1

