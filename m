From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [RFC 1/2] pci: dwc: pci-exynos: modify the Kconfig dependency
Date: Thu, 21 Dec 2017 21:14:06 +0900
Message-ID: <20171221121408.22636-1-jh80.chung@samsung.com>
References: <CGME20171221121409epcas1p2af291857b9df115d2dec9a3d3300e0aa@epcas1p2.samsung.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzk@kernel.org, jingoohan1@gmail.com, kgene@kernel.org, lorenzo.pieralisi@arm.com, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

PCI_EXYNOS has the dependency with SOC_EXYNOS5440.
It's modified to ARCH_EXYNOS from SOC_EXYNOS5440, because other
SoCs needs to use this driver.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 drivers/pci/dwc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/dwc/Kconfig b/drivers/pci/dwc/Kconfig
index 113e09440f85..0ff9795df8e8 100644
--- a/drivers/pci/dwc/Kconfig
+++ b/drivers/pci/dwc/Kconfig
@@ -65,7 +65,7 @@ config PCIE_DW_PLAT
 config PCI_EXYNOS
 	bool "Samsung Exynos PCIe controller"
 	depends on PCI
-	depends on SOC_EXYNOS5440
+	depends on ARCH_EXYNOS
 	depends on PCI_MSI_IRQ_DOMAIN
 	select PCIEPORTBUS
 	select PCIE_DW_HOST
-- 
2.15.1
