From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 4/8] ARM: Samsung: Add common Aquila and GONI code
Date: Fri, 23 Jul 2010 18:21:19 +0200
Message-ID: <1279902083-21250-5-git-send-email-s.nawrocki@samsung.com>
References: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31055 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752727Ab0GWQVr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 12:21:47 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6000LIVQRZEZ@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:35 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L60002K7QRZKK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:35 +0100 (BST)
In-reply-to: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Pawel Osciak <p.osciak@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig              |    5 ++++
 arch/arm/mach-s5pv210/Makefile             |    2 +
 arch/arm/mach-s5pv210/common-aquila-goni.c |   35 ++++++++++++++++++++++++++++
 arch/arm/mach-s5pv210/common-aquila-goni.h |    2 +
 4 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/common-aquila-goni.c
 create mode 100644 arch/arm/mach-s5pv210/common-aquila-goni.h

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 12a2c6b..039ba8c 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -90,6 +90,11 @@ config MACH_SMDKC110
 
 endmenu
 
+config COMMON_AQUILA_GONI
+	bool
+	help
+	  Compile common code for Samsung Aquila and Samsung GONI machines
+
 config S5PC110_DEV_ONENAND
 	bool
 	help
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 05048c5..a4c0bc9 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -22,6 +22,8 @@ obj-$(CONFIG_MACH_SMDKV210)	+= mach-smdkv210.o
 obj-$(CONFIG_MACH_SMDKC110)	+= mach-smdkc110.o
 obj-$(CONFIG_MACH_GONI)		+= mach-goni.o
 
+obj-$(CONFIG_COMMON_AQUILA_GONI)	+= common-aquila-goni.o
+
 # device support
 
 obj-y				+= dev-audio.o
diff --git a/arch/arm/mach-s5pv210/common-aquila-goni.c b/arch/arm/mach-s5pv210/common-aquila-goni.c
new file mode 100644
index 0000000..4d72531
--- /dev/null
+++ b/arch/arm/mach-s5pv210/common-aquila-goni.c
@@ -0,0 +1,35 @@
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <plat/fimc.h>
+
+#include "common-aquila-goni.h"
+
+void __init s5pv210_common_fimc_clk_init(void)
+{
+	int i;
+	struct clk *clk_fimc, *parent;
+
+	struct device *fimc_devs[] = {
+		&s5p_device_fimc0.dev,
+		&s5p_device_fimc1.dev,
+		&s5p_device_fimc2.dev
+	};
+
+	parent = clk_get(NULL, "mout_epll");
+	if (IS_ERR(parent))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(fimc_devs); i++) {
+		if (fimc_devs[i]) {
+			clk_fimc = clk_get(fimc_devs[i], "sclk_fimc");
+
+			if (IS_ERR(clk_fimc))
+				continue;
+
+			clk_set_parent(clk_fimc, parent);
+			clk_set_rate(clk_fimc, 133000000);
+			clk_enable(clk_fimc);
+		}
+	}
+	clk_put(parent);
+}
diff --git a/arch/arm/mach-s5pv210/common-aquila-goni.h b/arch/arm/mach-s5pv210/common-aquila-goni.h
new file mode 100644
index 0000000..f666462
--- /dev/null
+++ b/arch/arm/mach-s5pv210/common-aquila-goni.h
@@ -0,0 +1,2 @@
+
+extern void s5pv210_common_fimc_clk_init(void);
-- 
1.7.2
