Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kj6uk2Dp"
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F9D10EF
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2023 02:09:38 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso2087031e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2023 02:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030176; x=1702634976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fouTgSzHnq2Le/Tddi580C1lFpw+pBiar3lLePf2CB8=;
        b=kj6uk2DpjJvX3RpXkTU5+ut7qhFt+YqqTazdo8GA+BKitOFsBWNxVA04mcIZQHR6lA
         2i5jl8NyVYS71ud9cOz2NOaJY6Qzq6wAhcU9WmoX2wBLMziUAR2NAPKX72pn8W6Tly+g
         cMGvy9W7Kzv3RAa0fKw+A/mZ0l/9dPwnTKlNyTjAKoQ6i/TrQGH2+n3gZhf7rB8RcmeH
         qHpCCGhjE0jIi0GWKw+B9j1WovPmR9bPOHvLq5FRJbhGgVrS/iN/5S6DLLNzQhCypUZZ
         WxmvD1dCS6Jh8poutEx1JBpbq7pe/EIQTGvJNwE8tQyrkde+sVYkAAZc+R/8VJECkVu5
         gP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030176; x=1702634976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fouTgSzHnq2Le/Tddi580C1lFpw+pBiar3lLePf2CB8=;
        b=DIFB4oeJLw9TKrbVt83UHYDLPSK/+1TPCX1ZGLwrtlP7vOb9x8nrqxVJscAj3Lf/8j
         sGPJvsw0OWfhRkf1GH4TI4mOXBDgrfCY/vhaaBcbZIFzRzlezo+oBur4SNljP17oWAzM
         61Juu1fSxGwk+JGSCfeMVY2oUQMWAEpdLq2TjCyNFu9yMZm042u5a1lA2RCSTwmjL05c
         c6BDuHV0aZscpEUlpekrAN5AJ+H4VsTnSnXtc12GcxOQXzgl66cqVzB41suDv2WOalJW
         BbGv0ce90cW+ngh6bXrIJ0Wki2d50wM+qvIYm5rRhZwXbLfOMSGUiZnDM53ePEKpZvnI
         VqZA==
X-Gm-Message-State: AOJu0YwyaehZRXx/mR9s31syWtPVHiDlFIKJCiuPq76ta4vhzonckPWQ
	qzey70JPjP5FQDB+rnIhVrqu9g==
X-Google-Smtp-Source: AGHT+IHLG7YVN4RHNKt0ofqCqx2VVn7wiKCoemTxtueyxMygDKg8yZtESx01pirJnjGDaN36+YmffA==
X-Received: by 2002:a05:6512:159d:b0:50b:f15b:827f with SMTP id bp29-20020a056512159d00b0050bf15b827fmr2475683lfb.73.1702030176462;
        Fri, 08 Dec 2023 02:09:36 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id m4-20020a194344000000b0050bfd7d8873sm174295lfj.254.2023.12.08.02.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:09:36 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Dec 2023 11:09:27 +0100
Subject: [PATCH 3/5] ASoC: wm2200: Convert to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-descriptors-sound-wlf-v1-3-c4dab6f521ec@linaro.org>
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

This converts the WM2200 codec to use GPIO descriptors.
This is a pretty straight-forward conversion, and it also
switches over the single in-tree user in the S3C
Cragganmore module for S3C 6410.

This coded does not seem to get selected or be selectable
through Kconfig, I had to hack another soundcard Kconfig
entry to select it for compile tests.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 13 ++++++-
 include/sound/wm2200.h                   |  2 -
 sound/soc/codecs/wm2200.c                | 67 ++++++++++++++++----------------
 3 files changed, 44 insertions(+), 38 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index a9a713641047..1df6b7e52c9d 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -305,12 +305,20 @@ static const struct i2c_board_info wm6230_i2c_devs[] = {
 };
 
 static struct wm2200_pdata wm2200_pdata = {
-	.ldo_ena = S3C64XX_GPN(7),
 	.gpio_defaults = {
 		[2] = 0x0005,  /* GPIO3 24.576MHz output clock */
 	},
 };
 
+static struct gpiod_lookup_table wm2200_gpiod_table = {
+	.dev_id = "1-003a", /* Device 003a on I2C bus 1 */
+	.table = {
+		GPIO_LOOKUP("GPION", 7,
+			    "wlf,ldo1ena", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static const struct i2c_board_info wm2200_i2c[] = {
 	{ I2C_BOARD_INFO("wm2200", 0x3a),
 	  .platform_data = &wm2200_pdata, },
@@ -372,7 +380,8 @@ static const struct {
 	  .num_spi_devs = ARRAY_SIZE(wm5102_spi_devs),
 	  .gpiod_table = &wm5102_gpiod_table },
 	{ .id = 0x3f, .rev = -1, .name = "WM2200-6271-CS90-M-REV1",
-	  .i2c_devs = wm2200_i2c, .num_i2c_devs = ARRAY_SIZE(wm2200_i2c) },
+	  .i2c_devs = wm2200_i2c, .num_i2c_devs = ARRAY_SIZE(wm2200_i2c),
+	  .gpiod_table = &wm2200_gpiod_table },
 };
 
 static int wlf_gf_module_probe(struct i2c_client *i2c)
diff --git a/include/sound/wm2200.h b/include/sound/wm2200.h
index 9987e6c09bdc..2e4913ee2505 100644
--- a/include/sound/wm2200.h
+++ b/include/sound/wm2200.h
@@ -42,8 +42,6 @@ struct wm2200_micbias {
 };
 
 struct wm2200_pdata {
-	int reset;      /** GPIO controlling /RESET, if any */
-	int ldo_ena;    /** GPIO controlling LODENA, if any */
 	int irq_flags;
 
 	int gpio_defaults[4];
diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 9679906c6bd5..69c9c2bd7e7b 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -14,7 +14,7 @@
 #include <linux/pm.h>
 #include <linux/firmware.h>
 #include <linux/gcd.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -79,6 +79,8 @@ struct wm2200_priv {
 	struct snd_soc_component *component;
 	struct wm2200_pdata pdata;
 	struct regulator_bulk_data core_supplies[WM2200_NUM_CORE_SUPPLIES];
+	struct gpio_desc *ldo_ena;
+	struct gpio_desc *reset;
 
 	struct completion fll_lock;
 	int fll_fout;
@@ -975,9 +977,10 @@ static const struct reg_sequence wm2200_reva_patch[] = {
 
 static int wm2200_reset(struct wm2200_priv *wm2200)
 {
-	if (wm2200->pdata.reset) {
-		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
-		gpio_set_value_cansleep(wm2200->pdata.reset, 1);
+	if (wm2200->reset) {
+		/* Descriptor flagged active low, so this will be inverted */
+		gpiod_set_value_cansleep(wm2200->reset, 1);
+		gpiod_set_value_cansleep(wm2200->reset, 0);
 
 		return 0;
 	} else {
@@ -2246,28 +2249,28 @@ static int wm2200_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	if (wm2200->pdata.ldo_ena) {
-		ret = devm_gpio_request_one(&i2c->dev, wm2200->pdata.ldo_ena,
-					    GPIOF_OUT_INIT_HIGH,
-					    "WM2200 LDOENA");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request LDOENA %d: %d\n",
-				wm2200->pdata.ldo_ena, ret);
-			goto err_enable;
-		}
+	wm2200->ldo_ena = devm_gpiod_get_optional(&i2c->dev, "wlf,ldo1ena",
+						  GPIOD_OUT_HIGH);
+	if (IS_ERR(wm2200->ldo_ena)) {
+		ret = PTR_ERR(wm2200->ldo_ena);
+		dev_err(&i2c->dev, "Failed to request LDOENA GPIO %d\n",
+			ret);
+		goto err_enable;
+	}
+	if (wm2200->ldo_ena) {
+		gpiod_set_consumer_name(wm2200->ldo_ena, "WM2200 LDOENA");
 		msleep(2);
 	}
 
-	if (wm2200->pdata.reset) {
-		ret = devm_gpio_request_one(&i2c->dev, wm2200->pdata.reset,
-					    GPIOF_OUT_INIT_HIGH,
-					    "WM2200 /RESET");
-		if (ret < 0) {
-			dev_err(&i2c->dev, "Failed to request /RESET %d: %d\n",
-				wm2200->pdata.reset, ret);
-			goto err_ldo;
-		}
+	wm2200->reset = devm_gpiod_get_optional(&i2c->dev, "reset",
+						GPIOD_OUT_LOW);
+	if (IS_ERR(wm2200->reset)) {
+		ret = PTR_ERR(wm2200->reset);
+		dev_err(&i2c->dev, "Failed to request RESET GPIO %d\n",
+			ret);
+		goto err_ldo;
 	}
+	gpiod_set_consumer_name(wm2200->reset, "WM2200 /RESET");
 
 	ret = regmap_read(wm2200->regmap, WM2200_SOFTWARE_RESET, &reg);
 	if (ret < 0) {
@@ -2403,11 +2406,9 @@ static int wm2200_i2c_probe(struct i2c_client *i2c)
 	if (i2c->irq)
 		free_irq(i2c->irq, wm2200);
 err_reset:
-	if (wm2200->pdata.reset)
-		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
+	gpiod_set_value_cansleep(wm2200->reset, 1);
 err_ldo:
-	if (wm2200->pdata.ldo_ena)
-		gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 0);
+	gpiod_set_value_cansleep(wm2200->ldo_ena, 0);
 err_enable:
 	regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
 			       wm2200->core_supplies);
@@ -2421,10 +2422,9 @@ static void wm2200_i2c_remove(struct i2c_client *i2c)
 	pm_runtime_disable(&i2c->dev);
 	if (i2c->irq)
 		free_irq(i2c->irq, wm2200);
-	if (wm2200->pdata.reset)
-		gpio_set_value_cansleep(wm2200->pdata.reset, 0);
-	if (wm2200->pdata.ldo_ena)
-		gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 0);
+	/* Assert RESET, disable LDO */
+	gpiod_set_value_cansleep(wm2200->reset, 1);
+	gpiod_set_value_cansleep(wm2200->ldo_ena, 0);
 	regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
 			       wm2200->core_supplies);
 }
@@ -2436,8 +2436,7 @@ static int wm2200_runtime_suspend(struct device *dev)
 
 	regcache_cache_only(wm2200->regmap, true);
 	regcache_mark_dirty(wm2200->regmap);
-	if (wm2200->pdata.ldo_ena)
-		gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 0);
+	gpiod_set_value_cansleep(wm2200->ldo_ena, 0);
 	regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
 			       wm2200->core_supplies);
 
@@ -2457,8 +2456,8 @@ static int wm2200_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	if (wm2200->pdata.ldo_ena) {
-		gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 1);
+	if (wm2200->ldo_ena) {
+		gpiod_set_value_cansleep(wm2200->ldo_ena, 1);
 		msleep(2);
 	}
 

-- 
2.34.1

