From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] ARM: SAMSUNG: Add idle support
Date: Mon, 11 Jan 2010 12:21:53 +0900
Message-ID: <1263180113-31605-3-git-send-email-kgene.kim@samsung.com>
References: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com>
 <1263180113-31605-2-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51274 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760Ab0AKD20 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2010 22:28:26 -0500
In-Reply-To: <1263180113-31605-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

This patch adds common idle functionality for all Samsung SoC's.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/plat-samsung/include/mach/idle.h   |   18 +++++++++++++
 arch/arm/plat-samsung/include/mach/system.h |   36 +++++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/mach/idle.h
 create mode 100644 arch/arm/plat-samsung/include/mach/system.h

diff --git a/arch/arm/plat-samsung/include/mach/idle.h b/arch/arm/plat-samsung/include/mach/idle.h
new file mode 100644
index 0000000..f3b5034
--- /dev/null
+++ b/arch/arm/plat-samsung/include/mach/idle.h
@@ -0,0 +1,18 @@
+/* linux/arch/arm/plat-samsung/include/mach/idle.h
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Idle support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_IDLE_H
+#define __ASM_PLAT_IDLE_H __FILE__
+
+extern void (*s3c_idle_fn)(void);
+
+#endif /* __ASM_PLAT_IDLE_H */
diff --git a/arch/arm/plat-samsung/include/mach/system.h b/arch/arm/plat-samsung/include/mach/system.h
new file mode 100644
index 0000000..5377792
--- /dev/null
+++ b/arch/arm/plat-samsung/include/mach/system.h
@@ -0,0 +1,36 @@
+/* linux/arch/arm/plat-samsung/include/mach/idle.h
+ *
+ * Copyright (c) 2009 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Idle support
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_SYSTEM_H
+#define __ASM_PLAT_SYSTEM_H __FILE__
+
+void (*s3c_idle_fn)(void);
+
+static void s3c_default_idle(void)
+{
+	/* nothing here yet */
+}
+
+static void arch_idle(void)
+{
+	if (s3c_idle_fn != NULL)
+		(s3c_idle_fn)();
+	else
+		s3c_default_idle();
+}
+
+static void arch_reset(char mode, const char *cmd)
+{
+	/* nothing here yet */
+}
+
+#endif /* __ASM_PLAT_SYSTEM_H */
-- 
1.6.2.5
