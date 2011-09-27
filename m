From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/3] ARM: S5P: Make the common S5P PM code conditionally compile
Date: Tue, 27 Sep 2011 16:22:42 -0400
Message-ID: <1317154964-22600-2-git-send-email-a.kesavan@samsung.com>
References: <1317154964-22600-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:20911 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752878Ab1I0KdP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Sep 2011 06:33:15 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS6005U0FYSLSM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 19:33:14 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS60049OFZ1NM00@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 19:33:14 +0900 (KST)
In-reply-to: <1317154964-22600-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Pave the way for adding PM support on S5P64X0, which is more similar
to the S3C64XX series than the S5P series. Hence, the common pm code
(containing dummy functions) should not be used for S5P64X0.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig |    2 ++
 arch/arm/mach-s5pv210/Kconfig |    1 +
 arch/arm/plat-s5p/Kconfig     |    6 ++++++
 arch/arm/plat-s5p/Makefile    |    3 +--
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3b594fe..7ed7d49 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -12,11 +12,13 @@ if ARCH_EXYNOS4
 config CPU_EXYNOS4210
 	bool
 	select SAMSUNG_DMADEV
+	select S5P_PM if PM
 	help
 	  Enable EXYNOS4210 CPU support
 
 config SOC_EXYNOS4212
 	bool
+	select S5P_PM if PM
 	help
 	  Enable EXYNOS4212 SoC support
 
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index ccef034..356aa75 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -14,6 +14,7 @@ config CPU_S5PV210
 	select SAMSUNG_DMADEV
 	select S5P_EXT_INT
 	select S5P_HRT
+	select S5P_PM if PM
 	help
 	  Enable S5PV210 CPU support
 
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index f9241a7..53e6743 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -40,6 +40,12 @@ config S5P_HRT
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
index 1812019..755d7ac 100644
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
1.7.0.4
