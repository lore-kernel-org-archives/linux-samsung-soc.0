From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH] ARM: exynos4: Fix for stall in case of cpu hotplug or sleep
Date: Fri, 18 Nov 2011 17:15:52 +0530
Message-ID: <1321616752-1233-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40659 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753310Ab1KRLrI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Nov 2011 06:47:08 -0500
Received: by iage36 with SMTP id e36so3489388iag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Nov 2011 03:47:07 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: patches@linaro.org, amit.kachhap@linaro.org

This patch adds remove_irq in place of disable_irq which is
correct equivalent function for setup_irq used in
exynos4_mct_tick_init.

Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Tested-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 arch/arm/mach-exynos/mct.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
index 97343df..959f251 100644
--- a/arch/arm/mach-exynos/mct.c
+++ b/arch/arm/mach-exynos/mct.c
@@ -428,9 +428,13 @@ int __cpuinit local_timer_setup(struct clock_event_device *evt)
 
 void local_timer_stop(struct clock_event_device *evt)
 {
+	unsigned int cpu = smp_processor_id();
 	evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
 	if (mct_int_type == MCT_INT_SPI)
-		disable_irq(evt->irq);
+		if (cpu == 0)
+			remove_irq(evt->irq, &mct_tick0_event_irq);
+		else
+			remove_irq(evt->irq, &mct_tick1_event_irq);
 	else
 		disable_percpu_irq(IRQ_MCT_LOCALTIMER);
 }
-- 
1.7.1
