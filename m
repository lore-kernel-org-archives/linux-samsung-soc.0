From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 15/23] ARM: S3C24XX: Remove s3c2410_gpio_getpull()
Date: Fri,  7 May 2010 08:15:37 +0900
Message-ID: <1273187745-6566-16-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60643 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754022Ab0EFXQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:07 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Remove the unused s3c2410_gpio_getpull()

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/include/mach/gpio-fns.h |   12 ------------
 arch/arm/plat-s3c24xx/gpio.c                  |   13 -------------
 2 files changed, 0 insertions(+), 25 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/gpio-fns.h b/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
index f50c2a5..f453c4f 100644
--- a/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
+++ b/arch/arm/mach-s3c2410/include/mach/gpio-fns.h
@@ -97,18 +97,6 @@ extern int s3c2410_gpio_irqfilter(unsigned int pin, unsigned int on,
 
 extern void s3c2410_gpio_pullup(unsigned int pin, unsigned int to);
 
-/* s3c2410_gpio_getpull
- *
- * Read the state of the pull-up on a given pin
- *
- * return:
- *	< 0 => error code
- *	  0 => enabled
- *	  1 => disabled
-*/
-
-extern int s3c2410_gpio_getpull(unsigned int pin);
-
 extern void s3c2410_gpio_setpin(unsigned int pin, unsigned int to);
 
 extern unsigned int s3c2410_gpio_getpin(unsigned int pin);
diff --git a/arch/arm/plat-s3c24xx/gpio.c b/arch/arm/plat-s3c24xx/gpio.c
index 0b3b2cb..9b3d74c 100644
--- a/arch/arm/plat-s3c24xx/gpio.c
+++ b/arch/arm/plat-s3c24xx/gpio.c
@@ -20,7 +20,6 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
-
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -75,18 +74,6 @@ void s3c2410_gpio_pullup(unsigned int pin, unsigned int to)
 
 EXPORT_SYMBOL(s3c2410_gpio_pullup);
 
-int s3c2410_gpio_getpull(unsigned int pin)
-{
-	void __iomem *base = S3C24XX_GPIO_BASE(pin);
-	unsigned long offs = S3C2410_GPIO_OFFSET(pin);
-
-	if (pin < S3C2410_GPIO_BANKB)
-		return -EINVAL;
-
-	return (__raw_readl(base + 0x08) & (1L << offs)) ? 1 : 0;
-}
-
-EXPORT_SYMBOL(s3c2410_gpio_getpull);
 
 void s3c2410_gpio_setpin(unsigned int pin, unsigned int to)
 {
-- 
1.7.0.4
