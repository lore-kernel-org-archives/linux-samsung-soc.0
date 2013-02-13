From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] gpio: samsung: fixes build warning with s3c2410_defconfig
Date: Tue, 12 Feb 2013 21:05:36 -0800
Message-ID: <1360731937-23471-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59730 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828Ab3BMFG7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 00:06:59 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI500B1J7IOI7M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 14:06:58 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MI5006XP7JHY040@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 13 Feb 2013 14:06:58 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Heiko Stuebner <heiko@sntech.de>

commit 7b45ed96 ("ARM: S3C24XX: handle s3c2412 eints using new
infrastructure") introduced build warning and this patch fixes
that:

drivers/gpio/gpio-samsung.c: In function 's3c24xx_gpiolib_fbank_to_irq':
drivers/gpio/gpio-samsung.c:1126:5: warning: suggest explicit braces to avoid ambiguous 'else' [-Wparentheses]

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index df096dc..a811d0f 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -1123,11 +1123,12 @@ int samsung_gpiolib_to_irq(struct gpio_chip *chip, unsigned int offset)
 #ifdef CONFIG_PLAT_S3C24XX
 static int s3c24xx_gpiolib_fbank_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	if (offset < 4)
+	if (offset < 4) {
 		if (soc_is_s3c2412())
 			return IRQ_EINT0_2412 + offset;
 		else
 			return IRQ_EINT0 + offset;
+	}
 
 	if (offset < 8)
 		return IRQ_EINT4 + offset - 4;
-- 
1.7.10.4
