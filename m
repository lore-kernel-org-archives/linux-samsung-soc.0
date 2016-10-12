From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 09/10] PCI: designware-plat: Add local struct device
 pointers
Date: Wed, 12 Oct 2016 08:18:55 -0500
Message-ID: <20161012131855.26443.15578.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20161012131616.26443.89407.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20161012131616.26443.89407.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-pci-owner@vger.kernel.org
To: Joao Pinto <jpinto@synopsys.com>, Pratyush Anand <pratyush.anand@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Use a local "struct device *dev" for brevity and consistency with other
drivers.  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pcie-designware-plat.c |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/host/pcie-designware-plat.c b/drivers/pci/host/pcie-designware-plat.c
index d9d01e7..f0a2a60 100644
--- a/drivers/pci/host/pcie-designware-plat.c
+++ b/drivers/pci/host/pcie-designware-plat.c
@@ -51,6 +51,7 @@ static struct pcie_host_ops dw_plat_pcie_host_ops = {
 static int dw_plat_add_pcie_port(struct pcie_port *pp,
 				 struct platform_device *pdev)
 {
+	struct device *dev = pp->dev;
 	int ret;
 
 	pp->irq = platform_get_irq(pdev, 1);
@@ -62,11 +63,11 @@ static int dw_plat_add_pcie_port(struct pcie_port *pp,
 		if (pp->msi_irq < 0)
 			return pp->msi_irq;
 
-		ret = devm_request_irq(&pdev->dev, pp->msi_irq,
+		ret = devm_request_irq(dev, pp->msi_irq,
 					dw_plat_pcie_msi_irq_handler,
 					IRQF_SHARED, "dw-plat-pcie-msi", pp);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to request MSI IRQ\n");
+			dev_err(dev, "failed to request MSI IRQ\n");
 			return ret;
 		}
 	}
@@ -76,7 +77,7 @@ static int dw_plat_add_pcie_port(struct pcie_port *pp,
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to initialize host\n");
+		dev_err(dev, "failed to initialize host\n");
 		return ret;
 	}
 
@@ -85,21 +86,21 @@ static int dw_plat_add_pcie_port(struct pcie_port *pp,
 
 static int dw_plat_pcie_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct dw_plat_pcie *dw_plat_pcie;
 	struct pcie_port *pp;
 	struct resource *res;  /* Resource from DT */
 	int ret;
 
-	dw_plat_pcie = devm_kzalloc(&pdev->dev, sizeof(*dw_plat_pcie),
-					GFP_KERNEL);
+	dw_plat_pcie = devm_kzalloc(dev, sizeof(*dw_plat_pcie), GFP_KERNEL);
 	if (!dw_plat_pcie)
 		return -ENOMEM;
 
 	pp = &dw_plat_pcie->pp;
-	pp->dev = &pdev->dev;
+	pp->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pp->dbi_base = devm_ioremap_resource(&pdev->dev, res);
+	pp->dbi_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(pp->dbi_base))
 		return PTR_ERR(pp->dbi_base);
 
