From: srikanth <ts.srikanth@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: Added SATA registers base address.
Date: Thu, 09 Feb 2012 15:25:32 +0900
Message-ID: <004e01cce6f3$a02236e0$e066a4a0$%srikanth@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51734 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819Ab2BIGZr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 01:25:47 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ4000PX4IE6UN0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 15:25:32 +0900 (KST)
Received: from DOTSSRIKANT01 ([12.23.118.165])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ4002RP4IJ6S61@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 15:25:32 +0900 (KST)
Content-language: en-gb
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk

Added Base address for the SATA registers.

Signed-off-by: Srikanth TS <ts.srikanth@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h      |    7 +++++++
 arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index b882106..9d344a6 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -116,9 +116,16 @@
 #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 #define EXYNOS4_PA_DWMCI		0x12550000
 
+#ifdef CONFIG_ARCH_EXYNOS4
 #define EXYNOS4_PA_SATA			0x12560000
 #define EXYNOS4_PA_SATAPHY		0x125D0000
 #define EXYNOS4_PA_SATAPHY_CTRL		0x126B0000
+#endif
+#ifdef CONFIG_ARCH_EXYNOS5
+#define EXYNOS5_PA_SATA_PHY_CTRL	0x12170000
+#define EXYNOS5_PA_SATA_PHY_I2C		0x121D0000
+#define EXYNOS5_PA_SATA_BASE		0x122F0000
+#endif
 
 #define EXYNOS4_PA_SROMC		0x12570000
 #define EXYNOS5_PA_SROMC		0x12250000
diff --git a/arch/arm/mach-exynos/include/mach/regs-pmu.h b/arch/arm/mach-exynos/include/mach/regs-pmu.h
index 4c53f38..49e386a 100644
--- a/arch/arm/mach-exynos/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos/include/mach/regs-pmu.h
@@ -218,4 +218,7 @@
 #define S5P_SECSS_MEM_OPTION			S5P_PMUREG(0x2EC8)
 #define S5P_ROTATOR_MEM_OPTION			S5P_PMUREG(0x2F48)
 
+/* Only for EXYNOS5250 */
+#define EXYNOS5_SATA_PHY_CONTROL		S5P_PMUREG(0x0724)
+
 #endif /* __ASM_ARCH_REGS_PMU_H */
-- 
1.7.1
