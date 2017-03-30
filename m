From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v9 08/12] ARM: EXYNOS: move exynos_boot_vector_{addr,flag} ops
 to exynos_s2r_data
Date: Thu, 30 Mar 2017 18:47:02 +0530
Message-ID: <1490879826-16754-9-git-send-email-pankaj.dubey@samsung.com>
References: <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170330131436epcas1p4a4f8bf7b64b4a5ff9ee692adc4e7d001@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51416 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933512AbdC3NOj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 09:14:39 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONM007VTQ4DSO40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Mar 2017 22:14:37 +0900 (KST)
In-reply-to: <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, kgene@kernel.org, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, javier@osg.samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

Various Exynos SoC needs different boot addresses and flags. Currently we
are handling this difference by adding lots of soc_is_exynosMMM checks in
the code, in an attempt to remove the dependency of such helper functions
specific to each SoC, let's separate helper functions for these helper
functions by moving them into SoC specific hooks in struct exynos_s2r_data.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/pm.c | 60 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index fa24098..c3fa537 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -32,26 +32,56 @@
 #include "common.h"
 
 struct exynos_s2r_data {
+	void __iomem* (*boot_vector_addr)(void);
+	void __iomem* (*boot_vector_flag)(void);
 	void (*enter_aftr)(void);
 };
 
 static const struct exynos_s2r_data *s2r_data;
 
-static inline void __iomem *exynos_boot_vector_addr(void)
+static void __iomem *exynos_boot_vector_addr(void)
+{
+	if (s2r_data && s2r_data->boot_vector_addr)
+		return s2r_data->boot_vector_addr();
+
+	return NULL;
+}
+
+static inline void __iomem *exynos4210_rev11_boot_vector_addr(void)
+{
+	return pmu_base_addr + S5P_INFORM7;
+}
+
+static inline void __iomem *exynos4210_rev10_boot_vector_addr(void)
+{
+	return sysram_base_addr + 0x24;
+}
+
+static inline void __iomem *exynos_common_boot_vector_addr(void)
 {
-	if (samsung_rev() == EXYNOS4210_REV_1_1)
-		return pmu_base_addr + S5P_INFORM7;
-	else if (samsung_rev() == EXYNOS4210_REV_1_0)
-		return sysram_base_addr + 0x24;
 	return pmu_base_addr + S5P_INFORM0;
 }
 
-static inline void __iomem *exynos_boot_vector_flag(void)
+static void __iomem *exynos_boot_vector_flag(void)
+{
+	if (s2r_data && s2r_data->boot_vector_flag)
+		return s2r_data->boot_vector_flag();
+
+	return NULL;
+}
+
+static inline void __iomem *exynos4210_rev11_boot_vector_flag(void)
+{
+	return pmu_base_addr + S5P_INFORM6;
+}
+
+static inline void __iomem *exynos4210_rev10_boot_vector_flag(void)
+{
+	return sysram_base_addr + 0x20;
+}
+
+static inline void __iomem *exynos_common_boot_vector_flag(void)
 {
-	if (samsung_rev() == EXYNOS4210_REV_1_1)
-		return pmu_base_addr + S5P_INFORM6;
-	else if (samsung_rev() == EXYNOS4210_REV_1_0)
-		return sysram_base_addr + 0x20;
 	return pmu_base_addr + S5P_INFORM1;
 }
 
@@ -218,22 +248,32 @@ static void exynos5_enter_aftr(void)
 }
 
 static const struct exynos_s2r_data exynos_common_s2r_data = {
+	.boot_vector_addr	= exynos_common_boot_vector_addr,
+	.boot_vector_flag	= exynos_common_boot_vector_flag,
 	.enter_aftr		= exynos5_enter_aftr,
 };
 
 static const struct exynos_s2r_data exynos3250_s2r_data = {
+	.boot_vector_addr	= exynos_common_boot_vector_addr,
+	.boot_vector_flag	= exynos_common_boot_vector_flag,
 	.enter_aftr		= exynos3_enter_aftr,
 };
 
 static const struct exynos_s2r_data exynos4210_rev11_s2r_data = {
+	.boot_vector_addr	= exynos4210_rev11_boot_vector_addr,
+	.boot_vector_flag	= exynos4210_rev11_boot_vector_flag,
 	.enter_aftr		= exynos4_enter_aftr,
 };
 
 static const struct exynos_s2r_data exynos4210_rev10_s2r_data = {
+	.boot_vector_addr	= exynos4210_rev10_boot_vector_addr,
+	.boot_vector_flag	= exynos4210_rev10_boot_vector_flag,
 	.enter_aftr		= exynos4_enter_aftr,
 };
 
 static const struct exynos_s2r_data exynos4x12_s2r_data = {
+	.boot_vector_addr	= exynos_common_boot_vector_addr,
+	.boot_vector_flag	= exynos_common_boot_vector_flag,
 	.enter_aftr		= exynos4_enter_aftr,
 };
 
-- 
2.7.4
