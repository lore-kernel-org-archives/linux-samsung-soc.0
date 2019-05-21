From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/5] usb: exynos: add support for getting PHYs from the
 standard dt array
Date: Tue, 21 May 2019 13:58:47 +0200
Message-ID: <20190521115849.9882-4-m.szyprowski@samsung.com>
References: <20190521115849.9882-1-m.szyprowski@samsung.com>
        <CGME20190521120249eucas1p2e4a8fec922fa78783d7d3fed785f3e3b@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190521115849.9882-1-m.szyprowski@samsung.com>
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
 drivers/usb/host/ehci-exynos.c | 14 +++++++++++++-
 drivers/usb/host/ohci-exynos.c | 14 +++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 3a29a1a8519c..2a551a807ec0 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -50,10 +50,22 @@ static int exynos_ehci_get_phy(struct device *dev,
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
+	if (num_phys)
+		return 0;
+
+	/* Get PHYs using legacy bindings */
 	for_each_available_child_of_node(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &phy_number);
 		if (ret) {
diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 905c6317e0c3..195ea5fa021e 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -39,10 +39,22 @@ static int exynos_ohci_get_phy(struct device *dev,
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
+	if (num_phys)
+		return 0;
+
+	/* Get PHYs using legacy bindings */
 	for_each_available_child_of_node(dev->of_node, child) {
 		ret = of_property_read_u32(child, "reg", &phy_number);
 		if (ret) {
-- 
2.17.1
