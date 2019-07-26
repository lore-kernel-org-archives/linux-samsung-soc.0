From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/3] usb: exynos: add support for getting PHYs from the
 standard dt array
Date: Fri, 26 Jul 2019 10:14:52 +0200
Message-ID: <20190726081453.9456-3-m.szyprowski@samsung.com>
References: <20190726081453.9456-1-m.szyprowski@samsung.com>
        <CGME20190726081505eucas1p146c14eed320c57050aa968b7c97b227b@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190726081453.9456-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add the code for getting generic PHYs from standard device tree array
from the main controller device node. This is a first step in resolving
the conflict between Exynos EHCI/OHCI sub-nodes and generic USB device
bindings. Later the sub-nodes currently used for assigning PHYs to root
ports of the controller will be removed making a place for the generic
USB device bindings nodes.

Suggested-by: Måns Rullgård <mans@mansr.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/host/ehci-exynos.c | 23 +++++++++++++++++++----
 drivers/usb/host/ohci-exynos.c | 23 +++++++++++++++++++----
 2 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 3a29a1a8519c..01debfd03d4a 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -41,6 +41,7 @@ struct exynos_ehci_hcd {
 	struct clk *clk;
 	struct device_node *of_node;
 	struct phy *phy[PHY_NUMBER];
+	bool legacy_phy;
 };
 
 #define to_exynos_ehci(hcd) (struct exynos_ehci_hcd *)(hcd_to_ehci(hcd)->priv)
@@ -50,10 +51,22 @@ static int exynos_ehci_get_phy(struct device *dev,
 {
 	struct device_node *child;
 	struct phy *phy;
-	int phy_number;
+	int phy_number, num_phys;
 	int ret;
 
 	/* Get PHYs for the controller */
+	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
+					      "#phy-cells");
+	for (phy_number = 0; phy_number < num_phys; phy_number++) {
+		phy = devm_of_phy_get_by_index(dev, dev->of_node, phy_number);
+		if (IS_ERR(phy))
+			return PTR_ERR(phy);
+		exynos_ehci->phy[phy_number] = phy;
+	}
+	if (num_phys > 0)
+		return 0;
+
+	/* Get PHYs using legacy bindings */
 	for_each_available_child_of_node(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &phy_number);
 		if (ret) {
@@ -84,6 +97,7 @@ static int exynos_ehci_get_phy(struct device *dev,
 		}
 	}
 
+	exynos_ehci->legacy_phy = true;
 	return 0;
 }
 
@@ -205,11 +219,12 @@ static int exynos_ehci_probe(struct platform_device *pdev)
 	ehci->caps = hcd->regs;
 
 	/*
-	 * Workaround: reset of_node pointer to avoid conflict between Exynos
-	 * EHCI port subnodes and generic USB device bindings
+	 * Workaround: reset of_node pointer to avoid conflict between legacy
+	 * Exynos EHCI port subnodes and generic USB device bindings
 	 */
 	exynos_ehci->of_node = pdev->dev.of_node;
-	pdev->dev.of_node = NULL;
+	if (exynos_ehci->legacy_phy)
+		pdev->dev.of_node = NULL;
 
 	/* DMA burst Enable */
 	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 905c6317e0c3..d5ce98e205c7 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -32,6 +32,7 @@ struct exynos_ohci_hcd {
 	struct clk *clk;
 	struct device_node *of_node;
 	struct phy *phy[PHY_NUMBER];
+	bool legacy_phy;
 };
 
 static int exynos_ohci_get_phy(struct device *dev,
@@ -39,10 +40,22 @@ static int exynos_ohci_get_phy(struct device *dev,
 {
 	struct device_node *child;
 	struct phy *phy;
-	int phy_number;
+	int phy_number, num_phys;
 	int ret;
 
 	/* Get PHYs for the controller */
+	num_phys = of_count_phandle_with_args(dev->of_node, "phys",
+					      "#phy-cells");
+	for (phy_number = 0; phy_number < num_phys; phy_number++) {
+		phy = devm_of_phy_get_by_index(dev, dev->of_node, phy_number);
+		if (IS_ERR(phy))
+			return PTR_ERR(phy);
+		exynos_ohci->phy[phy_number] = phy;
+	}
+	if (num_phys > 0)
+		return 0;
+
+	/* Get PHYs using legacy bindings */
 	for_each_available_child_of_node(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &phy_number);
 		if (ret) {
@@ -73,6 +86,7 @@ static int exynos_ohci_get_phy(struct device *dev,
 		}
 	}
 
+	exynos_ohci->legacy_phy = true;
 	return 0;
 }
 
@@ -172,11 +186,12 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * Workaround: reset of_node pointer to avoid conflict between Exynos
-	 * OHCI port subnodes and generic USB device bindings
+	 * Workaround: reset of_node pointer to avoid conflict between legacy
+	 * Exynos OHCI port subnodes and generic USB device bindings
 	 */
 	exynos_ohci->of_node = pdev->dev.of_node;
-	pdev->dev.of_node = NULL;
+	if (exynos_ohci->legacy_phy)
+		pdev->dev.of_node = NULL;
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
-- 
2.17.1
