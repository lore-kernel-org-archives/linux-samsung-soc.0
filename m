From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drivers: phy: exynos4x12-phy: fix HSIC1 power on/off sequence
Date: Tue, 20 May 2014 14:09:14 +0200
Message-ID: <1400587754-8363-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:19526 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752045AbaETMJY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 08:09:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kamil Debski <k.debski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

>From experiments with real hardware, it seems that URSTCON bits for
HSIC0 and HSIC1 seems to be swapped, so updated macro definitions for
them. HSIC1 also requires enabling power to device phy to get properly
enabled (similar hack is already implemented for HSIC0).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Hello,

This fix for Exynos4x12 USB2 PHY driver is needed to add support for
OdroidU3 board, which uses both HSIC0 and HSIC1 ports. Without it only
LAN chip, which is connected to HSIC0 works correctly.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland
---
 drivers/phy/phy-exynos4x12-usb2.c | 48 +++++++++++++++++++++++++++------------
 drivers/phy/phy-samsung-usb2.h    |  2 +-
 2 files changed, 35 insertions(+), 15 deletions(-)
diff --git a/drivers/phy/phy-exynos4x12-usb2.c b/drivers/phy/phy-exynos4x12-usb2.c
index d92a7cc5698a..431568b5cc61 100644
--- a/drivers/phy/phy-exynos4x12-usb2.c
+++ b/drivers/phy/phy-exynos4x12-usb2.c
@@ -87,8 +87,16 @@
 #define EXYNOS_4x12_URSTCON_OTG_PHYLINK		BIT(2)
 #define EXYNOS_4x12_URSTCON_HOST_PHY		BIT(3)
 #define EXYNOS_4x12_URSTCON_PHY1		BIT(4)
-#define EXYNOS_4x12_URSTCON_HSIC0		BIT(5)
-#define EXYNOS_4x12_URSTCON_HSIC1		BIT(6)
+/*
+ * According to Exynos 4x12 reference manual the values for
+ * EXYNOS_4x12_URSTCON_HSIC are:
+ * 	URSTCON_HSIC0 = BIT(5)
+ *	URSTCON_HSIC1 = BIT(6)
+ * but from experiments with real hardware the above 2 bitfields
+ * seems to be swapped, so define them to match the actual
+ * hardware */
+#define EXYNOS_4x12_URSTCON_HSIC1		BIT(5)
+#define EXYNOS_4x12_URSTCON_HSIC0		BIT(6)
 #define EXYNOS_4x12_URSTCON_HOST_LINK_ALL	BIT(7)
 #define EXYNOS_4x12_URSTCON_HOST_LINK_P0	BIT(8)
 #define EXYNOS_4x12_URSTCON_HOST_LINK_P1	BIT(9)
@@ -216,14 +224,15 @@ static void exynos4x12_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
 		break;
 	case EXYNOS4x12_HSIC0:
 		phypwr =	EXYNOS_4x12_UPHYPWR_HSIC0;
-		rstbits =	EXYNOS_4x12_URSTCON_HSIC1 |
+		rstbits =	EXYNOS_4x12_URSTCON_HSIC0 |
 				EXYNOS_4x12_URSTCON_HOST_LINK_P0 |
 				EXYNOS_4x12_URSTCON_HOST_PHY;
 		break;
 	case EXYNOS4x12_HSIC1:
 		phypwr =	EXYNOS_4x12_UPHYPWR_HSIC1;
 		rstbits =	EXYNOS_4x12_URSTCON_HSIC1 |
-				EXYNOS_4x12_URSTCON_HOST_LINK_P1;
+				EXYNOS_4x12_URSTCON_HOST_LINK_P1 |
+				EXYNOS_4x12_URSTCON_HOST_PHY;
 		break;
 	};
 
@@ -256,18 +265,22 @@ static void exynos4x12_phy_pwr(struct samsung_usb2_phy_instance *inst, bool on)
 static int exynos4x12_power_on(struct samsung_usb2_phy_instance *inst)
 {
 	struct samsung_usb2_phy_driver *drv = inst->drv;
+	struct samsung_usb2_phy_instance *device =
+					&drv->instances[EXYNOS4x12_DEVICE];
 
-	inst->enabled = 1;
+	inst->enabled++;
 	exynos4x12_setup_clk(inst);
 	exynos4x12_phy_pwr(inst, 1);
 	exynos4x12_isol(inst, 0);
 
 	/* Power on the device, as it is necessary for HSIC to work */
-	if (inst->cfg->id == EXYNOS4x12_HSIC0) {
-		struct samsung_usb2_phy_instance *device =
-					&drv->instances[EXYNOS4x12_DEVICE];
-		exynos4x12_phy_pwr(device, 1);
-		exynos4x12_isol(device, 0);
+	if (inst->cfg->id == EXYNOS4x12_HSIC0 ||
+	    inst->cfg->id == EXYNOS4x12_HSIC1) {
+		if (!device->enabled) {
+			exynos4x12_phy_pwr(device, 1);
+			exynos4x12_isol(device, 0);
+		}
+		device->enabled++;
 	}
 
 	return 0;
@@ -279,13 +292,20 @@ static int exynos4x12_power_off(struct samsung_usb2_phy_instance *inst)
 	struct samsung_usb2_phy_instance *device =
 					&drv->instances[EXYNOS4x12_DEVICE];
 
-	inst->enabled = 0;
+	inst->enabled--;
+	if (inst->enabled)
+		return 0;
+
 	exynos4x12_isol(inst, 1);
 	exynos4x12_phy_pwr(inst, 0);
 
-	if (inst->cfg->id == EXYNOS4x12_HSIC0 && !device->enabled) {
-		exynos4x12_isol(device, 1);
-		exynos4x12_phy_pwr(device, 0);
+	if (inst->cfg->id == EXYNOS4x12_HSIC0 ||
+	    inst->cfg->id == EXYNOS4x12_HSIC1) {
+		device->enabled--;
+		if (!device->enabled) {
+			exynos4x12_isol(device, 1);
+			exynos4x12_phy_pwr(device, 0);
+		}
 	}
 
 	return 0;
diff --git a/drivers/phy/phy-samsung-usb2.h b/drivers/phy/phy-samsung-usb2.h
index 51a16016a214..848744ab8f38 100644
--- a/drivers/phy/phy-samsung-usb2.h
+++ b/drivers/phy/phy-samsung-usb2.h
@@ -29,7 +29,7 @@ struct samsung_usb2_phy_instance {
 	const struct samsung_usb2_common_phy *cfg;
 	struct phy *phy;
 	struct samsung_usb2_phy_driver *drv;
-	bool enabled;
+	int enabled;
 };
 
 struct samsung_usb2_phy_driver {
-- 
1.9.2
