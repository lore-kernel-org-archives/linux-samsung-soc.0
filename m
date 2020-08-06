Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B613BC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B806221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738954;
	bh=mPsC61lMZKmtzeLxo601e47DlSg2SAAoFQgjc4SYv8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zlHCbMB+gWU2OvgIefdmcMWlooKpwMMiYaeRgboB99AyohKaNoNHAAF2E7nwOu9s0
	 ypeiAa3bhAbnZKHGZLhD//Vt6u6tPdQgy+wij8oT5r3kfQc7rvgyKJjVv8kOh43AGf
	 1c0X0jFi0htTw+o0E7HY2nqt+q0ClPNTzozY+ImA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgHFSfw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729220AbgHFSem (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711EEC0619CF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d190so9673359wmd.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=WsGAxrmIrJYgXi4AbchufgQN0S/QQRj3Zd7mxWc98pE=;
        b=TTgPHPC2BJEKTuqqAn+FWJlyzm2BbgI99StDDz4dYmt0PTCb8WYnZsJCy+SB6UeRf4
         a2OGuYFYHZN/bhYW0M5AWx5vapYt7b6jtInJhtJRatjG8zYmpPvf9xECm9JdTumOFQi7
         iw+/3/iqH4No5zN/Vfo5A/AVUB6qGlnA9yb2JAasSExvZ/ryNsIpz82FPCGuRT/avIPx
         KNBFNZit/PaxQ9bwqhAyrWA19aFSV0usNPs/jUdCTujocd4qLHRmy7ugQGS6yh/NlyZ+
         nBqxj4IJProo307jZPLWkqVeMyt2bnnPFo747S0fu1XQXw7iqFwOtcunv9HMzDQa47fw
         5IWA==
X-Gm-Message-State: AOAM5326oA5GbmXt9acRgD+dpYfJahUtwjJv1QvUsfsufD1S5Fk3nNtH
        7g9iQUFtGDGMNZo/mJ/b71Oley0Xntc=
X-Google-Smtp-Source: ABdhPJxeiONs6r15gWlcj84j2Rmiy0+DUgtU8JPbc4nEpoNEEnNE2LQ+zjUItmSyQiwPjPAhClmJJA==
X-Received: by 2002:a1c:e304:: with SMTP id a4mr9069098wmh.11.1596738872833;
        Thu, 06 Aug 2020 11:34:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id t202sm7429891wmt.20.2020.08.06.11.34.32
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:32 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541571lta;
        Thu, 6 Aug 2020 11:23:21 -0700 (PDT)
X-Received: by 2002:a63:a55e:: with SMTP id r30mr8361749pgu.367.1596738201329;
        Thu, 06 Aug 2020 11:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738201; cv=none;
        d=google.com; s=arc-20160816;
        b=w8cfhTGvyOSTQ494HyXgoLCf7dZac24ZOaLBpxcNcQbbrC2PpY/4o3J5QercVqu4bZ
         gDLAUmchA3VdBOdcWw/GNDXFgw6nuBl8Lj8ooB9BvrI05ahPzAyBkIpXfQMGXjYaHec0
         iF5eUAo6QweCGkLIiWZG8K9KtSu57Wyu3RUifTqARJGVmZAYS5v/MdL48sikl20W8IC3
         +8OIshS7EMum1uD3+NbA9Fhvyu1UMlMmOg+Bawap41wU0iLKUtVrH8lv06dnbmUUeXw6
         N4LZQI+1DDlk+3KJXkPO3KovFsVHbRw8Z4lx60XFk+urU7fR6LQEHZbdjNvYWObQCGlu
         WSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=WsGAxrmIrJYgXi4AbchufgQN0S/QQRj3Zd7mxWc98pE=;
        b=nlMT5n5EC0XzEybK1FuMNLXHwmCZUDAKL8NcF9m5W1g7L08OqVdzDydFhHRRF7AKfm
         0GsZwl0t111+DK117IqwBsbFODiOfX2noxC6pF2XSMq14EvgqS0M3Q/oVLcW9i7BOz3s
         nFNECXxHEcSQWg2XxYEiwGI1p+FhbbjDwIG0X1C9V9ptGENqNq6PW9KXBIjeHII1UHv6
         8yMMq536KUSt/doluRvNcq6GD18WdsABsMkNbw9ETsOy7REROEU+61LrIWHwcx4VR3kv
         fM4FWJF8WT4b3JYpS6fSSmDa+GENoLZLx7yXIunS3P8+ePcxJ1AjqOs29wDDmRFWTfuN
         2W6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=o3fhH0ni;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id g12si3999885pfb.335.2020.08.06.11.23.21
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 7406F22DFB; Thu,  6 Aug 2020 18:23:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F5F822DA7;
        Thu,  6 Aug 2020 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738201;
        bh=mPsC61lMZKmtzeLxo601e47DlSg2SAAoFQgjc4SYv8o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o3fhH0niDfjMM09Vzx/0teVjpyo+Nhlg9HvKFFa582tyrB5jzqOMQZGtqYlYakm/u
         Un2t3ZKkAd3r4V59qdigc4NxmGn6gi7TgSQeyxY3CjyXCDLa8PRM4MYwDFrZ9P17pj
         xoB+z2V0hITRznxzE5WRaKXmEb6fwq4bdCmo5pTQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 26/41] ASoC: samsung: rx1950: turn into platform driver
Date:   Thu,  6 Aug 2020 20:20:43 +0200
Message-Id: <20200806182059.2431-26-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: +CffbIFJfVAX
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Avoid machine specific headers by using a gpio lookup table
combined with a platform_driver for this board.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/mach-rx1950.c | 16 +++++++
 sound/soc/samsung/rx1950_uda1380.c  | 72 +++++++++--------------------
 2 files changed, 39 insertions(+), 49 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 65440c39500e..a5461b2227bd 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -727,6 +727,20 @@ static struct i2c_board_info rx1950_i2c_devices[] = {
 	},
 };
 
+static struct gpiod_lookup_table rx1950_audio_gpio_table = {
+	.dev_id = "rx1950-audio",
+	.table = {
+		GPIO_LOOKUP("GPIOG", 12, "hp-gpio", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOA", 1, "speaker-power", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct platform_device rx1950_audio = {
+	.name = "rx1950-audio",
+	.id = -1,
+};
+
 static struct platform_device *rx1950_devices[] __initdata = {
 	&s3c2410_device_dclk,
 	&s3c_device_lcd,
@@ -745,6 +759,7 @@ static struct platform_device *rx1950_devices[] __initdata = {
 	&power_supply,
 	&rx1950_battery,
 	&rx1950_leds,
+	&rx1950_audio,
 };
 
 static void __init rx1950_map_io(void)
@@ -812,6 +827,7 @@ static void __init rx1950_init_machine(void)
 	gpio_direction_output(S3C2410_GPJ(6), 0);
 
 	pwm_add_table(rx1950_pwm_lookup, ARRAY_SIZE(rx1950_pwm_lookup));
+	gpiod_add_lookup_table(&rx1950_audio_gpio_table);
 	platform_add_devices(rx1950_devices, ARRAY_SIZE(rx1950_devices));
 
 	i2c_register_board_info(0, rx1950_i2c_devices,
diff --git a/sound/soc/samsung/rx1950_uda1380.c b/sound/soc/samsung/rx1950_uda1380.c
index 08f7c82aedb6..400a7f77c711 100644
--- a/sound/soc/samsung/rx1950_uda1380.c
+++ b/sound/soc/samsung/rx1950_uda1380.c
@@ -12,16 +12,13 @@
 //          Vasily Khoruzhick <anarsoul@gmail.com>
 
 #include <linux/types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 
 #include <sound/soc.h>
 #include <sound/jack.h>
 
-#include <mach/gpio-samsung.h>
 #include "regs-iis.h"
-#include <asm/mach-types.h>
-
 #include "s3c24xx-i2s.h"
 
 static int rx1950_uda1380_init(struct snd_soc_pcm_runtime *rtd);
@@ -58,7 +55,6 @@ static struct snd_soc_jack_pin hp_jack_pins[] = {
 
 static struct snd_soc_jack_gpio hp_jack_gpios[] = {
 	[0] = {
-		.gpio			= S3C2410_GPG(12),
 		.name			= "hp-gpio",
 		.report			= SND_JACK_HEADPHONE,
 		.invert			= 1,
@@ -123,8 +119,6 @@ static struct snd_soc_card rx1950_asoc = {
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
 };
 
-static struct platform_device *s3c24xx_snd_device;
-
 static int rx1950_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -134,13 +128,15 @@ static int rx1950_startup(struct snd_pcm_substream *substream)
 					&hw_rates);
 }
 
+struct gpio_desc *gpiod_speaker_power;
+
 static int rx1950_spk_power(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(S3C2410_GPA(1), 1);
+		gpiod_set_value(gpiod_speaker_power, 1);
 	else
-		gpio_set_value(S3C2410_GPA(1), 0);
+		gpiod_set_value(gpiod_speaker_power, 0);
 
 	return 0;
 }
@@ -214,57 +210,35 @@ static int rx1950_uda1380_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int __init rx1950_init(void)
+static int rx1950_probe(struct platform_device *pdev)
 {
-	int ret;
-
-	if (!machine_is_rx1950())
-		return -ENODEV;
+	struct device *dev = &pdev->dev;
 
 	/* configure some gpios */
-	ret = gpio_request(S3C2410_GPA(1), "speaker-power");
-	if (ret)
-		goto err_gpio;
-
-	ret = gpio_direction_output(S3C2410_GPA(1), 0);
-	if (ret)
-		goto err_gpio_conf;
-
-	s3c24xx_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!s3c24xx_snd_device) {
-		ret = -ENOMEM;
-		goto err_plat_alloc;
-	}
-
-	platform_set_drvdata(s3c24xx_snd_device, &rx1950_asoc);
-	ret = platform_device_add(s3c24xx_snd_device);
-
-	if (ret) {
-		platform_device_put(s3c24xx_snd_device);
-		goto err_plat_add;
+	gpiod_speaker_power = devm_gpiod_get(dev, "speaker-power", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_speaker_power)) {
+		dev_err(dev, "cannot get gpio\n");
+		return PTR_ERR(gpiod_speaker_power);
 	}
 
-	return 0;
-
-err_plat_add:
-err_plat_alloc:
-err_gpio_conf:
-	gpio_free(S3C2410_GPA(1));
+	hp_jack_gpios[0].gpiod_dev = dev;
+	rx1950_asoc.dev = dev;
 
-err_gpio:
-	return ret;
+	return devm_snd_soc_register_card(dev, &rx1950_asoc);
 }
 
-static void __exit rx1950_exit(void)
-{
-	platform_device_unregister(s3c24xx_snd_device);
-	gpio_free(S3C2410_GPA(1));
-}
+struct platform_driver rx1950_audio = {
+	.driver = {
+		.name = "rx1950-audio",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = rx1950_probe,
+};
 
-module_init(rx1950_init);
-module_exit(rx1950_exit);
+module_platform_driver(rx1950_audio);
 
 /* Module information */
 MODULE_AUTHOR("Vasily Khoruzhick");
 MODULE_DESCRIPTION("ALSA SoC RX1950");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:rx1950-audio");
-- 
2.17.1

