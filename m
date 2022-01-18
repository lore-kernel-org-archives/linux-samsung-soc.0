Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABBCEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 11:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238730AbiARLLk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 06:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238577AbiARLLj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 06:11:39 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D77C061574
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 03:11:39 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o12so52436516lfu.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7OWZMjHJ8cfIWekryz7JWM8gPOqJ2AqQvf5fPoO5X0=;
        b=VmbjQoXyHauKIJYYMpGQ8YeFHFxLoZ2+dIDreTH2r+z9C69+8QGR4N7V+M6A4RFS/c
         8xZlstwKvh6EmQUQC4Rmipa+ASry2UWUOwx1yPB+/7MKfvL9MYGKkr+9uN7x1+hwuNo8
         9JerPK7hC/CFkKGtP49rl1O6+rfiM4UH6Hoh8Pt9N5aRvZDLXofSCmjEDOcqm6w1c6lE
         6xqIvorGXgtLGg3tEQD9+avN9EQmdSTQEN53bv7G0s/1NsIPreNTqAmN9aiikzUPdB3F
         V/35KSIW0rbJjGUtgWEFL2PcFO5qnId/YQria9Ydhfw7j+ETG9Kvw5NleK+PVEQ+cKRl
         f0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7OWZMjHJ8cfIWekryz7JWM8gPOqJ2AqQvf5fPoO5X0=;
        b=vGKy397LN6E0J/exClbxY9B7uhUAb362xZjtHHe6Trr3KpmJ1T99WygJQD4nu3aK77
         KusVnMiaG+yHdVK0aocIk9GXBfM+4uU3mgxa0u+BO2G/NJNIHS3Rm4c9GJY+dAVDvPiX
         W6Gybn367p6sIOL15dF+ptaChdEYy27PA067drvgne610Uo5RTswto5CSy8n1MNpkMC0
         VQyuxTfwNAvXWTKO2zr+KO8eJgHdoj05eY5RDe9LKsioScJ1cOZIDYfWgHGPc++BIZFx
         pQZMfqVrk3atx47EUqMGsEc54v7ffY4PSMqeqw1IIcHctX4RLmFaJyxVTJOwnU3IK4Et
         ZCbg==
X-Gm-Message-State: AOAM532ghC8eqORR+SHYf1oXj+02o2X9yYm9duTpM+GYYqESg/UqEK0Z
        QYg88dP01NNzfF5vdcG2Bi6wjQ==
X-Google-Smtp-Source: ABdhPJz8gVrc5Eg5gCtFTJ0iE0vK9vvMuzMY6I/eZ45B25bJ3/CB0CrhJ5RhI4tqaiNcd6BiQMc/zQ==
X-Received: by 2002:a05:6512:461:: with SMTP id x1mr22039490lfd.622.1642504297468;
        Tue, 18 Jan 2022 03:11:37 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o10sm918303lft.240.2022.01.18.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 03:11:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 2/3 v2] spi: s3c64xx: Drop custom gpio setup argument
Date:   Tue, 18 Jan 2022 12:09:27 +0100
Message-Id: <20220118110928.120640-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118110928.120640-1-linus.walleij@linaro.org>
References: <20220118110928.120640-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The SPI0 platform population function was taking a custom
gpio setup callback but the only user pass NULL as
argument so drop this argument.

Cc: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1-v2:
- Split out to separate patch
---
 arch/arm/mach-s3c/devs.c                  | 5 ++---
 arch/arm/mach-s3c/mach-crag6410.c         | 2 +-
 include/linux/platform_data/spi-s3c64xx.h | 4 +---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 9f086aee862b..1e266fc24f9b 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -1107,8 +1107,7 @@ struct platform_device s3c64xx_device_spi0 = {
 	},
 };
 
-void __init s3c64xx_spi0_set_platdata(int (*cfg_gpio)(void), int src_clk_nr,
-						int num_cs)
+void __init s3c64xx_spi0_set_platdata(int src_clk_nr, int num_cs)
 {
 	struct s3c64xx_spi_info pd;
 
@@ -1120,7 +1119,7 @@ void __init s3c64xx_spi0_set_platdata(int (*cfg_gpio)(void), int src_clk_nr,
 
 	pd.num_cs = num_cs;
 	pd.src_clk_nr = src_clk_nr;
-	pd.cfg_gpio = (cfg_gpio) ? cfg_gpio : s3c64xx_spi0_cfg_gpio;
+	pd.cfg_gpio = s3c64xx_spi0_cfg_gpio;
 
 	s3c_set_platdata(&pd, sizeof(pd), &s3c64xx_device_spi0);
 }
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 4a12c75d407f..41f0aba2d2fd 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -856,7 +856,7 @@ static void __init crag6410_machine_init(void)
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
 	samsung_keypad_set_platdata(&crag6410_keypad_data);
-	s3c64xx_spi0_set_platdata(NULL, 0, 2);
+	s3c64xx_spi0_set_platdata(0, 2);
 
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
diff --git a/include/linux/platform_data/spi-s3c64xx.h b/include/linux/platform_data/spi-s3c64xx.h
index 19d690f34670..10890a4b55b9 100644
--- a/include/linux/platform_data/spi-s3c64xx.h
+++ b/include/linux/platform_data/spi-s3c64xx.h
@@ -43,15 +43,13 @@ struct s3c64xx_spi_info {
 /**
  * s3c64xx_spi_set_platdata - SPI Controller configure callback by the board
  *				initialization code.
- * @cfg_gpio: Pointer to gpio setup function.
  * @src_clk_nr: Clock the SPI controller is to use to generate SPI clocks.
  * @num_cs: Number of elements in the 'cs' array.
  *
  * Call this from machine init code for each SPI Controller that
  * has some chips attached to it.
  */
-extern void s3c64xx_spi0_set_platdata(int (*cfg_gpio)(void), int src_clk_nr,
-						int num_cs);
+extern void s3c64xx_spi0_set_platdata(int src_clk_nr, int num_cs);
 
 /* defined by architecture to configure gpio */
 extern int s3c64xx_spi0_cfg_gpio(void);
-- 
2.34.1

