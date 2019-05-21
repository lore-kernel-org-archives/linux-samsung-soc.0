From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/5] usb: exynos: Remove support for legacy PHY bindings
Date: Tue, 21 May 2019 13:58:49 +0200
Message-ID: <20190521115849.9882-6-m.szyprowski@samsung.com>
References: <20190521115849.9882-1-m.szyprowski@samsung.com>
        <CGME20190521120354eucas1p2a39ba06586ddd388a9c376a40327bb4c@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190521115849.9882-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Exnyos EHCI/OHCI custom port device tree sub-nodes under EHCI/OHCI
devices has been removed, so the code for handling them can be also
removed. Once this has been done, we can also remove the workaround
added by commit 01d4071486fe ("usb: exynos: add workaround for the USB
device bindings conflict") and enable support for the generic USB device
bindings.

Suggested-by: Måns Rullgård <mans@mansr.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/host/ehci-exynos.c | 46 ----------------------------------
 drivers/usb/host/ohci-exynos.c | 46 ----------------------------------
 2 files changed, 92 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 2a551a807ec0..afde1ffa0824 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -39,7 +39,6 @@ static struct hc_driver __read_mostly exynos_ehci_hc_driver;
 
 struct exynos_ehci_hcd {
 	struct clk *clk;
-	struct device_node *of_node;
 	struct phy *phy[PHY_NUMBER];
 };
 
@@ -48,10 +47,8 @@ struct exynos_ehci_hcd {
 static int exynos_ehci_get_phy(struct device *dev,
 				struct exynos_ehci_hcd *exynos_ehci)
 {
-	struct device_node *child;
 	struct phy *phy;
 	int phy_number, num_phys;
-	int ret;
 
 	/* Get PHYs for the controller */
 	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
@@ -62,39 +59,6 @@ static int exynos_ehci_get_phy(struct device *dev,
 			return PTR_ERR(phy);
 		exynos_ehci->phy[phy_number] = phy;
 	}
-	if (num_phys)
-		return 0;
-
-	/* Get PHYs using legacy bindings */
-	for_each_available_child_of_node(dev->of_node, child) {
-		ret = of_property_read_u32(child, "reg", &phy_number);
-		if (ret) {
-			dev_err(dev, "Failed to parse device tree\n");
-			of_node_put(child);
-			return ret;
-		}
-
-		if (phy_number >= PHY_NUMBER) {
-			dev_err(dev, "Invalid number of PHYs\n");
-			of_node_put(child);
-			return -EINVAL;
-		}
-
-		phy = devm_of_phy_get(dev, child, NULL);
-		exynos_ehci->phy[phy_number] = phy;
-		if (IS_ERR(phy)) {
-			ret = PTR_ERR(phy);
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(child);
-				return ret;
-			} else if (ret != -ENOSYS && ret != -ENODEV) {
-				dev_err(dev,
-					"Error retrieving usb2 phy: %d\n", ret);
-				of_node_put(child);
-				return ret;
-			}
-		}
-	}
 
 	return 0;
 }
@@ -216,13 +180,6 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = hcd->regs;
 
-	/*
-	 * Workaround: reset of_node pointer to avoid conflict between Exynos
-	 * EHCI port subnodes and generic USB device bindings
-	 */
-	exynos_ehci->of_node = pdev->dev.of_node;
-	pdev->dev.of_node = NULL;
-
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
 
@@ -239,7 +196,6 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 
 fail_add_hcd:
 	exynos_ehci_phy_disable(&pdev->dev);
-	pdev->dev.of_node = exynos_ehci->of_node;
 fail_io:
 	clk_disable_unprepare(exynos_ehci->clk);
 fail_clk:
@@ -252,8 +208,6 @@ static int exynos_ehci_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct exynos_ehci_hcd *exynos_ehci = to_exynos_ehci(hcd);
 
-	pdev->dev.of_node = exynos_ehci->of_node;
-
 	usb_remove_hcd(hcd);
 
 	exynos_ehci_phy_disable(&pdev->dev);
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 195ea5fa021e..8e9f4ef4e397 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -30,17 +30,14 @@ static struct hc_driver __read_mostly exynos_ohci_hc_driver;
 
 struct exynos_ohci_hcd {
 	struct clk *clk;
-	struct device_node *of_node;
 	struct phy *phy[PHY_NUMBER];
 };
 
 static int exynos_ohci_get_phy(struct device *dev,
 				struct exynos_ohci_hcd *exynos_ohci)
 {
-	struct device_node *child;
 	struct phy *phy;
 	int phy_number, num_phys;
-	int ret;
 
 	/* Get PHYs for the controller */
 	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
@@ -51,39 +48,6 @@ static int exynos_ohci_get_phy(struct device *dev,
 			return PTR_ERR(phy);
 		exynos_ohci->phy[phy_number] = phy;
 	}
-	if (num_phys)
-		return 0;
-
-	/* Get PHYs using legacy bindings */
-	for_each_available_child_of_node(dev->of_node, child) {
-		ret = of_property_read_u32(child, "reg", &phy_number);
-		if (ret) {
-			dev_err(dev, "Failed to parse device tree\n");
-			of_node_put(child);
-			return ret;
-		}
-
-		if (phy_number >= PHY_NUMBER) {
-			dev_err(dev, "Invalid number of PHYs\n");
-			of_node_put(child);
-			return -EINVAL;
-		}
-
-		phy = devm_of_phy_get(dev, child, NULL);
-		exynos_ohci->phy[phy_number] = phy;
-		if (IS_ERR(phy)) {
-			ret = PTR_ERR(phy);
-			if (ret == -EPROBE_DEFER) {
-				of_node_put(child);
-				return ret;
-			} else if (ret != -ENOSYS && ret != -ENODEV) {
-				dev_err(dev,
-					"Error retrieving usb2 phy: %d\n", ret);
-				of_node_put(child);
-				return ret;
-			}
-		}
-	}
 
 	return 0;
 }
@@ -183,13 +147,6 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 		goto fail_io;
 	}
 
-	/*
-	 * Workaround: reset of_node pointer to avoid conflict between Exynos
-	 * OHCI port subnodes and generic USB device bindings
-	 */
-	exynos_ohci->of_node = pdev->dev.of_node;
-	pdev->dev.of_node = NULL;
-
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add USB HCD\n");
@@ -200,7 +157,6 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 
 fail_add_hcd:
 	exynos_ohci_phy_disable(&pdev->dev);
-	pdev->dev.of_node = exynos_ohci->of_node;
 fail_io:
 	clk_disable_unprepare(exynos_ohci->clk);
 fail_clk:
@@ -213,8 +169,6 @@ static int exynos_ohci_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
 
-	pdev->dev.of_node = exynos_ohci->of_node;
-
 	usb_remove_hcd(hcd);
 
 	exynos_ohci_phy_disable(&pdev->dev);
-- 
2.17.1
