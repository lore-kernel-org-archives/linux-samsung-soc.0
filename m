From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/7] ARM: SAMSUNG: move pm part for common s5p into plat-samsung
Date: Wed, 18 Apr 2012 19:20:32 -0700
Message-ID: <1334802036-16768-4-git-send-email-kgene.kim@samsung.com>
References: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:65059 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab2DSC2e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 22:28:34 -0400
Received: by mail-pz0-f52.google.com with SMTP id e40so10677696dak.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 19:28:34 -0700 (PDT)
In-Reply-To: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/Kconfig                          |   12 ------------
 arch/arm/plat-s5p/Makefile                         |    2 --
 arch/arm/plat-samsung/Kconfig                      |   12 ++++++++++++
 arch/arm/plat-samsung/Makefile                     |    3 +++
 .../irq-pm.c => plat-samsung/s5p-irq-pm.c}         |    3 +--
 arch/arm/{plat-s5p/pm.c => plat-samsung/s5p-pm.c}  |    3 +--
 .../{plat-s5p/sleep.S => plat-samsung/s5p-sleep.S} |    3 +--
 7 files changed, 18 insertions(+), 20 deletions(-)
 rename arch/arm/{plat-s5p/irq-pm.c => plat-samsung/s5p-irq-pm.c} (98%)
 rename arch/arm/{plat-s5p/pm.c => plat-samsung/s5p-pm.c} (95%)
 rename arch/arm/{plat-s5p/sleep.S => plat-samsung/s5p-sleep.S} (98%)

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index efff0a3..8e45c8b 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -33,18 +33,6 @@ config S5P_DEV_UART
 	def_bool y
 	depends on (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210)
 
-config S5P_PM
-	bool
-	help
-	  Common code for power management support on S5P and newer SoCs
-	  Note: Do not select this for S5P6440 and S5P6450.
-
-config S5P_SLEEP
-	bool
-	help
-	  Internal config node to apply common S5P sleep management code.
-	  Can be selected by S5P and newer SoCs with similar sleep procedure.
-
 config S5P_DEV_FIMC0
 	bool
 	help
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 8701c3c..c81106f 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -12,8 +12,6 @@ obj-				:=
 
 # Core files
 
-obj-$(CONFIG_S5P_PM)		+= pm.o irq-pm.o
-obj-$(CONFIG_S5P_SLEEP)		+= sleep.o
 obj-$(CONFIG_S5P_HRT) 		+= s5p-time.o
 
 # devices
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 9ae8036..56e6ae7 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -372,6 +372,18 @@ config SAMSUNG_WAKEMASK
 	  and above. This code allows a set of interrupt to wakeup-mask
 	  mappings. See <plat/wakeup-mask.h>
 
+config S5P_PM
+	bool
+	help
+	  Common code for power management support on S5P and newer SoCs
+	  Note: Do not select this for S5P6440 and S5P6450.
+
+config S5P_SLEEP
+	bool
+	help
+	  Internal config node to apply common S5P sleep management code.
+	  Can be selected by S5P and newer SoCs with similar sleep procedure.
+
 comment "Power Domain"
 
 config SAMSUNG_PD
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 5b65009..caa6f9a 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -51,6 +51,9 @@ obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
 
+obj-$(CONFIG_S5P_PM)		+= s5p-pm.o s5p-irq-pm.o
+obj-$(CONFIG_S5P_SLEEP)		+= s5p-sleep.o
+
 # PD support
 
 obj-$(CONFIG_SAMSUNG_PD)	+= pd.o
diff --git a/arch/arm/plat-s5p/irq-pm.c b/arch/arm/plat-samsung/s5p-irq-pm.c
similarity index 98%
rename from arch/arm/plat-s5p/irq-pm.c
rename to arch/arm/plat-samsung/s5p-irq-pm.c
index d1bfeca..7c1e3b7 100644
--- a/arch/arm/plat-s5p/irq-pm.c
+++ b/arch/arm/plat-samsung/s5p-irq-pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5p/irq-pm.c
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
diff --git a/arch/arm/plat-s5p/pm.c b/arch/arm/plat-samsung/s5p-pm.c
similarity index 95%
rename from arch/arm/plat-s5p/pm.c
rename to arch/arm/plat-samsung/s5p-pm.c
index d15dc47..0747468 100644
--- a/arch/arm/plat-s5p/pm.c
+++ b/arch/arm/plat-samsung/s5p-pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5p/pm.c
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
diff --git a/arch/arm/plat-s5p/sleep.S b/arch/arm/plat-samsung/s5p-sleep.S
similarity index 98%
rename from arch/arm/plat-s5p/sleep.S
rename to arch/arm/plat-samsung/s5p-sleep.S
index 006bd01..bdf6dad 100644
--- a/arch/arm/plat-s5p/sleep.S
+++ b/arch/arm/plat-samsung/s5p-sleep.S
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5p/sleep.S
- *
+/*
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
-- 
1.7.2.3
