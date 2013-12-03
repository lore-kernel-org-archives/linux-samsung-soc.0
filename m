From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Add save/restore infra for system registers for Exynos5420
Date: Tue,  3 Dec 2013 17:10:48 +0530
Message-ID: <1386070848-13083-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:36630 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753205Ab3LCLn0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Dec 2013 06:43:26 -0500
Received: by mail-pd0-f170.google.com with SMTP id g10so19941006pdj.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Dec 2013 03:43:25 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, Ajay Kumar <ajaykumar.rs@samsung.com>

From: Ajay Kumar <ajaykumar.rs@samsung.com>

Added exynos5420_sys_save[] structure for system registers on Exynos5420.
We save the values of all the system registers present in the list
exynos5420_sys_save[], and we restore these values on resume.

As of now, we have added save/restore entry for EXYNOS5_SYS_DISP1_BLK_CFG.

NOTE: Restoring of EXYNOS5_SYS_DISP1_BLK_CFG was not done on Exynos5250
because we use MIE path on Exynos5250 and the default reset value of
EXYNOS5_SYS_DISP1_BLK_CFG is set to use MIE.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Tested-by: Prathyush Kalashwaram <prathyush@chromium.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    1 +
 arch/arm/mach-exynos/pm.c                    |   10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
index 2cdb63e8ce5c..c58b43a19020 100644
--- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
@@ -227,6 +227,7 @@
 
 /* For EXYNOS5 */
 
+#define EXYNOS5_SYS_DISP1_BLK_CFG				S5P_SYSREG(0x0214)
 #define EXYNOS5_SYS_I2C_CFG					S5P_SYSREG(0x0234)
 
 #define EXYNOS5_AUTO_WDTRESET_DISABLE				S5P_PMUREG(0x0408)
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 1578d435df43..a1b7b79b70fa 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -39,6 +39,10 @@ static struct sleep_save exynos5_sys_save[] = {
 	SAVE_ITEM(EXYNOS5_SYS_I2C_CFG),
 };
 
+static struct sleep_save exynos5420_sys_save[] = {
+	SAVE_ITEM(EXYNOS5_SYS_DISP1_BLK_CFG),
+};
+
 static struct sleep_save exynos_core_save[] = {
 	/* SROM side */
 	SAVE_ITEM(S5P_SROM_BW),
@@ -80,6 +84,9 @@ static void exynos_pm_prepare(void)
 		tmp = __raw_readl(EXYNOS5_JPEG_MEM_OPTION);
 		tmp &= ~EXYNOS5_OPTION_USE_RETENTION;
 		__raw_writel(tmp, EXYNOS5_JPEG_MEM_OPTION);
+	} else if (soc_is_exynos5420()) {
+		s3c_pm_do_save(exynos5420_sys_save,
+					ARRAY_SIZE(exynos5420_sys_save));
 	}
 
 	/* Set value of power down register for sleep mode */
@@ -256,6 +263,9 @@ static void exynos_pm_resume(void)
 	if (soc_is_exynos5250())
 		s3c_pm_do_restore(exynos5_sys_save,
 			ARRAY_SIZE(exynos5_sys_save));
+	else if (soc_is_exynos5420())
+		s3c_pm_do_restore(exynos5420_sys_save,
+			ARRAY_SIZE(exynos5420_sys_save));
 
 	s3c_pm_do_restore_core(exynos_core_save, ARRAY_SIZE(exynos_core_save));
 
-- 
1.7.9.5
