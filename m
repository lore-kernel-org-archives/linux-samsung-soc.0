From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 16/23] ARM: S3C24XX: Remove s3c2410_gpio_getirq()
Date: Fri,  7 May 2010 08:15:38 +0900
Message-ID: <1273187745-6566-17-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60646 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754107Ab0EFXQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:07 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Remove s3c2410_gpio_getirq() as the only users is the pm code, and it
can be replicated by using gpio_to_irq().

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c24xx/gpio.c |   19 -------------------
 arch/arm/plat-s3c24xx/pm.c   |    2 +-
 2 files changed, 1 insertions(+), 20 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/gpio.c b/arch/arm/plat-s3c24xx/gpio.c
index 9b3d74c..24c0047 100644
--- a/arch/arm/plat-s3c24xx/gpio.c
+++ b/arch/arm/plat-s3c24xx/gpio.c
@@ -120,22 +120,3 @@ unsigned int s3c2410_modify_misccr(unsigned int clear, unsigned int change)
 }
 
 EXPORT_SYMBOL(s3c2410_modify_misccr);
-
-int s3c2410_gpio_getirq(unsigned int pin)
-{
-	if (pin < S3C2410_GPF(0) || pin > S3C2410_GPG(15))
-		return -EINVAL;	/* not valid interrupts */
-
-	if (pin < S3C2410_GPG(0) && pin > S3C2410_GPF(7))
-		return -EINVAL;	/* not valid pin */
-
-	if (pin < S3C2410_GPF(4))
-		return (pin - S3C2410_GPF(0)) + IRQ_EINT0;
-
-	if (pin < S3C2410_GPG(0))
-		return (pin - S3C2410_GPF(4)) + IRQ_EINT4;
-
-	return (pin - S3C2410_GPG(0)) + IRQ_EINT8;
-}
-
-EXPORT_SYMBOL(s3c2410_gpio_getirq);
diff --git a/arch/arm/plat-s3c24xx/pm.c b/arch/arm/plat-s3c24xx/pm.c
index 37ea822..691fecc 100644
--- a/arch/arm/plat-s3c24xx/pm.c
+++ b/arch/arm/plat-s3c24xx/pm.c
@@ -91,7 +91,7 @@ static void s3c_pm_check_resume_pin(unsigned int pin, unsigned int irqoffs)
 {
 	unsigned long irqstate;
 	unsigned long pinstate;
-	int irq = s3c2410_gpio_getirq(pin);
+	int irq = gpio_to_irq(pin);
 
 	if (irqoffs < 4)
 		irqstate = s3c_irqwake_intmask & (1L<<irqoffs);
-- 
1.7.0.4
