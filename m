Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CC2C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFF83206B5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738955;
	bh=BBg/4qmHoJQtQA51Qyk1peSStt8JWZO2uvgyLBA4Goc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=oBmQHYCFOzziO8hdsQlnsddd36WW1M+BoLSvQSElf8N2T+Lwpo6nNf5M80TxrNG37
	 mWtRc77i1j8MJP/khAbzQF01QHaarvoZIgGsNx8/4U68R1ty6L7paZdJ8OXPPWd3PI
	 y3RLVcp2OUS2wxclI8ho5Lq00R0XVLfzDbOfTOA4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgHFSfx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgHFSey (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:54 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB754C0617A9
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:38 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z18so41377526wrm.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=0VIKCpG4vRpAC5xGRNm9Ejds42OwLNT0pXvt/OZwFa4=;
        b=rFxRnpxACY2fzDKnE95Zy/pvJhaH8pPhE2VHXro9xyJu2TXnqFfA2wAiCPw6gFA4EW
         cVodVOZVg0fPHnNDFZzWEnzIsMGihNba/REsoCe+8Zkbjpc8ByCLtbMHE5V8UqeDAo5H
         iEoCTf/ekYq79jPqy6/GuC+mwU1lSsqblmD6/yTE7y0GbIBawd1pLLz5I+TJi4ye9yzA
         CWgcde+t7SKsomvpTCX15ZdkRcw6N4Q+R+8U7qrfBJuzl+av5cAYLJI/3zFg4xCLVbzG
         s7qBtu6L8WtVrQmT/nksIJzyRPiIdlTjIzA4HKwND0N7Cy2v6cogc1wVomPAeTKgqIE1
         CJyg==
X-Gm-Message-State: AOAM531dbuYshrkgeXTuhjxuy6PcsicgXID9PP19d5P3bDa11bv33sDB
        7y8W8YxZS/bpYzNyiCiTGGnG1hNGjW4=
X-Google-Smtp-Source: ABdhPJwO2XOZyxauqYF/1u8L6sT5xIN/FG5ujsdz+lG9M10R4EdNE3NNGaHzT52tuGvVCAEvSZJwmw==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr8630193wrr.370.1596738876877;
        Thu, 06 Aug 2020 11:34:36 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id v16sm4376612wmj.14.2020.08.06.11.34.36
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:36 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541497lta;
        Thu, 6 Aug 2020 11:23:13 -0700 (PDT)
X-Received: by 2002:a17:90a:3d47:: with SMTP id o7mr8759319pjf.45.1596738193759;
        Thu, 06 Aug 2020 11:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738193; cv=none;
        d=google.com; s=arc-20160816;
        b=vD6yd7KKqCtbTgFsdRhqkC+t3x6F1mn1eb//HV7Um1fFDv7dtRWefsAHglDJ81WFPx
         qEQQtsW8+y+oUeOIJjrW20jevAm26oUHYGMthYi4JqACx3H5ypAQ2SlnyA9CleqHDSkt
         1flU3LOFaGbbj6ky33rJJrP26+5ZPYRQfpfUYQd8W0wYAzxV25G18e1cxr5Ez06q0xoB
         VIODVCRbfUXdyaQA4rNGj4klJ4O6/NmFMXEmA+0046DfMYbEMOexSwXfq7VSo4jbWjEp
         qUuasK17P4AcrTFQms684lgR340neGVemPlauriwB3/tLf7o0zaKFQZQwcy1bnMl7/vd
         Foww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=0VIKCpG4vRpAC5xGRNm9Ejds42OwLNT0pXvt/OZwFa4=;
        b=Z8DYO3EbUM+zieH9XuUNtjeDUGtVvdJPR9XZq8dj1zwYjiGfpLJ2QOgYGj+rNf7bQD
         nl3hgQcwYz9rdjG6kN6xsz/WWta6GbN3Bqnc3eFP9H9T8dAlw+wps0xWcRFlGStq+nDx
         kWbNdHMUNn1fZUkbuXc6R+ThLyjl9OFt/IAX+UO6MiFgZE7V+rIjZimNS6BNROQC3D40
         KitWRwRcVCn0Ckl4hC7nC5mqb+LiUS6IQGbVdOohcnuz07S5356sZ8w5+efXWV2XMIsw
         ezitRiamZ0IUzDoKVVDbPVNPKSGb3fj5wPtr1wVRIteM3+vXsv4wTEc8lr+AlOrj+5LM
         7ZzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=GGWLccR+;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id a140si4241918pfa.211.2020.08.06.11.23.13
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id CBDC622DD3; Thu,  6 Aug 2020 18:23:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A2B522DBF;
        Thu,  6 Aug 2020 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738193;
        bh=BBg/4qmHoJQtQA51Qyk1peSStt8JWZO2uvgyLBA4Goc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GGWLccR+znsLClyv1ArFPV7Yzj9VljgipB1KYiUEdCBiO2I8qnpHXq21yoWVTlSH3
         3AQ/+CpVKta2K1SZXNlbBd5s3KPZAeFnQa4Ubst6lOoSZNntjNSLzXpE69mQ9ywYxr
         dutADTrPcIn7oGXhONatoO0GIu1Ot+3AjmSzIv/k=
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
Subject: [PATCH v2 24/41] ASoC: samsung: h1940: turn into platform driver
Date:   Thu,  6 Aug 2020 20:20:41 +0200
Message-Id: <20200806182059.2431-24-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: m2vO8q37TGi6
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
 arch/arm/mach-s3c24xx/mach-h1940.c | 18 ++++++++
 sound/soc/samsung/h1940_uda1380.c  | 71 ++++++++++--------------------
 2 files changed, 41 insertions(+), 48 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 9c71472c939f..c7269cd26ba8 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -474,6 +474,22 @@ static struct gpiod_lookup_table h1940_mmc_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table h1940_audio_gpio_table = {
+	.dev_id = "h1940-audio",
+	.table = {
+		GPIO_LOOKUP("H1940_LATCH",
+			    H1940_LATCH_AUDIO_POWER - H1940_LATCH_GPIO(0),
+			    "speaker-power", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOG", 4, "hp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct platform_device h1940_audio = {
+	.name = "h1940-audio",
+	.id   = -1,
+};
+
 static struct pwm_lookup h1940_pwm_lookup[] = {
 	PWM_LOOKUP("samsung-pwm", 0, "pwm-backlight", NULL, 36296,
 		   PWM_POLARITY_NORMAL),
@@ -650,6 +666,7 @@ static struct platform_device *h1940_devices[] __initdata = {
 	&s3c_device_ts,
 	&power_supply,
 	&h1940_battery,
+	&h1940_audio,
 };
 
 static void __init h1940_map_io(void)
@@ -689,6 +706,7 @@ static void __init h1940_init(void)
 
 	s3c24xx_fb_set_platdata(&h1940_fb_info);
 	gpiod_add_lookup_table(&h1940_mmc_gpio_table);
+	gpiod_add_lookup_table(&h1940_audio_gpio_table);
 	s3c24xx_mci_set_platdata(&h1940_mmc_cfg);
  	s3c24xx_udc_set_platdata(&h1940_udc_cfg);
 	s3c24xx_ts_set_platdata(&h1940_ts_cfg);
diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index b8f0057a0510..8aa78ff640f5 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -15,9 +15,6 @@
 #include <sound/jack.h>
 
 #include "regs-iis.h"
-#include <asm/mach-types.h>
-
-#include <mach/gpio-samsung.h>
 #include "s3c24xx-i2s.h"
 
 static const unsigned int rates[] = {
@@ -31,6 +28,8 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 	.list = rates,
 };
 
+static struct gpio_desc *gpiod_speaker_power;
+
 static struct snd_soc_jack hp_jack;
 
 static struct snd_soc_jack_pin hp_jack_pins[] = {
@@ -47,7 +46,6 @@ static struct snd_soc_jack_pin hp_jack_pins[] = {
 
 static struct snd_soc_jack_gpio hp_jack_gpios[] = {
 	{
-		.gpio			= S3C2410_GPG(4),
 		.name			= "hp-gpio",
 		.report			= SND_JACK_HEADPHONE,
 		.invert			= 1,
@@ -123,9 +121,9 @@ static int h1940_spk_power(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(S3C_GPIO_END + 9, 1);
+		gpiod_set_value(gpiod_speaker_power, 1);
 	else
-		gpio_set_value(S3C_GPIO_END + 9, 0);
+		gpiod_set_value(gpiod_speaker_power, 0);
 
 	return 0;
 }
@@ -151,8 +149,6 @@ static const struct snd_soc_dapm_route audio_map[] = {
 	{"VINM", NULL, "Mic Jack"},
 };
 
-static struct platform_device *s3c24xx_snd_device;
-
 static int h1940_uda1380_init(struct snd_soc_pcm_runtime *rtd)
 {
 	snd_soc_card_jack_new(rtd->card, "Headphone Jack", SND_JACK_HEADPHONE,
@@ -194,55 +190,34 @@ static struct snd_soc_card h1940_asoc = {
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
 };
 
-static int __init h1940_init(void)
+static int h1940_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct device *dev = &pdev->dev;
 
-	if (!machine_is_h1940())
-		return -ENODEV;
+	h1940_asoc.dev = dev;
+	hp_jack_gpios[0].gpiod_dev = dev;
+	gpiod_speaker_power = devm_gpiod_get(&pdev->dev, "speaker-power",
+					     GPIOD_OUT_LOW);
 
-	/* configure some gpios */
-	ret = gpio_request(S3C_GPIO_END + 9, "speaker-power");
-	if (ret)
-		goto err_out;
-
-	ret = gpio_direction_output(S3C_GPIO_END + 9, 0);
-	if (ret)
-		goto err_gpio;
-
-	s3c24xx_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!s3c24xx_snd_device) {
-		ret = -ENOMEM;
-		goto err_gpio;
+	if (IS_ERR(gpiod_speaker_power)) {
+		dev_err(dev, "Could not get gpio\n");
+		return PTR_ERR(gpiod_speaker_power);
 	}
 
-	platform_set_drvdata(s3c24xx_snd_device, &h1940_asoc);
-	ret = platform_device_add(s3c24xx_snd_device);
-
-	if (ret)
-		goto err_plat;
-
-	return 0;
-
-err_plat:
-	platform_device_put(s3c24xx_snd_device);
-err_gpio:
-	gpio_free(S3C_GPIO_END + 9);
-
-err_out:
-	return ret;
-}
-
-static void __exit h1940_exit(void)
-{
-	platform_device_unregister(s3c24xx_snd_device);
-	gpio_free(S3C_GPIO_END + 9);
+	return devm_snd_soc_register_card(dev, &h1940_asoc);
 }
 
-module_init(h1940_init);
-module_exit(h1940_exit);
+static struct platform_driver h1940_audio_driver = {
+	.driver = {
+		.name = "h1940-audio",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = h1940_probe,
+};
+module_platform_driver(h1940_audio_driver);
 
 /* Module information */
 MODULE_AUTHOR("Arnaud Patard, Vasily Khoruzhick");
 MODULE_DESCRIPTION("ALSA SoC H1940");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:h1940-audio");
-- 
2.17.1

