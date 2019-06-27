From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/3] usb: dwc3: exynos: Use Exynos specific XHCI-plat driver
 variant
Date: Thu, 27 Jun 2019 09:17:25 +0200
Message-ID: <20190627071726.30467-3-m.szyprowski@samsung.com>
References: <20190627071726.30467-1-m.szyprowski@samsung.com>
        <CGME20190627071745eucas1p1fa1b9d46e67b131522f49d73ac12d8ed@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190627071726.30467-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos5 SoCs needs to calibrate USB3.0 DRD PHY after every XHCI HCD
reset. This patch adds support for instantiating Exynos5-specific variant
of XHCI-plat driver, which handles the required USB3.0 DRD PHY
calibration.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc3/Kconfig       |  1 +
 drivers/usb/dwc3/core.c        |  1 +
 drivers/usb/dwc3/core.h        |  1 +
 drivers/usb/dwc3/dwc3-exynos.c | 64 +++++++++++++++++++++++-----------
 drivers/usb/dwc3/host.c        |  2 +-
 5 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 89abc6078703..badf86dfb027 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -67,6 +67,7 @@ config USB_DWC3_OMAP
 config USB_DWC3_EXYNOS
 	tristate "Samsung Exynos Platform"
 	depends on (ARCH_EXYNOS || COMPILE_TEST) && OF
+	select USB_XHCI_EXYNOS if USB_XHCI_PLATFORM
 	default USB_DWC3
 	help
 	  Recent Exynos5 SoCs ship with one DesignWare Core USB3 IP inside,
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c9bb93a2c81e..baa029ceede9 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1303,6 +1303,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				    &dwc->hsphy_interface);
 	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
 				 &dwc->fladj);
+	device_property_read_string(dev, "snps,xhci_variant", &dwc->hcd_name);
 
 	dwc->dis_metastability_quirk = device_property_read_bool(dev,
 				"snps,dis_metastability_quirk");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 3dd783b889cb..1b8f5f5814a4 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1176,6 +1176,7 @@ struct dwc3 {
 	u8			tx_max_burst_prd;
 
 	const char		*hsphy_interface;
+	const char		*hcd_name;
 
 	unsigned		connected:1;
 	unsigned		delayed_status:1;
diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index c1e9ea621f41..4e847073e85e 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
@@ -35,22 +36,20 @@ struct dwc3_exynos {
 
 	struct regulator	*vdd33;
 	struct regulator	*vdd10;
+	struct platform_device	*dwc3;
 };
 
-static int dwc3_exynos_remove_child(struct device *dev, void *unused)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-
-	platform_device_unregister(pdev);
-
-	return 0;
-}
+static const struct property_entry dwc3_exynos_properties[] = {
+	PROPERTY_ENTRY_STRING("snps,xhci_variant", "exynos5-dwc3-xhci"),
+	{}
+};
 
 static int dwc3_exynos_probe(struct platform_device *pdev)
 {
 	struct dwc3_exynos	*exynos;
 	struct device		*dev = &pdev->dev;
-	struct device_node	*node = dev->of_node;
+	struct device_node	*node = dev->of_node, *child;
+	struct platform_device	*dwc3;
 	const struct dwc3_exynos_driverdata *driver_data;
 	int			i, ret;
 
@@ -109,21 +108,43 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 		goto vdd10_err;
 	}
 
-	if (node) {
-		ret = of_platform_populate(node, NULL, NULL, dev);
-		if (ret) {
-			dev_err(dev, "failed to add dwc3 core\n");
-			goto populate_err;
-		}
-	} else {
-		dev_err(dev, "no device node, failed to add dwc3 core\n");
-		ret = -ENODEV;
-		goto populate_err;
+	child = of_get_next_child(node, NULL);
+	if (!child) {
+		dev_err(dev, "Failed to find DWC3 core device node\n");
+		goto dwc3_child_err;
+	}
+
+	dwc3 = of_device_alloc(child, NULL, dev);
+	if (!dwc3) {
+		dev_err(dev, "Failed to allocate DWC3 core device\n");
+		goto dwc3_alloc_err;
+	}
+
+	dwc3->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+	dwc3->dev.dma_mask = &dwc3->dev.coherent_dma_mask;
+	dwc3->dev.bus = &platform_bus_type;
+
+	ret = platform_device_add_properties(dwc3, dwc3_exynos_properties);
+	if (ret < 0) {
+		dev_err(dev, "Failed to add properties to DWC3 device\n");
+		goto dwc3_props_err;
+	}
+
+	ret = of_device_add(dwc3);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register DWC3 core device\n");
+		goto dwc3_props_err;
 	}
+	exynos->dwc3 = dwc3;
+	of_node_put(child);
 
 	return 0;
 
-populate_err:
+dwc3_props_err:
+	platform_device_put(dwc3);
+dwc3_alloc_err:
+	of_node_put(child);
+dwc3_child_err:
 	regulator_disable(exynos->vdd10);
 vdd10_err:
 	regulator_disable(exynos->vdd33);
@@ -142,7 +163,8 @@ static int dwc3_exynos_remove(struct platform_device *pdev)
 	struct dwc3_exynos	*exynos = platform_get_drvdata(pdev);
 	int i;
 
-	device_for_each_child(&pdev->dev, NULL, dwc3_exynos_remove_child);
+	of_device_unregister(exynos->dwc3);
+	platform_device_put(exynos->dwc3);
 
 	for (i = exynos->num_clks - 1; i >= 0; i--)
 		clk_disable_unprepare(exynos->clks[i]);
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f55947294f7c..b526d0c78c3b 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -71,7 +71,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	dwc->xhci_resources[1].flags = res->flags;
 	dwc->xhci_resources[1].name = res->name;
 
-	xhci = platform_device_alloc("xhci-hcd", PLATFORM_DEVID_AUTO);
+	xhci = platform_device_alloc(dwc->hcd_name, PLATFORM_DEVID_AUTO);
 	if (!xhci) {
 		dev_err(dwc->dev, "couldn't allocate xHCI device\n");
 		return -ENOMEM;
-- 
2.17.1
