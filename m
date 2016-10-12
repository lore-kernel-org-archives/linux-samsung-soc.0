From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 5/5] PCI: exynos: Reorder struct exynos_pcie
Date: Wed, 12 Oct 2016 08:37:53 -0500
Message-ID: <20161012133753.28194.44548.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20161012133428.28194.54006.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20161012133428.28194.54006.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Reorder struct exynos_pcie to put generic fields first.  No functional
change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pci-exynos.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/host/pci-exynos.c b/drivers/pci/host/pci-exynos.c
index 829aa6b..f1c544b 100644
--- a/drivers/pci/host/pci-exynos.c
+++ b/drivers/pci/host/pci-exynos.c
@@ -29,13 +29,13 @@
 #define to_exynos_pcie(x)	container_of(x, struct exynos_pcie, pp)
 
 struct exynos_pcie {
-	void __iomem		*elbi_base;
-	void __iomem		*phy_base;
-	void __iomem		*block_base;
+	struct pcie_port	pp;
+	void __iomem		*elbi_base;	/* DT 0th resource */
+	void __iomem		*phy_base;	/* DT 1st resource */
+	void __iomem		*block_base;	/* DT 2nd resource */
 	int			reset_gpio;
 	struct clk		*clk;
 	struct clk		*bus_clk;
-	struct pcie_port	pp;
 };
 
 /* PCIe ELBI registers */
