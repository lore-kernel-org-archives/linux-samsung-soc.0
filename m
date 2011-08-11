From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/4] ARM: EXYNOS4: Support for generic Clock manipulation PM
 callbacks
Date: Thu, 11 Aug 2011 13:55:17 +0900
Message-ID: <4E4360B5.3050203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17630 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984Ab1HKEzk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Aug 2011 00:55:40 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPQ00H8KZ0IC420@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 13:55:40 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPQ00CZLZ0SBG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 13:55:40 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Makefile     |    2 +-
 arch/arm/mach-exynos4/pm-runtime.c |   56 ++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 arch/arm/mach-exynos4/pm-runtime.c

diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefile
index 97c31ce..28cdb8b 100644
--- a/arch/arm/mach-exynos4/Makefile
+++ b/arch/arm/mach-exynos4/Makefile
@@ -5,7 +5,7 @@
 #
 # Licensed under GPLv2
 
-obj-y				:=
+obj-y				:= pm-runtime.o
 obj-m				:=
 obj-n				:=
 obj-				:=
diff --git a/arch/arm/mach-exynos4/pm-runtime.c b/arch/arm/mach-exynos4/pm-runtime.c
new file mode 100644
index 0000000..4fe9f73
--- /dev/null
+++ b/arch/arm/mach-exynos4/pm-runtime.c
@@ -0,0 +1,56 @@
+/* linux/arch/arm/mach-exynos4/pm-runtime.c
+
+ * Exynos4210 Power management support
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/bitmap.h>
+#include <linux/slab.h>
+
+#ifdef CONFIG_PM_RUNTIME
+
+static int default_platform_runtime_idle(struct device *dev)
+{
+	return pm_runtime_suspend(dev);
+}
+
+static struct dev_pm_domain default_pm_domain = {
+	.ops = {
+		.runtime_suspend = pm_clk_suspend,
+		.runtime_resume = pm_clk_resume,
+		.runtime_idle = default_platform_runtime_idle,
+		USE_PLATFORM_PM_SLEEP_OPS
+	},
+};
+
+#define DEFAULT_PM_DOMAIN_PTR	(&default_pm_domain)
+
+#else
+
+#define DEFAULT_PM_DOMAIN_PTR	NULL
+
+#endif /* CONFIG_PM_RUNTIME */
+
+static struct pm_clk_notifier_block platform_bus_notifier = {
+	.pm_domain = DEFAULT_PM_DOMAIN_PTR,
+	.con_ids = { NULL, },
+};
+
+static int __init exynos4_pm_runtime_init(void)
+{
+	pm_clk_add_notifier(&platform_bus_type, &platform_bus_notifier);
+	return 0;
+}
+core_initcall(exynos4_pm_runtime_init);
-- 
1.7.0.4
