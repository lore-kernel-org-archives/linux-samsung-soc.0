From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance to
 non-dt build
Date: Fri, 26 Aug 2011 14:10:14 +0530
Message-ID: <1314348014-2481-7-git-send-email-thomas.abraham@linaro.org>
References: <1314348014-2481-1-git-send-email-thomas.abraham@linaro.org>
 <1314348014-2481-2-git-send-email-thomas.abraham@linaro.org>
 <1314348014-2481-3-git-send-email-thomas.abraham@linaro.org>
 <1314348014-2481-4-git-send-email-thomas.abraham@linaro.org>
 <1314348014-2481-5-git-send-email-thomas.abraham@linaro.org>
 <1314348014-2481-6-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52231 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753592Ab1HZIkr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Aug 2011 04:40:47 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQJ007FB1FIWAR0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 17:40:46 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQJ005J71FB2H@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 26 Aug 2011 17:40:46 +0900 (KST)
In-reply-to: <1314348014-2481-6-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

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
