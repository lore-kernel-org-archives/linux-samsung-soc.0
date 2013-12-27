From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/3] ARM: SAMSUNG: Remove Exynos specific code from s5p-pm-irq.c
Date: Fri, 27 Dec 2013 11:59:54 +0530
Message-ID: <1388125795-30418-3-git-send-email-tushar.behera@linaro.org>
References: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:36657 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662Ab3L0Gda (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 01:33:30 -0500
Received: by mail-pa0-f54.google.com with SMTP id rd3so9009507pab.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2013 22:33:30 -0800 (PST)
In-Reply-To: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

This file is only compiled when SAMSUNG_ATAGS is enabled, hence not
for Exynos platform.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/s5p-irq-pm.c |   13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm/plat-samsung/s5p-irq-pm.c b/arch/arm/plat-samsung/s5p-irq-pm.c
index 5914980..52b1694 100644
--- a/arch/arm/plat-samsung/s5p-irq-pm.c
+++ b/arch/arm/plat-samsung/s5p-irq-pm.c
@@ -22,10 +22,7 @@
 #include <mach/map.h>
 
 #include <mach/regs-gpio.h>
-
-#ifndef CONFIG_ARCH_EXYNOS
 #include <mach/regs-irq.h>
-#endif
 
 /* state for IRQs over sleep */
 
@@ -43,18 +40,8 @@ int s3c_irq_wake(struct irq_data *data, unsigned int state)
 	unsigned long irqbit;
 	unsigned int irq_rtc_tic, irq_rtc_alarm;
 
-#ifdef CONFIG_ARCH_EXYNOS
-	if (soc_is_exynos5250()) {
-		irq_rtc_tic = EXYNOS5_IRQ_RTC_TIC;
-		irq_rtc_alarm = EXYNOS5_IRQ_RTC_ALARM;
-	} else {
-		irq_rtc_tic = EXYNOS4_IRQ_RTC_TIC;
-		irq_rtc_alarm = EXYNOS4_IRQ_RTC_ALARM;
-	}
-#else
 	irq_rtc_tic = IRQ_RTC_TIC;
 	irq_rtc_alarm = IRQ_RTC_ALARM;
-#endif
 
 	if (data->irq == irq_rtc_tic || data->irq == irq_rtc_alarm) {
 		irqbit = 1 << (data->irq + 1 - irq_rtc_alarm);
-- 
1.7.9.5
