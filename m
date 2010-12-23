From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/7] ARM: S5PV310: Add DMC registers and map_desc
Date: Thu, 23 Dec 2010 14:49:53 +0900
Message-ID: <1293083397-15969-4-git-send-email-kgene.kim@samsung.com>
References: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:56536 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418Ab0LWGHu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 01:07:50 -0500
In-Reply-To: <1293083397-15969-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Sunyoung Kang <sy0816.kang@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Sunyoung Kang <sy0816.kang@samsung.com>

This patch adds DMC io mapping for access it and adds registers.
This is used in checking DRAM memory type.

Signed-off-by: Sunyoung Kang <sy0816.kang@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv310/cpu.c                   |    5 +++++
 arch/arm/mach-s5pv310/include/mach/map.h      |    2 ++
 arch/arm/mach-s5pv310/include/mach/regs-mem.h |   23 +++++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/include/mach/regs-mem.h

diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
index 82ce4aa..283dd75 100644
--- a/arch/arm/mach-s5pv310/cpu.c
+++ b/arch/arm/mach-s5pv310/cpu.c
@@ -73,6 +73,11 @@ static struct map_desc s5pv310_iodesc[] __initdata = {
 		.length		= SZ_256,
 		.type		= MT_DEVICE,
 	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC0,
+		.pfn		= __phys_to_pfn(S5PV310_PA_DMC0),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	}, {
 		.virtual	= (unsigned long)S3C_VA_UART,
 		.pfn		= __phys_to_pfn(S3C_PA_UART),
 		.length		= SZ_512K,
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 7acf4e7..37294f1 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -44,6 +44,8 @@
 #define S5PV310_PA_WATCHDOG		(0x10060000)
 #define S5PV310_PA_RTC			(0x10070000)
 
+#define S5PV310_PA_DMC0			(0x10400000)
+
 #define S5PV310_PA_COMBINER		(0x10448000)
 
 #define S5PV310_PA_COREPERI		(0x10500000)
diff --git a/arch/arm/mach-s5pv310/include/mach/regs-mem.h b/arch/arm/mach-s5pv310/include/mach/regs-mem.h
new file mode 100644
index 0000000..8342271
--- /dev/null
+++ b/arch/arm/mach-s5pv310/include/mach/regs-mem.h
@@ -0,0 +1,23 @@
+/* linux/arch/arm/mach-s5pv310/include/mach/regs-mem.h
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * S5PV310 - SROMC and DMC register definitions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_ARCH_REGS_MEM_H
+#define __ASM_ARCH_REGS_MEM_H __FILE__
+
+#include <mach/map.h>
+
+#define S5P_DMC0_MEMCON_OFFSET		0x04
+
+#define S5P_DMC0_MEMTYPE_SHIFT		8
+#define S5P_DMC0_MEMTYPE_MASK		0xF
+
+#endif /* __ASM_ARCH_REGS_MEM_H */
-- 
1.6.2.5
