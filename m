Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626A3C433E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9C9A221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738953;
	bh=FHA57+AhyuwFu169uBnI07bF7rlOue//dBxLIpuhG/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=v/9gxNZ2pFNohdinGkHZ7p/OPrWXPBsfexPt1HUDoNWOxbjFXi4T71sRYd3j4Tjjo
	 rbGvgN6EIlNIjVEEguF9RxWYOpssrFGgU0JDuzKRagtGIgMtfLJeCbIg9znzPlC9e4
	 Ev9M2E6BGW5ze/3Ga6hl/9BbLVhQK8XSluYVODBE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgHFSfv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729222AbgHFSem (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:42 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7B2C061A01
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:36 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id p20so10039103wrf.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=mZbcfWjfbujDkq2pNG0EjxDL3wmODeKZR6QdjpvNwnA=;
        b=VTRUjRAVdJHuXWZRmfPyfZrOTCIvQYizklnH/Ew/yU4mpKjlAc4z7iim0mqDsRJYzG
         rvz+3HFMZMqr2H4nrooL+dhZUWgVv08tHKBRNS+UFgDDMirlvNkW4OHN7RTFOi/Wd8Jk
         LNDrGYzMjWoDfqKTp4ye1WT3GDlpOG0mBm5JDQ8XBqleZNbJVoyflCimh32l9KL5vfue
         AdI4uo1627V/f2OBfE3V6RSc9Wi6WAOtr0C0RtvITc6soAWbiTK21JNOtqstSrhwiOd0
         skv0GsUirthghpCY4t8o1ivCTopWB7Ki+LA+7sMT3WvEqM1ab76OnQDUw3UJkV812XFd
         PojQ==
X-Gm-Message-State: AOAM5313RgnZyZAJWef5ldfFCzyyJrB9AbIh7ajfquc8GWCjOqB5d8Jc
        m/xAGAJu5A0jO34q5Ud/nCOPsn9DQGw=
X-Google-Smtp-Source: ABdhPJy3Yvvvoh1JsQgmoF/gIrRX5nvTi4e54LxRPR7HSrWSXWbr30Dyjx+wqvJsH+kgfktV9uJTVQ==
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr8310908wru.161.1596738874718;
        Thu, 06 Aug 2020 11:34:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id j24sm8186050wrb.49.2020.08.06.11.34.34
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:34 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541534lta;
        Thu, 6 Aug 2020 11:23:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4d06:: with SMTP id mw6mr9995860pjb.226.1596738197466;
        Thu, 06 Aug 2020 11:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738197; cv=none;
        d=google.com; s=arc-20160816;
        b=R8pty+rH2b7DEwvSPRsGsh8Erplp9C7+U7GO6kINfY+ya63lyf3ZrWcgWxPa7FGCwn
         Ou8ZRqMwe8hfU4yv7VbY4QIOwzrpNixEgLCwu7SZA6Nhco2uuX9vDco5JRx45Pt2v1m+
         3FOv/lXh1PIfC/3MWfsqDNIJAd07WZzjP90cS9orALQVc+YfGVODE5sqq4No6q5PZwbe
         X5WfwEiU7NUpmP/pGynVSCNpKmh9eK28tgJqgtKTFF6VPsV8mrEvd+5BxaO8EsV9DRrR
         VxzLOPYJNhI04Go9B7lCvfb+OEPAWPFUh7HdijgF5UdoSWn0bfyF0PxYoNwhr4HRmCME
         ag0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=mZbcfWjfbujDkq2pNG0EjxDL3wmODeKZR6QdjpvNwnA=;
        b=bIkLFmqnm7mT1IbpcevL3kO4eI1xP/GzXJBSHZMVQPLyRoL4GaJ3LmQvf/F1Xq1E4X
         XP3+614x2Fls3MDsbzpOnqJaozKhpCHYCd7Z1lYmWuVyiJ0kgyAOOfPzpsrdnC85dsCt
         0TVenlQcT8ueSOb1OWqZFmWbisbHVuH1sOACHD/6FiyIwmSr+CBCliYvtZfU4XBrXQxk
         aMR9QhaCUUwOlkkMRtAYsn+8q32Bcy/9FiwL5P1m57zwAX76BW8T6LC9thjWtZNBFcD4
         sr4DPr+fSNO5plMJx9qtXrjVxyaDhcODUonNxI/LXupaHgr2jALSdZ8v+LxxGWPTZ2og
         o7Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=Rs2aObNQ;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id v2si3923566pgf.357.2020.08.06.11.23.17
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 74F4022DD3; Thu,  6 Aug 2020 18:23:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8519E22DA9;
        Thu,  6 Aug 2020 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738197;
        bh=FHA57+AhyuwFu169uBnI07bF7rlOue//dBxLIpuhG/A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rs2aObNQJlMWa6LY3B2iZMvRGGVQzv+LIW8Q3ctxhJwbIKpYxW8YTZiIi/TmOEbMv
         XVq8gvLS3NSvtcKuryMfVNyLvpf1QeUiW6aDppOAiigzQwabRPeTWoDJWESmkdcnzP
         pUyTm3JhvQa4kVYoiGsedS7Or576pd5nhRtdZSEI=
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
Subject: [PATCH v2 25/41] ASoC: samsung: neo1973: turn into platform driver
Date:   Thu,  6 Aug 2020 20:20:42 +0200
Message-Id: <20200806182059.2431-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: FDEFkBBm6Hk0
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
 arch/arm/mach-s3c24xx/mach-gta02.c | 17 ++++++
 sound/soc/samsung/neo1973_wm8753.c | 85 +++++++++---------------------
 2 files changed, 43 insertions(+), 59 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 346a158f9960..46a80fae7056 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/init.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/gpio_keys.h>
 #include <linux/workqueue.h>
@@ -472,6 +473,20 @@ static struct platform_device gta02_buttons_device = {
 	},
 };
 
+static struct gpiod_lookup_table gta02_audio_gpio_table = {
+	.dev_id = "neo1973-audio",
+	.table = {
+		GPIO_LOOKUP("GPIOJ", 2, "amp-shut", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOJ", 1, "hp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct platform_device gta02_audio = {
+	.name = "neo1973-audio",
+	.id = -1,
+};
+
 static void __init gta02_map_io(void)
 {
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
@@ -496,6 +511,7 @@ static struct platform_device *gta02_devices[] __initdata = {
 	&gta02_buttons_device,
 	&s3c_device_adc,
 	&s3c_device_ts,
+	&gta02_audio,
 };
 
 static void gta02_poweroff(void)
@@ -522,6 +538,7 @@ static void __init gta02_machine_init(void)
 
 	i2c_register_board_info(0, gta02_i2c_devs, ARRAY_SIZE(gta02_i2c_devs));
 
+	gpiod_add_lookup_table(&gta02_audio_gpio_table);
 	platform_add_devices(gta02_devices, ARRAY_SIZE(gta02_devices));
 	pm_power_off = gta02_poweroff;
 
diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index 54317e0f68f8..9266070e0181 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -11,14 +11,11 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/soc.h>
 
-#include <mach/gpio-samsung.h>
-#include <asm/mach-types.h>
 #include "regs-iis.h"
-
 #include "../codecs/wm8753.h"
 #include "s3c24xx-i2s.h"
 
@@ -166,6 +163,7 @@ static struct snd_soc_ops neo1973_voice_ops = {
 	.hw_free = neo1973_voice_hw_free,
 };
 
+static struct gpio_desc *gpiod_hp_in, *gpiod_amp_shut;
 static int gta02_speaker_enabled;
 
 static int lm4853_set_spk(struct snd_kcontrol *kcontrol,
@@ -173,7 +171,7 @@ static int lm4853_set_spk(struct snd_kcontrol *kcontrol,
 {
 	gta02_speaker_enabled = ucontrol->value.integer.value[0];
 
-	gpio_set_value(S3C2410_GPJ(2), !gta02_speaker_enabled);
+	gpiod_set_value(gpiod_hp_in, !gta02_speaker_enabled);
 
 	return 0;
 }
@@ -188,7 +186,7 @@ static int lm4853_get_spk(struct snd_kcontrol *kcontrol,
 static int lm4853_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(S3C2410_GPJ(1), SND_SOC_DAPM_EVENT_OFF(event));
+	gpiod_set_value(gpiod_amp_shut, SND_SOC_DAPM_EVENT_OFF(event));
 
 	return 0;
 }
@@ -308,13 +306,8 @@ static struct snd_soc_codec_conf neo1973_codec_conf[] = {
 	},
 };
 
-static const struct gpio neo1973_gta02_gpios[] = {
-	{ S3C2410_GPJ(2), GPIOF_OUT_INIT_HIGH, "GTA02_HP_IN" },
-	{ S3C2410_GPJ(1), GPIOF_OUT_INIT_HIGH, "GTA02_AMP_SHUT" },
-};
-
 static struct snd_soc_card neo1973 = {
-	.name = "neo1973",
+	.name = "neo1973gta02",
 	.owner = THIS_MODULE,
 	.dai_link = neo1973_dai,
 	.num_links = ARRAY_SIZE(neo1973_dai),
@@ -332,62 +325,36 @@ static struct snd_soc_card neo1973 = {
 	.fully_routed = true,
 };
 
-static struct platform_device *neo1973_snd_device;
-
-static int __init neo1973_init(void)
+static int neo1973_probe(struct platform_device *pdev)
 {
-	int ret;
-
-	if (!machine_is_neo1973_gta02())
-		return -ENODEV;
+	struct device *dev = &pdev->dev;
 
-	if (machine_is_neo1973_gta02()) {
-		neo1973.name = "neo1973gta02";
-		neo1973.num_aux_devs = 1;
-
-		ret = gpio_request_array(neo1973_gta02_gpios,
-				ARRAY_SIZE(neo1973_gta02_gpios));
-		if (ret)
-			return ret;
+	gpiod_hp_in = devm_gpiod_get(dev, "hp", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_hp_in)) {
+		dev_err(dev, "missing gpio %s\n", "hp");
+		return PTR_ERR(gpiod_hp_in);
 	}
-
-	neo1973_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!neo1973_snd_device) {
-		ret = -ENOMEM;
-		goto err_gpio_free;
+	gpiod_amp_shut = devm_gpiod_get(dev, "amp-shut", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_amp_shut)) {
+		dev_err(dev, "missing gpio %s\n", "amp-shut");
+		return PTR_ERR(gpiod_amp_shut);
 	}
 
-	platform_set_drvdata(neo1973_snd_device, &neo1973);
-	ret = platform_device_add(neo1973_snd_device);
-
-	if (ret)
-		goto err_put_device;
-
-	return 0;
-
-err_put_device:
-	platform_device_put(neo1973_snd_device);
-err_gpio_free:
-	if (machine_is_neo1973_gta02()) {
-		gpio_free_array(neo1973_gta02_gpios,
-				ARRAY_SIZE(neo1973_gta02_gpios));
-	}
-	return ret;
+	neo1973.dev = dev;
+	return devm_snd_soc_register_card(dev, &neo1973);
 }
-module_init(neo1973_init);
-
-static void __exit neo1973_exit(void)
-{
-	platform_device_unregister(neo1973_snd_device);
 
-	if (machine_is_neo1973_gta02()) {
-		gpio_free_array(neo1973_gta02_gpios,
-				ARRAY_SIZE(neo1973_gta02_gpios));
-	}
-}
-module_exit(neo1973_exit);
+struct platform_driver neo1973_audio = {
+	.driver = {
+		.name = "neo1973-audio",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = neo1973_probe,
+};
+module_platform_driver(neo1973_audio);
 
 /* Module information */
 MODULE_AUTHOR("Graeme Gregory, graeme@openmoko.org, www.openmoko.org");
 MODULE_DESCRIPTION("ALSA SoC WM8753 Neo1973 and Frerunner");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:neo1973-audio");
-- 
2.17.1

