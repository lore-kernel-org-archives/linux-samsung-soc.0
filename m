From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/7] ARM: SAMSUNG: move clock part for common s5p into plat-samsung
Date: Wed, 18 Apr 2012 19:20:30 -0700
Message-ID: <1334802036-16768-2-git-send-email-kgene.kim@samsung.com>
References: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:65059 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab2DSC2b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 22:28:31 -0400
Received: by mail-pz0-f52.google.com with SMTP id e40so10677696dak.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 19:28:30 -0700 (PDT)
In-Reply-To: <1334802036-16768-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/Makefile                         |    1 -
 arch/arm/plat-samsung/Kconfig                      |    5 +++++
 arch/arm/plat-samsung/Makefile                     |    1 +
 .../{plat-s5p/clock.c => plat-samsung/s5p-clock.c} |    3 +--
 4 files changed, 7 insertions(+), 3 deletions(-)
 rename arch/arm/{plat-s5p/clock.c => plat-samsung/s5p-clock.c} (99%)

diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 4953d50..8315210 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -12,7 +12,6 @@ obj-				:=
 
 # Core files
 
-obj-y				+= clock.o
 obj-y				+= irq.o
 obj-$(CONFIG_S5P_EXT_INT)	+= irq-eint.o
 obj-$(CONFIG_S5P_GPIO_INT)	+= irq-gpioint.o
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index a0ffc77d..4283765 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -58,6 +58,11 @@ config SAMSUNG_CLKSRC
 	  Select the clock code for the clksrc implementation
 	  used by newer systems such as the S3C64XX.
 
+config S5P_CLOCK
+	def_bool (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS)
+	help
+	  Support common clock part for ARCH_S5P and ARCH_EXYNOS SoCs
+
 # options for IRQ support
 
 config SAMSUNG_IRQ_VIC_TIMER
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 6012366..997ce10 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -17,6 +17,7 @@ obj-y				+= clock.o
 obj-y				+= pwm-clock.o
 
 obj-$(CONFIG_SAMSUNG_CLKSRC)	+= clock-clksrc.o
+obj-$(CONFIG_S5P_CLOCK)		+= s5p-clock.o
 
 obj-$(CONFIG_SAMSUNG_IRQ_VIC_TIMER) += irq-vic-timer.o
 
diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-samsung/s5p-clock.c
similarity index 99%
rename from arch/arm/plat-s5p/clock.c
rename to arch/arm/plat-samsung/s5p-clock.c
index f68a9bb..41d3dfd 100644
--- a/arch/arm/plat-s5p/clock.c
+++ b/arch/arm/plat-samsung/s5p-clock.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5p/clock.c
- *
+/*
  * Copyright 2009 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
-- 
1.7.2.3
