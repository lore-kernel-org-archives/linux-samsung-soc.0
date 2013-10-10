From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/5] USB: host: Rename ehci-s5p to ehci-exynos
Date: Thu, 10 Oct 2013 15:31:35 +0900
Message-ID: <000801cec582$5e467820$1ad36860$%han@samsung.com>
References: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13013 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752701Ab3JJGbh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 02:31:37 -0400
In-reply-to: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

Currently, Samsung is using 'EXYNOS' as the name of Samsung SoCs.
Thus, ehci-exynos is preferred than ehci-s5p.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/usb/host/Kconfig                           |    5 +-
 drivers/usb/host/Makefile                          |    2 +-
 drivers/usb/host/{ehci-s5p.c => ehci-exynos.c}     |  164 ++++++++++----------
 .../{usb-ehci-s5p.h => usb-ehci-exynos.h}          |   10 +-
 4 files changed, 90 insertions(+), 91 deletions(-)
 rename drivers/usb/host/{ehci-s5p.c => ehci-exynos.c} (57%)
 rename include/linux/platform_data/{usb-ehci-s5p.h => usb-ehci-exynos.h} (71%)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 70cb1a9..80e72fb 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -203,12 +203,11 @@ config USB_EHCI_SH
 	  Enables support for the on-chip EHCI controller on the SuperH.
 	  If you use the PCI EHCI controller, this option is not necessary.
 
-config USB_EHCI_S5P
+config USB_EHCI_EXYNOS
        tristate "EHCI support for Samsung S5P/EXYNOS SoC Series"
        depends on PLAT_S5P || ARCH_EXYNOS
        help
-	Enable support for the Samsung S5Pxxxx and Exynos3/4/5 SOC's
-	on-chip EHCI controller.
+	Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
 
 config USB_EHCI_MV
 	bool "EHCI support for Marvell PXA/MMP USB controller"
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 0b9fdee..9dc11c2 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -34,7 +34,7 @@ obj-$(CONFIG_USB_EHCI_MXC)	+= ehci-mxc.o
 obj-$(CONFIG_USB_EHCI_HCD_OMAP)	+= ehci-omap.o
 obj-$(CONFIG_USB_EHCI_HCD_ORION)	+= ehci-orion.o
 obj-$(CONFIG_USB_EHCI_HCD_SPEAR)	+= ehci-spear.o
-obj-$(CONFIG_USB_EHCI_S5P)	+= ehci-s5p.o
+obj-$(CONFIG_USB_EHCI_EXYNOS)	+= ehci-exynos.o
 obj-$(CONFIG_USB_EHCI_HCD_AT91) += ehci-atmel.o
 obj-$(CONFIG_USB_EHCI_MSM)	+= ehci-msm.o
 obj-$(CONFIG_USB_EHCI_TEGRA)	+= ehci-tegra.o
diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-exynos.c
similarity index 57%
rename from drivers/usb/host/ehci-s5p.c
rename to drivers/usb/host/ehci-exynos.c
index 7c3de95..42b5fb8 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -1,5 +1,5 @@
 /*
- * SAMSUNG S5P USB HOST EHCI Controller
+ * SAMSUNG EXYNOS USB HOST EHCI Controller
  *
  * Copyright (C) 2011 Samsung Electronics Co.Ltd
  * Author: Jingoo Han <jg1.han@samsung.com>
@@ -20,7 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/usb-ehci-s5p.h>
+#include <linux/platform_data/usb-ehci-exynos.h>
 #include <linux/usb/phy.h>
 #include <linux/usb/samsung_usb_phy.h>
 #include <linux/usb.h>
@@ -29,7 +29,7 @@
 
 #include "ehci.h"
 
-#define DRIVER_DESC "EHCI s5p driver"
+#define DRIVER_DESC "EHCI EXYNOS driver"
 
 #define EHCI_INSNREG00(base)			(base + 0x90)
 #define EHCI_INSNREG00_ENA_INCR16		(0x1 << 25)
@@ -40,21 +40,21 @@
 	(EHCI_INSNREG00_ENA_INCR16 | EHCI_INSNREG00_ENA_INCR8 |	\
 	 EHCI_INSNREG00_ENA_INCR4 | EHCI_INSNREG00_ENA_INCRX_ALIGN)
 
-static const char hcd_name[] = "ehci-s5p";
-static struct hc_driver __read_mostly s5p_ehci_hc_driver;
+static const char hcd_name[] = "ehci-exynos";
+static struct hc_driver __read_mostly exynos_ehci_hc_driver;
 
-struct s5p_ehci_hcd {
+struct exynos_ehci_hcd {
 	struct clk *clk;
 	struct usb_phy *phy;
 	struct usb_otg *otg;
-	struct s5p_ehci_platdata *pdata;
+	struct exynos_ehci_platdata *pdata;
 };
 
-static struct s5p_ehci_platdata empty_platdata;
+static struct exynos_ehci_platdata empty_platdata;
 
-#define to_s5p_ehci(hcd)      (struct s5p_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
+#define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
 
-static void s5p_setup_vbus_gpio(struct platform_device *pdev)
+static void exynos_setup_vbus_gpio(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int err;
@@ -73,10 +73,10 @@ static void s5p_setup_vbus_gpio(struct platform_device *pdev)
 		dev_err(dev, "can't request ehci vbus gpio %d", gpio);
 }
 
-static int s5p_ehci_probe(struct platform_device *pdev)
+static int exynos_ehci_probe(struct platform_device *pdev)
 {
-	struct s5p_ehci_platdata *pdata = dev_get_platdata(&pdev->dev);
-	struct s5p_ehci_hcd *s5p_ehci;
+	struct exynos_ehci_platdata *pdata = dev_get_platdata(&pdev->dev);
+	struct exynos_ehci_hcd *exynos_ehci;
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
 	struct resource *res;
@@ -94,19 +94,19 @@ static int s5p_ehci_probe(struct platform_device *pdev)
 	if (!pdev->dev.coherent_dma_mask)
 		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 
-	s5p_setup_vbus_gpio(pdev);
+	exynos_setup_vbus_gpio(pdev);
 
-	hcd = usb_create_hcd(&s5p_ehci_hc_driver,
+	hcd = usb_create_hcd(&exynos_ehci_hc_driver,
 			     &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
 		dev_err(&pdev->dev, "Unable to create HCD\n");
 		return -ENOMEM;
 	}
-	s5p_ehci = to_s5p_ehci(hcd);
+	exynos_ehci = to_exynos_ehci(hcd);
 
 	if (of_device_is_compatible(pdev->dev.of_node,
 					"samsung,exynos5440-ehci")) {
-		s5p_ehci->pdata = &empty_platdata;
+		exynos_ehci->pdata = &empty_platdata;
 		goto skip_phy;
 	}
 
@@ -118,24 +118,24 @@ static int s5p_ehci_probe(struct platform_device *pdev)
 			dev_warn(&pdev->dev, "no platform data or transceiver defined\n");
 			return -EPROBE_DEFER;
 		} else {
-			s5p_ehci->pdata = pdata;
+			exynos_ehci->pdata = pdata;
 		}
 	} else {
-		s5p_ehci->phy = phy;
-		s5p_ehci->otg = phy->otg;
+		exynos_ehci->phy = phy;
+		exynos_ehci->otg = phy->otg;
 	}
 
 skip_phy:
 
-	s5p_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
+	exynos_ehci->clk = devm_clk_get(&pdev->dev, "usbhost");
 
-	if (IS_ERR(s5p_ehci->clk)) {
+	if (IS_ERR(exynos_ehci->clk)) {
 		dev_err(&pdev->dev, "Failed to get usbhost clock\n");
-		err = PTR_ERR(s5p_ehci->clk);
+		err = PTR_ERR(exynos_ehci->clk);
 		goto fail_clk;
 	}
 
-	err = clk_prepare_enable(s5p_ehci->clk);
+	err = clk_prepare_enable(exynos_ehci->clk);
 	if (err)
 		goto fail_clk;
 
@@ -162,13 +162,13 @@ skip_phy:
 		goto fail_io;
 	}
 
-	if (s5p_ehci->otg)
-		s5p_ehci->otg->set_host(s5p_ehci->otg, &hcd->self);
+	if (exynos_ehci->otg)
+		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
 
-	if (s5p_ehci->phy)
-		usb_phy_init(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_init)
-		s5p_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ehci->phy)
+		usb_phy_init(exynos_ehci->phy);
+	else if (exynos_ehci->pdata->phy_init)
+		exynos_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
@@ -187,33 +187,33 @@ skip_phy:
 	return 0;
 
 fail_add_hcd:
-	if (s5p_ehci->phy)
-		usb_phy_shutdown(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_exit)
-		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ehci->phy)
+		usb_phy_shutdown(exynos_ehci->phy);
+	else if (exynos_ehci->pdata->phy_exit)
+		exynos_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 fail_io:
-	clk_disable_unprepare(s5p_ehci->clk);
+	clk_disable_unprepare(exynos_ehci->clk);
 fail_clk:
 	usb_put_hcd(hcd);
 	return err;
 }
 
-static int s5p_ehci_remove(struct platform_device *pdev)
+static int exynos_ehci_remove(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
-	struct s5p_ehci_hcd *s5p_ehci = to_s5p_ehci(hcd);
+	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
 
 	usb_remove_hcd(hcd);
 
-	if (s5p_ehci->otg)
-		s5p_ehci->otg->set_host(s5p_ehci->otg, &hcd->self);
+	if (exynos_ehci->otg)
+		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
 
-	if (s5p_ehci->phy)
-		usb_phy_shutdown(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_exit)
-		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ehci->phy)
+		usb_phy_shutdown(exynos_ehci->phy);
+	else if (exynos_ehci->pdata->phy_exit)
+		exynos_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
-	clk_disable_unprepare(s5p_ehci->clk);
+	clk_disable_unprepare(exynos_ehci->clk);
 
 	usb_put_hcd(hcd);
 
@@ -221,10 +221,10 @@ static int s5p_ehci_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int s5p_ehci_suspend(struct device *dev)
+static int exynos_ehci_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
-	struct s5p_ehci_hcd *s5p_ehci = to_s5p_ehci(hcd);
+	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
 	struct platform_device *pdev = to_platform_device(dev);
 
 	bool do_wakeup = device_may_wakeup(dev);
@@ -232,34 +232,34 @@ static int s5p_ehci_suspend(struct device *dev)
 
 	rc = ehci_suspend(hcd, do_wakeup);
 
-	if (s5p_ehci->otg)
-		s5p_ehci->otg->set_host(s5p_ehci->otg, &hcd->self);
+	if (exynos_ehci->otg)
+		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
 
-	if (s5p_ehci->phy)
-		usb_phy_shutdown(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_exit)
-		s5p_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ehci->phy)
+		usb_phy_shutdown(exynos_ehci->phy);
+	else if (exynos_ehci->pdata->phy_exit)
+		exynos_ehci->pdata->phy_exit(pdev, USB_PHY_TYPE_HOST);
 
-	clk_disable_unprepare(s5p_ehci->clk);
+	clk_disable_unprepare(exynos_ehci->clk);
 
 	return rc;
 }
 
-static int s5p_ehci_resume(struct device *dev)
+static int exynos_ehci_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
-	struct  s5p_ehci_hcd *s5p_ehci = to_s5p_ehci(hcd);
+	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
 	struct platform_device *pdev = to_platform_device(dev);
 
-	clk_prepare_enable(s5p_ehci->clk);
+	clk_prepare_enable(exynos_ehci->clk);
 
-	if (s5p_ehci->otg)
-		s5p_ehci->otg->set_host(s5p_ehci->otg, &hcd->self);
+	if (exynos_ehci->otg)
+		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
 
-	if (s5p_ehci->phy)
-		usb_phy_init(s5p_ehci->phy);
-	else if (s5p_ehci->pdata->phy_init)
-		s5p_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
+	if (exynos_ehci->phy)
+		usb_phy_init(exynos_ehci->phy);
+	else if (exynos_ehci->pdata->phy_init)
+		exynos_ehci->pdata->phy_init(pdev, USB_PHY_TYPE_HOST);
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
@@ -268,13 +268,13 @@ static int s5p_ehci_resume(struct device *dev)
 	return 0;
 }
 #else
-#define s5p_ehci_suspend	NULL
-#define s5p_ehci_resume		NULL
+#define exynos_ehci_suspend	NULL
+#define exynos_ehci_resume	NULL
 #endif
 
-static const struct dev_pm_ops s5p_ehci_pm_ops = {
-	.suspend	= s5p_ehci_suspend,
-	.resume		= s5p_ehci_resume,
+static const struct dev_pm_ops exynos_ehci_pm_ops = {
+	.suspend	= exynos_ehci_suspend,
+	.resume		= exynos_ehci_resume,
 };
 
 #ifdef CONFIG_OF
@@ -286,40 +286,40 @@ static const struct of_device_id exynos_ehci_match[] = {
 MODULE_DEVICE_TABLE(of, exynos_ehci_match);
 #endif
 
-static struct platform_driver s5p_ehci_driver = {
-	.probe		= s5p_ehci_probe,
-	.remove		= s5p_ehci_remove,
+static struct platform_driver exynos_ehci_driver = {
+	.probe		= exynos_ehci_probe,
+	.remove		= exynos_ehci_remove,
 	.shutdown	= usb_hcd_platform_shutdown,
 	.driver = {
-		.name	= "s5p-ehci",
+		.name	= "exynos-ehci",
 		.owner	= THIS_MODULE,
-		.pm	= &s5p_ehci_pm_ops,
+		.pm	= &exynos_ehci_pm_ops,
 		.of_match_table = of_match_ptr(exynos_ehci_match),
 	}
 };
-static const struct ehci_driver_overrides s5p_overrides __initdata = {
-	.extra_priv_size = sizeof(struct s5p_ehci_hcd),
+static const struct ehci_driver_overrides exynos_overrides __initdata = {
+	.extra_priv_size = sizeof(struct exynos_ehci_hcd),
 };
 
-static int __init ehci_s5p_init(void)
+static int __init ehci_exynos_init(void)
 {
 	if (usb_disabled())
 		return -ENODEV;
 
 	pr_info("%s: " DRIVER_DESC "\n", hcd_name);
-	ehci_init_driver(&s5p_ehci_hc_driver, &s5p_overrides);
-	return platform_driver_register(&s5p_ehci_driver);
+	ehci_init_driver(&exynos_ehci_hc_driver, &exynos_overrides);
+	return platform_driver_register(&exynos_ehci_driver);
 }
-module_init(ehci_s5p_init);
+module_init(ehci_exynos_init);
 
-static void __exit ehci_s5p_cleanup(void)
+static void __exit ehci_exynos_cleanup(void)
 {
-	platform_driver_unregister(&s5p_ehci_driver);
+	platform_driver_unregister(&exynos_ehci_driver);
 }
-module_exit(ehci_s5p_cleanup);
+module_exit(ehci_exynos_cleanup);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_ALIAS("platform:s5p-ehci");
+MODULE_ALIAS("platform:exynos-ehci");
 MODULE_AUTHOR("Jingoo Han");
 MODULE_AUTHOR("Joonyoung Shim");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/platform_data/usb-ehci-s5p.h b/include/linux/platform_data/usb-ehci-exynos.h
similarity index 71%
rename from include/linux/platform_data/usb-ehci-s5p.h
rename to include/linux/platform_data/usb-ehci-exynos.h
index 5f28cae..5413745 100644
--- a/include/linux/platform_data/usb-ehci-s5p.h
+++ b/include/linux/platform_data/usb-ehci-exynos.h
@@ -8,14 +8,14 @@
  * option) any later version.
  */
 
-#ifndef __PLAT_SAMSUNG_EHCI_H
-#define __PLAT_SAMSUNG_EHCI_H __FILE__
+#ifndef __USB_EHCI_EXYNOS_H
+#define __USB_EHCI_EXYNOS_H __FILE__
 
-struct s5p_ehci_platdata {
+struct exynos_ehci_platdata {
 	int (*phy_init)(struct platform_device *pdev, int type);
 	int (*phy_exit)(struct platform_device *pdev, int type);
 };
 
-extern void s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd);
+extern void exynos_ehci_set_platdata(struct exynos_ehci_platdata *pd);
 
-#endif /* __PLAT_SAMSUNG_EHCI_H */
+#endif /* __USB_EHCI_EXYNOS_H */
-- 
1.7.10.4
