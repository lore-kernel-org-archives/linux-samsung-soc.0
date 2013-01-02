From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 05/26] ARM: S5P64X0: move s5p64x0-clock.h into local directory
Date: Wed, 02 Jan 2013 14:23:42 -0800
Message-ID: <1357165443-3716-6-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27486 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752707Ab3ABWYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:24:43 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000LLVRKZPW30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:41 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:24:41 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

The <mach/s5p64x0-clock.h> can be moved into mach-s5p64x0/.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/clock-s5p6440.c                         |    2 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c                         |    2 +-
 .../mach-s5p64x0/{include/mach/s5p64x0-clock.h => clock.h}    |    9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)
 rename arch/arm/mach-s5p64x0/{include/mach/s5p64x0-clock.h => clock.h} (87%)

diff --git a/arch/arm/mach-s5p64x0/clock-s5p6440.c b/arch/arm/mach-s5p64x0/clock-s5p6440.c
index 5112371..35378152 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6440.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6440.c
@@ -23,7 +23,6 @@
 #include <mach/hardware.h>
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/s5p64x0-clock.h>
 
 #include <plat/cpu-freq.h>
 #include <plat/clock.h>
@@ -32,6 +31,7 @@
 #include <plat/s5p-clock.h>
 #include <plat/clock-clksrc.h>
 
+#include "clock.h"
 #include "common.h"
 
 static u32 epll_div[][5] = {
diff --git a/arch/arm/mach-s5p64x0/clock-s5p6450.c b/arch/arm/mach-s5p64x0/clock-s5p6450.c
index 154dea7..af384dd 100644
--- a/arch/arm/mach-s5p64x0/clock-s5p6450.c
+++ b/arch/arm/mach-s5p64x0/clock-s5p6450.c
@@ -23,7 +23,6 @@
 #include <mach/hardware.h>
 #include <mach/map.h>
 #include <mach/regs-clock.h>
-#include <mach/s5p64x0-clock.h>
 
 #include <plat/cpu-freq.h>
 #include <plat/clock.h>
@@ -32,6 +31,7 @@
 #include <plat/s5p-clock.h>
 #include <plat/clock-clksrc.h>
 
+#include "clock.h"
 #include "common.h"
 
 static struct clksrc_clk clk_mout_dpll = {
diff --git a/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h b/arch/arm/mach-s5p64x0/clock.h
similarity index 87%
rename from arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h
rename to arch/arm/mach-s5p64x0/clock.h
index 0ef47d1..28b8e3c 100644
--- a/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h
+++ b/arch/arm/mach-s5p64x0/clock.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/mach-s5p64x0/include/mach/s5p64x0-clock.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
@@ -10,8 +9,8 @@
  * published by the Free Software Foundation.
 */
 
-#ifndef __ASM_ARCH_CLOCK_H
-#define __ASM_ARCH_CLOCK_H __FILE__
+#ifndef __MACH_S5P64X0_CLOCK_H
+#define __MACH_S5P64X0_CLOCK_H __FILE__
 
 #include <linux/clk.h>
 
@@ -36,4 +35,4 @@ extern int s5p64x0_mem_ctrl(struct clk *clk, int enable);
 
 extern int s5p64x0_clk48m_ctrl(struct clk *clk, int enable);
 
-#endif /* __ASM_ARCH_CLOCK_H */
+#endif /* __MACH_S5P64X0_CLOCK_H */
-- 
1.7.10.4
