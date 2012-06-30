From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 2/2] ASoC: Convert S3C2412 I2S driver to gpiolib API
Date: Sat, 30 Jun 2012 14:37:56 +0200
Message-ID: <1341059876-29460-2-git-send-email-sylvester.nawrocki@gmail.com>
References: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:45675 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754584Ab2F3MiK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jun 2012 08:38:10 -0400
Received: by eeit10 with SMTP id t10so1633816eei.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Jun 2012 05:38:08 -0700 (PDT)
In-Reply-To: <1341059876-29460-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sbkim73@samsung.com, lrg@ti.com
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Ben Dooks <ben-linux@fluff.org>

The s3c2410_gpio* calls are obsolete and have been scheduled for
removal since several kernel releases. Remove them and use common
gpiolib API.
This patch is a prerequisite for removal of the S3C24XX SoC specific
arch/arm/plat-samsung/include/gpio-fns.h header.

Compile tested only.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 sound/soc/samsung/s3c2412-i2s.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index 79fbeea..ac7701b 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -25,7 +25,6 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>

-#include <mach/regs-gpio.h>
 #include <mach/dma.h>

 #include "dma.h"
@@ -83,12 +82,9 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)

 	s3c2412_i2s.iis_cclk = s3c2412_i2s.iis_pclk;

-	/* Configure the I2S pins in correct mode */
-	s3c2410_gpio_cfgpin(S3C2410_GPE0, S3C2410_GPE0_I2SLRCK);
-	s3c2410_gpio_cfgpin(S3C2410_GPE1, S3C2410_GPE1_I2SSCLK);
-	s3c2410_gpio_cfgpin(S3C2410_GPE2, S3C2410_GPE2_CDCLK);
-	s3c2410_gpio_cfgpin(S3C2410_GPE3, S3C2410_GPE3_I2SSDI);
-	s3c2410_gpio_cfgpin(S3C2410_GPE4, S3C2410_GPE4_I2SSDO);
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);

 	return 0;
 }
--
1.7.4.1
