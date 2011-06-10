From: Anand Kumar N <anand.kn@samsung.com>
Subject: [RE-SEND] [PATCH 1/4] ARM: EXYNOS4: Add FIMD resource definition
Date: Fri, 10 Jun 2011 13:45:20 +0530
Message-ID: <1307693723-14971-2-git-send-email-anand.kn@samsung.com>
References: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56995 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754728Ab1FJIQU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 04:16:20 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK003ZUEWY1CQ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:17 +0900 (KST)
Received: from anand-ubuntu.sisodomain.com (unknown [107.108.215.66])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK009OSEYVA360@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 17:16:16 +0900 (KST)
In-reply-to: <1307693723-14971-1-git-send-email-anand.kn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lethal@linux-sh.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jg1.han@samsung.com, jonghun.han@samsung.com, thomas.ab@samsung.com, anand.kn@samsung.com

From: Jonghun Han <jonghun.han@samsung.com>

This patch adds resource definitions for EXYNOS4 FIMD.
IRQ and SFR definitions are added.

Signed-off-by: Jonghun Han <jonghun.han@samsung.com>
Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    8 ++++++++
 arch/arm/mach-exynos4/include/mach/map.h  |    5 +++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 5d03730..2cd2090 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -73,6 +73,14 @@
 #define IRQ_SYSMMU_MFC_M1_0	COMBINER_IRQ(5, 6)
 #define IRQ_SYSMMU_PCIE_0	COMBINER_IRQ(5, 7)
 
+#define IRQ_FIMD0_FIFO		COMBINER_IRQ(11, 0)
+#define IRQ_FIMD0_VSYNC	COMBINER_IRQ(11, 1)
+#define IRQ_FIMD0_SYSTEM	COMBINER_IRQ(11, 2)
+
+#define IRQ_FIMD1_FIFO		COMBINER_IRQ(12, 0)
+#define IRQ_FIMD1_VSYNC	COMBINER_IRQ(12, 1)
+#define IRQ_FIMD1_SYSTEM	COMBINER_IRQ(12, 2)
+
 #define IRQ_PDMA0		COMBINER_IRQ(21, 0)
 #define IRQ_PDMA1		COMBINER_IRQ(21, 1)
 
diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 57d8074..4e3e1b6 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -95,6 +95,9 @@
 #define EXYNOS4_PA_MIPI_CSIS0		0x11880000
 #define EXYNOS4_PA_MIPI_CSIS1		0x11890000
 
+#define EXYNOS4_PA_FIMD0		0x11C00000
+#define EXYNOS4_PA_FIMD1		0x12000000
+
 #define EXYNOS4_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 
 #define EXYNOS4_PA_SATA			0x12560000
@@ -142,6 +145,8 @@
 #define S5P_PA_FIMC3			EXYNOS4_PA_FIMC3
 #define S5P_PA_MIPI_CSIS0		EXYNOS4_PA_MIPI_CSIS0
 #define S5P_PA_MIPI_CSIS1		EXYNOS4_PA_MIPI_CSIS1
+#define S5P_PA_FIMD0			EXYNOS4_PA_FIMD0
+#define S5P_PA_FIMD1			EXYNOS4_PA_FIMD1
 #define S5P_PA_ONENAND			EXYNOS4_PA_ONENAND
 #define S5P_PA_ONENAND_DMA		EXYNOS4_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			EXYNOS4_PA_SDRAM
-- 
1.7.4.1
