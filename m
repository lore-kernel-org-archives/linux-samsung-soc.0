From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 3/3] gpio-samsung: Remove now unused s3c2410_gpio* API
Date: Sat, 25 Aug 2012 14:20:43 +0200
Message-ID: <1345897243-15619-4-git-send-email-sylvester.nawrocki@gmail.com>
References: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:46269 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754385Ab2HYMVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Aug 2012 08:21:03 -0400
Received: by wibhq12 with SMTP id hq12so3979725wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 25 Aug 2012 05:21:01 -0700 (PDT)
In-Reply-To: <1345897243-15619-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linus.walleij@stericsson.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

There is no more users of s3c2410_gpio_pullup(), s3c2410_gpio_setpin()
and s3c2410_gpio_getpin() so remove theese functions.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/gpio/gpio-samsung.c |   40 ----------------------------------------
 1 files changed, 0 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 92f7b2b..9e71340 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3131,46 +3131,6 @@ samsung_gpio_pull_t s3c_gpio_getpull(unsigned int pin)
 }
 EXPORT_SYMBOL(s3c_gpio_getpull);
 
-/* gpiolib wrappers until these are totally eliminated */
-
-void s3c2410_gpio_pullup(unsigned int pin, unsigned int to)
-{
-	int ret;
-
-	WARN_ON(to);	/* should be none of these left */
-
-	if (!to) {
-		/* if pull is enabled, try first with up, and if that
-		 * fails, try using down */
-
-		ret = s3c_gpio_setpull(pin, S3C_GPIO_PULL_UP);
-		if (ret)
-			s3c_gpio_setpull(pin, S3C_GPIO_PULL_DOWN);
-	} else {
-		s3c_gpio_setpull(pin, S3C_GPIO_PULL_NONE);
-	}
-}
-EXPORT_SYMBOL(s3c2410_gpio_pullup);
-
-void s3c2410_gpio_setpin(unsigned int pin, unsigned int to)
-{
-	/* do this via gpiolib until all users removed */
-
-	gpio_request(pin, "temporary");
-	gpio_set_value(pin, to);
-	gpio_free(pin);
-}
-EXPORT_SYMBOL(s3c2410_gpio_setpin);
-
-unsigned int s3c2410_gpio_getpin(unsigned int pin)
-{
-	struct samsung_gpio_chip *chip = samsung_gpiolib_getchip(pin);
-	unsigned long offs = pin - chip->chip.base;
-
-	return __raw_readl(chip->base + 0x04) & (1 << offs);
-}
-EXPORT_SYMBOL(s3c2410_gpio_getpin);
-
 #ifdef CONFIG_S5P_GPIO_DRVSTR
 s5p_gpio_drvstr_t s5p_gpio_get_drvstr(unsigned int pin)
 {
-- 
1.7.4.1
