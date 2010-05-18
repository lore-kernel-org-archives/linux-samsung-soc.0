From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] ARM: Samsung: copy common I2C0 device helpers to machine
 directories
Date: Tue, 18 May 2010 12:23:35 +0200
Message-ID: <1274178216-12003-2-git-send-email-m.szyprowski@samsung.com>
References: <1274178216-12003-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:9521 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756388Ab0ERKXm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 06:23:42 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L2M008SL27GD470@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:23:40 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2M003AC27DGL@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:23:40 +0100 (BST)
In-reply-to: <1274178216-12003-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5p6440/Makefile                   |    1 +
 arch/arm/{plat-s5p => mach-s5p6440}/setup-i2c0.c |    2 +-
 arch/arm/mach-s5p6442/Makefile                   |    1 +
 arch/arm/{plat-s5p => mach-s5p6442}/setup-i2c0.c |    2 +-
 arch/arm/mach-s5pv210/Makefile                   |    1 +
 arch/arm/{plat-s5p => mach-s5pv210}/setup-i2c0.c |    2 +-
 arch/arm/plat-s5p/Makefile                       |    1 -
 7 files changed, 6 insertions(+), 4 deletions(-)
 copy arch/arm/{plat-s5p => mach-s5p6440}/setup-i2c0.c (92%)
 copy arch/arm/{plat-s5p => mach-s5p6442}/setup-i2c0.c (92%)
 rename arch/arm/{plat-s5p => mach-s5pv210}/setup-i2c0.c (92%)

diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/Makefile
index 1ad894b..9646cdf 100644
--- a/arch/arm/mach-s5p6440/Makefile
+++ b/arch/arm/mach-s5p6440/Makefile
@@ -13,6 +13,7 @@ obj-				:=
 # Core support for S5P6440 system
 
 obj-$(CONFIG_CPU_S5P6440)	+= cpu.o init.o clock.o gpio.o
+obj-$(CONFIG_CPU_S5P6440)	+= setup-i2c0.o
 
 # machine support
 
diff --git a/arch/arm/plat-s5p/setup-i2c0.c b/arch/arm/mach-s5p6440/setup-i2c0.c
similarity index 92%
copy from arch/arm/plat-s5p/setup-i2c0.c
copy to arch/arm/mach-s5p6440/setup-i2c0.c
index 67a66e0..69e8a66 100644
--- a/arch/arm/plat-s5p/setup-i2c0.c
+++ b/arch/arm/mach-s5p6440/setup-i2c0.c
@@ -1,4 +1,4 @@
-/* linux/arch/arm/plat-s5p/setup-i2c0.c
+/* linux/arch/arm/mach-s5p6440/setup-i2c0.c
  *
  * Copyright (c) 2009 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
diff --git a/arch/arm/mach-s5p6442/Makefile b/arch/arm/mach-s5p6442/Makefile
index dde39a6..4942c14 100644
--- a/arch/arm/mach-s5p6442/Makefile
+++ b/arch/arm/mach-s5p6442/Makefile
@@ -13,6 +13,7 @@ obj-				:=
 # Core support for S5P6442 system
 
 obj-$(CONFIG_CPU_S5P6442)	+= cpu.o init.o clock.o
+obj-$(CONFIG_CPU_S5P6442)	+= setup-i2c0.o
 
 # machine support
 
diff --git a/arch/arm/plat-s5p/setup-i2c0.c b/arch/arm/mach-s5p6442/setup-i2c0.c
similarity index 92%
copy from arch/arm/plat-s5p/setup-i2c0.c
copy to arch/arm/mach-s5p6442/setup-i2c0.c
index 67a66e0..662695d 100644
--- a/arch/arm/plat-s5p/setup-i2c0.c
+++ b/arch/arm/mach-s5p6442/setup-i2c0.c
@@ -1,4 +1,4 @@
-/* linux/arch/arm/plat-s5p/setup-i2c0.c
+/* linux/arch/arm/mach-s5p6442/setup-i2c0.c
  *
  * Copyright (c) 2009 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 8ebf51c..1a972a5 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -13,6 +13,7 @@ obj-				:=
 # Core support for S5PV210 system
 
 obj-$(CONFIG_CPU_S5PV210)	+= cpu.o init.o clock.o
+obj-$(CONFIG_CPU_S5PV210)	+= setup-i2c0.o
 
 # machine support
 
diff --git a/arch/arm/plat-s5p/setup-i2c0.c b/arch/arm/mach-s5pv210/setup-i2c0.c
similarity index 92%
rename from arch/arm/plat-s5p/setup-i2c0.c
rename to arch/arm/mach-s5pv210/setup-i2c0.c
index 67a66e0..9ec6845 100644
--- a/arch/arm/plat-s5p/setup-i2c0.c
+++ b/arch/arm/mach-s5pv210/setup-i2c0.c
@@ -1,4 +1,4 @@
-/* linux/arch/arm/plat-s5p/setup-i2c0.c
+/* linux/arch/arm/mach-s5pv210/setup-i2c0.c
  *
  * Copyright (c) 2009 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index a7c54b3..0ec09a9 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -16,4 +16,3 @@ obj-y				+= dev-uart.o
 obj-y				+= cpu.o
 obj-y				+= clock.o
 obj-y				+= irq.o
-obj-y				+= setup-i2c0.o
-- 
1.6.4
