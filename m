From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC alternative ver 1] phy: Exynos 421x USB 2.0 PHY support
Date: Fri, 20 Dec 2013 14:24:16 +0100
Message-ID: <1387545857-9472-11-git-send-email-k.debski@samsung.com>
References: <1387545857-9472-1-git-send-email-k.debski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1387545857-9472-1-git-send-email-k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mat.krawczuk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tjakobi-o02PS0xoJP9W0yFyLvAVXMxlOr/tl8fh@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This the alternative version of the support for Exynos 421x USB 2.0 PHY
in the Generic PHY framework. In this version the support for Exynos
4210 and 4212 was joined into one file.

Signed-off-by: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Hi,

Me and Kishon were discussing for quite a long time the way how Exynos 4
should be handled. I have decided to post the original patches and try
to make an alternative version with support for Exynos 4210 and 4212 joined
in one file. I have prepared two versions. The first one has 506 lines (vs
563 when two files are used). When doing the second version I was a little
more aggresive in removing code. This was done at a cost of adding if's
deciding which SoC version the driver is dealing with in some internal functions.
This resulted in a better number of removed lines - the second version has
only 452 lines (vs 563 original and 506 version 1).

Personally I like the original approach. One of my goals was to create a driver
that would be clear and easy to understand. I see that this was done at a cost of
having the code a little longer.

The first alternative version mostly was done by removing duplicate defines of
register values. The code clarity suffers a bit, but is still acceptable in my
opinion.

As to the second alternative version. It has the fewest lines, but I am not an
enthusiast of using "if this is SoC" in functions.

Anyway - please have a look at these two alternative versions in addition to
looking at the original patch "phy: Add new Exynos USB PHY driver".

Best wishes,
Kamil Debski
---
 drivers/phy/phy-exynos4212-usb2.c |  506 +++++++++++++++++++++++++++++++++++++
 1 file changed, 506 insertions(+)
 create mode 100644 drivers/phy/phy-exynos4212-usb2.c

diff --git a/drivers/phy/phy-exynos4212-usb2.c b/drivers/phy/phy-exynos4212-usb2.c
new file mode 100644
index 0000000..3fa22d0
--- /dev/null
+++ b/drivers/phy/phy-exynos4212-usb2.c
@@ -0,0 +1,506 @@
+/*
+ * Samsung SoC USB 1.1/2.0 PHY driver - Exynos 4210 and 4212 support
+ *
+ * Copyright (C) 2013 Samsung Electronics Co., Ltd.
+ * Author: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include "phy-samsung-usb2.h"
+
+/* Exynos USB PHY registers */
+
+/* PHY power control */
+#define EXYNOS_421x_UPHYPWR			0x0
+
+#define EXYNOS_421x_UPHYPWR_PHY0_SUSPEND	BIT(0)
+#define EXYNOS_421x_UPHYPWR_PHY0_PWR		BIT(3)
+#define EXYNOS_421x_UPHYPWR_PHY0_OTG_PWR	BIT(4)
+#define EXYNOS_421x_UPHYPWR_PHY0_SLEEP		BIT(5)
+#define EXYNOS_421x_UPHYPWR_PHY0 ( \
+	EXYNOS_421x_UPHYPWR_PHY0_SUSPEND | \
+	EXYNOS_421x_UPHYPWR_PHY0_PWR | \
+	EXYNOS_421x_UPHYPWR_PHY0_OTG_PWR | \
+	EXYNOS_421x_UPHYPWR_PHY0_SLEEP)
+
+#define EXYNOS_421x_UPHYPWR_PHY1_SUSPEND	BIT(6)
+#define EXYNOS_421x_UPHYPWR_PHY1_PWR		BIT(7)
+#define EXYNOS_421x_UPHYPWR_PHY1_SLEEP		BIT(8)
+#define EXYNOS_421x_UPHYPWR_PHY1 ( \
+	EXYNOS_421x_UPHYPWR_PHY1_SUSPEND | \
+	EXYNOS_421x_UPHYPWR_PHY1_PWR | \
+	EXYNOS_421x_UPHYPWR_PHY1_SLEEP)
+
+#define EXYNOS_4210_UPHYPWR_HSCI0_SUSPEND	BIT(9)
+#define EXYNOS_4210_UPHYPWR_HSCI0_SLEEP		BIT(10)
+#define EXYNOS_4210_UPHYPWR_HSCI0 ( \
+	EXYNOS_4210_UPHYPWR_HSCI0_SUSPEND | \
+	EXYNOS_4210_UPHYPWR_HSCI0_SLEEP)
+
+#define EXYNOS_4210_UPHYPWR_HSCI1_SUSPEND	BIT(11)
+#define EXYNOS_4210_UPHYPWR_HSCI1_SLEEP		BIT(12)
+#define EXYNOS_4210_UPHYPWR_HSCI1 ( \
+	EXYNOS_4210_UPHYPWR_HSCI1_SUSPEND | \
+	EXYNOS_4210_UPHYPWR_HSCI1_SLEEP)
+
+#define EXYNOS_4212_UPHYPWR_HSCI0_SUSPEND	BIT(9)
+#define EXYNOS_4212_UPHYPWR_HSCI0_PWR		BIT(10)
+#define EXYNOS_4212_UPHYPWR_HSCI0_SLEEP		BIT(11)
+#define EXYNOS_4212_UPHYPWR_HSCI0 ( \
+	EXYNOS_4212_UPHYPWR_HSCI0_SUSPEND | \
+	EXYNOS_4212_UPHYPWR_HSCI0_PWR | \
+	EXYNOS_4212_UPHYPWR_HSCI0_SLEEP)
+
+#define EXYNOS_4212_UPHYPWR_HSCI1_SUSPEND	BIT(12)
+#define EXYNOS_4212_UPHYPWR_HSCI1_PWR		BIT(13)
+#define EXYNOS_4212_UPHYPWR_HSCI1_SLEEP		BIT(14)
+#define EXYNOS_4212_UPHYPWR_HSCI1 ( \
+	EXYNOS_4212_UPHYPWR_HSCI1_SUSPEND | \
+	EXYNOS_4212_UPHYPWR_HSCI1_PWR | \
+	EXYNOS_4212_UPHYPWR_HSCI1_SLEEP)
+
+/* PHY clock control */
+#define EXYNOS_421x_UPHYCLK			0x4
+
+#define EXYNOS_421x_UPHYCLK_PHY0_COMMON_ON	BIT(4)
+#define EXYNOS_421x_UPHYCLK_PHY1_COMMON_ON	BIT(7)
+
+#define EXYNOS_4210_UPHYCLK_PHYFSEL_MASK	(0x3 << 0)
+#define EXYNOS_4210_UPHYCLK_PHYFSEL_48MHZ	(0x0 << 0)
+#define EXYNOS_4210_UPHYCLK_PHYFSEL_24MHZ	(0x3 << 0)
+#define EXYNOS_4210_UPHYCLK_PHYFSEL_12MHZ	(0x2 << 0)
+
+#define EXYNOS_4210_UPHYCLK_PHY0_ID_PULLUP	BIT(2)
+
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_MASK	(0x7 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_9MHZ6	(0x0 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_10MHZ	(0x1 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_12MHZ	(0x2 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_19MHZ2	(0x3 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_20MHZ	(0x4 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_24MHZ	(0x5 << 0)
+#define EXYNOS_4212_UPHYCLK_PHYFSEL_50MHZ	(0x7 << 0)
+
+#define EXYNOS_4212_UPHYCLK_PHY0_ID_PULLUP	BIT(3)
+
+#define EXYNOS_4212_UPHYCLK_HSIC_REFCLK_MASK	(0x7f << 10)
+#define EXYNOS_4212_UPHYCLK_HSIC_REFCLK_12MHZ	(0x24 << 10)
+#define EXYNOS_4212_UPHYCLK_HSIC_REFCLK_15MHZ	(0x1c << 10)
+#define EXYNOS_4212_UPHYCLK_HSIC_REFCLK_16MHZ	(0x1a << 10)
+#define EXYNOS_4212_UPHYCLK_HSIC_REFCLK_19MHZ2	(0x15 << 10)
+#define EXYNOS_4212_UPHYCLK_HSIC_REFCLK_20MHZ	(0x14 << 10)
+
+/* PHY reset control */
+#define EXYNOS_421x_UPHYRST			0x8
+
+#define EXYNOS_421x_URSTCON_PHY0		BIT(0)
+#define EXYNOS_421x_URSTCON_OTG_HLINK		BIT(1)
+#define EXYNOS_421x_URSTCON_OTG_PHYLINK		BIT(2)
+
+#define EXYNOS_4210_URSTCON_PHY1_ALL		BIT(3)
+#define EXYNOS_4210_URSTCON_PHY1_P0		BIT(4)
+#define EXYNOS_4210_URSTCON_PHY1_P1P2		BIT(5)
+#define EXYNOS_4210_URSTCON_HOST_LINK_ALL	BIT(6)
+#define EXYNOS_4210_URSTCON_HOST_LINK_P0	BIT(7)
+#define EXYNOS_4210_URSTCON_HOST_LINK_P1	BIT(8)
+#define EXYNOS_4210_URSTCON_HOST_LINK_P2	BIT(9)
+
+#define EXYNOS_4212_URSTCON_HOST_PHY		BIT(3)
+#define EXYNOS_4212_URSTCON_PHY1		BIT(4)
+#define EXYNOS_4212_URSTCON_HSIC0		BIT(5)
+#define EXYNOS_4212_URSTCON_HSIC1		BIT(6)
+#define EXYNOS_4212_URSTCON_HOST_LINK_ALL	BIT(7)
+#define EXYNOS_4212_URSTCON_HOST_LINK_P0	BIT(8)
+#define EXYNOS_4212_URSTCON_HOST_LINK_P1	BIT(9)
+#define EXYNOS_4212_URSTCON_HOST_LINK_P2	BIT(10)
+
+/* Isolation, configured in the power management unit */
+#define EXYNOS_4210_USB_ISOL_DEVICE_OFFSET	0x704
+#define EXYNOS_4210_USB_ISOL_DEVICE		BIT(0)
+#define EXYNOS_4210_USB_ISOL_HOST_OFFSET	0x708
+#define EXYNOS_4210_USB_ISOL_HOST		BIT(0)
+
+#define EXYNOS_4212_USB_ISOL_OFFSET		0x704
+#define EXYNOS_4212_USB_ISOL_OTG		BIT(0)
+#define EXYNOS_4212_USB_ISOL_HSIC0_OFFSET	0x708
+#define EXYNOS_4212_USB_ISOL_HSIC0		BIT(0)
+#define EXYNOS_4212_USB_ISOL_HSIC1_OFFSET	0x70c
+#define EXYNOS_4212_USB_ISOL_HSIC1		BIT(0)
+
+/* USBYPHY1 Floating prevention */
+#define EXYNOS_4210_UPHY1CON			0x34
+#define EXYNOS_4210_UPHY1CON_FLOAT_PREVENTION	0x1
+
+/* Mode switching SUB Device <-> Host */
+#define EXYNOS_421x_MODE_SWITCH_OFFSET		0x21c
+#define EXYNOS_421x_MODE_SWITCH_MASK		1
+#define EXYNOS_421x_MODE_SWITCH_DEVICE		0
+#define EXYNOS_421x_MODE_SWITCH_HOST		1
+
+enum exynos4210_phy_id {
+	EXYNOS4210_DEVICE,
+	EXYNOS4210_HOST,
+	EXYNOS4210_HSIC0,
+	EXYNOS4210_HSIC1,
+	EXYNOS4210_NUM_PHYS,
+};
+
+enum exynos4212_phy_id {
+	EXYNOS4212_DEVICE,
+	EXYNOS4212_HOST,
+	EXYNOS4212_HSIC0,
+	EXYNOS4212_HSIC1,
+	EXYNOS4212_NUM_PHYS,
+};
+
+/*
+ * exynos4210_rate_to_clk() converts the supplied clock rate to the value that
+ * can be written to the phy register.
+ */
+static int exynos4210_rate_to_clk(unsigned long rate, u32 *reg)
+{
+	switch (rate) {
+	case 12 * MHZ:
+		*reg = EXYNOS_4210_UPHYCLK_PHYFSEL_12MHZ;
+		break;
+	case 24 * MHZ:
+		*reg = EXYNOS_4210_UPHYCLK_PHYFSEL_24MHZ;
+		break;
+	case 48 * MHZ:
+		*reg = EXYNOS_4210_UPHYCLK_PHYFSEL_48MHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * exynos4212_rate_to_clk() converts the supplied clock rate to the value that
+ * can be written to the phy register.
+ */
+static int exynos4212_rate_to_clk(unsigned long rate, u32 *reg)
+{
+	/* EXYNOS_4212_UPHYCLK_PHYFSEL_MASK */
+
+	switch (rate) {
+	case 9600 * KHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_9MHZ6;
+		break;
+	case 10 * MHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_10MHZ;
+		break;
+	case 12 * MHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_12MHZ;
+		break;
+	case 19200 * KHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_19MHZ2;
+		break;
+	case 20 * MHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_20MHZ;
+		break;
+	case 24 * MHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_24MHZ;
+		break;
+	case 50 * MHZ:
+		*reg = EXYNOS_4212_UPHYCLK_PHYFSEL_50MHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void exynos4210_isol(struct samsung_usb2_phy_instance *inst, bool on)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	u32 offset;
+	u32 mask;
+
+	switch (inst->cfg->id) {
+	case EXYNOS4210_DEVICE:
+		offset = EXYNOS_4210_USB_ISOL_DEVICE_OFFSET;
+		mask = EXYNOS_4210_USB_ISOL_DEVICE;
+		break;
+	case EXYNOS4210_HOST:
+		offset = EXYNOS_4210_USB_ISOL_HOST_OFFSET;
+		mask = EXYNOS_4210_USB_ISOL_HOST;
+		break;
+	default:
+		return;
+	};
+
+	regmap_update_bits(drv->reg_pmu, offset, mask, on ? 0 : mask);
+}
+
+static void exynos4212_isol(struct samsung_usb2_phy_instance *inst, bool on)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	u32 offset;
+	u32 mask;
+
+	switch (inst->cfg->id) {
+	case EXYNOS4212_DEVICE:
+	case EXYNOS4212_HOST:
+		offset = EXYNOS_4212_USB_ISOL_OFFSET;
+		mask = EXYNOS_4212_USB_ISOL_OTG;
+		break;
+	case EXYNOS4212_HSIC0:
+		offset = EXYNOS_4212_USB_ISOL_HSIC0_OFFSET;
+		mask = EXYNOS_4212_USB_ISOL_HSIC0;
+		break;
+	case EXYNOS4212_HSIC1:
+		offset = EXYNOS_4212_USB_ISOL_HSIC1_OFFSET;
+		mask = EXYNOS_4212_USB_ISOL_HSIC1;
+		break;
+	default:
+		return;
+	};
+
+	regmap_update_bits(drv->reg_pmu, offset, mask, on ? 0 : mask);
+}
+
+static void exynos4210_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	u32 rstbits = 0;
+	u32 phypwr = 0;
+	u32 rst;
+	u32 pwr;
+
+	switch (inst->cfg->id) {
+	case EXYNOS4210_DEVICE:
+		phypwr =	EXYNOS_421x_UPHYPWR_PHY0;
+		rstbits =	EXYNOS_421x_URSTCON_PHY0;
+		break;
+	case EXYNOS4210_HOST:
+		phypwr =	EXYNOS_421x_UPHYPWR_PHY1;
+		rstbits =	EXYNOS_4210_URSTCON_PHY1_ALL |
+				EXYNOS_4210_URSTCON_PHY1_P0 |
+				EXYNOS_4210_URSTCON_PHY1_P1P2 |
+				EXYNOS_4210_URSTCON_HOST_LINK_ALL |
+				EXYNOS_4210_URSTCON_HOST_LINK_P0;
+		writel(on, drv->reg_phy + EXYNOS_4210_UPHY1CON);
+		break;
+	case EXYNOS4210_HSIC0:
+		phypwr =	EXYNOS_4210_UPHYPWR_HSCI0;
+		rstbits =	EXYNOS_4210_URSTCON_PHY1_P1P2 |
+				EXYNOS_4210_URSTCON_HOST_LINK_P1;
+		break;
+	case EXYNOS4210_HSIC1:
+		phypwr =	EXYNOS_4210_UPHYPWR_HSCI1;
+		rstbits =	EXYNOS_4210_URSTCON_PHY1_P1P2 |
+				EXYNOS_4210_URSTCON_HOST_LINK_P2;
+		break;
+	};
+
+	if (on) {
+		writel(inst->clk_reg_val, drv->reg_phy + EXYNOS_421x_UPHYCLK);
+
+		pwr = readl(drv->reg_phy + EXYNOS_421x_UPHYPWR);
+		pwr &= ~phypwr;
+		writel(pwr, drv->reg_phy + EXYNOS_421x_UPHYPWR);
+
+		rst = readl(drv->reg_phy + EXYNOS_421x_UPHYRST);
+		rst |= rstbits;
+		writel(rst, drv->reg_phy + EXYNOS_421x_UPHYRST);
+		udelay(10);
+		rst &= ~rstbits;
+		writel(rst, drv->reg_phy + EXYNOS_421x_UPHYRST);
+	} else {
+		pwr = readl(drv->reg_phy + EXYNOS_421x_UPHYPWR);
+		pwr |= phypwr;
+		writel(pwr, drv->reg_phy + EXYNOS_421x_UPHYPWR);
+	}
+}
+
+static void exynos4212_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	u32 rstbits = 0;
+	u32 phypwr = 0;
+	u32 rst;
+	u32 pwr;
+
+	switch (inst->cfg->id) {
+	case EXYNOS4212_DEVICE:
+		phypwr =	EXYNOS_421x_UPHYPWR_PHY0;
+		rstbits =	EXYNOS_421x_URSTCON_PHY0;
+		break;
+	case EXYNOS4212_HOST:
+		phypwr =	EXYNOS_421x_UPHYPWR_PHY1;
+		rstbits =	EXYNOS_4212_URSTCON_HOST_PHY;
+		break;
+	case EXYNOS4212_HSIC0:
+		phypwr =	EXYNOS_4212_UPHYPWR_HSCI0;
+		rstbits =	EXYNOS_4212_URSTCON_HSIC1 |
+				EXYNOS_4212_URSTCON_HOST_LINK_P0 |
+				EXYNOS_4212_URSTCON_HOST_PHY;
+		break;
+	case EXYNOS4212_HSIC1:
+		phypwr =	EXYNOS_4212_UPHYPWR_HSCI1;
+		rstbits =	EXYNOS_4212_URSTCON_HSIC1 |
+				EXYNOS_4212_URSTCON_HOST_LINK_P1;
+		break;
+	};
+
+	if (on) {
+		writel(inst->clk_reg_val, drv->reg_phy + EXYNOS_421x_UPHYCLK);
+
+		pwr = readl(drv->reg_phy + EXYNOS_421x_UPHYPWR);
+		pwr &= ~phypwr;
+		writel(pwr, drv->reg_phy + EXYNOS_421x_UPHYPWR);
+
+		rst = readl(drv->reg_phy + EXYNOS_421x_UPHYRST);
+		rst |= rstbits;
+		writel(rst, drv->reg_phy + EXYNOS_421x_UPHYRST);
+		udelay(10);
+		rst &= ~rstbits;
+		writel(rst, drv->reg_phy + EXYNOS_421x_UPHYRST);
+	} else {
+		pwr = readl(drv->reg_phy + EXYNOS_421x_UPHYPWR);
+		pwr |= phypwr;
+		writel(pwr, drv->reg_phy + EXYNOS_421x_UPHYPWR);
+	}
+}
+
+static int exynos4210_power_on(struct samsung_usb2_phy_instance *inst)
+{
+	/* Order of initialisation is important - first power then isolation */
+	exynos4210_phy_pwr(inst, 1);
+	exynos4210_isol(inst, 0);
+
+	return 0;
+}
+
+static int exynos4210_power_off(struct samsung_usb2_phy_instance *inst)
+{
+	exynos4210_isol(inst, 1);
+	exynos4210_phy_pwr(inst, 0);
+
+	return 0;
+}
+
+static int exynos4212_power_on(struct samsung_usb2_phy_instance *inst)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+
+	inst->enabled = 1;
+	exynos4212_phy_pwr(inst, 1);
+	exynos4212_isol(inst, 0);
+
+	/* Power on the device, as it is necessary for HSIC to work */
+	if (inst->cfg->id == EXYNOS4212_HSIC0) {
+		struct samsung_usb2_phy_instance *device =
+					&drv->instances[EXYNOS4212_DEVICE];
+		exynos4212_phy_pwr(device, 1);
+		exynos4212_isol(device, 0);
+	}
+
+	return 0;
+}
+
+static int exynos4212_power_off(struct samsung_usb2_phy_instance *inst)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	struct samsung_usb2_phy_instance *device =
+					&drv->instances[EXYNOS4212_DEVICE];
+
+	inst->enabled = 0;
+	exynos4212_isol(inst, 1);
+	exynos4212_phy_pwr(inst, 0);
+
+	if (inst->cfg->id == EXYNOS4212_HSIC0 && !device->enabled) {
+		exynos4212_isol(device, 1);
+		exynos4212_phy_pwr(device, 0);
+	}
+
+	return 0;
+}
+
+static const struct samsung_usb2_common_phy exynos4210_phys[] = {
+	{
+		.label		= "device",
+		.id		= EXYNOS4210_DEVICE,
+		.rate_to_clk	= exynos4210_rate_to_clk,
+		.power_on	= exynos4210_power_on,
+		.power_off	= exynos4210_power_off,
+	},
+	{
+		.label		= "host",
+		.id		= EXYNOS4210_HOST,
+		.rate_to_clk	= exynos4210_rate_to_clk,
+		.power_on	= exynos4210_power_on,
+		.power_off	= exynos4210_power_off,
+	},
+	{
+		.label		= "hsic0",
+		.id		= EXYNOS4210_HSIC0,
+		.rate_to_clk	= exynos4210_rate_to_clk,
+		.power_on	= exynos4210_power_on,
+		.power_off	= exynos4210_power_off,
+	},
+	{
+		.label		= "hsic1",
+		.id		= EXYNOS4210_HSIC1,
+		.rate_to_clk	= exynos4210_rate_to_clk,
+		.power_on	= exynos4210_power_on,
+		.power_off	= exynos4210_power_off,
+	},
+	{},
+};
+
+const struct samsung_usb2_phy_config exynos4210_usb2_phy_config = {
+	.num_phys		= EXYNOS4210_NUM_PHYS,
+	.phys			= exynos4210_phys,
+	.has_mode_switch	= 1,
+};
+
+
+static const struct samsung_usb2_common_phy exynos4212_phys[] = {
+	{
+		.label		= "device",
+		.id		= EXYNOS4212_DEVICE,
+		.rate_to_clk	= exynos4212_rate_to_clk,
+		.power_on	= exynos4212_power_on,
+		.power_off	= exynos4212_power_off,
+	},
+	{
+		.label		= "host",
+		.id		= EXYNOS4212_HOST,
+		.rate_to_clk	= exynos4212_rate_to_clk,
+		.power_on	= exynos4212_power_on,
+		.power_off	= exynos4212_power_off,
+	},
+	{
+		.label		= "hsic0",
+		.id		= EXYNOS4212_HSIC0,
+		.rate_to_clk	= exynos4212_rate_to_clk,
+		.power_on	= exynos4212_power_on,
+		.power_off	= exynos4212_power_off,
+	},
+	{
+		.label		= "hsic1",
+		.id		= EXYNOS4212_HSIC1,
+		.rate_to_clk	= exynos4212_rate_to_clk,
+		.power_on	= exynos4212_power_on,
+		.power_off	= exynos4212_power_off,
+	},
+	{},
+};
+
+const struct samsung_usb2_phy_config exynos4212_usb2_phy_config = {
+	.num_phys		= EXYNOS4212_NUM_PHYS,
+	.phys			= exynos4212_phys,
+	.has_mode_switch	= 1,
+};
+
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
