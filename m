From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance to
 non-dt build
Date: Thu, 01 Sep 2011 14:34:42 +0530
Message-ID: <1314867882-11755-7-git-send-email-thomas.abraham@linaro.org>
References: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-2-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-3-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-4-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-5-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-6-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35616 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756437Ab1IAJFH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Sep 2011 05:05:07 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQU005XW6JBUO50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Sep 2011 18:05:06 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQU001MY6JYD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Sep 2011 18:05:06 +0900 (KST)
In-reply-to: <1314867882-11755-6-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

The pl330 device instances and associated platform data is required only
for non-device-tree builds. With device tree, all of this information is
obtained from the device tree.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig  |    7 +++++++
 arch/arm/mach-exynos4/Makefile |    3 ++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index d4d401c..3edbf37 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -21,6 +21,13 @@ config EXYNOS4_MCT
 	help
 	  Use MCT (Multi Core Timer) as kernel timers
 
+config EXYNOS4_DEV_DMA
+	bool
+	default y if !OF
+	help
+	  Compile in amba device definitions for DMA controller if OF
+	  is not enabled.
+
 config EXYNOS4_DEV_AHCI
 	bool
 	help
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index d2bf5bf..a2f33dc 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -13,7 +13,8 @@ obj-				:=
 # Core support for EXYNOS4 system
 
 obj-$(CONFIG_CPU_EXYNOS4210)	+= cpu.o init.o clock.o irq-combiner.o
-obj-$(CONFIG_CPU_EXYNOS4210)	+= setup-i2c0.o irq-eint.o dma.o pmu.o
+obj-$(CONFIG_CPU_EXYNOS4210)	+= setup-i2c0.o irq-eint.o pmu.o
+obj-$(CONFIG_EXYNOS4_DEV_DMA)	+= dma.o
 obj-$(CONFIG_PM)		+= pm.o sleep.o
 obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
 
-- 
1.6.6.rc2
