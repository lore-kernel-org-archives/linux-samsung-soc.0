From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Bug fix on errors of build with CONFIG_PREEMPT_NONE
Date: Wed, 15 Sep 2010 08:41:33 +0900
Message-ID: <1284507693-12156-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41415 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752400Ab0INX61 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Sep 2010 19:58:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Seung-Chull Suh <sc.suh@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Seung-Chull Suh <sc.suh@samsung.com>

This patch adds header <linux/sched.h> into the below files for build with
CONFIG_PREEMPT_NONE.

arch/arm/mach-s5p6442/cpu.c
arch/arm/mach-s5p64x0/cpu.c
arch/arm/mach-s5pc100/cpu.c
arch/arm/mach-s5pv210/cpu.c

Following is error message of in case of s5pv210_defconfig with CONFIG_PREEMPT_NONE.

arch/arm/mach-s5pv210/cpu.c:91: error: implicit declaration of function 'need_resched'

Signed-off-by: Seung-Chull Suh <sc.suh@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6442/cpu.c |    1 +
 arch/arm/mach-s5p64x0/cpu.c |    1 +
 arch/arm/mach-s5pc100/cpu.c |    1 +
 arch/arm/mach-s5pv210/cpu.c |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p6442/cpu.c b/arch/arm/mach-s5p6442/cpu.c
index d3ab268..842af86 100644
--- a/arch/arm/mach-s5p6442/cpu.c
+++ b/arch/arm/mach-s5p6442/cpu.c
@@ -19,6 +19,7 @@
 #include <linux/sysdev.h>
 #include <linux/serial_core.h>
 #include <linux/platform_device.h>
+#include <linux/sched.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index fb90a30..2f244db 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -19,6 +19,7 @@
 #include <linux/sysdev.h>
 #include <linux/serial_core.h>
 #include <linux/platform_device.h>
+#include <linux/sched.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-s5pc100/cpu.c b/arch/arm/mach-s5pc100/cpu.c
index d13552c..fd2708e 100644
--- a/arch/arm/mach-s5pc100/cpu.c
+++ b/arch/arm/mach-s5pc100/cpu.c
@@ -24,6 +24,7 @@
 #include <linux/sysdev.h>
 #include <linux/serial_core.h>
 #include <linux/platform_device.h>
+#include <linux/sched.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index c551ab1..2f16bfc 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/sysdev.h>
 #include <linux/platform_device.h>
+#include <linux/sched.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-- 
1.6.2.5
