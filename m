From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC 3/3] ARM: S5PV210: Add a platform helper for MIPI DSIM/CSIS
 setup
Date: Tue, 04 Jan 2011 16:09:24 +0100
Message-ID: <1294153764-25006-4-git-send-email-s.nawrocki@samsung.com>
References: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:21619 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752060Ab1ADPJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jan 2011 10:09:31 -0500
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LEI00BB17FSG6@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LEI005JS7FSR4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jan 2011 15:09:28 +0000 (GMT)
In-reply-to: <1294153764-25006-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

This platform callback allows the MIPI DSIM and CSIS drivers
to control their corresponding PHYs without conflicts.
This patch also enables the MIPI setup code on Aquila board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig                   |    6 +++
 arch/arm/mach-s5pv210/Makefile                  |    1 +
 arch/arm/mach-s5pv210/include/mach/regs-clock.h |    4 ++
 arch/arm/mach-s5pv210/setup-mipi.c              |   52 +++++++++++++++++++++++
 4 files changed, 63 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5pv210/setup-mipi.c

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 53aabef..b93ea37 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -37,6 +37,11 @@ config S5PV210_SETUP_FB_24BPP
 	help
           Common setup code for S5PV210 with an 24bpp RGB display helper.
 
+config S5PV210_SETUP_MIPI
+	bool
+	help
+	  Common setup code for S5PV210 MIPI DSIM/CSIS configuration.
+
 config S5PV210_SETUP_KEYPAD
 	bool
 	help
@@ -62,6 +67,7 @@ config MACH_AQUILA
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
+	select S5PV210_SETUP_MIPI
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index ff1a0db..fd01315 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -31,6 +31,7 @@ obj-y				+= dev-audio.o
 obj-$(CONFIG_S3C64XX_DEV_SPI)	+= dev-spi.o
 
 obj-$(CONFIG_S5PV210_SETUP_FB_24BPP)	+= setup-fb-24bpp.o
+obj-$(CONFIG_S5PV210_SETUP_MIPI)	+= setup-mipi.o
 obj-$(CONFIG_S5PV210_SETUP_I2C1) 	+= setup-i2c1.o
 obj-$(CONFIG_S5PV210_SETUP_I2C2) 	+= setup-i2c2.o
 obj-$(CONFIG_S5PV210_SETUP_IDE)		+= setup-ide.o
diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
index 4c45b74..89b88eb 100644
--- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
+++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
@@ -162,6 +162,10 @@
 #define S5P_MIPI_PHY_CON0	S5P_CLKREG(0x7200)
 #define S5P_MIPI_PHY_CON1	S5P_CLKREG(0x7204)
 #define S5P_MIPI_DPHY_CONTROL	S5P_CLKREG(0xE814)
+#define S5P_MIPI_DPHY_ENABLE	(1 << 0)
+#define S5P_MIPI_DPHY_SRESETN	(1 << 1)
+#define S5P_MIPI_DPHY_MRESETN	(1 << 2)
+
 
 #define S5P_IDLE_CFG_TL_MASK	(3 << 30)
 #define S5P_IDLE_CFG_TM_MASK	(3 << 28)
diff --git a/arch/arm/mach-s5pv210/setup-mipi.c b/arch/arm/mach-s5pv210/setup-mipi.c
new file mode 100644
index 0000000..f644e8c
--- /dev/null
+++ b/arch/arm/mach-s5pv210/setup-mipi.c
@@ -0,0 +1,52 @@
+/* linux/arch/arm/mach-s5pv210/setup-mipi.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd
+ *
+ * S5PV210 - Helper functions for MIPI CSIS/DSIM PHY control
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
+/* Global MIPI CSIS or DSIM PHY enable and reset control. */
+int s5p_mipi_phy_control(struct platform_device *pdev, bool on, u32 rst)
+{
+	static DEFINE_SPINLOCK(lock);
+	unsigned long flags;
+	u32 cfg;
+
+	spin_lock_irqsave(&lock, flags);
+
+	cfg = __raw_readl(S5P_MIPI_DPHY_CONTROL) & ~rst;
+	if (on)
+		cfg |= rst;
+	__raw_writel(cfg, S5P_MIPI_DPHY_CONTROL);
+
+	if (on)
+		cfg |= S5P_MIPI_DPHY_ENABLE;
+	else if (!(cfg & (S5P_MIPI_DPHY_SRESETN | S5P_MIPI_DPHY_MRESETN) & ~rst))
+		cfg &= ~S5P_MIPI_DPHY_ENABLE;
+
+	__raw_writel(cfg, S5P_MIPI_DPHY_CONTROL);
+
+	spin_unlock_irqrestore(&lock, flags);
+
+	return 0;
+}
+
+int s5p_csis_phy_control(struct platform_device *pdev, bool on)
+{
+	return s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_SRESETN);
+}
+
+int s5p_dsim_phy_control(struct platform_device *pdev, bool on)
+{
+	return s5p_mipi_phy_control(pdev, on, S5P_MIPI_DPHY_MRESETN);
+}
-- 
1.7.3.4
