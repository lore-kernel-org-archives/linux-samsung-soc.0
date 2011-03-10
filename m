From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM D-PHY
	control
Date: Thu, 10 Mar 2011 12:06:35 +0100
Message-ID: <1299755195-9055-4-git-send-email-s.nawrocki@samsung.com>
References: <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:30739 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751285Ab1CJLGp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Mar 2011 06:06:45 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LHU00LHD9J36660@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 11:06:41 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHU000HN9J2HB@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Mar 2011 11:06:39 +0000 (GMT)
In-reply-to: <002601cbdead$0f1cb840$2d5628c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Add common code for MIPI-CSIS and MIPI-DSIM drivers to support
their corresponding D-PHY's enable and reset control.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    4 +-
 arch/arm/mach-exynos4/include/mach/regs-pmu.h   |    5 ++
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    5 ++-
 arch/arm/plat-s5p/Kconfig                       |    5 ++
 arch/arm/plat-s5p/Makefile                      |    1 +
 arch/arm/plat-s5p/setup-mipiphy.c               |   63 +++++++++++++++++++++++
 6 files changed, 81 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/plat-s5p/setup-mipiphy.c

diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/arm/mach-exynos4/include/mach/regs-clock.h
index ba8f91c..38dee94 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
@@ -160,7 +160,9 @@
 #define S5P_CLKDIV_BUS_GPLR_SHIFT	(4)
 #define S5P_CLKDIV_BUS_GPLR_MASK	(0x7 << S5P_CLKDIV_BUS_GPLR_SHIFT)
 
-/* Compatibility defines */
+/* Compatibility defines and inclusion */
+
+#include <mach/regs-pmu.h>
 
 #define S5P_EPLL_CON			S5P_EPLL_CON0
 
diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
index 2ddd617..985416d 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
@@ -17,6 +17,11 @@
 
 #define S5P_PMUREG(x)			(S5P_VA_PMU + (x))
 
+#define S5P_MIPI_DPHY_CONTROL(n)	S5P_PMUREG(0x0710 + (n) * 4)
+#define S5P_MIPI_DPHY_ENABLE		(1 << 0)
+#define S5P_MIPI_DPHY_SRESETN		(1 << 1)
+#define S5P_MIPI_DPHY_MRESETN		(1 << 2)
+
 #define S5P_PMU_CAM_CONF		S5P_PMUREG(0x3C00)
 #define S5P_PMU_TV_CONF			S5P_PMUREG(0x3C20)
 #define S5P_PMU_MFC_CONF		S5P_PMUREG(0x3C40)
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
index 4c45b74..78925c5 100644
--- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
@@ -146,6 +146,10 @@
 #define S5P_OM_STAT		S5P_CLKREG(0xE100)
 #define S5P_USB_PHY_CONTROL	S5P_CLKREG(0xE80C)
 #define S5P_DAC_CONTROL		S5P_CLKREG(0xE810)
+#define S5P_MIPI_DPHY_CONTROL(x) S5P_CLKREG(0xE814)
+#define S5P_MIPI_DPHY_ENABLE	(1 << 0)
+#define S5P_MIPI_DPHY_SRESETN	(1 << 1)
+#define S5P_MIPI_DPHY_MRESETN	(1 << 2)
 
 #define S5P_INFORM0		S5P_CLKREG(0xF000)
 #define S5P_INFORM1		S5P_CLKREG(0xF004)
@@ -161,7 +165,6 @@
 #define S5P_MDNIE_SEL		S5P_CLKREG(0x7008)
 #define S5P_MIPI_PHY_CON0	S5P_CLKREG(0x7200)
 #define S5P_MIPI_PHY_CON1	S5P_CLKREG(0x7204)
-#define S5P_MIPI_DPHY_CONTROL	S5P_CLKREG(0xE814)
 
 #define S5P_IDLE_CFG_TL_MASK	(3 << 30)
 #define S5P_IDLE_CFG_TM_MASK	(3 << 28)
diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 6390ac7..834c77f 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -74,3 +74,8 @@ config S5P_DEV_CSIS1
 	bool
 	help
 	  Compile in platform device definitions for MIPI-CSIS channel 1
+
+config S5P_SETUP_MIPIPHY
+	bool
+	help
+	  Compile in common setup code for MIPI-CSIS and MIPI-DSIM devices.
diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
index 4bd5cf9..79ee7bb 100644
--- a/arch/arm/plat-s5p/Makefile
+++ b/arch/arm/plat-s5p/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_S5P_DEV_FIMC2)	+= dev-fimc2.o
 obj-$(CONFIG_S5P_DEV_ONENAND)	+= dev-onenand.o
 obj-$(CONFIG_S5P_DEV_CSIS0)	+= dev-csis0.o
 obj-$(CONFIG_S5P_DEV_CSIS1)	+= dev-csis1.o
+obj-$(CONFIG_S5P_SETUP_MIPIPHY)	+= setup-mipiphy.o
diff --git a/arch/arm/plat-s5p/setup-mipiphy.c b/arch/arm/plat-s5p/setup-mipiphy.c
new file mode 100644
index 0000000..a51a234
--- /dev/null
+++ b/arch/arm/plat-s5p/setup-mipiphy.c
@@ -0,0 +1,63 @@
+/*
+ * Copyright (C) 2011 Samsung Electronics Co., Ltd
+ *
+ * S5P - Helper functions for MIPI-CSIS and MIPI-DSIM D-PHY control
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
+#include <mach/regs-clock.h>
+
+static int __s5p_mipi_phy_control(struct platform_device *pdev,
+				  bool on, u32 reset)
+{
+	static DEFINE_SPINLOCK(lock);
+	void __iomem *addr;
+	unsigned long flags;
+	int pid;
+	u32 cfg;
+
+	if (!pdev)
+		return -EINVAL;
+
+	pid = (pdev->id == -1) ? 0 : pdev->id;
+
+	if (pid != 0 && pid != 1)
+		return -EINVAL;
+
+	addr = S5P_MIPI_DPHY_CONTROL(pid);
+
+	spin_lock_irqsave(&lock, flags);
+
+	cfg = __raw_readl(addr);
+	cfg = on ? (cfg | reset) : (cfg & ~reset);
+	__raw_writel(cfg, addr);
+
+	if (on) {
+		cfg |= S5P_MIPI_DPHY_ENABLE;
+	} else if (!(cfg & (S5P_MIPI_DPHY_SRESETN |
+			    S5P_MIPI_DPHY_MRESETN) & ~reset)) {
+		cfg &= ~S5P_MIPI_DPHY_ENABLE;
+	}
+
+	__raw_writel(cfg, addr);
+	spin_unlock_irqrestore(&lock, flags);
+
+	return 0;
+}
+
+int s5p_csis_phy_enable(struct platform_device *pdev, bool on)
+{
+	return __s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_SRESETN);
+}
+
+int s5p_dsim_phy_enable(struct platform_device *pdev, bool on)
+{
+	return __s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_MRESETN);
+}
-- 
1.7.4.1
