From: juergen@kreuzholzen.de
Subject: (unknown)
Date: Sun, 16 Nov 2014 18:29:36 +0100
Message-ID: <E1Xq3do-0006lG-GP@sslproxy02.your-server.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www291.your-server.de ([78.46.156.197]:51636 "EHLO
	www291.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755302AbaKPR3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Nov 2014 12:29:41 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

>From a97962c53a7a441f3a08f9911f84f9b40738a989 Mon Sep 17 00:00:00 2001
Message-Id: <a97962c53a7a441f3a08f9911f84f9b40738a989.1416158605.git.juergen@kreuzholzen.de>
In-Reply-To: <cover.1416158605.git.juergen@kreuzholzen.de>
References: <cover.1416158605.git.juergen@kreuzholzen.de>
From: Juergen Borleis <juergen@kreuzholzen.de>
Date: Sun, 9 Nov 2014 20:14:25 +0100
Subject: [PATCH 5/8] Samsung/S3C6410/OTG-phy: add S3C6410 support
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

In order to make the internal OTG and OHCI controller work we need to
handle the OTG phy as it is also the source of the 48 MHz clock for both
USB units.

Signed-off-by: Juergen Borleis <juergen@kreuzholzen.de>
---
 drivers/phy/Kconfig            |   9 ++
 drivers/phy/Makefile           |   1 +
 drivers/phy/phy-s3c6410-usb2.c | 346 +++++++++++++++++++++++++++++++++++++++++
 drivers/phy/phy-samsung-usb2.c |  12 ++
 drivers/phy/phy-samsung-usb2.h |   3 +
 5 files changed, 371 insertions(+)
 create mode 100644 drivers/phy/phy-s3c6410-usb2.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 2a436e6..720ef8c 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -166,6 +166,15 @@ config PHY_SAMSUNG_USB2
 	  for particular PHYs will be enabled based on the SoC type in addition
 	  to this driver.
 
+config PHY_S3C6410_USB2
+	bool "Support for S3C6410"
+	depends on PHY_SAMSUNG_USB2
+	depends on ARCH_S3C64XX
+	help
+	  Enable USB 2.0 PHY support for S3C6410. This option is required in
+	  order to make the SoC's USB 2.0 OTG and the USB 1.1 OHCI work, since
+	  both USB units depend on the 48 MHz clock the USB 2.0 PHY provides.
+
 config PHY_S5PV210_USB2
 	bool "Support for S5PV210"
 	depends on PHY_SAMSUNG_USB2
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c4590fc..bac9dff 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -23,6 +23,7 @@ phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4210_USB2)	+= phy-exynos4210-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS4X12_USB2)	+= phy-exynos4x12-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_EXYNOS5250_USB2)	+= phy-exynos5250-usb2.o
 phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
+phy-exynos-usb2-$(CONFIG_PHY_S3C6410_USB2)	+= phy-s3c6410-usb2.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
diff --git a/drivers/phy/phy-s3c6410-usb2.c b/drivers/phy/phy-s3c6410-usb2.c
new file mode 100644
index 0000000..7fb4c1f
--- /dev/null
+++ b/drivers/phy/phy-s3c6410-usb2.c
@@ -0,0 +1,346 @@
+/*
+ * Samsung SoC USB 2.0 PHY driver - S3C6410 support
+ *
+ * Copyright 2014 Juergen Borleis <juergen@kreuzholzen.de>
+ *
+ * Based on phy-s5pv210-usb2.c:
+ * Copyright (C) 2013 Samsung Electronics Co., Ltd.
+ * Authors: Kamil Debski <k.debski@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * The USB 2.0 phy units of the S5P210 and S3C64XX SoCs are nearly the same.
+ * But the one inside the S3C64XX SoC needs some more love in order to enable
+ * the OTG and OHCI unit. At least it provides the required 48 MHz clock for
+ * both USB units, so it must be powered on, even if only the OHCI unit should
+ * run (which can, but hasn't to use the USB 2.0 phy as its data path).
+ * Also some platforms (at least the Mini6410) can switch on/off the external
+ * power supplies for this unit, that's why this driver uses a regulator to
+ * support this switch.
+ * Note: due to fixed register settings, this driver assumes an external 48 MHz
+ * crystal instead of an external clock/oscillator.
+ */
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/phy/phy.h>
+#include <linux/regulator/consumer.h>
+#include "phy-samsung-usb2.h"
+
+/* PHY power control */
+#define S3C6410_OPHYPWR			0x0
+
+#define S3C6410_OPHYPWR_FORCE_SUSPEND	BIT(0)
+#define S3C6410_OPHYPWR_ANALOG_PWDWN	BIT(3)
+#define S3C6410_OPHYPWR_PHY_OTG_DISABLE	BIT(4)
+
+/* PHY clock control */
+#define S3C6410_OPHYCLK			0x4
+
+#define S3C6410_OPHYCLK_PHYFSEL_48MHZ	(0x0 << 0)
+#define S3C6410_OPHYCLK_PHYFSEL_24MHZ	(0x3 << 0)
+#define S3C6410_OPHYCLK_PHYFSEL_12MHZ	(0x2 << 0)
+
+#define S3C6410_OPHYCLK_PHY_ID_PULLUP	BIT(2)
+#define S3C6410_OPHYCLK_PHY_COMMON_ON	BIT(4)
+#define S3C6410_OPHYCLK_PHY_XO_EXT_CLK_ENB BIT(5)
+#define S3C6410_OPHYCLK_PHY_SERIAL_MODE BIT(6)
+
+/* PHY reset control */
+#define S3C6410_OPHYRST			0x8
+
+#define S3C6410_ORSTCON_PHY		BIT(0)
+#define S3C6410_ORSTCON_OTG_HLINK	BIT(1)
+#define S3C6410_ORSTCON_OTG_PHYLINK	BIT(2)
+
+#define S3C6410_SYSCON_OTHERS_OFFSET	0x900
+#define S3C64XX_OTHERS_USBMASK		BIT(16)
+
+enum s3c6410_phy_id {
+	S3C6410_OTG,
+	S3C6410_HOST,
+};
+
+static bool otg_active;
+static bool ohci_active;
+
+/*
+ * +-----------+      UTMI           +-----------+
+ * |           |---------------------|           |<-- analog power
+ * |   OTG     |                     |  USB 2.0  |
+ * |           |--<-----o------------|  OTG phy  |
+ * +-----------+        |         +--|           |<-- digital power
+ *               48 MHz |         |  +-----------+
+ *      +---<-----------+         |
+ *      |                         |
+ * +-----------+  serial intf I   |
+ * |           |------------------+
+ * |   OHCI    |  serial intf II     +-----------+
+ * |           |---------------------| USB-1.1   |
+ * +-----------+                     +-----------+
+ *
+ * Note: this driver does not support the 'serial intf I' path, it supports the
+ * UTMI and 'serial intf II' path only.
+ */
+
+static int s3c6410_rate_to_clk(unsigned long rate, u32 *reg)
+{
+	switch (rate) {
+	case 12 * MHZ:
+		*reg = S3C6410_OPHYCLK_PHYFSEL_12MHZ;
+		break;
+	case 24 * MHZ:
+		*reg = S3C6410_OPHYCLK_PHYFSEL_24MHZ;
+		break;
+	case 48 * MHZ:
+		*reg = S3C6410_OPHYCLK_PHYFSEL_48MHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void s3c6410_otgphy_reset(struct samsung_usb2_phy_driver *drv, u32 bit)
+{
+	u32 ophyrst_reg = readl(drv->reg_phy + S3C6410_OPHYRST);
+
+	if (!(ophyrst_reg & bit)) {
+		ophyrst_reg |= bit;
+		writel(ophyrst_reg, drv->reg_phy + S3C6410_OPHYRST);
+		udelay(10);
+	}
+
+	ophyrst_reg &= ~bit;
+	writel(ophyrst_reg, drv->reg_phy + S3C6410_OPHYRST);
+	dev_dbg(drv->dev, "%s: phy reset\n", __func__);
+}
+
+/* activate the OTG phy to provide the 48 MHz for the OHCI */
+static int s3c6410_otgphy_power_up_ohci(struct samsung_usb2_phy_driver *drv)
+{
+	u32 pwr_reg;
+	int rc;
+
+	if (ohci_active)
+		return 0; /* nothing to be done here */
+
+	if (drv->power) {
+		rc = regulator_enable(drv->power);
+		if (rc != 0) {
+			dev_err(drv->dev,
+				"Failed to enable phy's power supply\n");
+			return rc;
+		}
+	} else {
+		dev_err(drv->dev, "Unknown power supply\n");
+		return -ENODEV;
+	}
+
+	if (otg_active)
+		return 0;
+
+	/* enable the OTG phy signals */
+	regmap_update_bits(drv->reg_pmu, S3C6410_SYSCON_OTHERS_OFFSET,
+				S3C64XX_OTHERS_USBMASK, S3C64XX_OTHERS_USBMASK);
+
+	/* setup the clock multiplexer */
+	drv->ref_reg_val &= ~S3C6410_OPHYCLK_PHY_SERIAL_MODE;
+	/* activate the 48 MHz crystal based oscillator */
+	drv->ref_reg_val &= ~S3C6410_OPHYCLK_PHY_XO_EXT_CLK_ENB;
+	writel(drv->ref_reg_val, drv->reg_phy + S3C6410_OPHYCLK);
+	dev_dbg(drv->dev, "%s: writing %u into PHY Clock register\n",
+						__func__, drv->ref_reg_val);
+
+	pwr_reg = readl(drv->reg_phy + S3C6410_OPHYPWR);
+	/* power up the analog part of the OTG phy */
+	pwr_reg &= ~S3C6410_OPHYPWR_ANALOG_PWDWN;
+	/* power up the signals */
+	pwr_reg &= ~S3C6410_OPHYPWR_FORCE_SUSPEND;
+	writel(pwr_reg, drv->reg_phy + S3C6410_OPHYPWR);
+	dev_dbg(drv->dev,"%s: writing %u into PHY Power register\n",
+							__func__, pwr_reg);
+
+	s3c6410_otgphy_reset(drv, S3C6410_ORSTCON_PHY);
+	ohci_active = true;
+	dev_dbg(drv->dev, "%s: phy clock now active for OHCI\n", __func__);
+
+	return 0;
+}
+
+static int s3c6410_otgphy_power_up_otg(struct samsung_usb2_phy_driver *drv)
+{
+	u32 pwr_reg;
+	int rc;
+
+	if (otg_active)
+		return 0; /* nothing to be done here */
+
+	if (drv->power) {
+		rc = regulator_enable(drv->power);
+		if (rc != 0) {
+			dev_err(drv->dev,
+				"Failed to enable phy's power supply\n");
+			return rc;
+		}
+	} else {
+		dev_err(drv->dev, "Unknown power supply\n");
+		return -ENODEV;
+	}
+
+	if (!ohci_active) {
+		/* enable the OTG phy signals */
+		regmap_update_bits(drv->reg_pmu, S3C6410_SYSCON_OTHERS_OFFSET,
+				S3C64XX_OTHERS_USBMASK, S3C64XX_OTHERS_USBMASK);
+	}
+
+	pwr_reg = readl(drv->reg_phy + S3C6410_OPHYPWR);
+	/* switch the OTG phy to the UTMI interface */
+	drv->ref_reg_val &= ~S3C6410_OPHYCLK_PHY_SERIAL_MODE;
+	/* activate the 48 MHz crystal based oscillator */
+	drv->ref_reg_val &= ~S3C6410_OPHYCLK_PHY_XO_EXT_CLK_ENB;
+	drv->ref_reg_val &= ~S3C6410_OPHYCLK_PHY_ID_PULLUP;
+	writel(drv->ref_reg_val, drv->reg_phy + S3C6410_OPHYCLK);
+	dev_dbg(drv->dev, "%s: writing %u into PHY Clock register\n",
+						__func__, drv->ref_reg_val);
+
+	/* power up the OTG phy */
+	pwr_reg &= ~S3C6410_OPHYPWR_PHY_OTG_DISABLE;
+	/* power up the analog part of the OTG phy */
+	pwr_reg &= ~S3C6410_OPHYPWR_ANALOG_PWDWN;
+	/* power up the signals */
+	pwr_reg &= ~S3C6410_OPHYPWR_FORCE_SUSPEND;
+	writel(pwr_reg, drv->reg_phy + S3C6410_OPHYPWR);
+	dev_dbg(drv->dev, "%s: writing %u into PHY Power register\n",
+						__func__, pwr_reg);
+
+	otg_active = true;
+	dev_dbg(drv->dev, "%s: phy clock now active for OTG\n", __func__);
+
+	/* reset the unit after first powerup (do not disturn the OHCI) */
+	if (!ohci_active)
+		s3c6410_otgphy_reset(drv, S3C6410_ORSTCON_PHY);
+
+	return 0;
+}
+
+static void s3c6410_otgphy_power_down_ohci(struct samsung_usb2_phy_driver *drv)
+{
+	u32 pwr_reg;
+
+	if (!ohci_active)
+		return; /* nothing to be done here */
+
+	if (drv->power)
+		regulator_disable(drv->power); /* decrement usage count */
+
+	if (otg_active)
+		return;
+
+	pwr_reg = readl(drv->reg_phy + S3C6410_OPHYPWR);
+	/* power down the analog part of the OTG phy */
+	pwr_reg |= S3C6410_OPHYPWR_ANALOG_PWDWN;
+	/* power down the signals */
+	pwr_reg |= S3C6410_OPHYPWR_FORCE_SUSPEND;
+	writel(pwr_reg, drv->reg_phy + S3C6410_OPHYPWR);
+
+	/* disable the OTG phy signals */
+	regmap_update_bits(drv->reg_pmu, S3C6410_SYSCON_OTHERS_OFFSET,
+			S3C64XX_OTHERS_USBMASK, 0);
+	ohci_active = false;
+	dev_dbg(drv->dev, "%s: phy clock now disabled for OHCI\n", __func__);
+}
+
+static void s3c6410_otgphy_power_down_otg(struct samsung_usb2_phy_driver *drv)
+{
+	u32 pwr_reg;
+
+	if (!otg_active)
+		return;
+
+	if (drv->power)
+		regulator_disable(drv->power); /* decrement usage count */
+
+	pwr_reg = readl(drv->reg_phy + S3C6410_OPHYPWR);
+
+	if (ohci_active) {
+		/* power down the OTG part only, keep the OHCI active */
+		pwr_reg |= S3C6410_OPHYPWR_PHY_OTG_DISABLE;
+		writel(pwr_reg, drv->reg_phy + S3C6410_OPHYPWR);
+		otg_active = false;
+		return;
+	}
+
+	/* power down the OTG phy */
+	pwr_reg |= S3C6410_OPHYPWR_PHY_OTG_DISABLE;
+	/* power down the analog part of the OTG phy */
+	pwr_reg |= S3C6410_OPHYPWR_ANALOG_PWDWN;
+	/* power down the signals */
+	pwr_reg |= S3C6410_OPHYPWR_FORCE_SUSPEND;
+	writel(pwr_reg, drv->reg_phy + S3C6410_OPHYPWR);
+
+	/* disable the OTG phy signals */
+	regmap_update_bits(drv->reg_pmu, S3C6410_SYSCON_OTHERS_OFFSET,
+			S3C64XX_OTHERS_USBMASK, 0);
+	otg_active = false;
+	dev_dbg(drv->dev, "%s: phy clock now disabled for OTG\n", __func__);
+}
+
+static int s3c6410_power_on(struct samsung_usb2_phy_instance *inst)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+	int rc = -EINVAL;
+
+	switch (inst->cfg->id) {
+	case S3C6410_OTG:
+		rc = s3c6410_otgphy_power_up_otg(drv);
+		break;
+
+	case S3C6410_HOST:
+		rc = s3c6410_otgphy_power_up_ohci(drv);
+		break;
+	}
+
+	return rc;
+}
+
+static int s3c6410_power_off(struct samsung_usb2_phy_instance *inst)
+{
+	struct samsung_usb2_phy_driver *drv = inst->drv;
+
+	switch (inst->cfg->id) {
+	case S3C6410_OTG:
+		s3c6410_otgphy_power_down_otg(drv);
+		break;
+
+	case S3C6410_HOST:
+		s3c6410_otgphy_power_down_ohci(drv);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct samsung_usb2_common_phy s3c6410_phys[] = {
+	{
+	/* route the OTG through the OTG phy */
+		.label = "otg",
+		.id = S3C6410_OTG,
+		.power_on = s3c6410_power_on,
+		.power_off = s3c6410_power_off,
+	}, {
+	/* just clock control of the OHCI unit */
+		.label = "host",
+		.id = S3C6410_HOST,
+		.power_on = s3c6410_power_on,
+		.power_off = s3c6410_power_off,
+	},
+};
+
+const struct samsung_usb2_phy_config s3c6410_usb2_phy_config = {
+	.num_phys = ARRAY_SIZE(s3c6410_phys),
+	.phys = s3c6410_phys,
+	.rate_to_clk = s3c6410_rate_to_clk,
+};
diff --git a/drivers/phy/phy-samsung-usb2.c b/drivers/phy/phy-samsung-usb2.c
index 908949d..d4160b6 100644
--- a/drivers/phy/phy-samsung-usb2.c
+++ b/drivers/phy/phy-samsung-usb2.c
@@ -117,6 +117,12 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
 		.data = &s5pv210_usb2_phy_config,
 	},
 #endif
+#ifdef CONFIG_PHY_S3C6410_USB2
+	{
+		.compatible = "samsung,s3c6410-usb2-phy",
+		.data = &s3c6410_usb2_phy_config,
+	},
+#endif
 	{ },
 };
 MODULE_DEVICE_TABLE(of, samsung_usb2_phy_of_match);
@@ -178,6 +184,12 @@ static int samsung_usb2_phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	drv->power = devm_regulator_get(dev, "analog");
+	if (IS_ERR(drv->power)) {
+		dev_info(dev, "No power supply provided. Trying to continue without one\n");
+		drv->power = NULL;
+	}
+
 	drv->clk = devm_clk_get(dev, "phy");
 	if (IS_ERR(drv->clk)) {
 		dev_err(dev, "Failed to get clock of phy controller\n");
diff --git a/drivers/phy/phy-samsung-usb2.h b/drivers/phy/phy-samsung-usb2.h
index 44bead9..9ad5106 100644
--- a/drivers/phy/phy-samsung-usb2.h
+++ b/drivers/phy/phy-samsung-usb2.h
@@ -14,6 +14,7 @@
 
 #include <linux/clk.h>
 #include <linux/phy/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
@@ -43,6 +44,7 @@ struct samsung_usb2_phy_driver {
 	void __iomem *reg_phy;
 	struct regmap *reg_pmu;
 	struct regmap *reg_sys;
+	struct regulator *power;
 	spinlock_t lock;
 	struct samsung_usb2_phy_instance instances[0];
 };
@@ -68,4 +70,5 @@ extern const struct samsung_usb2_phy_config exynos4210_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos4x12_usb2_phy_config;
 extern const struct samsung_usb2_phy_config exynos5250_usb2_phy_config;
 extern const struct samsung_usb2_phy_config s5pv210_usb2_phy_config;
+extern const struct samsung_usb2_phy_config s3c6410_usb2_phy_config;
 #endif
-- 
1.8.1
