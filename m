From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/2] USB: ehci-s5p: add DMA burst support
Date: Thu, 01 Mar 2012 14:40:03 +0900
Message-ID: <000801ccf76d$c01e2a00$405a7e00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: 'Greg Kroah-Hartman' <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, 'Sangwook Lee' <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Joonyoung Shim' <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

DMA burst support is added to improve performance in EHCI data
transfer. The USB EHCI controller on Exynos SoCs can use INCR16,
INCR8, and INCR4 mode. These modes of INSNREG00 register should
be set in order to enable DMA burst transfer. This feature is
also related to AHB spec.

Signed-off-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
v2: change the definition name from EHCI_ENA_xxx to EHCI_INSNREG00_ENA_xxx.

drivers/usb/host/ehci-s5p.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 293f741..b337f72 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <plat/ehci.h>
 #include <plat/usb-phy.h>
+#include <mach/regs-usb-host.h>
 
 struct s5p_ehci_hcd {
 	struct device *dev;
@@ -128,6 +129,9 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	ehci->regs = hcd->regs +
 		HC_LENGTH(ehci, readl(&ehci->caps->hc_capbase));
 
+	/* DMA burst Enable */
+	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
+
 	dbg_hcs_params(ehci, "reset");
 	dbg_hcc_params(ehci, "reset");
 
@@ -234,6 +238,9 @@ static int s5p_ehci_resume(struct device *dev)
 	if (pdata && pdata->phy_init)
 		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
 
+	/* DMA burst Enable */
+	writel(EHCI_INSNREG00_ENABLE_DMA_BURST, EHCI_INSNREG00(hcd->regs));
+
 	if (time_before(jiffies, ehci->next_statechange))
 		msleep(100);
 
-- 
1.7.1


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
