From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 4/4] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Mon, 21 Sep 2015 12:16:12 +0200
Message-ID: <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

DWC2 module on some platforms needs three additional hardware
resources: phy controller, clock and power supply. All of them must be
enabled/activated to properly initialize and operate. This was initially
handled in s3c-hsotg driver, which has been converted to 'gadget' part
of dwc2 driver. Unfortunately, not all of this code got moved to common
platform code, what resulted in accessing DWC2 registers without
enabling low-level hardware resources. This fails for example on Exynos
SoCs. This patch moves all the code for managing those resources to
common platform.c file and provides convenient wrappers for controlling
them.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h     |   4 +-
 drivers/usb/dwc2/gadget.c   | 193 ++++--------------------------------
 drivers/usb/dwc2/platform.c | 234 +++++++++++++++++++++++++++++++++++++-------
 3 files changed, 217 insertions(+), 214 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 1a7982d..a130e38 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -706,6 +706,7 @@ struct dwc2_hsotg {
 	enum usb_dr_mode dr_mode;
 	unsigned int hcd_enabled:1;
 	unsigned int gadget_enabled:1;
+	unsigned int ll_hw_enabled:1;
 
 	struct phy *phy;
 	struct usb_phy *uphy;
@@ -1104,7 +1105,8 @@ extern void dwc2_set_all_params(struct dwc2_core_params *params, int value);
 
 extern int dwc2_get_hwparams(struct dwc2_hsotg *hsotg);
 
-
+extern int dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg);
+extern int dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg);
 
 /*
  * Dump core registers and SPRAM
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 3f656d9..12ac879 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -25,15 +25,11 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/clk.h>
-#include <linux/regulator/consumer.h>
 #include <linux/of_platform.h>
-#include <linux/phy/phy.h>
 
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/phy.h>
-#include <linux/platform_data/s3c-hsotg.h>
 
 #include "core.h"
 #include "hw.h"
@@ -2944,50 +2940,6 @@ static struct usb_ep_ops dwc2_hsotg_ep_ops = {
 };
 
 /**
- * dwc2_hsotg_phy_enable - enable platform phy dev
- * @hsotg: The driver state
- *
- * A wrapper for platform code responsible for controlling
- * low-level USB code
- */
-static void dwc2_hsotg_phy_enable(struct dwc2_hsotg *hsotg)
-{
-	struct platform_device *pdev = to_platform_device(hsotg->dev);
-
-	dev_dbg(hsotg->dev, "pdev 0x%p\n", pdev);
-
-	if (hsotg->uphy)
-		usb_phy_init(hsotg->uphy);
-	else if (hsotg->plat && hsotg->plat->phy_init)
-		hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
-	else {
-		phy_init(hsotg->phy);
-		phy_power_on(hsotg->phy);
-	}
-}
-
-/**
- * dwc2_hsotg_phy_disable - disable platform phy dev
- * @hsotg: The driver state
- *
- * A wrapper for platform code responsible for controlling
- * low-level USB code
- */
-static void dwc2_hsotg_phy_disable(struct dwc2_hsotg *hsotg)
-{
-	struct platform_device *pdev = to_platform_device(hsotg->dev);
-
-	if (hsotg->uphy)
-		usb_phy_shutdown(hsotg->uphy);
-	else if (hsotg->plat && hsotg->plat->phy_exit)
-		hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
-	else {
-		phy_power_off(hsotg->phy);
-		phy_exit(hsotg->phy);
-	}
-}
-
-/**
  * dwc2_hsotg_init - initalize the usb core
  * @hsotg: The driver state
  */
@@ -3068,14 +3020,12 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
 	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-				    hsotg->supplies);
-	if (ret) {
-		dev_err(hsotg->dev, "failed to enable supplies: %d\n", ret);
-		goto err;
+	if (hsotg->dr_mode == USB_DR_MODE_PERIPHERAL) {
+		ret = dwc2_lowlevel_hw_enable(hsotg);
+		if (ret)
+			goto err;
 	}
 
-	dwc2_hsotg_phy_enable(hsotg);
 	if (!IS_ERR_OR_NULL(hsotg->uphy))
 		otg_set_peripheral(hsotg->uphy->otg, &hsotg->gadget);
 
@@ -3133,9 +3083,9 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 
 	if (!IS_ERR_OR_NULL(hsotg->uphy))
 		otg_set_peripheral(hsotg->uphy->otg, NULL);
-	dwc2_hsotg_phy_disable(hsotg);
 
-	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
+	if (hsotg->dr_mode == USB_DR_MODE_PERIPHERAL)
+		dwc2_lowlevel_hw_disable(hsotg);
 
 	mutex_unlock(&hsotg->init_mutex);
 
@@ -3473,15 +3423,11 @@ static inline void dwc2_hsotg_of_probe(struct dwc2_hsotg *hsotg) { }
 int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 {
 	struct device *dev = hsotg->dev;
-	struct dwc2_hsotg_plat *plat = dev->platform_data;
 	int epnum;
 	int ret;
 	int i;
 	u32 p_tx_fifo[] = DWC2_G_P_LEGACY_TX_FIFO_SIZE;
 
-	/* Set default UTMI width */
-	hsotg->phyif = GUSBCFG_PHYIF16;
-
 	/* Initialize to legacy fifo configuration values */
 	hsotg->g_rx_fifo_sz = 2048;
 	hsotg->g_np_g_tx_fifo_sz = 1024;
@@ -3495,32 +3441,6 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 	for (i = 0; i < MAX_EPS_CHANNELS; i++)
 		dev_dbg(dev, "Periodic TXFIFO%2d size: %d\n", i,
 						hsotg->g_tx_fifo_sz[i]);
-	/*
-	 * If platform probe couldn't find a generic PHY or an old style
-	 * USB PHY, fall back to pdata
-	 */
-	if (IS_ERR_OR_NULL(hsotg->phy) && IS_ERR_OR_NULL(hsotg->uphy)) {
-		plat = dev_get_platdata(dev);
-		if (!plat) {
-			dev_err(dev,
-			"no platform data or transceiver defined\n");
-			return -EPROBE_DEFER;
-		}
-		hsotg->plat = plat;
-	} else if (hsotg->phy) {
-		/*
-		 * If using the generic PHY framework, check if the PHY bus
-		 * width is 8-bit and set the phyif appropriately.
-		 */
-		if (phy_get_bus_width(hsotg->phy) == 8)
-			hsotg->phyif = GUSBCFG_PHYIF8;
-	}
-
-	hsotg->clk = devm_clk_get(dev, "otg");
-	if (IS_ERR(hsotg->clk)) {
-		hsotg->clk = NULL;
-		dev_dbg(dev, "cannot get otg clock\n");
-	}
 
 	hsotg->gadget.max_speed = USB_SPEED_HIGH;
 	hsotg->gadget.ops = &dwc2_hsotg_gadget_ops;
@@ -3528,38 +3448,6 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 	if (hsotg->dr_mode == USB_DR_MODE_OTG)
 		hsotg->gadget.is_otg = 1;
 
-	/* reset the system */
-
-	ret = clk_prepare_enable(hsotg->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable otg clk\n");
-		goto err_clk;
-	}
-
-
-	/* regulators */
-
-	for (i = 0; i < ARRAY_SIZE(hsotg->supplies); i++)
-		hsotg->supplies[i].supply = dwc2_hsotg_supply_names[i];
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hsotg->supplies),
-				 hsotg->supplies);
-	if (ret) {
-		dev_err(dev, "failed to request supplies: %d\n", ret);
-		goto err_clk;
-	}
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-				    hsotg->supplies);
-
-	if (ret) {
-		dev_err(dev, "failed to enable supplies: %d\n", ret);
-		goto err_clk;
-	}
-
-	/* usb phy enable */
-	dwc2_hsotg_phy_enable(hsotg);
-
 	/*
 	 * Force Device mode before initialization.
 	 * This allows correctly configuring fifo for device mode.
@@ -3577,7 +3465,7 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 	ret = dwc2_hsotg_hw_cfg(hsotg);
 	if (ret) {
 		dev_err(hsotg->dev, "Hardware configuration failed: %d\n", ret);
-		goto err_clk;
+		return ret;
 	}
 
 	dwc2_hsotg_init(hsotg);
@@ -3589,35 +3477,28 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 			DWC2_CTRL_BUFF_SIZE, GFP_KERNEL);
 	if (!hsotg->ctrl_buff) {
 		dev_err(dev, "failed to allocate ctrl request buff\n");
-		ret = -ENOMEM;
-		goto err_supplies;
+		return -ENOMEM;
 	}
 
 	hsotg->ep0_buff = devm_kzalloc(hsotg->dev,
 			DWC2_CTRL_BUFF_SIZE, GFP_KERNEL);
 	if (!hsotg->ep0_buff) {
 		dev_err(dev, "failed to allocate ctrl reply buff\n");
-		ret = -ENOMEM;
-		goto err_supplies;
+		return -ENOMEM;
 	}
 
 	ret = devm_request_irq(hsotg->dev, irq, dwc2_hsotg_irq, IRQF_SHARED,
 				dev_name(hsotg->dev), hsotg);
 	if (ret < 0) {
-		dwc2_hsotg_phy_disable(hsotg);
-		clk_disable_unprepare(hsotg->clk);
-		regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies),
-				       hsotg->supplies);
 		dev_err(dev, "cannot claim IRQ for gadget\n");
-		goto err_supplies;
+		return ret;
 	}
 
 	/* hsotg->num_of_eps holds number of EPs other than ep0 */
 
 	if (hsotg->num_of_eps == 0) {
 		dev_err(dev, "wrong number of EPs (zero)\n");
-		ret = -EINVAL;
-		goto err_supplies;
+		return -EINVAL;
 	}
 
 	/* setup endpoint information */
@@ -3631,8 +3512,7 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 						     GFP_KERNEL);
 	if (!hsotg->ctrl_req) {
 		dev_err(dev, "failed to allocate ctrl req\n");
-		ret = -ENOMEM;
-		goto err_supplies;
+		return -ENOMEM;
 	}
 
 	/* initialise the endpoints now the core has been initialised */
@@ -3645,30 +3525,13 @@ int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq)
 								epnum, 0);
 	}
 
-	/* disable power and clock */
-	dwc2_hsotg_phy_disable(hsotg);
-
-	ret = regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies),
-				    hsotg->supplies);
-	if (ret) {
-		dev_err(dev, "failed to disable supplies: %d\n", ret);
-		goto err_supplies;
-	}
-
 	ret = usb_add_gadget_udc(dev, &hsotg->gadget);
 	if (ret)
-		goto err_supplies;
+		return ret;
 
 	dwc2_hsotg_dump(hsotg);
 
 	return 0;
-
-err_supplies:
-	dwc2_hsotg_phy_disable(hsotg);
-err_clk:
-	clk_disable_unprepare(hsotg->clk);
-
-	return ret;
 }
 
 /**
@@ -3678,7 +3541,6 @@ err_clk:
 int dwc2_hsotg_remove(struct dwc2_hsotg *hsotg)
 {
 	usb_del_gadget_udc(&hsotg->gadget);
-	clk_disable_unprepare(hsotg->clk);
 
 	return 0;
 }
@@ -3686,12 +3548,9 @@ int dwc2_hsotg_remove(struct dwc2_hsotg *hsotg)
 int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
 {
 	unsigned long flags;
-	int ret = 0;
 
 	if (hsotg->lx_state != DWC2_L0)
-		return ret;
-
-	mutex_lock(&hsotg->init_mutex);
+		return 0;
 
 	if (hsotg->driver) {
 		int ep;
@@ -3706,52 +3565,34 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
 		hsotg->gadget.speed = USB_SPEED_UNKNOWN;
 		spin_unlock_irqrestore(&hsotg->lock, flags);
 
-		dwc2_hsotg_phy_disable(hsotg);
-
 		for (ep = 0; ep < hsotg->num_of_eps; ep++) {
 			if (hsotg->eps_in[ep])
 				dwc2_hsotg_ep_disable(&hsotg->eps_in[ep]->ep);
 			if (hsotg->eps_out[ep])
 				dwc2_hsotg_ep_disable(&hsotg->eps_out[ep]->ep);
 		}
-
-		ret = regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies),
-					     hsotg->supplies);
-		clk_disable(hsotg->clk);
 	}
 
-	mutex_unlock(&hsotg->init_mutex);
-
-	return ret;
+	return 0;
 }
 
 int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg)
 {
 	unsigned long flags;
-	int ret = 0;
 
 	if (hsotg->lx_state == DWC2_L2)
-		return ret;
-
-	mutex_lock(&hsotg->init_mutex);
+		return 0;
 
 	if (hsotg->driver) {
 		dev_info(hsotg->dev, "resuming usb gadget %s\n",
 			 hsotg->driver->driver.name);
 
-		clk_enable(hsotg->clk);
-		ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-					    hsotg->supplies);
-
-		dwc2_hsotg_phy_enable(hsotg);
-
 		spin_lock_irqsave(&hsotg->lock, flags);
 		dwc2_hsotg_core_init_disconnected(hsotg, false);
 		if (hsotg->enabled)
 			dwc2_hsotg_core_connect(hsotg);
 		spin_unlock_irqrestore(&hsotg->lock, flags);
 	}
-	mutex_unlock(&hsotg->init_mutex);
 
-	return ret;
+	return 0;
 }
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index f8ab538..e927a00 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -37,11 +37,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/of_device.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_data/s3c-hsotg.h>
 
 #include <linux/usb/of.h>
 
@@ -111,6 +114,145 @@ static const struct dwc2_core_params params_rk3066 = {
 	.hibernation			= -1,
 };
 
+static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
+{
+	struct platform_device *pdev = to_platform_device(hsotg->dev);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
+				    hsotg->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(hsotg->clk);
+	if (ret)
+		return ret;
+
+	if (hsotg->uphy)
+		ret = usb_phy_init(hsotg->uphy);
+	else if (hsotg->plat && hsotg->plat->phy_init)
+		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
+	else {
+		ret = phy_power_on(hsotg->phy);
+		if (ret == 0)
+			ret = phy_init(hsotg->phy);
+	}
+
+	return ret;
+}
+
+/**
+ * dwc2_lowlevel_hw_enable - enable platform lowlevel hw resources
+ * @hsotg: The driver state
+ *
+ * A wrapper for platform code responsible for controlling
+ * low-level USB platform resources (phy, clock, regulators)
+ */
+int dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
+{
+	int ret = __dwc2_lowlevel_hw_enable(hsotg);
+
+	if (ret == 0)
+		hsotg->ll_hw_enabled = true;
+	return ret;
+}
+
+static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
+{
+	struct platform_device *pdev = to_platform_device(hsotg->dev);
+	int ret = 0;
+
+	if (hsotg->uphy)
+		usb_phy_shutdown(hsotg->uphy);
+	else if (hsotg->plat && hsotg->plat->phy_exit)
+		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
+	else {
+		ret = phy_exit(hsotg->phy);
+		if (ret == 0)
+			ret = phy_power_off(hsotg->phy);
+	}
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(hsotg->clk);
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies),
+				     hsotg->supplies);
+
+	return ret;
+}
+
+/**
+ * dwc2_lowlevel_hw_disable - disable platform lowlevel hw resources
+ * @hsotg: The driver state
+ *
+ * A wrapper for platform code responsible for controlling
+ * low-level USB platform resources (phy, clock, regulators)
+ */
+int dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
+{
+	int ret = __dwc2_lowlevel_hw_disable(hsotg);
+
+	if (ret == 0)
+		hsotg->ll_hw_enabled = false;
+	return ret;
+}
+
+static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
+{
+	int i, ret;
+
+	/* Set default UTMI width */
+	hsotg->phyif = GUSBCFG_PHYIF16;
+
+	/*
+	 * Attempt to find a generic PHY, then look for an old style
+	 * USB PHY and then fall back to pdata
+	 */
+	hsotg->phy = devm_phy_get(hsotg->dev, "usb2-phy");
+	if (IS_ERR(hsotg->phy)) {
+		hsotg->phy = NULL;
+		hsotg->uphy = devm_usb_get_phy(hsotg->dev, USB_PHY_TYPE_USB2);
+		if (IS_ERR(hsotg->uphy))
+			hsotg->uphy = NULL;
+		else
+			hsotg->plat = dev_get_platdata(hsotg->dev);
+	}
+
+	if (hsotg->phy) {
+		/*
+		 * If using the generic PHY framework, check if the PHY bus
+		 * width is 8-bit and set the phyif appropriately.
+		 */
+		if (phy_get_bus_width(hsotg->phy) == 8)
+			hsotg->phyif = GUSBCFG_PHYIF8;
+	}
+
+	if (!hsotg->phy && !hsotg->uphy && !hsotg->plat) {
+		dev_err(hsotg->dev, "no platform data or transceiver defined\n");
+		return -EPROBE_DEFER;
+	}
+
+	/* Clock */
+	hsotg->clk = devm_clk_get(hsotg->dev, "otg");
+	if (IS_ERR(hsotg->clk)) {
+		hsotg->clk = NULL;
+		dev_dbg(hsotg->dev, "cannot get otg clock\n");
+	}
+
+	/* Regulators */
+	for (i = 0; i < ARRAY_SIZE(hsotg->supplies); i++)
+		hsotg->supplies[i].supply = dwc2_hsotg_supply_names[i];
+
+	ret = devm_regulator_bulk_get(hsotg->dev, ARRAY_SIZE(hsotg->supplies),
+				      hsotg->supplies);
+	if (ret) {
+		dev_err(hsotg->dev, "failed to request supplies: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
 /**
  * dwc2_driver_remove() - Called when the DWC_otg core is unregistered with the
  * DWC_otg driver
@@ -126,12 +268,19 @@ static int dwc2_driver_remove(struct platform_device *dev)
 {
 	struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
 
+	mutex_lock(&hsotg->init_mutex);
+
 	dwc2_debugfs_exit(hsotg);
 	if (hsotg->hcd_enabled)
 		dwc2_hcd_remove(hsotg);
 	if (hsotg->gadget_enabled)
 		dwc2_hsotg_remove(hsotg);
 
+	if (hsotg->ll_hw_enabled)
+		dwc2_lowlevel_hw_disable(hsotg);
+
+	mutex_unlock(&hsotg->init_mutex);
+
 	return 0;
 }
 
@@ -163,8 +312,6 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	struct dwc2_core_params defparams;
 	struct dwc2_hsotg *hsotg;
 	struct resource *res;
-	struct phy *phy;
-	struct usb_phy *uphy;
 	int retval;
 	int irq;
 
@@ -222,32 +369,13 @@ static int dwc2_driver_probe(struct platform_device *dev)
 
 	hsotg->dr_mode = of_usb_get_dr_mode(dev->dev.of_node);
 
-	/*
-	 * Attempt to find a generic PHY, then look for an old style
-	 * USB PHY
-	 */
-	phy = devm_phy_get(&dev->dev, "usb2-phy");
-	if (IS_ERR(phy)) {
-		hsotg->phy = NULL;
-		uphy = devm_usb_get_phy(&dev->dev, USB_PHY_TYPE_USB2);
-		if (IS_ERR(uphy))
-			hsotg->uphy = NULL;
-		else
-			hsotg->uphy = uphy;
-	} else {
-		hsotg->phy = phy;
-		phy_power_on(hsotg->phy);
-		phy_init(hsotg->phy);
-	}
+	retval = dwc2_lowlevel_hw_init(hsotg);
+	if (retval)
+		return retval;
 
 	spin_lock_init(&hsotg->lock);
 	mutex_init(&hsotg->init_mutex);
 
-	/* Detect config values from hardware */
-	retval = dwc2_get_hwparams(hsotg);
-	if (retval)
-		return retval;
-
 	hsotg->core_params = devm_kzalloc(&dev->dev,
 				sizeof(*hsotg->core_params), GFP_KERNEL);
 	if (!hsotg->core_params)
@@ -255,13 +383,24 @@ static int dwc2_driver_probe(struct platform_device *dev)
 
 	dwc2_set_all_params(hsotg->core_params, -1);
 
+	retval = dwc2_lowlevel_hw_enable(hsotg);
+	if (retval)
+		return retval;
+
+	/* Detect config values from hardware */
+	retval = dwc2_get_hwparams(hsotg);
+	if (retval)
+		goto error;
+
 	/* Validate parameter values */
 	dwc2_set_parameters(hsotg, params);
 
+	mutex_lock(&hsotg->init_mutex);
+
 	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
 		retval = dwc2_gadget_init(hsotg, irq);
 		if (retval)
-			return retval;
+			goto err_unlock;
 		hsotg->gadget_enabled = 1;
 	}
 
@@ -270,7 +409,7 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		if (retval) {
 			if (hsotg->gadget_enabled)
 				dwc2_hsotg_remove(hsotg);
-			return retval;
+			goto err_unlock;
 		}
 		hsotg->hcd_enabled = 1;
 	}
@@ -279,6 +418,18 @@ static int dwc2_driver_probe(struct platform_device *dev)
 
 	dwc2_debugfs_init(hsotg);
 
+	/* Gadget code manages lowlevel hw on its own */
+	if (hsotg->dr_mode == USB_DR_MODE_PERIPHERAL)
+		dwc2_lowlevel_hw_disable(hsotg);
+
+	mutex_unlock(&hsotg->init_mutex);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&hsotg->init_mutex);
+error:
+	dwc2_lowlevel_hw_disable(hsotg);
 	return retval;
 }
 
@@ -287,13 +438,16 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
 	struct dwc2_hsotg *dwc2 = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (dwc2_is_device_mode(dwc2)) {
-		ret = dwc2_hsotg_suspend(dwc2);
-	} else {
-		phy_exit(dwc2->phy);
-		phy_power_off(dwc2->phy);
+	mutex_lock(&dwc2->init_mutex);
+
+	if (dwc2_is_device_mode(dwc2))
+		dwc2_hsotg_suspend(dwc2);
+
+	if (dwc2->ll_hw_enabled)
+		ret = __dwc2_lowlevel_hw_disable(dwc2);
+
+	mutex_unlock(&dwc2->init_mutex);
 
-	}
 	return ret;
 }
 
@@ -302,13 +456,19 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 	struct dwc2_hsotg *dwc2 = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (dwc2_is_device_mode(dwc2)) {
-		ret = dwc2_hsotg_resume(dwc2);
-	} else {
-		phy_power_on(dwc2->phy);
-		phy_init(dwc2->phy);
+	mutex_lock(&dwc2->init_mutex);
 
+	if (dwc2->ll_hw_enabled) {
+		ret = __dwc2_lowlevel_hw_enable(dwc2);
+		if (ret)
+			goto err;
 	}
+
+	if (dwc2_is_device_mode(dwc2))
+		ret = dwc2_hsotg_resume(dwc2);
+err:
+	mutex_unlock(&dwc2->init_mutex);
+
 	return ret;
 }
 
-- 
1.9.2
