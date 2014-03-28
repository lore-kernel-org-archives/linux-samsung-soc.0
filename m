From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 7/8] PCI: designware: make MSI isr shared irq aware
Date: Fri, 28 Mar 2014 17:52:58 +0100
Message-ID: <1396025579-14344-8-git-send-email-l.stach@pengutronix.de>
References: <1396025579-14344-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396025579-14344-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On i.MX6 the host controller MSI irq is shared
with PCI legacy INTD. Make sure we don't bail too
early from the irq handler.

The issue is fairly theoretical as it would require
a system setup with a PCIe switch where one connected
device is using legacy INTD and another one using
MSI, but better fix it now.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/pci/host/pci-exynos.c      | 4 +---
 drivers/pci/host/pcie-designware.c | 6 +++++-
 drivers/pci/host/pcie-designware.h | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/host/pci-exynos.c b/drivers/pci/host/pci-exynos.c
index 3de6bfbbe8e9..b616d34922d8 100644
--- a/drivers/pci/host/pci-exynos.c
+++ b/drivers/pci/host/pci-exynos.c
@@ -415,9 +415,7 @@ static irqreturn_t exynos_pcie_msi_irq_handler(int irq, void *arg)
 {
 	struct pcie_port *pp = arg;
 
-	dw_handle_msi_irq(pp);
-
-	return IRQ_HANDLED;
+	return dw_handle_msi_irq(pp);
 }
 
 static void exynos_pcie_msi_init(struct pcie_port *pp)
diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
index 98c118e04dba..cbce9b04b13d 100644
--- a/drivers/pci/host/pcie-designware.c
+++ b/drivers/pci/host/pcie-designware.c
@@ -156,15 +156,17 @@ static struct irq_chip dw_msi_irq_chip = {
 };
 
 /* MSI int handler */
-void dw_handle_msi_irq(struct pcie_port *pp)
+irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 {
 	unsigned long val;
 	int i, pos, irq;
+	irqreturn_t ret = IRQ_NONE;
 
 	for (i = 0; i < MAX_MSI_CTRLS; i++) {
 		dw_pcie_rd_own_conf(pp, PCIE_MSI_INTR0_STATUS + i * 12, 4,
 				(u32 *)&val);
 		if (val) {
+			ret = IRQ_HANDLED;
 			pos = 0;
 			while ((pos = find_next_bit(&val, 32, pos)) != 32) {
 				irq = irq_find_mapping(pp->irq_domain,
@@ -177,6 +179,8 @@ void dw_handle_msi_irq(struct pcie_port *pp)
 			}
 		}
 	}
+
+	return ret;
 }
 
 void dw_pcie_msi_init(struct pcie_port *pp)
diff --git a/drivers/pci/host/pcie-designware.h b/drivers/pci/host/pcie-designware.h
index 3063b3594d88..a169d22d517e 100644
--- a/drivers/pci/host/pcie-designware.h
+++ b/drivers/pci/host/pcie-designware.h
@@ -68,7 +68,7 @@ struct pcie_host_ops {
 
 int dw_pcie_cfg_read(void __iomem *addr, int where, int size, u32 *val);
 int dw_pcie_cfg_write(void __iomem *addr, int where, int size, u32 val);
-void dw_handle_msi_irq(struct pcie_port *pp);
+irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
 void dw_pcie_msi_init(struct pcie_port *pp);
 int dw_pcie_link_up(struct pcie_port *pp);
 void dw_pcie_setup_rc(struct pcie_port *pp);
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
