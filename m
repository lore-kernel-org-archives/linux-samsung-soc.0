From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/5] ARM: S5P: Make the common S5P PM code conditionally compile
Date: Fri, 12 Aug 2011 15:56:23 +0530
Message-ID: <1313144787-30666-2-git-send-email-a.kesavan@samsung.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42193 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753279Ab1HLKZd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:25:33 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT00DB48YJOVR0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:32 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00ESK8YEI1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:32 +0900 (KST)
In-reply-to: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Pave the way for adding PM support on S5P64X0, which is more similar
to the S3C64XX series than the S5P series. Hence, the common pm code
(containing dummy functions) should not be used for S5P64X0.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig |    1 +
 arch/arm/mach-s5pv210/Kconfig |    1 +
 arch/arm/plat-s5p/Kconfig     |    6 ++++++
 arch/arm/plat-s5p/Makefile    |    3 +--
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 0c77ab9..77362c2 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -12,6 +12,7 @@ if ARCH_EXYNOS4
 config CPU_EXYNOS4210
 	bool
 	select S3C_PL330_DMA
+	select S5P_PM if PM
 	help
 	  Enable EXYNOS4210 CPU support
 
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index aaeb44a..b31e866 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -14,6 +14,7 @@ config CPU_S5PV210
 	select S3C_PL330_DMA
 	select S5P_EXT_INT
 	select S5P_HRT
+	select S5P_PM if PM
 	help
 	  Enable S5PV210 CPU support
 
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 9843c95..3ca5341 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -43,6 +43,12 @@ config S5P_HRT
 	help
 	  Use the High Resolution timer support
 
+config S5P_PM
+	bool
+	help
+	  Common code for power management support on S5P and newer SoCs
+	  Note: Do not select this for S5P6440 and S5P6450.
+
 comment "System MMU"
 
 config S5P_SYSTEM_MMU
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 4b53e04..735c270 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -20,8 +20,7 @@ obj-y				+= irq.o
 obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
 obj-$(CONFIG_S5P_GPIO_INT)	+= irq-gpioint.o
 obj-$(CONFIG_S5P_SYSTEM_MMU)	+= sysmmu.o
-obj-$(CONFIG_PM)		+= pm.o
-obj-$(CONFIG_PM)		+= irq-pm.o
+obj-$(CONFIG_S5P_PM)		+= pm.o irq-pm.o
 obj-$(CONFIG_S5P_HRT) 		+= s5p-time.o
 
 # devices
-- 
1.7.4.1
