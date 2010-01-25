From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Move debug-macro support
Date: Mon, 25 Jan 2010 11:38:08 +0900
Message-ID: <1264387088-22949-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47631 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752974Ab0AYCqa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 21:46:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch moves debug-macro support common functions for S5P into
plat-s5p/include/mach from mach-s5p6440/include/mach.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p6440/include/mach/debug-macro.S |   37 --------------------
 arch/arm/plat-s5p/include/mach/debug-macro.S     |   39 ++++++++++++++++++++++
 2 files changed, 39 insertions(+), 37 deletions(-)
 delete mode 100644 arch/arm/mach-s5p6440/include/mach/debug-macro.S
 create mode 100644 arch/arm/plat-s5p/include/mach/debug-macro.S

diff --git a/arch/arm/mach-s5p6440/include/mach/debug-macro.S b/arch/arm/mach-s5p6440/include/mach/debug-macro.S
deleted file mode 100644
index f3a5d16..0000000
--- a/arch/arm/mach-s5p6440/include/mach/debug-macro.S
+++ /dev/null
@@ -1,37 +0,0 @@
-/* linux/arch/arm/mach-s5p6440/include/mach/debug-macro.S
- *
- * Copyright (c) 2009 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-/* pull in the relevant register and map files. */
-
-#include <mach/map.h>
-#include <plat/regs-serial.h>
-
-	/* note, for the boot process to work we have to keep the UART
-	 * virtual address aligned to an 1MiB boundary for the L1
-	 * mapping the head code makes. We keep the UART virtual address
-	 * aligned and add in the offset when we load the value here.
-	 */
-
-	.macro addruart, rx
-		mrc	p15, 0, \rx, c1, c0
-		tst	\rx, #1
-		ldreq	\rx, = S5P_PA_UART
-		ldrne	\rx, = (S5P_VA_UART + S5P_PA_UART & 0xfffff)
-#if CONFIG_DEBUG_S3C_UART != 0
-		add	\rx, \rx, #(0x400 * CONFIG_DEBUG_S3C_UART)
-#endif
-	.endm
-
-/* include the reset of the code which will do the work, we're only
- * compiling for a single cpu processor type so the default of s3c2440
- * will be fine with us.
- */
-
-#include <plat/debug-macro.S>
diff --git a/arch/arm/plat-s5p/include/mach/debug-macro.S b/arch/arm/plat-s5p/include/mach/debug-macro.S
new file mode 100644
index 0000000..446b9f0
--- /dev/null
+++ b/arch/arm/plat-s5p/include/mach/debug-macro.S
@@ -0,0 +1,39 @@
+/* linux/arch/arm/mach-s5p6440/include/mach/debug-macro.S
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Based on arch/arm/mach-s3c6400/include/mach/debug-macro.S
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+/* pull in the relevant register and map files. */
+
+#include <mach/map.h>
+#include <plat/regs-serial.h>
+
+	/* note, for the boot process to work we have to keep the UART
+	 * virtual address aligned to an 1MiB boundary for the L1
+	 * mapping the head code makes. We keep the UART virtual address
+	 * aligned and add in the offset when we load the value here.
+	 */
+
+	.macro addruart, rx
+		mrc	p15, 0, \rx, c1, c0
+		tst	\rx, #1
+		ldreq	\rx, = S5P_PA_UART
+		ldrne	\rx, = (S5P_VA_UART + S5P_PA_UART & 0xfffff)
+#if CONFIG_DEBUG_S3C_UART != 0
+		add	\rx, \rx, #(0x400 * CONFIG_DEBUG_S3C_UART)
+#endif
+	.endm
+
+/* include the reset of the code which will do the work, we're only
+ * compiling for a single cpu processor type so the default of s3c2440
+ * will be fine with us.
+ */
+
+#include <plat/debug-macro.S>
-- 
1.6.2.5
