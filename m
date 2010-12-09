From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 1/4] ARM: S5P: Make the common S5P PM code conditionally compile
Date: Thu,  9 Dec 2010 17:11:54 +0900
Message-ID: <1291882317-20411-2-git-send-email-sbkim73@samsung.com>
References: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40884 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754613Ab0LII3n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 03:29:43 -0500
In-Reply-To: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Pave the way for adding PM support on S5P64X0, which is more similar
to the S3C64XX series than the S5P series. Hence, the common pm code
should not be used for S5P64X0.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim  <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig |    1 +
 arch/arm/plat-s5p/Kconfig     |    7 +++++++
 arch/arm/plat-s5p/Makefile    |    4 ++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 862f239..eb60e10 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -13,6 +13,7 @@ config CPU_S5PV210
 	bool
 	select S3C_PL330_DMA
 	select S5P_EXT_INT
+	select S5P_PM if PM
 	select S5PV210_PM if PM
 	help
 	  Enable S5PV210 CPU support
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 65dbfa8..eeac91d 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -37,6 +37,13 @@ config S5P_GPIO_INT
 	help
 	  Common code for the GPIO interrupts (other than external interrupts.)
 
+config S5P_PM
+	bool
+	help
+	  Common code for power management support on S5P series (includes irq
+	  suspend/resume)
+	  Note: Do not choose this S5P6440 and S5P6450.
+
 config S5P_DEV_FIMC0
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index de65238..bfdf304 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -19,8 +19,8 @@ obj-y				+= clock.o
 obj-y				+= irq.o
 obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
 obj-$(CONFIG_S5P_GPIO_INT)	+= irq-gpioint.o
-obj-$(CONFIG_PM)		+= pm.o
-obj-$(CONFIG_PM)		+= irq-pm.o
+obj-$(CONFIG_S5P_PM)		+= pm.o
+obj-$(CONFIG_S5P_PM)		+= irq-pm.o
 
 # devices
 
-- 
1.6.6.1
