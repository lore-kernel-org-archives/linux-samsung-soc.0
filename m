From: Eunki Kim <eunki_kim@samsung.com>
Subject: [PATCH 2/2] gpio: samsung: Fix input mode setting function for GPIO int
Date: Thu, 27 Sep 2012 12:55:24 +0900
Message-ID: <000101cd9c63$ecb606a0$c62213e0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50228 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753744Ab2I0Dz0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Sep 2012 23:55:26 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAZ00HZ3PK2X3L0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 12:55:25 +0900 (KST)
Received: from DOEUNKIKIM03 ([12.23.118.132])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAZ003Q8PKC5G60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 12:55:25 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, eunki_kim@samsung.com

This patch makes GPIO pin to INTERRUPT mode or INPUT mode according
to bitmap_gpio_int. When the related bit of bitmap_gpio_int is set,
it makes GPIO pin to INTERRUPT mode instrad of INPUT mode in the
samsung_gpiolib_4bit_input function.

Signed-off-by: Eunki Kim <eunki_kim@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index ba126cc..19caef4 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -596,7 +596,10 @@ static int samsung_gpiolib_4bit_input(struct gpio_chip *chip,
 	unsigned long con;
 
 	con = __raw_readl(base + GPIOCON_OFF);
-	con &= ~(0xf << con_4bit_shift(offset));
+	if (ourchip->bitmap_gpio_int & BIT(offset))
+		con |= 0xf << con_4bit_shift(offset);
+	else
+		con &= ~(0xf << con_4bit_shift(offset));
 	__raw_writel(con, base + GPIOCON_OFF);
 
 	gpio_dbg("%s: %p: CON now %08lx\n", __func__, base, con);
@@ -1018,6 +1021,8 @@ static void __init samsung_gpiolib_add_4bit_chips(struct samsung_gpio_chip
*chip
 		if ((base != NULL) && (chip->base == NULL))
 			chip->base = base + ((i) * 0x20);
 
+		chip->bitmap_gpio_int = 0;
+
 		samsung_gpiolib_add(chip);
 	}
 }
-- 
1.7.1
