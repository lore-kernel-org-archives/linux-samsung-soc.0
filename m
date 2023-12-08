Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYi1XRyh"
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5722611D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2023 02:09:36 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bf1e32571so2069779e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2023 02:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702030174; x=1702634974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fbMNx8K6X721K26Lgmb1xI9uac4P9/tY0MeUYoh8EA=;
        b=gYi1XRyhvKCEDqyj7IWTiqD2yfAV+otb/Afdojc9OYBf/sk4UBMW7teKaTQ26hbpYs
         NK9XvCiGCLa191650Hih7FI8AeenUQBgySH4t55USGd9h3ghVb5LUHuh8ocKG/BLc0B5
         dABSFg6WO6GuXK9i3f4EKr2QihgI2OheKHrRsMQZTmewSpChcB5Ok/IDvND/483rZ7n2
         0mivf2j/x2E5jNFEv16dAzjJ7lqFA0H4HjQtoqFpaq7ewfjbi9Ym05UJpi2NJgvXL+fd
         l6Hyag/lR9H1iKiDbJs+Fesq3TS16uVcb3Dw/Sia5FCzeQ0ff1q52a7/Z9BgtveHY66g
         cQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030174; x=1702634974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fbMNx8K6X721K26Lgmb1xI9uac4P9/tY0MeUYoh8EA=;
        b=sv8f/yPylnZ0LBib3PNuKEzrxvqoNHRNXFF5AMoZ1BzeyDyXRqgkj+X9HW8jf38Aci
         k2DurQaduCnO9BafdPTt0x7FxbKMkRSM7ccFUzvkXAwhO5IUo4T2DTz8z7UhjLb20vY/
         Hc2Ry7bdb5Hx4ugRQH8CFkAppCc9Ck9MVZIcIAZsZQ0OGA0bT/WOS+/A/UGA+mI1tMuy
         ZHONTDlbqLMmcr1Y8hK8L0Trlp4AVyOMpFL8qZlm3qeDTqEy7pwd6kiOVljdO5cnV72h
         ZfJh1op4tcViG7pJgnEiDhLon+ZzcpMJThLRe4gCvom61GlcjMkdzIY/fioyRy+KMfiJ
         Fs3g==
X-Gm-Message-State: AOJu0Yya3XXU5pq5SOTV0Vont708RBiQzZ8ySwfVGMBxKl7sbK4MHxw/
	C1h6Femr+jDXv38+w1DVgRUmUQ==
X-Google-Smtp-Source: AGHT+IG5hKLIPrlVDQ94uVi4SqUyllHlGOKufWNCNqV7C79hn/3+s2YqaskB1j5yvCcg+N6xWM87dA==
X-Received: by 2002:a05:6512:3e03:b0:50b:e229:23b0 with SMTP id i3-20020a0565123e0300b0050be22923b0mr3135826lfv.94.1702030174566;
        Fri, 08 Dec 2023 02:09:34 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id m4-20020a194344000000b0050bfd7d8873sm174295lfj.254.2023.12.08.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:09:33 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Dec 2023 11:09:25 +0100
Subject: [PATCH 1/5] ASoC: wm0010: Convert to GPIO descriptors
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-descriptors-sound-wlf-v1-1-c4dab6f521ec@linaro.org>
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

This converts the WM0010 codec to use GPIO descriptors.
It's a pretty straight-forward conversion also switching over
the single in-tree user in the S3C Cragganmore module
for S3C 6410.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 16 +++++++++---
 include/sound/wm0010.h                   |  6 -----
 sound/soc/codecs/wm0010.c                | 44 ++++++++------------------------
 3 files changed, 23 insertions(+), 43 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 8fce1e815ee8..a9a713641047 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -32,9 +32,18 @@
 
 #include "crag6410.h"
 
+static struct gpiod_lookup_table wm0010_gpiod_table = {
+	.dev_id = "spi0.0", /* SPI device name */
+	.table = {
+		/* Active high for Glenfarclas Rev 2 */
+		GPIO_LOOKUP("GPION", 6,
+			    "reset", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct wm0010_pdata wm0010_pdata = {
-	.gpio_reset = S3C64XX_GPN(6),
-	.reset_active_high = 1, /* Active high for Glenfarclas Rev 2 */
+	/* Intentionally left blank */
 };
 
 static struct spi_board_info wm1253_devs[] = {
@@ -337,7 +346,8 @@ static const struct {
 	{ .id = 0x21, .rev = 0xff, .name = "1275-EV1 Mortlach" },
 	{ .id = 0x25, .rev = 0xff, .name = "1274-EV1 Glencadam" },
 	{ .id = 0x31, .rev = 0xff, .name = "1253-EV1 Tomatin",
-	  .spi_devs = wm1253_devs, .num_spi_devs = ARRAY_SIZE(wm1253_devs) },
+	  .spi_devs = wm1253_devs, .num_spi_devs = ARRAY_SIZE(wm1253_devs),
+	  .gpiod_table = &wm0010_gpiod_table },
 	{ .id = 0x32, .rev = 0xff, .name = "XXXX-EV1 Caol Illa" },
 	{ .id = 0x33, .rev = 0xff, .name = "XXXX-EV1 Oban" },
 	{ .id = 0x34, .rev = 0xff, .name = "WM0010-6320-CS42 Balblair",
diff --git a/include/sound/wm0010.h b/include/sound/wm0010.h
index 13b473935ca1..14ff9056c5d0 100644
--- a/include/sound/wm0010.h
+++ b/include/sound/wm0010.h
@@ -11,12 +11,6 @@
 #define WM0010_PDATA_H
 
 struct wm0010_pdata {
-	int gpio_reset;
-
-	/* Set if there is an inverter between the GPIO controlling
-	 * the reset signal and the device.
-	 */
-	int reset_active_high;
 	int irq_flags;
 };
 
diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 1d4259433f47..8f862729a2ca 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -18,7 +18,7 @@
 #include <linux/firmware.h>
 #include <linux/delay.h>
 #include <linux/fs.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
@@ -94,8 +94,7 @@ struct wm0010_priv {
 
 	struct wm0010_pdata pdata;
 
-	int gpio_reset;
-	int gpio_reset_value;
+	struct gpio_desc *reset;
 
 	struct regulator_bulk_data core_supplies[2];
 	struct regulator *dbvdd;
@@ -174,8 +173,7 @@ static void wm0010_halt(struct snd_soc_component *component)
 	case WM0010_STAGE2:
 	case WM0010_FIRMWARE:
 		/* Remember to put chip back into reset */
-		gpio_set_value_cansleep(wm0010->gpio_reset,
-					wm0010->gpio_reset_value);
+		gpiod_set_value_cansleep(wm0010->reset, 1);
 		/* Disable the regulators */
 		regulator_disable(wm0010->dbvdd);
 		regulator_bulk_disable(ARRAY_SIZE(wm0010->core_supplies),
@@ -610,7 +608,7 @@ static int wm0010_boot(struct snd_soc_component *component)
 	}
 
 	/* Release reset */
-	gpio_set_value_cansleep(wm0010->gpio_reset, !wm0010->gpio_reset_value);
+	gpiod_set_value_cansleep(wm0010->reset, 0);
 	spin_lock_irqsave(&wm0010->irq_lock, flags);
 	wm0010->state = WM0010_OUT_OF_RESET;
 	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
@@ -863,7 +861,6 @@ static int wm0010_probe(struct snd_soc_component *component)
 
 static int wm0010_spi_probe(struct spi_device *spi)
 {
-	unsigned long gpio_flags;
 	int ret;
 	int trigger;
 	int irq;
@@ -903,31 +900,11 @@ static int wm0010_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	if (wm0010->pdata.gpio_reset) {
-		wm0010->gpio_reset = wm0010->pdata.gpio_reset;
-
-		if (wm0010->pdata.reset_active_high)
-			wm0010->gpio_reset_value = 1;
-		else
-			wm0010->gpio_reset_value = 0;
-
-		if (wm0010->gpio_reset_value)
-			gpio_flags = GPIOF_OUT_INIT_HIGH;
-		else
-			gpio_flags = GPIOF_OUT_INIT_LOW;
-
-		ret = devm_gpio_request_one(wm0010->dev, wm0010->gpio_reset,
-					    gpio_flags, "wm0010 reset");
-		if (ret < 0) {
-			dev_err(wm0010->dev,
-				"Failed to request GPIO for DSP reset: %d\n",
-				ret);
-			return ret;
-		}
-	} else {
-		dev_err(wm0010->dev, "No reset GPIO configured\n");
-		return -EINVAL;
-	}
+	wm0010->reset = devm_gpiod_get(wm0010->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(wm0010->reset))
+		return dev_err_probe(wm0010->dev, PTR_ERR(wm0010->reset),
+				     "could not get RESET GPIO\n");
+	gpiod_set_consumer_name(wm0010->reset, "wm0010 reset");
 
 	wm0010->state = WM0010_POWER_OFF;
 
@@ -972,8 +949,7 @@ static void wm0010_spi_remove(struct spi_device *spi)
 {
 	struct wm0010_priv *wm0010 = spi_get_drvdata(spi);
 
-	gpio_set_value_cansleep(wm0010->gpio_reset,
-				wm0010->gpio_reset_value);
+	gpiod_set_value_cansleep(wm0010->reset, 1);
 
 	irq_set_irq_wake(wm0010->irq, 0);
 

-- 
2.34.1

