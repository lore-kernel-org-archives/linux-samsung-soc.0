From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 10/15] ARM: S5PC100: Move sdhci helpers from plat-s5pc1xx to
 mach-s5pc100
Date: Fri, 14 May 2010 08:19:01 +0200
Message-ID: <1273817946-29404-11-git-send-email-m.szyprowski@samsung.com>
References: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24732 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753480Ab0ENGTQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 02:19:16 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2E000GGC82PL@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 07:19:14 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2E0046NC80JX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 May 2010 07:19:13 +0100 (BST)
In-reply-to: <1273817946-29404-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Move sdhci helpers from plat-s5pc1xx to mach-s5pc100.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pc100/Kconfig                      |   11 +++++++++++
 arch/arm/mach-s5pc100/Makefile                     |    1 +
 .../setup-sdhci-gpio.c                             |    4 ++--
 arch/arm/plat-s5pc1xx/Kconfig                      |    5 -----
 arch/arm/plat-s5pc1xx/Makefile                     |    1 -
 5 files changed, 14 insertions(+), 8 deletions(-)
 rename arch/arm/{plat-s5pc1xx => mach-s5pc100}/setup-sdhci-gpio.c (95%)

diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 9b10541..176c9a1 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -28,6 +28,17 @@ config S5PC100_SETUP_I2C1
 	help
 	  Common setup code for i2c bus 1.
 
+config S5PC100_SETUP_SDHCI
+        bool
+        select S5PC100_SETUP_SDHCI_GPIO
+        help
+          Internal helper functions for S5PC100 based SDHCI systems
+
+config S5PC100_SETUP_SDHCI_GPIO
+	bool
+	help
+	  Common setup code for SDHCI gpio.
+
 config MACH_SMDKC100
 	bool "SMDKC100"
 	select CPU_S5PC100
diff --git a/arch/arm/mach-s5pc100/Makefile b/arch/arm/mach-s5pc100/Makefile
index 741fba0..1e3180e 100644
--- a/arch/arm/mach-s5pc100/Makefile
+++ b/arch/arm/mach-s5pc100/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_CPU_S5PC100)	+= setup-i2c0.o
 obj-$(CONFIG_S5PC100_SETUP_FB_24BPP)	+= setup-fb-24bpp.o
 obj-$(CONFIG_S5PC100_SETUP_I2C1)	+= setup-i2c1.o
 obj-$(CONFIG_S5PC100_SETUP_SDHCI)       += setup-sdhci.o
+obj-$(CONFIG_S5PC100_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
 
 # machine support
 obj-$(CONFIG_MACH_SMDKC100)	+= mach-smdkc100.o
diff --git a/arch/arm/plat-s5pc1xx/setup-sdhci-gpio.c b/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
similarity index 95%
rename from arch/arm/plat-s5pc1xx/setup-sdhci-gpio.c
rename to arch/arm/mach-s5pc100/setup-sdhci-gpio.c
index 185c894..7769c76 100644
--- a/arch/arm/plat-s5pc1xx/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
@@ -1,8 +1,8 @@
-/* linux/arch/arm/plat-s5pc1xx/setup-sdhci-gpio.c
+/* linux/arch/arm/plat-s5pc100/setup-sdhci-gpio.c
  *
  * Copyright 2009 Samsung Eletronics
  *
- * S5PC1XX - Helper functions for setting up SDHCI device(s) GPIO (HSMMC)
+ * S5PC100 - Helper functions for setting up SDHCI device(s) GPIO (HSMMC)
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index c7bd2bb..ab58758 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -39,9 +39,4 @@ config CPU_S5PC100_CLOCK
 
 # platform specific device setup
 
-config S5PC1XX_SETUP_SDHCI_GPIO
-	bool
-	help
-	  Common setup code for SDHCI gpio.
-
 endif
diff --git a/arch/arm/plat-s5pc1xx/Makefile b/arch/arm/plat-s5pc1xx/Makefile
index 9ce6409..d490543 100644
--- a/arch/arm/plat-s5pc1xx/Makefile
+++ b/arch/arm/plat-s5pc1xx/Makefile
@@ -23,4 +23,3 @@ obj-$(CONFIG_CPU_S5PC100_CLOCK)	+= s5pc100-clock.o
 
 # Device setup
 
-obj-$(CONFIG_S5PC1XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio.o
-- 
1.6.4
