From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] usb: dwc2: add support for initial state for dual-role mode
Date: Wed, 17 Dec 2014 14:49:53 +0100
Message-ID: <1418824193-19182-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49975 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750946AbaLQNuL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Dec 2014 08:50:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Felipe Balbi <balbi@ti.com>

DWC2 module on Exynos SoCs is used only as peripheral controller (UDC),
so add support for selecting default initial state for dual-role mode. The
default init mode can be overridden by device tree 'dr_mode' property.
This patch enables to use usb gadget on Exynos SoCs, when DWC2 driver has
been compiled as 'dual-role driver'.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/core.h     |  3 +++
 drivers/usb/dwc2/platform.c | 62 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 7a70a13..b0fed4e 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -354,6 +354,7 @@ struct dwc2_core_params {
 	int reload_ctl;
 	int ahbcfg;
 	int uframe_sched;
+	int default_dr_mode;
 };
 
 /**
@@ -570,6 +571,8 @@ struct dwc2_hsotg {
 	struct dwc2_core_params *core_params;
 	enum usb_otg_state op_state;
 	enum usb_dr_mode dr_mode;
+	unsigned int hcd_enabled:1;
+	unsigned int gadget_enabled:1;
 
 	struct phy *phy;
 	struct usb_phy *uphy;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 6a795aa..8abf437 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -76,6 +76,7 @@ static const struct dwc2_core_params params_bcm2835 = {
 	.reload_ctl			= 0,
 	.ahbcfg				= 0x10,
 	.uframe_sched			= 0,
+	.default_dr_mode		= USB_DR_MODE_OTG,
 };
 
 static const struct dwc2_core_params params_rk3066 = {
@@ -104,6 +105,36 @@ static const struct dwc2_core_params params_rk3066 = {
 	.reload_ctl			= -1,
 	.ahbcfg				= 0x7, /* INCR16 */
 	.uframe_sched			= -1,
+	.default_dr_mode		= USB_DR_MODE_OTG,
+};
+
+static const struct dwc2_core_params params_s3c_hsotg = {
+	.otg_cap			= -1,
+	.otg_ver			= -1,
+	.dma_enable			= 0,
+	.dma_desc_enable		= 0,
+	.speed				= -1,
+	.enable_dynamic_fifo		= -1,
+	.en_multiple_tx_fifo		= -1,
+	.host_rx_fifo_size		= -1,
+	.host_nperio_tx_fifo_size	= -1,
+	.host_perio_tx_fifo_size	= -1,
+	.max_transfer_size		= -1,
+	.max_packet_count		= -1,
+	.host_channels			= -1,
+	.phy_type			= -1,
+	.phy_utmi_width			= -1,
+	.phy_ulpi_ddr			= -1,
+	.phy_ulpi_ext_vbus		= -1,
+	.i2c_enable			= -1,
+	.ulpi_fs_ls			= -1,
+	.host_support_fs_ls_low_power	= -1,
+	.host_ls_low_power_phy_clk	= -1,
+	.ts_dline			= -1,
+	.reload_ctl			= -1,
+	.ahbcfg				= -1,
+	.uframe_sched			= -1,
+	.default_dr_mode		= USB_DR_MODE_PERIPHERAL,
 };
 
 /**
@@ -121,8 +152,10 @@ static int dwc2_driver_remove(struct platform_device *dev)
 {
 	struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
 
-	dwc2_hcd_remove(hsotg);
-	s3c_hsotg_remove(hsotg);
+	if (hsotg->hcd_enabled)
+		dwc2_hcd_remove(hsotg);
+	if (hsotg->gadget_enabled)
+		s3c_hsotg_remove(hsotg);
 
 	return 0;
 }
@@ -131,7 +164,7 @@ static const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "brcm,bcm2835-usb", .data = &params_bcm2835 },
 	{ .compatible = "rockchip,rk3066-usb", .data = &params_rk3066 },
 	{ .compatible = "snps,dwc2", .data = NULL },
-	{ .compatible = "samsung,s3c6400-hsotg", .data = NULL},
+	{ .compatible = "samsung,s3c6400-hsotg", .data = &params_s3c_hsotg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
@@ -211,15 +244,26 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		(unsigned long)res->start, hsotg->regs);
 
 	hsotg->dr_mode = of_usb_get_dr_mode(dev->dev.of_node);
+	if (hsotg->dr_mode == USB_DR_MODE_UNKNOWN &&
+	    params->default_dr_mode > USB_DR_MODE_UNKNOWN)
+		hsotg->dr_mode = params->default_dr_mode;
 
 	spin_lock_init(&hsotg->lock);
 	mutex_init(&hsotg->init_mutex);
-	retval = dwc2_gadget_init(hsotg, irq);
-	if (retval)
-		return retval;
-	retval = dwc2_hcd_init(hsotg, irq, params);
-	if (retval)
-		return retval;
+
+	if (hsotg->dr_mode != USB_DR_MODE_HOST) {
+		retval = dwc2_gadget_init(hsotg, irq);
+		if (retval)
+			return retval;
+		hsotg->gadget_enabled = 1;
+	}
+
+	if (hsotg->dr_mode != USB_DR_MODE_PERIPHERAL) {
+		retval = dwc2_hcd_init(hsotg, irq, params);
+		if (retval)
+			return retval;
+		hsotg->hcd_enabled = 1;
+	}
 
 	platform_set_drvdata(dev, hsotg);
 
-- 
1.9.2
