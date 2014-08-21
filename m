From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH v2 3/3] ARM: exynos: Add PMU and S2R support for exynos5800 SoC
Date: Thu, 21 Aug 2014 18:52:37 +0545
Message-ID: <1408626457-3422-4-git-send-email-vikas.sajjan@samsung.com>
References: <1408626457-3422-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:57476 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754493AbaHUNIB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Aug 2014 09:08:01 -0400
Received: by mail-pa0-f46.google.com with SMTP id lj1so14257209pab.33
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2014 06:08:00 -0700 (PDT)
In-Reply-To: <1408626457-3422-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, dianders@chromium.org, olof@lixom.net

Adds PMU and S2R support for exynos5800 SoC.

Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/mach-exynos/pm.c       |    3 +++
 arch/arm/mach-exynos/pmu.c      |   22 ++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h |    3 ++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index acdcf0b..41fc1c3 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -646,6 +646,9 @@ static struct of_device_id exynos_pmu_of_device_ids[] = {
 	}, {
 		.compatible = "samsung,exynos5420-pmu",
 		.data = &exynos5420_pm_data,
+	}, {
+		.compatible = "samsung,exynos5800-pmu",
+		.data = &exynos5420_pm_data,
 	},
 	{ /*sentinel*/ },
 };
diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index f8ced42..c1cd31c 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -719,6 +719,19 @@ static void exynos5420_pmu_init(void)
 	pr_info("EXYNOS5420 PMU initialized\n");
 }
 
+static void exynos5800_pmu_init(void)
+{
+	unsigned int value;
+
+	exynos5420_pmu_init();
+
+	value = pmu_raw_readl(EXYNOS5420_LPI_MASK);
+	value |= EXYNOS5800_POWER_GATE_CTRL;
+	pmu_raw_writel(value, EXYNOS5420_LPI_MASK);
+
+	pr_info("EXYNOS5800 PMU initialized\n");
+}
+
 
 static const struct exynos_pmu_data exynos4210_pmu_data = {
 	.pmu_config	= exynos4210_pmu_config,
@@ -745,6 +758,12 @@ static struct exynos_pmu_data exynos5420_pmu_data = {
 	.powerdown_conf	= exynos5420_powerdown_conf,
 };
 
+static struct exynos_pmu_data exynos5800_pmu_data = {
+	.pmu_config	= exynos5420_pmu_config,
+	.pmu_init	= exynos5800_pmu_init,
+	.powerdown_conf	= exynos5420_powerdown_conf,
+};
+
 static const struct regmap_config pmu_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -770,6 +789,9 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
 	}, {
 		.compatible = "samsung,exynos5420-pmu",
 		.data = &exynos5420_pmu_data,
+	}, {
+		.compatible = "samsung,exynos5800-pmu",
+		.data = &exynos5800_pmu_data,
 	},
 	{ /*sentinel*/ },
 };
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 3a6a559..3a0140c 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -555,5 +555,6 @@ static inline unsigned int exynos_pmu_cpunr(unsigned int mpidr)
 					 | EXYNOS5420_KFC_USE_STANDBY_WFI1  \
 					 | EXYNOS5420_KFC_USE_STANDBY_WFI2  \
 					 | EXYNOS5420_KFC_USE_STANDBY_WFI3)
-
+/* for exynos5800 only */
+#define EXYNOS5800_POWER_GATE_CTRL                              (1 << 15)
 #endif /* __ASM_ARCH_REGS_PMU_H */
-- 
1.7.9.5
