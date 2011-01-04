From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 2/3] ARM: S5PV310: Add a platform helper for MIPI DSIM/CSIS
 setup
Date: Tue, 04 Jan 2011 16:09:23 +0100
Message-ID: <1294153764-25006-3-git-send-email-s.nawrocki@samsung.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38600 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752089Ab1ADPJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 10:09:31 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LEI008407FSIDA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LEI005CF7FS9J@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
In-reply-to: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

MIPI_PHYn_CONTROL registers are shared between MIPI DSIM
and MIPI CSIS drivers so a spinlock is used to protect multiple
access to these registers. Also a proper state of a common
PHY enable bit is maintained in order to avoid a DSIM
and CSIS driver conflict.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv310/Kconfig                 |    6 ++
 arch/arm/mach-s5pv310/Makefile                |    2 +
 arch/arm/mach-s5pv310/include/mach/map.h      |    7 +--
 arch/arm/mach-s5pv310/include/mach/regs-pmu.h |    6 ++
 arch/arm/mach-s5pv310/setup-mipi.c            |   62 +++++++++++++++++++++++++
 5 files changed, 79 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/setup-mipi.c

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index b7aa3cd..2420076 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -15,6 +15,11 @@ config CPU_S5PV310
 	help
 	  Enable S5PV310 CPU support
 
+config S5PV310_SETUP_MIPI
+	bool
+	help
+	  Common setup code for MIPI CSIS/DSIM channels 0 and 1.
+
 config S5PV310_DEV_PD
 	bool
 	help
@@ -96,6 +101,7 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_HSMMC3
 	select S5PV310_SETUP_SDHCI
 	select S3C_DEV_I2C1
+	select S5PV310_SETUP_MIPI
 	select S5PV310_SETUP_I2C1
 	help
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
diff --git a/arch/arm/mach-s5pv310/Makefile b/arch/arm/mach-s5pv310/Makefile
index 651f193..7f1b89b 100644
--- a/arch/arm/mach-s5pv310/Makefile
+++ b/arch/arm/mach-s5pv310/Makefile
@@ -29,6 +29,8 @@ obj-$(CONFIG_MACH_UNIVERSAL_C210)	+= mach-universal_c210.o
 # device support
 
 obj-y					+= dev-audio.o
+
+obj-$(CONFIG_S5PV310_SETUP_MIPI)	+= setup-mipi.o
 obj-$(CONFIG_S5PV310_DEV_PD)		+= dev-pd.o
 
 obj-$(CONFIG_S5PV310_SETUP_I2C1)	+= setup-i2c1.o
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 33bcff2..6635287 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -65,8 +65,7 @@
 #define S5PV310_PA_GPIO2		(0x11000000)
 #define S5PV310_PA_GPIO3		(0x03860000)
 
-#define S5PV310_PA_MIPI_CSIS0		0x11880000
-#define S5PV310_PA_MIPI_CSIS1		0x11890000
+#define S5PV310_PA_MIPI_CSIS(x)		(0x11880000 + ((x) * 0x10000))
 
 #define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 
@@ -124,7 +123,7 @@
 #define S3C_PA_IIC7			S5PV310_PA_IIC(7)
 #define S3C_PA_RTC			S5PV310_PA_RTC
 #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
-#define S5P_PA_MIPI_CSIS0		S5PV310_PA_MIPI_CSIS0
-#define S5P_PA_MIPI_CSIS1		S5PV310_PA_MIPI_CSIS1
+#define S5P_PA_MIPI_CSIS0		S5PV310_PA_MIPI_CSIS(0)
+#define S5P_PA_MIPI_CSIS1		S5PV310_PA_MIPI_CSIS(1)
 
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-s5pv310/include/mach/regs-pmu.h b/arch/arm/mach-s5pv310/include/mach/regs-pmu.h
index fb333d0..bef8102 100644
--- a/arch/arm/mach-s5pv310/include/mach/regs-pmu.h
+++ b/arch/arm/mach-s5pv310/include/mach/regs-pmu.h
@@ -27,4 +27,10 @@
 
 #define S5P_INT_LOCAL_PWR_EN		0x7
 
+#define S5P_MIPI_PHY0_CONTROL		S5P_PMUREG(0x0710)
+#define S5P_MIPI_PHY1_CONTROL		S5P_PMUREG(0x0714)
+#define S5P_MIPI_PHY_ENABLE		(1 << 0)
+#define S5P_MIPI_PHY_SRESETN		(1 << 1)
+#define S5P_MIPI_PHY_MRESETN		(1 << 2)
+
 #endif /* __ASM_ARCH_REGS_PMU_H */
diff --git a/arch/arm/mach-s5pv310/setup-mipi.c b/arch/arm/mach-s5pv310/setup-mipi.c
new file mode 100644
index 0000000..fc91a29
--- /dev/null
+++ b/arch/arm/mach-s5pv310/setup-mipi.c
@@ -0,0 +1,62 @@
+/* linux/arch/arm/mach-s5pv310/setup-mipi.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd
+ *
+ * S5PV310 - Helper functions for MIPI CSIS/DSIM PHY control
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/spinlock.h>
+#include <mach/regs-pmu.h>
+
+/* Global MIPI CSIS or DSIM PHY enable and reset control. */
+static int s5p_mipi_phy_control(struct platform_device *pdev, bool on, u32 rst)
+{
+	static DEFINE_SPINLOCK(lock);
+	void __iomem *addr;
+	unsigned long flags;
+	int pid;
+	u32 cfg;
+
+	if (pdev == NULL)
+		return -EINVAL;
+
+	pid = pdev->id;
+	if (pid != 0 && pid != 1)
+		return -EINVAL;
+
+	addr = pid ? S5P_MIPI_PHY1_CONTROL : S5P_MIPI_PHY0_CONTROL;
+
+	spin_lock_irqsave(&lock, flags);
+
+	cfg = __raw_readl(addr) & ~rst;
+	if (on)
+		cfg |= rst;
+	__raw_writel(cfg, addr);
+
+	if (on)
+		cfg |= S5P_MIPI_PHY_ENABLE;
+	else if (!(cfg & (S5P_MIPI_PHY_SRESETN | S5P_MIPI_PHY_MRESETN) & ~rst))
+		cfg &= ~S5P_MIPI_PHY_ENABLE;
+
+	__raw_writel(cfg, addr);
+
+	spin_unlock_irqrestore(&lock, flags);
+	return 0;
+}
+
+int s5p_csis_phy_enable(struct platform_device *pdev, bool on)
+{
+	return s5p_mipi_phy_control(pdev, on, S5P_MIPI_PHY_SRESETN);
+}
+
+int s5p_dsim_phy_enable(struct platform_device *pdev, bool on)
+{
+	return s5p_mipi_phy_control(pdev, on, S5P_MIPI_PHY_MRESETN);
+}
-- 
1.7.3.4
