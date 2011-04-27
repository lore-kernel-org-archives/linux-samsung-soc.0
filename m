From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: SAMSUNG: Add support for pre-sleep/post-restore gpio control
Date: Wed, 27 Apr 2011 18:34:14 +0100
Message-ID: <1303925654-27715-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:60468 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1759736Ab1D0ReK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2011 13:34:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

From: Ben Dooks <ben-linux@fluff.org>

Add a callback so that per-arch can do pre-sleep and post-resume
gpio configuration so that for the S3C64XX, the GPIO configuration
is restored before the sleep mode is cleared.

For the S3C64XX case, it means that the GPIOs get set back to normal
operation after the restore code puts the original configurations
back in after the

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c2410/include/mach/pm-core.h |    3 +++
 arch/arm/mach-s3c64xx/include/mach/pm-core.h |   17 +++++++++++++++++
 arch/arm/mach-s5pv210/include/mach/pm-core.h |    3 +++
 arch/arm/plat-samsung/pm.c                   |    2 ++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/pm-core.h b/arch/arm/mach-s3c2410/include/mach/pm-core.h
index 70a83b2..45eea52 100644
--- a/arch/arm/mach-s3c2410/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c2410/include/mach/pm-core.h
@@ -62,3 +62,6 @@ static inline void s3c_pm_arch_update_uart(void __iomem *regs,
 					   struct pm_uart_save *save)
 {
 }
+
+static inline void s3c_pm_restored_gpios(void) { }
+static inline void s3c_pm_saved_gpios(void) { }
diff --git a/arch/arm/mach-s3c64xx/include/mach/pm-core.h b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
index 4ed0f58..38659be 100644
--- a/arch/arm/mach-s3c64xx/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
@@ -96,3 +96,20 @@ static inline void s3c_pm_arch_update_uart(void __iomem *regs,
 		save->ucon = new_ucon;
 	}
 }
+
+static inline void s3c_pm_restored_gpios(void)
+{
+	/* ensure sleep mode has been cleared from the system */
+
+	__raw_writel(0, S3C64XX_SLPEN);
+}
+
+static inline void s3c_pm_saved_gpios(void)
+{
+	/* turn on the sleep mode and keep it there, as it seems that during
+	 * suspend the xCON registers get re-set and thus you can end up with
+	 * problems between going to sleep and resuming.
+	 */
+
+	__raw_writel(S3C64XX_SLPEN_USE_xSLP, S3C64XX_SLPEN);
+}
diff --git a/arch/arm/mach-s5pv210/include/mach/pm-core.h b/arch/arm/mach-s5pv210/include/mach/pm-core.h
index e8d394f..3e22109 100644
--- a/arch/arm/mach-s5pv210/include/mach/pm-core.h
+++ b/arch/arm/mach-s5pv210/include/mach/pm-core.h
@@ -41,3 +41,6 @@ static inline void s3c_pm_arch_update_uart(void __iomem *regs,
 {
 	/* nothing here yet */
 }
+
+static inline void s3c_pm_restored_gpios(void) { }
+static inline void s3c_pm_saved_gpios(void) { }
diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 5c0a440..4f9a951 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -268,6 +268,7 @@ static int s3c_pm_enter(suspend_state_t state)
 	/* save all necessary core registers not covered by the drivers */
 
 	s3c_pm_save_gpios();
+	s3c_pm_saved_gpios();
 	s3c_pm_save_uarts();
 	s3c_pm_save_core();
 
@@ -309,6 +310,7 @@ static int s3c_pm_enter(suspend_state_t state)
 	s3c_pm_restore_core();
 	s3c_pm_restore_uarts();
 	s3c_pm_restore_gpios();
+	s3c_pm_restored_gpios();
 
 	s3c_pm_debug_init();
 
-- 
1.7.4.1
