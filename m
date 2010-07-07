From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 05/11] USB: s3c-hsotg: Add initial detection and setup for dedicated FIFO mode
Date: Wed,  7 Jul 2010 01:02:17 +0100
Message-ID: <1278460943-16224-6-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hull.simtec.co.uk ([78.105.113.97]:34539 "EHLO ben-laptop"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754518Ab0GGL5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 07:57:50 -0400
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Add support for the dedicated FIFO mode on newer SoCs such as the S5PV210
partly to improve support and to fix the bug where any non-EP0 IN endpoint
requires its own FIFO allocation.

To fix this, we ensure that any non-zero IN endpoint is given a TXFIFO
using the same allocation method as the periodic case (all our current
hardware has enough FIFOs and FIFO memory for a 1:1 mapping) and ensure
that the necessary transmission done interrupt is enabled.

The default settings from reset for the core point all EPs at FIFO0,
used for the control endpoint. However, the controller documentation
states that all IN endpoints _must_ have a unique FIFO to avoid any
contention during transmission.

Note, this leaves us with a large IN FIFO for EP0 (which re-uses the
old NPTXFIFO) for an endpoint which cannot shift more than a pair of
packets at a time... this is a waste, but it looks like we cannot
re-allocate space to the individual IN FIFOs as they are already
maxed out (to be confirmed).

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 .../arm/plat-samsung/include/plat/regs-usb-hsotg.h |    2 +
 drivers/usb/gadget/s3c-hsotg.c                     |   40 +++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg.h b/arch/arm/plat-samsung/include/plat/regs-usb-hsotg.h
index 8d18d9d..dc90f5e 100644
--- a/arch/arm/plat-samsung/include/plat/regs-usb-hsotg.h
+++ b/arch/arm/plat-samsung/include/plat/regs-usb-hsotg.h
@@ -226,6 +226,7 @@
 
 #define S3C_DIEPMSK				S3C_HSOTG_REG(0x810)
 
+#define S3C_DIEPMSK_TxFIFOEmpty			(1 << 7)
 #define S3C_DIEPMSK_INEPNakEffMsk		(1 << 6)
 #define S3C_DIEPMSK_INTknEPMisMsk		(1 << 5)
 #define S3C_DIEPMSK_INTknTXFEmpMsk		(1 << 4)
@@ -371,6 +372,7 @@
 
 #define S3C_DIEPDMA(_a)				S3C_HSOTG_REG(0x914 + ((_a) * 0x20))
 #define S3C_DOEPDMA(_a)				S3C_HSOTG_REG(0xB14 + ((_a) * 0x20))
+#define S3C_DTXFSTS(_a)				S3C_HSOTG_REG(0x918 + ((_a) * 0x20))
 
 #define S3C_EPFIFO(_a)				S3C_HSOTG_REG(0x1000 + ((_a) * 0x1000))
 
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 9d32c9f..4196e37 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -12,6 +12,8 @@
  * published by the Free Software Foundation.
 */
 
+#define DEBUG
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
@@ -130,6 +132,7 @@ struct s3c_hsotg_ep {
  * @regs: The memory area mapped for accessing registers.
  * @regs_res: The resource that was allocated when claiming register space.
  * @irq: The IRQ number we are using
+ * @dedicated_fifos: Set if the hardware has dedicated IN-EP fifos.
  * @debug_root: root directrory for debugfs.
  * @debug_file: main status file for debugfs.
  * @debug_fifo: FIFO status file for debugfs.
@@ -148,6 +151,8 @@ struct s3c_hsotg {
 	struct resource		*regs_res;
 	int			irq;
 
+	unsigned int		dedicated_fifos:1;
+
 	struct dentry		*debug_root;
 	struct dentry		*debug_file;
 	struct dentry		*debug_fifo;
@@ -466,7 +471,7 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 	if (to_write == 0)
 		return 0;
 
-	if (periodic) {
+	if (periodic && !hsotg->dedicated_fifos) {
 		u32 epsize = readl(hsotg->regs + S3C_DIEPTSIZ(hs_ep->index));
 		int size_left;
 		int size_done;
@@ -504,6 +509,11 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 			s3c_hsotg_en_gsint(hsotg, S3C_GINTSTS_PTxFEmp);
 			return -ENOSPC;
 		}
+	} else if (hsotg->dedicated_fifos && hs_ep->index != 0) {
+		can_write = readl(hsotg->regs + S3C_DTXFSTS(hs_ep->index));
+
+		can_write &= 0xffff;
+		can_write *= 4;
 	} else {
 		if (S3C_GNPTXSTS_NPTxQSpcAvail_GET(gnptxsts) == 0) {
 			dev_dbg(hsotg->dev,
@@ -1829,6 +1839,15 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 				 __func__, idx);
 			clear |= S3C_DIEPMSK_INTknEPMisMsk;
 		}
+
+		/* FIFO has space or is empty (see GAHBCFG) */
+		if (hsotg->dedicated_fifos &&
+		    ints & S3C_DIEPMSK_TxFIFOEmpty) {
+			dev_dbg(hsotg->dev, "%s: ep%d: TxFIFOEmpty\n",
+				__func__, idx);
+			s3c_hsotg_trytx(hsotg, hs_ep);
+			clear |= S3C_DIEPMSK_TxFIFOEmpty;
+		}
 	}
 
 	writel(clear, hsotg->regs + epint_reg);
@@ -2280,6 +2299,12 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 		break;
 	}
 
+	/* if the hardware has dedicated fifos, we must give each IN EP
+	 * a unique tx-fifo even if it is non-periodic.
+	 */
+	if (dir_in && hsotg->dedicated_fifos)
+		epctrl |= S3C_DxEPCTL_TxFNum(index);
+
 	/* for non control endpoints, set PID to D0 */
 	if (index)
 		epctrl |= S3C_DxEPCTL_SetD0PID;
@@ -2569,7 +2594,8 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 
 	writel(S3C_DIEPMSK_TimeOUTMsk | S3C_DIEPMSK_AHBErrMsk |
 	       S3C_DIEPMSK_INTknEPMisMsk |
-	       S3C_DIEPMSK_EPDisbldMsk | S3C_DIEPMSK_XferComplMsk,
+	       S3C_DIEPMSK_EPDisbldMsk | S3C_DIEPMSK_XferComplMsk |
+	       ((hsotg->dedicated_fifos) ? S3C_DIEPMSK_TxFIFOEmpty : 0),
 	       hsotg->regs + S3C_DIEPMSK);
 
 	/* don't need XferCompl, we get that from RXFIFO in slave mode. In
@@ -2778,6 +2804,8 @@ static void s3c_hsotg_otgreset(struct s3c_hsotg *hsotg)
 
 static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 {
+	u32 cfg4;
+
 	/* unmask subset of endpoint interrupts */
 
 	writel(S3C_DIEPMSK_TimeOUTMsk | S3C_DIEPMSK_AHBErrMsk |
@@ -2813,6 +2841,14 @@ static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 
 	writel(using_dma(hsotg) ? S3C_GAHBCFG_DMAEn : 0x0,
 	       hsotg->regs + S3C_GAHBCFG);
+
+	/* check hardware configuration */
+
+	cfg4 = readl(hsotg->regs + 0x50);
+	hsotg->dedicated_fifos = (cfg4 >> 25) & 1;
+
+	dev_info(hsotg->dev, "%s fifos\n",
+		 hsotg->dedicated_fifos ? "dedicated" : "shared");
 }
 
 static void s3c_hsotg_dump(struct s3c_hsotg *hsotg)
-- 
1.7.0.4
