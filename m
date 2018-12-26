From: Kangjie Lu <kjlu@umn.edu>
Subject: [PATCH] pci: dwc: add a check for resetting gpio
Date: Tue, 25 Dec 2018 20:22:36 -0600
Message-ID: <20181226022236.71682-1-kjlu@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kjlu@umn.edu
Cc: pakki001@umn.edu, Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

devm_gpio_request_one() could fail. The fix checks its status and issues
an error if it fails.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
---
 drivers/pci/controller/dwc/pci-exynos.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index cee5f2f590e2..e3a045e215d2 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -226,9 +226,12 @@ static void exynos_pcie_assert_reset(struct exynos_pcie *ep)
 	struct dw_pcie *pci = ep->pci;
 	struct device *dev = pci->dev;
 
-	if (ep->reset_gpio >= 0)
-		devm_gpio_request_one(dev, ep->reset_gpio,
-				GPIOF_OUT_INIT_HIGH, "RESET");
+	if (ep->reset_gpio >= 0) {
+		if (devm_gpio_request_one(dev, ep->reset_gpio,
+				GPIOF_OUT_INIT_HIGH, "RESET"))
+			dev_err(dev, "Failed requesting reset gpio %d\n",
+					ep->reset_gpio);
+	}
 }
 
 static int exynos_pcie_establish_link(struct exynos_pcie *ep)
-- 
2.17.2 (Apple Git-113)
