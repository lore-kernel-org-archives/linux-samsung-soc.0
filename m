From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 3/5] ARM: EXYNOS: Add support for secure monitor calls
Date: Thu, 13 Sep 2012 10:13:36 +0200
Message-ID: <1347524018-19301-4-git-send-email-t.figa@samsung.com>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12903 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752775Ab2IMIOU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Sep 2012 04:14:20 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAA00L2C46GO2V0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:14:12 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAA00F0A477MEF1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Sep 2012 17:14:12 +0900 (KST)
In-reply-to: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, t.figa@samsung.com

Some boards use secure monitor calls to communicate with secure
firmware.

This patch adds exynos_smc function which uses smc assembly instruction
to do secure monitor calls.

This is a follow-up on the patch by Kyungmin Park:
[PATCH v5 2/2] ARM: EXYNOS: SMC instruction (aka firmware) support
http://thread.gmane.org/gmane.linux.ports.arm.kernel/183608/focus=184109

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/Makefile     |  5 +++++
 arch/arm/mach-exynos/exynos-smc.S | 22 ++++++++++++++++++++++
 arch/arm/mach-exynos/smc.h        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 arch/arm/mach-exynos/exynos-smc.S
 create mode 100644 arch/arm/mach-exynos/smc.h

diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index ee7fde9..997864b 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -30,6 +30,11 @@ obj-$(CONFIG_EXYNOS4_MCT)	+= mct.o
 
 obj-$(CONFIG_HOTPLUG_CPU)	+= hotplug.o
 
+obj-$(CONFIG_ARCH_EXYNOS)	+= exynos-smc.o
+
+plus_sec := $(call as-instr,.arch_extension sec,+sec)
+AFLAGS_exynos-smc.o		:=-Wa,-march=armv7-a$(plus_sec)
+
 # machine support
 
 obj-$(CONFIG_MACH_SMDKC210)		+= mach-smdkv310.o
diff --git a/arch/arm/mach-exynos/exynos-smc.S b/arch/arm/mach-exynos/exynos-smc.S
new file mode 100644
index 0000000..2e27aa3
--- /dev/null
+++ b/arch/arm/mach-exynos/exynos-smc.S
@@ -0,0 +1,22 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics.
+ *
+ * Copied from omap-smc.S Copyright (C) 2010 Texas Instruments, Inc.
+ *
+ * This program is free software,you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/linkage.h>
+
+/*
+ * Function signature: void exynos_smc(u32 cmd, u32 arg1, u32 arg2, u32 arg3)
+ */
+
+ENTRY(exynos_smc)
+	stmfd	sp!, {r4-r11, lr}
+	dsb
+	smc	#0
+	ldmfd	sp!, {r4-r11, pc}
+ENDPROC(exynos_smc)
diff --git a/arch/arm/mach-exynos/smc.h b/arch/arm/mach-exynos/smc.h
new file mode 100644
index 0000000..e972390
--- /dev/null
+++ b/arch/arm/mach-exynos/smc.h
@@ -0,0 +1,31 @@
+/*
+ *  Copyright (c) 2012 Samsung Electronics.
+ *
+ * EXYNOS - SMC Call
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __ASM_ARCH_EXYNOS_SMC_H
+#define __ASM_ARCH_EXYNOS_SMC_H
+
+#define SMC_CMD_INIT            (-1)
+#define SMC_CMD_INFO            (-2)
+/* For Power Management */
+#define SMC_CMD_SLEEP           (-3)
+#define SMC_CMD_CPU1BOOT        (-4)
+#define SMC_CMD_CPU0AFTR        (-5)
+/* For CP15 Access */
+#define SMC_CMD_C15RESUME       (-11)
+/* For L2 Cache Access */
+#define SMC_CMD_L2X0CTRL        (-21)
+#define SMC_CMD_L2X0SETUP1      (-22)
+#define SMC_CMD_L2X0SETUP2      (-23)
+#define SMC_CMD_L2X0INVALL      (-24)
+#define SMC_CMD_L2X0DEBUG       (-25)
+
+extern void exynos_smc(u32 cmd, u32 arg1, u32 arg2, u32 arg3);
+
+#endif
-- 
1.7.12
