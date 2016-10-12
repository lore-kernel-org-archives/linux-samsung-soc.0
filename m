From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 06/10] PCI: designware: Uninline register accessors
Date: Wed, 12 Oct 2016 08:18:31 -0500
Message-ID: <20161012131831.26443.14261.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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

The register accessors are not performance critical and small enough that
the compiler can inline them itself if it makes sense.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/host/pcie-designware.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
index b8feea4..7a3458d 100644
--- a/drivers/pci/host/pcie-designware.c
+++ b/drivers/pci/host/pcie-designware.c
@@ -157,14 +157,14 @@ void dw_pcie_writel_rc(struct pcie_port *pp, u32 reg, u32 val)
 		writel(val, pp->dbi_base + reg);
 }
 
-static inline u32 dw_pcie_readl_unroll(struct pcie_port *pp, u32 index, u32 reg)
+static u32 dw_pcie_readl_unroll(struct pcie_port *pp, u32 index, u32 reg)
 {
 	u32 offset = PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
 
 	return dw_pcie_readl_rc(pp, offset + reg);
 }
 
-static inline void dw_pcie_writel_unroll(struct pcie_port *pp, u32 index,
+static void dw_pcie_writel_unroll(struct pcie_port *pp, u32 index,
 					 u32 val, u32 reg)
 {
 	u32 offset = PCIE_GET_ATU_OUTB_UNR_REG_OFFSET(index);
