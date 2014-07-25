From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: move <mach/regs-clock.h> into mach-s5pv210/
Date: Fri, 25 Jul 2014 13:40:23 +0900
Message-ID: <1406263223-3646-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19072 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbaGYEjk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 00:39:40 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N99006VZ3M3U0D0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jul 2014 13:39:39 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This moves <mach/regs-clock.h> into mach-s5pv210 so no more
include/mach/ under mach-s5pv210.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-s5pv210/pm.c                            | 3 +--
 arch/arm/mach-s5pv210/{include/mach => }/regs-clock.h | 3 +--
 arch/arm/mach-s5pv210/s5pv210.c                       | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)
 rename arch/arm/mach-s5pv210/{include/mach => }/regs-clock.h (99%)

diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
index 123163d..21b4b13 100644
--- a/arch/arm/mach-s5pv210/pm.c
+++ b/arch/arm/mach-s5pv210/pm.c
@@ -24,9 +24,8 @@
 
 #include <plat/pm-common.h>
 
-#include <mach/regs-clock.h>
-
 #include "common.h"
+#include "regs-clock.h"
 
 static struct sleep_save s5pv210_core_save[] = {
 	/* Clock ETC */
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/regs-clock.h
similarity index 99%
rename from arch/arm/mach-s5pv210/include/mach/regs-clock.h
rename to arch/arm/mach-s5pv210/regs-clock.h
index b14ffcd..4640f0f 100644
--- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv210/regs-clock.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/mach-s5pv210/include/mach/regs-clock.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
diff --git a/arch/arm/mach-s5pv210/s5pv210.c b/arch/arm/mach-s5pv210/s5pv210.c
index 53feff3..43eb1ea 100644
--- a/arch/arm/mach-s5pv210/s5pv210.c
+++ b/arch/arm/mach-s5pv210/s5pv210.c
@@ -18,9 +18,9 @@
 #include <asm/system_misc.h>
 
 #include <plat/map-base.h>
-#include <mach/regs-clock.h>
 
 #include "common.h"
+#include "regs-clock.h"
 
 static int __init s5pv210_fdt_map_sys(unsigned long node, const char *uname,
 					int depth, void *data)
-- 
2.0.0
