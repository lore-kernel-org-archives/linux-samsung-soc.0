From: <dinguyen@altera.com>
Subject: [RFC PATCH 2/2] usb: gadget: s3c-hsotg: move s3c-hsotg driver into dwc2
Date: Tue, 14 Jan 2014 05:01:02 -0600
Message-ID: <1389697262-29065-3-git-send-email-dinguyen@altera.com>
References: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-db8lp0184.outbound.messaging.microsoft.com ([213.199.154.184]:41288
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751451AbaANLDQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 06:03:16 -0500
In-Reply-To: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, gregkh@linuxfoundation.org
Cc: dinh.linux@gmail.com, Dinh Nguyen <dinguyen@altera.com>, Paul Zimmerman <paulz@synopsys.com>, Rashika Kheria <rashika.kheria@gmail.com>, Matthijs Kooijman <matthijs@stdin.nl>, Luis Ortega Perez de Villar <luiorpe1@upv.es>, Dom Cobley <popcornmix@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

From: Dinh Nguyen <dinguyen@altera.com>

In preparation for combining the dwc2 host driver and the s3c-hsotg
gadget driver into a dual-role USB driver, move the s3c-hsotg into
the same place with DWC2 host driver.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
Cc: Paul Zimmerman <paulz@synopsys.com>
Cc: Rashika Kheria <rashika.kheria@gmail.com>
Cc: Matthijs Kooijman <matthijs@stdin.nl>
Cc: Luis Ortega Perez de Villar <luiorpe1@upv.es>
Cc: Dom Cobley <popcornmix@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Robert Baldyga <r.baldyga@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Jingoo Han <jg1.han@samsung.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/dwc2/Makefile                |    2 +-
 drivers/usb/{gadget => dwc2}/s3c-hsotg.c |  439 +++++++++++++++---------------
 drivers/usb/gadget/Makefile              |    1 -
 drivers/usb/gadget/s3c-hsotg.h           |  378 -------------------------
 4 files changed, 220 insertions(+), 600 deletions(-)
 rename drivers/usb/{gadget => dwc2}/s3c-hsotg.c (90%)
 delete mode 100644 drivers/usb/gadget/s3c-hsotg.h

diff --git a/drivers/usb/dwc2/Makefile b/drivers/usb/dwc2/Makefile
index 11529d3..265df03 100644
--- a/drivers/usb/dwc2/Makefile
+++ b/drivers/usb/dwc2/Makefile
@@ -2,9 +2,9 @@ ccflags-$(CONFIG_USB_DWC2_DEBUG)	+= -DDEBUG
 ccflags-$(CONFIG_USB_DWC2_VERBOSE)	+= -DVERBOSE_DEBUG
 
 obj-$(CONFIG_USB_DWC2)			+= dwc2.o
+obj-$(CONFIG_USB_S3C_HSOTG)		+= s3c-hsotg.o
 
 dwc2-y					+= core.o core_intr.o
-
 # NOTE: This driver at present only implements the Host mode
 # of the controller. The existing s3c-hsotg driver supports
 # Peripheral mode, but only for the Samsung S3C platforms.
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/dwc2/s3c-hsotg.c
similarity index 90%
rename from drivers/usb/gadget/s3c-hsotg.c
rename to drivers/usb/dwc2/s3c-hsotg.c
index c0ff1cb..c32b1c7 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/dwc2/s3c-hsotg.c
@@ -38,7 +38,7 @@
 #include <linux/usb/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
 
-#include "s3c-hsotg.h"
+#include "hw.h"
 
 static const char * const s3c_hsotg_supply_names[] = {
 	"vusb_d",		/* digital USB supply, 1.2V */
@@ -94,7 +94,7 @@ struct s3c_hsotg_req;
  * @fifo_size: The size of the FIFO (for periodic IN endpoints)
  * @fifo_load: The amount of data loaded into the FIFO (periodic IN)
  * @last_load: The offset of data for the last start of request.
- * @size_loaded: The last loaded size for DxEPTSIZE for periodic IN
+ * @size_loaded: The last loaded size for DXEPTSIZE for periodic IN
  *
  * This is the driver's state for each registered enpoint, allowing it
  * to keep track of transactions that need doing. Each endpoint has a
@@ -341,8 +341,8 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	/* set FIFO sizes to 2048/1024 */
 
 	writel(2048, hsotg->regs + GRXFSIZ);
-	writel(GNPTXFSIZ_NPTxFStAddr(2048) |
-	       GNPTXFSIZ_NPTxFDep(1024),
+	writel(DPTXFSIZN_DPTXFADDR(2048) |
+	       DPTXFSIZN_DPTXFSIZE(1024),
 	       hsotg->regs + GNPTXFSIZ);
 
 	/*
@@ -363,10 +363,10 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 
 	for (ep = 1; ep <= 15; ep++) {
 		val = addr;
-		val |= size << DPTXFSIZn_DPTxFSize_SHIFT;
+		val |= size << FIFOSIZE_DEPTH_SHIFT;
 		addr += size;
 
-		writel(val, hsotg->regs + DPTXFSIZn(ep));
+		writel(val, hsotg->regs + DPTXFSIZN(ep));
 	}
 
 	/*
@@ -374,15 +374,15 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	 * all fifos are flushed before continuing
 	 */
 
-	writel(GRSTCTL_TxFNum(0x10) | GRSTCTL_TxFFlsh |
-	       GRSTCTL_RxFFlsh, hsotg->regs + GRSTCTL);
+	writel(GRSTCTL_TXFNUM(0x10) | GRSTCTL_TXFFLSH |
+	       GRSTCTL_RXFFLSH, hsotg->regs + GRSTCTL);
 
 	/* wait until the fifos are both flushed */
 	timeout = 100;
 	while (1) {
 		val = readl(hsotg->regs + GRSTCTL);
 
-		if ((val & (GRSTCTL_TxFFlsh | GRSTCTL_RxFFlsh)) == 0)
+		if ((val & (GRSTCTL_TXFFLSH | GRSTCTL_RXFFLSH)) == 0)
 			break;
 
 		if (--timeout == 0) {
@@ -496,14 +496,14 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		 * how much data is left in the fifo.
 		 */
 
-		size_left = DxEPTSIZ_XferSize_GET(epsize);
+		size_left = DXEPTSIZ_XFERSIZE_GET(epsize);
 
 		/*
 		 * if shared fifo, we cannot write anything until the
 		 * previous data has been completely sent.
 		 */
 		if (hs_ep->fifo_load != 0) {
-			s3c_hsotg_en_gsint(hsotg, GINTSTS_PTxFEmp);
+			s3c_hsotg_en_gsint(hsotg, GINTSTS_PTXFEMP);
 			return -ENOSPC;
 		}
 
@@ -524,7 +524,7 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 			__func__, can_write);
 
 		if (can_write <= 0) {
-			s3c_hsotg_en_gsint(hsotg, GINTSTS_PTxFEmp);
+			s3c_hsotg_en_gsint(hsotg, GINTSTS_PTXFEMP);
 			return -ENOSPC;
 		}
 	} else if (hsotg->dedicated_fifos && hs_ep->index != 0) {
@@ -533,16 +533,16 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		can_write &= 0xffff;
 		can_write *= 4;
 	} else {
-		if (GNPTXSTS_NPTxQSpcAvail_GET(gnptxsts) == 0) {
+		if (GNPTXSTS_NP_TXQ_SPC_AVAIL_GET(gnptxsts) == 0) {
 			dev_dbg(hsotg->dev,
 				"%s: no queue slots available (0x%08x)\n",
 				__func__, gnptxsts);
 
-			s3c_hsotg_en_gsint(hsotg, GINTSTS_NPTxFEmp);
+			s3c_hsotg_en_gsint(hsotg, GINTSTS_NPTXFEMP);
 			return -ENOSPC;
 		}
 
-		can_write = GNPTXSTS_NPTxFSpcAvail_GET(gnptxsts);
+		can_write = GNPTXSTS_NP_TXF_SPC_AVAIL_GET(gnptxsts);
 		can_write *= 4;	/* fifo size is in 32bit quantities. */
 	}
 
@@ -570,8 +570,8 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		/* it's needed only when we do not use dedicated fifos */
 		if (!hsotg->dedicated_fifos)
 			s3c_hsotg_en_gsint(hsotg,
-					   periodic ? GINTSTS_PTxFEmp :
-					   GINTSTS_NPTxFEmp);
+				   periodic ? GINTSTS_PTXFEMP :
+				   GINTSTS_NPTXFEMP);
 	}
 
 	/* see if we can write data */
@@ -599,8 +599,8 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		/* it's needed only when we do not use dedicated fifos */
 		if (!hsotg->dedicated_fifos)
 			s3c_hsotg_en_gsint(hsotg,
-					   periodic ? GINTSTS_PTxFEmp :
-					   GINTSTS_NPTxFEmp);
+				   periodic ? GINTSTS_PTXFEMP :
+				   GINTSTS_NPTXFEMP);
 	}
 
 	dev_dbg(hsotg->dev, "write %d/%d, can_write %d, done %d\n",
@@ -637,12 +637,12 @@ static unsigned get_ep_limit(struct s3c_hsotg_ep *hs_ep)
 	unsigned maxpkt;
 
 	if (index != 0) {
-		maxsize = DxEPTSIZ_XferSize_LIMIT + 1;
-		maxpkt = DxEPTSIZ_PktCnt_LIMIT + 1;
+		maxsize = DXEPTSIZ_XFERSIZE_LIMIT + 1;
+		maxpkt = DXEPTSIZ_PKTCNT_LIMIT + 1;
 	} else {
 		maxsize = 64+64;
 		if (hs_ep->dir_in)
-			maxpkt = DIEPTSIZ0_PktCnt_LIMIT + 1;
+			maxpkt = DIEPTSIZ0_PKTCNT_LIMIT + 1;
 		else
 			maxpkt = 2;
 	}
@@ -704,14 +704,14 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	epctrl_reg = dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	epsize_reg = dir_in ? DIEPTSIZ(index) : DOEPTSIZ(index);
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x, ep %d, dir %s\n",
+	dev_dbg(hsotg->dev, "%s: DXEPCTL=0x%08x, ep %d, dir %s\n",
 		__func__, readl(hsotg->regs + epctrl_reg), index,
 		hs_ep->dir_in ? "in" : "out");
 
 	/* If endpoint is stalled, we will restart request later */
 	ctrl = readl(hsotg->regs + epctrl_reg);
 
-	if (ctrl & DxEPCTL_Stall) {
+	if (ctrl & DXEPCTL_STALL) {
 		dev_warn(hsotg->dev, "%s: ep%d is stalled\n", __func__, index);
 		return;
 	}
@@ -751,9 +751,9 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 
 	if (dir_in && index != 0)
 		if (hs_ep->isochronous)
-			epsize = DxEPTSIZ_MC(packets);
+			epsize = DXEPTSIZ_MC(packets);
 		else
-			epsize = DxEPTSIZ_MC(1);
+			epsize = DXEPTSIZ_MC(1);
 	else
 		epsize = 0;
 
@@ -767,8 +767,8 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 			packets++;
 	}
 
-	epsize |= DxEPTSIZ_PktCnt(packets);
-	epsize |= DxEPTSIZ_XferSize(length);
+	epsize |= DXEPTSIZ_PKTCNT(packets);
+	epsize |= DXEPTSIZ_XFERSIZE(length);
 
 	dev_dbg(hsotg->dev, "%s: %d@%d/%d, 0x%08x => 0x%08x\n",
 		__func__, packets, length, ureq->length, epsize, epsize_reg);
@@ -794,8 +794,8 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 			__func__, ureq->dma, dma_reg);
 	}
 
-	ctrl |= DxEPCTL_EPEna;	/* ensure ep enabled */
-	ctrl |= DxEPCTL_USBActEp;
+	ctrl |= DXEPCTL_EPENA;	/* ensure ep enabled */
+	ctrl |= DXEPCTL_USBACTEP;
 
 	dev_dbg(hsotg->dev, "setup req:%d\n", hsotg->setup);
 
@@ -803,10 +803,10 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	if (hsotg->setup && index == 0)
 		hsotg->setup = 0;
 	else
-		ctrl |= DxEPCTL_CNAK;	/* clear NAK set by core */
+		ctrl |= DXEPCTL_CNAK;	/* clear NAK set by core */
 
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x\n", __func__, ctrl);
+	dev_dbg(hsotg->dev, "%s: DXEPCTL=0x%08x\n", __func__, ctrl);
 	writel(ctrl, hsotg->regs + epctrl_reg);
 
 	/*
@@ -829,7 +829,7 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	 * to debugging to see what is going on.
 	 */
 	if (dir_in)
-		writel(DIEPMSK_INTknTXFEmpMsk,
+		writel(DIEPMSK_INTKNTXFEMPMSK,
 		       hsotg->regs + DIEPINT(index));
 
 	/*
@@ -838,12 +838,12 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	 */
 
 	/* check ep is enabled */
-	if (!(readl(hsotg->regs + epctrl_reg) & DxEPCTL_EPEna))
+	if (!(readl(hsotg->regs + epctrl_reg) & DXEPCTL_EPENA))
 		dev_warn(hsotg->dev,
-			 "ep%d: failed to become enabled (DxEPCTL=0x%08x)?\n",
+			 "ep%d: failed to become enabled (DXEPCTL=0x%08x)?\n",
 			 index, readl(hsotg->regs + epctrl_reg));
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x\n",
+	dev_dbg(hsotg->dev, "%s: DXEPCTL=0x%08x\n",
 		__func__, readl(hsotg->regs + epctrl_reg));
 
 	/* enable ep interrupts */
@@ -1228,8 +1228,8 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 		case USB_REQ_SET_ADDRESS:
 			s3c_hsotg_disconnect(hsotg);
 			dcfg = readl(hsotg->regs + DCFG);
-			dcfg &= ~DCFG_DevAddr_MASK;
-			dcfg |= ctrl->wValue << DCFG_DevAddr_SHIFT;
+			dcfg &= ~DCFG_DEVADDR_MASK;
+			dcfg |= ctrl->wValue << DCFG_DEVADDR_SHIFT;
 			writel(dcfg, hsotg->regs + DCFG);
 
 			dev_info(hsotg->dev, "new address %d\n", ctrl->wValue);
@@ -1271,17 +1271,17 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 		reg = (ep0->dir_in) ? DIEPCTL0 : DOEPCTL0;
 
 		/*
-		 * DxEPCTL_Stall will be cleared by EP once it has
+		 * DXEPCTL_Stall will be cleared by EP once it has
 		 * taken effect, so no need to clear later.
 		 */
 
 		ctrl = readl(hsotg->regs + reg);
-		ctrl |= DxEPCTL_Stall;
-		ctrl |= DxEPCTL_CNAK;
+		ctrl |= DXEPCTL_STALL;
+		ctrl |= DXEPCTL_CNAK;
 		writel(ctrl, hsotg->regs + reg);
 
 		dev_dbg(hsotg->dev,
-			"written DxEPCTL=0x%08x to %08x (DxEPCTL=0x%08x)\n",
+			"written DXEPCTL=0x%08x to %08x (DXEPCTL=0x%08x)\n",
 			ctrl, reg, readl(hsotg->regs + reg));
 
 		/*
@@ -1454,7 +1454,7 @@ static void s3c_hsotg_rx_data(struct s3c_hsotg *hsotg, int ep_idx, int size)
 		int ptr;
 
 		dev_warn(hsotg->dev,
-			 "%s: FIFO %d bytes on ep%d but no req (DxEPCTl=0x%08x)\n",
+			 "%s: FIFO %d bytes on ep%d but no req (DXEPCTl=0x%08x)\n",
 			 __func__, size, ep_idx, epctl);
 
 		/* dump the data from the FIFO, we've nothing we can do */
@@ -1526,13 +1526,13 @@ static void s3c_hsotg_send_zlp(struct s3c_hsotg *hsotg,
 	dev_dbg(hsotg->dev, "sending zero-length packet\n");
 
 	/* issue a zero-sized packet to terminate this */
-	writel(DxEPTSIZ_MC(1) | DxEPTSIZ_PktCnt(1) |
-	       DxEPTSIZ_XferSize(0), hsotg->regs + DIEPTSIZ(0));
+	writel(DXEPTSIZ_MC(1) | DXEPTSIZ_PKTCNT(1) |
+	       DXEPTSIZ_XFERSIZE(0), hsotg->regs + DIEPTSIZ(0));
 
 	ctrl = readl(hsotg->regs + DIEPCTL0);
-	ctrl |= DxEPCTL_CNAK;  /* clear NAK set by core */
-	ctrl |= DxEPCTL_EPEna; /* ensure ep enabled */
-	ctrl |= DxEPCTL_USBActEp;
+	ctrl |= DXEPCTL_CNAK;  /* clear NAK set by core */
+	ctrl |= DXEPCTL_EPENA; /* ensure ep enabled */
+	ctrl |= DXEPCTL_USBACTEP;
 	writel(ctrl, hsotg->regs + DIEPCTL0);
 }
 
@@ -1553,7 +1553,7 @@ static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
 	struct s3c_hsotg_ep *hs_ep = &hsotg->eps[epnum];
 	struct s3c_hsotg_req *hs_req = hs_ep->req;
 	struct usb_request *req = &hs_req->req;
-	unsigned size_left = DxEPTSIZ_XferSize_GET(epsize);
+	unsigned size_left = DXEPTSIZ_XFERSIZE_GET(epsize);
 	int result = 0;
 
 	if (!hs_req) {
@@ -1653,24 +1653,24 @@ static void s3c_hsotg_handle_rx(struct s3c_hsotg *hsotg)
 
 	WARN_ON(using_dma(hsotg));
 
-	epnum = grxstsr & GRXSTS_EPNum_MASK;
-	status = grxstsr & GRXSTS_PktSts_MASK;
+	epnum = grxstsr & GRXSTS_EPNUM_MASK;
+	status = grxstsr & GRXSTS_PKTSTS_MASK;
 
-	size = grxstsr & GRXSTS_ByteCnt_MASK;
-	size >>= GRXSTS_ByteCnt_SHIFT;
+	size = grxstsr & GRXSTS_BYTECNT_MASK;
+	size >>= GRXSTS_BYTECNT_SHIFT;
 
 	if (1)
 		dev_dbg(hsotg->dev, "%s: GRXSTSP=0x%08x (%d@%d)\n",
 			__func__, grxstsr, size, epnum);
 
-#define __status(x) ((x) >> GRXSTS_PktSts_SHIFT)
+#define __status(x) ((x) >> GRXSTS_PKTSTS_SHIFT)
 
-	switch (status >> GRXSTS_PktSts_SHIFT) {
-	case __status(GRXSTS_PktSts_GlobalOutNAK):
-		dev_dbg(hsotg->dev, "GlobalOutNAK\n");
+	switch (status >> GRXSTS_PKTSTS_SHIFT) {
+	case __status(GRXSTS_PKTSTS_GLOBALOUTNAK):
+		dev_dbg(hsotg->dev, "GLOBALOUTNAK\n");
 		break;
 
-	case __status(GRXSTS_PktSts_OutDone):
+	case __status(GRXSTS_PKTSTS_OUTDONE):
 		dev_dbg(hsotg->dev, "OutDone (Frame=0x%08x)\n",
 			s3c_hsotg_read_frameno(hsotg));
 
@@ -1678,7 +1678,7 @@ static void s3c_hsotg_handle_rx(struct s3c_hsotg *hsotg)
 			s3c_hsotg_handle_outdone(hsotg, epnum, false);
 		break;
 
-	case __status(GRXSTS_PktSts_SetupDone):
+	case __status(GRXSTS_PKTSTS_SETUPDONE):
 		dev_dbg(hsotg->dev,
 			"SetupDone (Frame=0x%08x, DOPEPCTL=0x%08x)\n",
 			s3c_hsotg_read_frameno(hsotg),
@@ -1687,11 +1687,11 @@ static void s3c_hsotg_handle_rx(struct s3c_hsotg *hsotg)
 		s3c_hsotg_handle_outdone(hsotg, epnum, true);
 		break;
 
-	case __status(GRXSTS_PktSts_OutRX):
+	case __status(GRXSTS_PKTSTS_OUTRX):
 		s3c_hsotg_rx_data(hsotg, epnum, size);
 		break;
 
-	case __status(GRXSTS_PktSts_SetupRX):
+	case __status(GRXSTS_PKTSTS_SETUPRX):
 		dev_dbg(hsotg->dev,
 			"SetupRX (Frame=0x%08x, DOPEPCTL=0x%08x)\n",
 			s3c_hsotg_read_frameno(hsotg),
@@ -1757,7 +1757,7 @@ static void s3c_hsotg_set_ep_maxpacket(struct s3c_hsotg *hsotg,
 		hs_ep->ep.maxpacket = mps;
 		hs_ep->mc = 1;
 	} else {
-		mpsval = mps & DxEPCTL_MPS_MASK;
+		mpsval = mps & DXEPCTL_MPS_MASK;
 		if (mpsval > 1024)
 			goto bad_mps;
 		mcval = ((mps >> 11) & 0x3) + 1;
@@ -1773,13 +1773,13 @@ static void s3c_hsotg_set_ep_maxpacket(struct s3c_hsotg *hsotg,
 	 */
 
 	reg = readl(regs + DIEPCTL(ep));
-	reg &= ~DxEPCTL_MPS_MASK;
+	reg &= ~DXEPCTL_MPS_MASK;
 	reg |= mpsval;
 	writel(reg, regs + DIEPCTL(ep));
 
 	if (ep) {
 		reg = readl(regs + DOEPCTL(ep));
-		reg &= ~DxEPCTL_MPS_MASK;
+		reg &= ~DXEPCTL_MPS_MASK;
 		reg |= mpsval;
 		writel(reg, regs + DOEPCTL(ep));
 	}
@@ -1800,7 +1800,7 @@ static void s3c_hsotg_txfifo_flush(struct s3c_hsotg *hsotg, unsigned int idx)
 	int timeout;
 	int val;
 
-	writel(GRSTCTL_TxFNum(idx) | GRSTCTL_TxFFlsh,
+	writel(GRSTCTL_TXFNUM(idx) | GRSTCTL_TXFFLSH,
 		hsotg->regs + GRSTCTL);
 
 	/* wait until the fifo is flushed */
@@ -1809,7 +1809,7 @@ static void s3c_hsotg_txfifo_flush(struct s3c_hsotg *hsotg, unsigned int idx)
 	while (1) {
 		val = readl(hsotg->regs + GRSTCTL);
 
-		if ((val & (GRSTCTL_TxFFlsh)) == 0)
+		if ((val & (GRSTCTL_TXFFLSH)) == 0)
 			break;
 
 		if (--timeout == 0) {
@@ -1892,7 +1892,7 @@ static void s3c_hsotg_complete_in(struct s3c_hsotg *hsotg,
 	 * aligned).
 	 */
 
-	size_left = DxEPTSIZ_XferSize_GET(epsize);
+	size_left = DXEPTSIZ_XFERSIZE_GET(epsize);
 
 	size_done = hs_ep->size_loaded - size_left;
 	size_done += hs_ep->last_load;
@@ -1956,20 +1956,20 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 	/* Clear endpoint interrupts */
 	writel(ints, hsotg->regs + epint_reg);
 
-	dev_dbg(hsotg->dev, "%s: ep%d(%s) DxEPINT=0x%08x\n",
+	dev_dbg(hsotg->dev, "%s: ep%d(%s) DXEPINT=0x%08x\n",
 		__func__, idx, dir_in ? "in" : "out", ints);
 
-	if (ints & DxEPINT_XferCompl) {
+	if (ints & DXEPINT_XFERCOMPL) {
 		if (hs_ep->isochronous && hs_ep->interval == 1) {
-			if (ctrl & DxEPCTL_EOFrNum)
-				ctrl |= DxEPCTL_SetEvenFr;
+			if (ctrl & DXEPCTL_EOFRNUM)
+				ctrl |= DXEPCTL_SETEVENFR;
 			else
-				ctrl |= DxEPCTL_SetOddFr;
+				ctrl |= DXEPCTL_SETODDFR;
 			writel(ctrl, hsotg->regs + epctl_reg);
 		}
 
 		dev_dbg(hsotg->dev,
-			"%s: XferCompl: DxEPCTL=0x%08x, DxEPTSIZ=%08x\n",
+			"%s: XferCompl: DXEPCTL=0x%08x, DXEPTSIZ=%08x\n",
 			__func__, readl(hsotg->regs + epctl_reg),
 			readl(hsotg->regs + epsiz_reg));
 
@@ -1992,7 +1992,7 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 		}
 	}
 
-	if (ints & DxEPINT_EPDisbld) {
+	if (ints & DXEPINT_EPDISBLD) {
 		dev_dbg(hsotg->dev, "%s: EPDisbld\n", __func__);
 
 		if (dir_in) {
@@ -2000,20 +2000,20 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 
 			s3c_hsotg_txfifo_flush(hsotg, idx);
 
-			if ((epctl & DxEPCTL_Stall) &&
-				(epctl & DxEPCTL_EPType_Bulk)) {
+			if ((epctl & DXEPCTL_STALL) &&
+				(epctl & DXEPCTL_EPTYPE_BULK)) {
 				int dctl = readl(hsotg->regs + DCTL);
 
-				dctl |= DCTL_CGNPInNAK;
+				dctl |= DCTL_CGNPINNAK;
 				writel(dctl, hsotg->regs + DCTL);
 			}
 		}
 	}
 
-	if (ints & DxEPINT_AHBErr)
+	if (ints & DXEPINT_AHBERR)
 		dev_dbg(hsotg->dev, "%s: AHBErr\n", __func__);
 
-	if (ints & DxEPINT_Setup) {  /* Setup or Timeout */
+	if (ints & DXEPINT_SETUP) {  /* Setup or Timeout */
 		dev_dbg(hsotg->dev, "%s: Setup/Timeout\n",  __func__);
 
 		if (using_dma(hsotg) && idx == 0) {
@@ -2031,26 +2031,26 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 		}
 	}
 
-	if (ints & DxEPINT_Back2BackSetup)
+	if (ints & DXEPINT_BACK2BACKSETUP)
 		dev_dbg(hsotg->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
 
 	if (dir_in && !hs_ep->isochronous) {
 		/* not sure if this is important, but we'll clear it anyway */
-		if (ints & DIEPMSK_INTknTXFEmpMsk) {
-			dev_dbg(hsotg->dev, "%s: ep%d: INTknTXFEmpMsk\n",
+		if (ints & DIEPMSK_INTKNTXFEMPMSK) {
+			dev_dbg(hsotg->dev, "%s: ep%d: INTKNTXFEMPMSK\n",
 				__func__, idx);
 		}
 
 		/* this probably means something bad is happening */
-		if (ints & DIEPMSK_INTknEPMisMsk) {
-			dev_warn(hsotg->dev, "%s: ep%d: INTknEP\n",
+		if (ints & DIEPMSK_INTKNEPMISMSK) {
+			dev_warn(hsotg->dev, "%s: ep%d: INTKNEP\n",
 				 __func__, idx);
 		}
 
 		/* FIFO has space or is empty (see GAHBCFG) */
 		if (hsotg->dedicated_fifos &&
-		    ints & DIEPMSK_TxFIFOEmpty) {
-			dev_dbg(hsotg->dev, "%s: ep%d: TxFIFOEmpty\n",
+		    ints & DIEPMSK_TXFIFOEMPTY) {
+			dev_dbg(hsotg->dev, "%s: ep%d: TXFIFOEMPTY\n",
 				__func__, idx);
 			if (!using_dma(hsotg))
 				s3c_hsotg_trytx(hsotg, hs_ep);
@@ -2085,21 +2085,21 @@ static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
 	 */
 
 	/* catch both EnumSpd_FS and EnumSpd_FS48 */
-	switch (dsts & DSTS_EnumSpd_MASK) {
-	case DSTS_EnumSpd_FS:
-	case DSTS_EnumSpd_FS48:
+	switch (dsts & DSTS_ENUMSPD_MASK) {
+	case DSTS_ENUMSPD_FS:
+	case DSTS_ENUMSPD_FS48:
 		hsotg->gadget.speed = USB_SPEED_FULL;
 		ep0_mps = EP0_MPS_LIMIT;
 		ep_mps = 1023;
 		break;
 
-	case DSTS_EnumSpd_HS:
+	case DSTS_ENUMSPD_HS:
 		hsotg->gadget.speed = USB_SPEED_HIGH;
 		ep0_mps = EP0_MPS_LIMIT;
 		ep_mps = 1024;
 		break;
 
-	case DSTS_EnumSpd_LS:
+	case DSTS_ENUMSPD_LS:
 		hsotg->gadget.speed = USB_SPEED_LOW;
 		/*
 		 * note, we don't actually support LS in this driver at the
@@ -2222,9 +2222,9 @@ static void s3c_hsotg_irq_fifoempty(struct s3c_hsotg *hsotg, bool periodic)
 }
 
 /* IRQ flags which will trigger a retry around the IRQ loop */
-#define IRQ_RETRY_MASK (GINTSTS_NPTxFEmp | \
-			GINTSTS_PTxFEmp |  \
-			GINTSTS_RxFLvl)
+#define IRQ_RETRY_MASK (GINTSTS_NPTXFEMP | \
+			GINTSTS_PTXFEMP |  \
+			GINTSTS_RXFLVL)
 
 /**
  * s3c_hsotg_corereset - issue softreset to the core
@@ -2240,14 +2240,14 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "resetting core\n");
 
 	/* issue soft reset */
-	writel(GRSTCTL_CSftRst, hsotg->regs + GRSTCTL);
+	writel(GRSTCTL_CSFTRST, hsotg->regs + GRSTCTL);
 
 	timeout = 10000;
 	do {
 		grstctl = readl(hsotg->regs + GRSTCTL);
-	} while ((grstctl & GRSTCTL_CSftRst) && timeout-- > 0);
+	} while ((grstctl & GRSTCTL_CSFTRST) && timeout-- > 0);
 
-	if (grstctl & GRSTCTL_CSftRst) {
+	if (grstctl & GRSTCTL_CSFTRST) {
 		dev_err(hsotg->dev, "Failed to get CSftRst asserted\n");
 		return -EINVAL;
 	}
@@ -2264,7 +2264,7 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
 			return -ETIMEDOUT;
 		}
 
-		if (!(grstctl & GRSTCTL_AHBIdle))
+		if (!(grstctl & GRSTCTL_AHBIDLE))
 			continue;
 
 		break;		/* reset done */
@@ -2290,14 +2290,14 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	 */
 
 	/* set the PLL on, remove the HNP/SRP and set the PHY */
-	writel(hsotg->phyif | GUSBCFG_TOutCal(7) |
+	writel(hsotg->phyif | GUSBCFG_TOUTCAL(7) |
 	       (0x5 << 10), hsotg->regs + GUSBCFG);
 
 	s3c_hsotg_init_fifo(hsotg);
 
-	__orr32(hsotg->regs + DCTL, DCTL_SftDiscon);
+	__orr32(hsotg->regs + DCTL, DCTL_SFTDISCON);
 
-	writel(1 << 18 | DCFG_DevSpd_HS,  hsotg->regs + DCFG);
+	writel(1 << 18 | DCFG_DEVSPD_HS,  hsotg->regs + DCFG);
 
 	/* Clear any pending OTG interrupts */
 	writel(0xffffffff, hsotg->regs + GOTGINT);
@@ -2305,21 +2305,21 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	/* Clear any pending interrupts */
 	writel(0xffffffff, hsotg->regs + GINTSTS);
 
-	writel(GINTSTS_ErlySusp | GINTSTS_SessReqInt |
-	       GINTSTS_GOUTNakEff | GINTSTS_GINNakEff |
-	       GINTSTS_ConIDStsChng | GINTSTS_USBRst |
-	       GINTSTS_EnumDone | GINTSTS_OTGInt |
-	       GINTSTS_USBSusp | GINTSTS_WkUpInt,
+	writel(GINTSTS_EARLYSUSP | GINTSTS_SESSREQINT |
+	       GINTSTS_GOUTNAKEFF | GINTSTS_GINNAKEFF |
+	       GINTSTS_CONIDSTSCHNG | GINTSTS_USBRST |
+	       GINTSTS_ENUMDONE | GINTSTS_OTGINT |
+	       GINTSTS_USBSUSP | GINTSTS_WKUPINT,
 	       hsotg->regs + GINTMSK);
 
 	if (using_dma(hsotg))
-		writel(GAHBCFG_GlblIntrEn | GAHBCFG_DMAEn |
-		       GAHBCFG_HBstLen_Incr4,
+		writel(GAHBCFG_GLBL_INTR_EN | GAHBCFG_DMA_EN |
+		       GAHBCFG_HBSTLEN_INCR4,
 		       hsotg->regs + GAHBCFG);
 	else
-		writel(((hsotg->dedicated_fifos) ? (GAHBCFG_NPTxFEmpLvl |
-						    GAHBCFG_PTxFEmpLvl) : 0) |
-		       GAHBCFG_GlblIntrEn,
+		writel(((hsotg->dedicated_fifos) ? (GAHBCFG_NP_TXF_EMP_LVL |
+						    GAHBCFG_P_TXF_EMP_LVL) : 0) |
+		       GAHBCFG_GLBL_INTR_EN,
 		       hsotg->regs + GAHBCFG);
 
 	/*
@@ -2328,21 +2328,20 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	 * interrupts.
 	 */
 
-	writel(((hsotg->dedicated_fifos) ? DIEPMSK_TxFIFOEmpty |
-	       DIEPMSK_INTknTXFEmpMsk : 0) |
-	       DIEPMSK_EPDisbldMsk | DIEPMSK_XferComplMsk |
-	       DIEPMSK_TimeOUTMsk | DIEPMSK_AHBErrMsk |
-	       DIEPMSK_INTknEPMisMsk,
+	writel(((hsotg->dedicated_fifos) ? DIEPMSK_TXFIFOEMPTY : 0) |
+	       DIEPMSK_EPDISBLDMSK | DIEPMSK_XFERCOMPLMSK |
+	       DIEPMSK_TIMEOUTMSK | DIEPMSK_AHBERRMSK |
+	       DIEPMSK_INTKNEPMISMSK,
 	       hsotg->regs + DIEPMSK);
 
 	/*
 	 * don't need XferCompl, we get that from RXFIFO in slave mode. In
 	 * DMA mode we may need this.
 	 */
-	writel((using_dma(hsotg) ? (DIEPMSK_XferComplMsk |
-				    DIEPMSK_TimeOUTMsk) : 0) |
-	       DOEPMSK_EPDisbldMsk | DOEPMSK_AHBErrMsk |
-	       DOEPMSK_SetupMsk,
+	writel((using_dma(hsotg) ? (DIEPMSK_XFERCOMPLMSK |
+				    DIEPMSK_TIMEOUTMSK) : 0) |
+	       DOEPMSK_EPDISBLDMSK | DOEPMSK_AHBERRMSK |
+	       DOEPMSK_SETUPMSK,
 	       hsotg->regs + DOEPMSK);
 
 	writel(0, hsotg->regs + DAINTMSK);
@@ -2352,7 +2351,7 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 		readl(hsotg->regs + DOEPCTL0));
 
 	/* enable in and out endpoint interrupts */
-	s3c_hsotg_en_gsint(hsotg, GINTSTS_OEPInt | GINTSTS_IEPInt);
+	s3c_hsotg_en_gsint(hsotg, GINTSTS_OEPINT | GINTSTS_IEPINT);
 
 	/*
 	 * Enable the RXFIFO when in slave mode, as this is how we collect
@@ -2360,35 +2359,35 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	 * things we cannot process, so do not use it.
 	 */
 	if (!using_dma(hsotg))
-		s3c_hsotg_en_gsint(hsotg, GINTSTS_RxFLvl);
+		s3c_hsotg_en_gsint(hsotg, GINTSTS_RXFLVL);
 
 	/* Enable interrupts for EP0 in and out */
 	s3c_hsotg_ctrl_epint(hsotg, 0, 0, 1);
 	s3c_hsotg_ctrl_epint(hsotg, 0, 1, 1);
 
-	__orr32(hsotg->regs + DCTL, DCTL_PWROnPrgDone);
+	__orr32(hsotg->regs + DCTL, DCTL_PWRONPRGDONE);
 	udelay(10);  /* see openiboot */
-	__bic32(hsotg->regs + DCTL, DCTL_PWROnPrgDone);
+	__bic32(hsotg->regs + DCTL, DCTL_PWRONPRGDONE);
 
 	dev_dbg(hsotg->dev, "DCTL=0x%08x\n", readl(hsotg->regs + DCTL));
 
 	/*
-	 * DxEPCTL_USBActEp says RO in manual, but seems to be set by
+	 * DXEPCTL_USBActEp says RO in manual, but seems to be set by
 	 * writing to the EPCTL register..
 	 */
 
 	/* set to read 1 8byte packet */
-	writel(DxEPTSIZ_MC(1) | DxEPTSIZ_PktCnt(1) |
-	       DxEPTSIZ_XferSize(8), hsotg->regs + DOEPTSIZ0);
+	writel(DXEPTSIZ_MC(1) | DXEPTSIZ_PKTCNT(1) |
+	       DXEPTSIZ_XFERSIZE(8), hsotg->regs + DOEPTSIZ0);
 
 	writel(s3c_hsotg_ep0_mps(hsotg->eps[0].ep.maxpacket) |
-	       DxEPCTL_CNAK | DxEPCTL_EPEna |
-	       DxEPCTL_USBActEp,
+	       DXEPCTL_CNAK | DXEPCTL_EPENA |
+	       DXEPCTL_USBACTEP,
 	       hsotg->regs + DOEPCTL0);
 
 	/* enable, but don't activate EP0in */
 	writel(s3c_hsotg_ep0_mps(hsotg->eps[0].ep.maxpacket) |
-	       DxEPCTL_USBActEp, hsotg->regs + DIEPCTL0);
+	       DXEPCTL_USBACTEP, hsotg->regs + DIEPCTL0);
 
 	s3c_hsotg_enqueue_setup(hsotg);
 
@@ -2397,14 +2396,14 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 		readl(hsotg->regs + DOEPCTL0));
 
 	/* clear global NAKs */
-	writel(DCTL_CGOUTNak | DCTL_CGNPInNAK,
+	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK,
 	       hsotg->regs + DCTL);
 
 	/* must be at-least 3ms to allow bus to see disconnect */
 	mdelay(3);
 
 	/* remove the soft-disconnect and let's go */
-	__bic32(hsotg->regs + DCTL, DCTL_SftDiscon);
+	__bic32(hsotg->regs + DCTL, DCTL_SFTDISCON);
 }
 
 /**
@@ -2429,7 +2428,7 @@ irq_retry:
 
 	gintsts &= gintmsk;
 
-	if (gintsts & GINTSTS_OTGInt) {
+	if (gintsts & GINTSTS_OTGINT) {
 		u32 otgint = readl(hsotg->regs + GOTGINT);
 
 		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
@@ -2437,34 +2436,34 @@ irq_retry:
 		writel(otgint, hsotg->regs + GOTGINT);
 	}
 
-	if (gintsts & GINTSTS_SessReqInt) {
-		dev_dbg(hsotg->dev, "%s: SessReqInt\n", __func__);
-		writel(GINTSTS_SessReqInt, hsotg->regs + GINTSTS);
+	if (gintsts & GINTSTS_SESSREQINT) {
+		dev_dbg(hsotg->dev, "%s: SESSREQINT\n", __func__);
+		writel(GINTSTS_SESSREQINT, hsotg->regs + GINTSTS);
 	}
 
-	if (gintsts & GINTSTS_EnumDone) {
-		writel(GINTSTS_EnumDone, hsotg->regs + GINTSTS);
+	if (gintsts & GINTSTS_ENUMDONE) {
+		writel(GINTSTS_ENUMDONE, hsotg->regs + GINTSTS);
 
 		s3c_hsotg_irq_enumdone(hsotg);
 	}
 
-	if (gintsts & GINTSTS_ConIDStsChng) {
-		dev_dbg(hsotg->dev, "ConIDStsChg (DSTS=0x%08x, GOTCTL=%08x)\n",
+	if (gintsts & GINTSTS_CONIDSTSCHNG) {
+		dev_dbg(hsotg->dev, "CONIDSTSCHNG (DSTS=0x%08x, GOTCTL=%08x)\n",
 			readl(hsotg->regs + DSTS),
 			readl(hsotg->regs + GOTGCTL));
 
-		writel(GINTSTS_ConIDStsChng, hsotg->regs + GINTSTS);
+		writel(GINTSTS_CONIDSTSCHNG, hsotg->regs + GINTSTS);
 	}
 
-	if (gintsts & (GINTSTS_OEPInt | GINTSTS_IEPInt)) {
+	if (gintsts & (GINTSTS_OEPINT | GINTSTS_IEPINT)) {
 		u32 daint = readl(hsotg->regs + DAINT);
 		u32 daintmsk = readl(hsotg->regs + DAINTMSK);
 		u32 daint_out, daint_in;
 		int ep;
 
 		daint &= daintmsk;
-		daint_out = daint >> DAINT_OutEP_SHIFT;
-		daint_in = daint & ~(daint_out << DAINT_OutEP_SHIFT);
+		daint_out = daint >> DAINT_OUTEP_SHIFT;
+		daint_in = daint & ~(daint_out << DAINT_OUTEP_SHIFT);
 
 		dev_dbg(hsotg->dev, "%s: daint=%08x\n", __func__, daint);
 
@@ -2479,15 +2478,15 @@ irq_retry:
 		}
 	}
 
-	if (gintsts & GINTSTS_USBRst) {
+	if (gintsts & GINTSTS_USBRST) {
 
 		u32 usb_status = readl(hsotg->regs + GOTGCTL);
 
-		dev_info(hsotg->dev, "%s: USBRst\n", __func__);
+		dev_info(hsotg->dev, "%s: USBRST\n", __func__);
 		dev_dbg(hsotg->dev, "GNPTXSTS=%08x\n",
 			readl(hsotg->regs + GNPTXSTS));
 
-		writel(GINTSTS_USBRst, hsotg->regs + GINTSTS);
+		writel(GINTSTS_USBRST, hsotg->regs + GINTSTS);
 
 		if (usb_status & GOTGCTL_BSESVLD) {
 			if (time_after(jiffies, hsotg->last_rst +
@@ -2504,8 +2503,8 @@ irq_retry:
 
 	/* check both FIFOs */
 
-	if (gintsts & GINTSTS_NPTxFEmp) {
-		dev_dbg(hsotg->dev, "NPTxFEmp\n");
+	if (gintsts & GINTSTS_NPTXFEMP) {
+		dev_dbg(hsotg->dev, "NPTXFEMP\n");
 
 		/*
 		 * Disable the interrupt to stop it happening again
@@ -2513,22 +2512,22 @@ irq_retry:
 		 * it needs re-enabling
 		 */
 
-		s3c_hsotg_disable_gsint(hsotg, GINTSTS_NPTxFEmp);
+		s3c_hsotg_disable_gsint(hsotg, GINTSTS_NPTXFEMP);
 		s3c_hsotg_irq_fifoempty(hsotg, false);
 	}
 
-	if (gintsts & GINTSTS_PTxFEmp) {
-		dev_dbg(hsotg->dev, "PTxFEmp\n");
+	if (gintsts & GINTSTS_PTXFEMP) {
+		dev_dbg(hsotg->dev, "PTXFEMP\n");
 
 		/* See note in GINTSTS_NPTxFEmp */
 
-		s3c_hsotg_disable_gsint(hsotg, GINTSTS_PTxFEmp);
+		s3c_hsotg_disable_gsint(hsotg, GINTSTS_PTXFEMP);
 		s3c_hsotg_irq_fifoempty(hsotg, true);
 	}
 
-	if (gintsts & GINTSTS_RxFLvl) {
+	if (gintsts & GINTSTS_RXFLVL) {
 		/*
-		 * note, since GINTSTS_RxFLvl doubles as FIFO-not-empty,
+		 * note, since GINTSTS_RXFLVL doubles as FIFO-not-empty,
 		 * we need to retry s3c_hsotg_handle_rx if this is still
 		 * set.
 		 */
@@ -2536,28 +2535,28 @@ irq_retry:
 		s3c_hsotg_handle_rx(hsotg);
 	}
 
-	if (gintsts & GINTSTS_ModeMis) {
+	if (gintsts & GINTSTS_MODEMIS) {
 		dev_warn(hsotg->dev, "warning, mode mismatch triggered\n");
-		writel(GINTSTS_ModeMis, hsotg->regs + GINTSTS);
+		writel(GINTSTS_MODEMIS, hsotg->regs + GINTSTS);
 	}
 
-	if (gintsts & GINTSTS_USBSusp) {
+	if (gintsts & GINTSTS_USBSUSP) {
 		dev_info(hsotg->dev, "GINTSTS_USBSusp\n");
-		writel(GINTSTS_USBSusp, hsotg->regs + GINTSTS);
+		writel(GINTSTS_USBSUSP, hsotg->regs + GINTSTS);
 
 		call_gadget(hsotg, suspend);
 	}
 
-	if (gintsts & GINTSTS_WkUpInt) {
+	if (gintsts & GINTSTS_WKUPINT) {
 		dev_info(hsotg->dev, "GINTSTS_WkUpIn\n");
-		writel(GINTSTS_WkUpInt, hsotg->regs + GINTSTS);
+		writel(GINTSTS_WKUPINT, hsotg->regs + GINTSTS);
 
 		call_gadget(hsotg, resume);
 	}
 
-	if (gintsts & GINTSTS_ErlySusp) {
+	if (gintsts & GINTSTS_EARLYSUSP) {
 		dev_dbg(hsotg->dev, "GINTSTS_ErlySusp\n");
-		writel(GINTSTS_ErlySusp, hsotg->regs + GINTSTS);
+		writel(GINTSTS_EARLYSUSP, hsotg->regs + GINTSTS);
 	}
 
 	/*
@@ -2566,18 +2565,18 @@ irq_retry:
 	 * the occurrence.
 	 */
 
-	if (gintsts & GINTSTS_GOUTNakEff) {
-		dev_info(hsotg->dev, "GOUTNakEff triggered\n");
+	if (gintsts & GINTSTS_GOUTNAKEFF) {
+		dev_info(hsotg->dev, "GOUTNAKEFF triggered\n");
 
-		writel(DCTL_CGOUTNak, hsotg->regs + DCTL);
+		writel(DCTL_CGOUTNAK, hsotg->regs + DCTL);
 
 		s3c_hsotg_dump(hsotg);
 	}
 
-	if (gintsts & GINTSTS_GINNakEff) {
-		dev_info(hsotg->dev, "GINNakEff triggered\n");
+	if (gintsts & GINTSTS_GINNAKEFF) {
+		dev_info(hsotg->dev, "GINNAKEFF triggered\n");
 
-		writel(DCTL_CGNPInNAK, hsotg->regs + DCTL);
+		writel(DCTL_CGNPINNAK, hsotg->regs + DCTL);
 
 		s3c_hsotg_dump(hsotg);
 	}
@@ -2636,19 +2635,19 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	epctrl_reg = dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	epctrl = readl(hsotg->regs + epctrl_reg);
 
-	dev_dbg(hsotg->dev, "%s: read DxEPCTL=0x%08x from 0x%08x\n",
+	dev_dbg(hsotg->dev, "%s: read DXEPCTL=0x%08x from 0x%08x\n",
 		__func__, epctrl, epctrl_reg);
 
 	spin_lock_irqsave(&hsotg->lock, flags);
 
-	epctrl &= ~(DxEPCTL_EPType_MASK | DxEPCTL_MPS_MASK);
-	epctrl |= DxEPCTL_MPS(mps);
+	epctrl &= ~(DXEPCTL_EPTYPE_MASK | DXEPCTL_MPS_MASK);
+	epctrl |= DXEPCTL_MPS(mps);
 
 	/*
 	 * mark the endpoint as active, otherwise the core may ignore
 	 * transactions entirely for this endpoint
 	 */
-	epctrl |= DxEPCTL_USBActEp;
+	epctrl |= DXEPCTL_USBACTEP;
 
 	/*
 	 * set the NAK status on the endpoint, otherwise we might try and
@@ -2657,7 +2656,7 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	 * size register hasn't been set.
 	 */
 
-	epctrl |= DxEPCTL_SNAK;
+	epctrl |= DXEPCTL_SNAK;
 
 	/* update the endpoint state */
 	s3c_hsotg_set_ep_maxpacket(hsotg, hs_ep->index, mps);
@@ -2673,15 +2672,15 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 
 	switch (desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) {
 	case USB_ENDPOINT_XFER_ISOC:
-		epctrl |= DxEPCTL_EPType_Iso;
-		epctrl |= DxEPCTL_SetEvenFr;
+		epctrl |= DXEPCTL_EPTYPE_ISO;
+		epctrl |= DXEPCTL_SETEVENFR;
 		hs_ep->isochronous = 1;
 		if (dir_in)
 			hs_ep->periodic = 1;
 		break;
 
 	case USB_ENDPOINT_XFER_BULK:
-		epctrl |= DxEPCTL_EPType_Bulk;
+		epctrl |= DXEPCTL_EPTYPE_BULK;
 		break;
 
 	case USB_ENDPOINT_XFER_INT:
@@ -2694,14 +2693,14 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 			 */
 
 			hs_ep->periodic = 1;
-			epctrl |= DxEPCTL_TxFNum(index);
+			epctrl |= DXEPCTL_TXFNUM(index);
 		}
 
-		epctrl |= DxEPCTL_EPType_Intterupt;
+		epctrl |= DXEPCTL_EPTYPE_INTERRUPT;
 		break;
 
 	case USB_ENDPOINT_XFER_CONTROL:
-		epctrl |= DxEPCTL_EPType_Control;
+		epctrl |= DXEPCTL_EPTYPE_CONTROL;
 		break;
 	}
 
@@ -2710,17 +2709,17 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	 * a unique tx-fifo even if it is non-periodic.
 	 */
 	if (dir_in && hsotg->dedicated_fifos)
-		epctrl |= DxEPCTL_TxFNum(index);
+		epctrl |= DXEPCTL_TXFNUM(index);
 
 	/* for non control endpoints, set PID to D0 */
 	if (index)
-		epctrl |= DxEPCTL_SetD0PID;
+		epctrl |= DXEPCTL_SETD0PID;
 
-	dev_dbg(hsotg->dev, "%s: write DxEPCTL=0x%08x\n",
+	dev_dbg(hsotg->dev, "%s: write DXEPCTL=0x%08x\n",
 		__func__, epctrl);
 
 	writel(epctrl, hsotg->regs + epctrl_reg);
-	dev_dbg(hsotg->dev, "%s: read DxEPCTL=0x%08x\n",
+	dev_dbg(hsotg->dev, "%s: read DXEPCTL=0x%08x\n",
 		__func__, readl(hsotg->regs + epctrl_reg));
 
 	/* enable the endpoint interrupt */
@@ -2759,11 +2758,11 @@ static int s3c_hsotg_ep_disable(struct usb_ep *ep)
 
 
 	ctrl = readl(hsotg->regs + epctrl_reg);
-	ctrl &= ~DxEPCTL_EPEna;
-	ctrl &= ~DxEPCTL_USBActEp;
-	ctrl |= DxEPCTL_SNAK;
+	ctrl &= ~DXEPCTL_EPENA;
+	ctrl &= ~DXEPCTL_USBACTEP;
+	ctrl |= DXEPCTL_SNAK;
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x\n", __func__, ctrl);
+	dev_dbg(hsotg->dev, "%s: DXEPCTL=0x%08x\n", __func__, ctrl);
 	writel(ctrl, hsotg->regs + epctrl_reg);
 
 	/* disable endpoint interrupts */
@@ -2839,15 +2838,15 @@ static int s3c_hsotg_ep_sethalt(struct usb_ep *ep, int value)
 	epctl = readl(hs->regs + epreg);
 
 	if (value) {
-		epctl |= DxEPCTL_Stall + DxEPCTL_SNAK;
-		if (epctl & DxEPCTL_EPEna)
-			epctl |= DxEPCTL_EPDis;
+		epctl |= DXEPCTL_STALL + DXEPCTL_SNAK;
+		if (epctl & DXEPCTL_EPENA)
+			epctl |= DXEPCTL_EPDIS;
 	} else {
-		epctl &= ~DxEPCTL_Stall;
-		xfertype = epctl & DxEPCTL_EPType_MASK;
-		if (xfertype == DxEPCTL_EPType_Bulk ||
-			xfertype == DxEPCTL_EPType_Intterupt)
-				epctl |= DxEPCTL_SetD0PID;
+		epctl &= ~DXEPCTL_STALL;
+		xfertype = epctl & DXEPCTL_EPTYPE_MASK;
+		if (xfertype == DXEPCTL_EPTYPE_BULK ||
+			xfertype == DXEPCTL_EPTYPE_INTERRUPT)
+				epctl |= DXEPCTL_SETD0PID;
 	}
 
 	writel(epctl, hs->regs + epreg);
@@ -2856,13 +2855,13 @@ static int s3c_hsotg_ep_sethalt(struct usb_ep *ep, int value)
 	epctl = readl(hs->regs + epreg);
 
 	if (value)
-		epctl |= DxEPCTL_Stall;
+		epctl |= DXEPCTL_STALL;
 	else {
-		epctl &= ~DxEPCTL_Stall;
-		xfertype = epctl & DxEPCTL_EPType_MASK;
-		if (xfertype == DxEPCTL_EPType_Bulk ||
-			xfertype == DxEPCTL_EPType_Intterupt)
-				epctl |= DxEPCTL_SetD0PID;
+		epctl &= ~DXEPCTL_STALL;
+		xfertype = epctl & DXEPCTL_EPTYPE_MASK;
+		if (xfertype == DXEPCTL_EPTYPE_BULK ||
+			xfertype == DXEPCTL_EPTYPE_INTERRUPT)
+				epctl |= DXEPCTL_SETD0PID;
 	}
 
 	writel(epctl, hs->regs + epreg);
@@ -2952,22 +2951,22 @@ static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 {
 	/* unmask subset of endpoint interrupts */
 
-	writel(DIEPMSK_TimeOUTMsk | DIEPMSK_AHBErrMsk |
-	       DIEPMSK_EPDisbldMsk | DIEPMSK_XferComplMsk,
+	writel(DIEPMSK_TIMEOUTMSK | DIEPMSK_AHBERRMSK |
+	       DIEPMSK_EPDISBLDMSK | DIEPMSK_XFERCOMPLMSK,
 	       hsotg->regs + DIEPMSK);
 
-	writel(DOEPMSK_SetupMsk | DOEPMSK_AHBErrMsk |
-	       DOEPMSK_EPDisbldMsk | DOEPMSK_XferComplMsk,
+	writel(DOEPMSK_SETUPMSK | DOEPMSK_AHBERRMSK |
+	       DOEPMSK_EPDISBLDMSK | DOEPMSK_XFERCOMPLMSK,
 	       hsotg->regs + DOEPMSK);
 
 	writel(0, hsotg->regs + DAINTMSK);
 
 	/* Be in disconnected state until gadget is registered */
-	__orr32(hsotg->regs + DCTL, DCTL_SftDiscon);
+	__orr32(hsotg->regs + DCTL, DCTL_SFTDISCON);
 
 	if (0) {
 		/* post global nak until we're ready */
-		writel(DCTL_SGNPInNAK | DCTL_SGOUTNak,
+		writel(DCTL_SGNPINNAK | DCTL_SGOUTNAK,
 		       hsotg->regs + DCTL);
 	}
 
@@ -2980,10 +2979,10 @@ static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 	s3c_hsotg_init_fifo(hsotg);
 
 	/* set the PLL on, remove the HNP/SRP and set the PHY */
-	writel(GUSBCFG_PHYIf16 | GUSBCFG_TOutCal(7) | (0x5 << 10),
+	writel(GUSBCFG_PHYIF16 | GUSBCFG_TOUTCAL(7) | (0x5 << 10),
 	       hsotg->regs + GUSBCFG);
 
-	writel(using_dma(hsotg) ? GAHBCFG_DMAEn : 0x0,
+	writel(using_dma(hsotg) ? GAHBCFG_DMA_EN : 0x0,
 	       hsotg->regs + GAHBCFG);
 }
 
@@ -3174,8 +3173,8 @@ static void s3c_hsotg_initep(struct s3c_hsotg *hsotg,
 	 * code is changed to make each endpoint's direction changeable.
 	 */
 
-	ptxfifo = readl(hsotg->regs + DPTXFSIZn(epnum));
-	hs_ep->fifo_size = DPTXFSIZn_DPTxFSize_GET(ptxfifo) * 4;
+	ptxfifo = readl(hsotg->regs + DPTXFSIZN(epnum));
+	hs_ep->fifo_size = DPTXFSIZN_DPTXFSIZE_GET(ptxfifo) * 4;
 
 	/*
 	 * if we're using dma, we need to set the next-endpoint pointer
@@ -3183,7 +3182,7 @@ static void s3c_hsotg_initep(struct s3c_hsotg *hsotg,
 	 */
 
 	if (using_dma(hsotg)) {
-		u32 next = DxEPCTL_NextEp((epnum + 1) % 15);
+		u32 next = DXEPCTL_NEXTEP((epnum + 1) % 15);
 		writel(next, hsotg->regs + DIEPCTL(epnum));
 		writel(next, hsotg->regs + DOEPCTL(epnum));
 	}
@@ -3355,17 +3354,17 @@ static int fifo_show(struct seq_file *seq, void *v)
 
 	val = readl(regs + GNPTXFSIZ);
 	seq_printf(seq, "NPTXFIFO: Size %d, Start 0x%08x\n",
-		   val >> GNPTXFSIZ_NPTxFDep_SHIFT,
-		   val & GNPTXFSIZ_NPTxFStAddr_MASK);
+		   val >> FIFOSIZE_DEPTH_SHIFT,
+		   val & FIFOSIZE_DEPTH_MASK);
 
 	seq_puts(seq, "\nPeriodic TXFIFOs:\n");
 
 	for (idx = 1; idx <= 15; idx++) {
-		val = readl(regs + DPTXFSIZn(idx));
+		val = readl(regs + DPTXFSIZN(idx));
 
 		seq_printf(seq, "\tDPTXFIFO%2d: Size %d, Start 0x%08x\n", idx,
-			   val >> DPTXFSIZn_DPTxFSize_SHIFT,
-			   val & DPTXFSIZn_DPTxFStAddr_MASK);
+			   val >> FIFOSIZE_DEPTH_SHIFT,
+			   val & FIFOSIZE_STARTADDR_MASK);
 	}
 
 	return 0;
@@ -3649,14 +3648,14 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 	}
 
 	/* Set default UTMI width */
-	hsotg->phyif = GUSBCFG_PHYIf16;
+	hsotg->phyif = GUSBCFG_PHYIF16;
 
 	/*
 	 * If using the generic PHY framework, check if the PHY bus
 	 * width is 8-bit and set the phyif appropriately.
 	 */
 	if (hsotg->phy && (phy_get_bus_width(phy) == 8))
-		hsotg->phyif = GUSBCFG_PHYIf8;
+		hsotg->phyif = GUSBCFG_PHYIF8;
 
 	if (hsotg->phy)
 		phy_init(hsotg->phy);
diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 5f150bc..49514ea 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -26,7 +26,6 @@ fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+= fsl_mxc_udc.o
 obj-$(CONFIG_USB_M66592)	+= m66592-udc.o
 obj-$(CONFIG_USB_R8A66597)	+= r8a66597-udc.o
 obj-$(CONFIG_USB_FSL_QE)	+= fsl_qe_udc.o
-obj-$(CONFIG_USB_S3C_HSOTG)	+= s3c-hsotg.o
 obj-$(CONFIG_USB_S3C_HSUDC)	+= s3c-hsudc.o
 obj-$(CONFIG_USB_LPC32XX)	+= lpc32xx_udc.o
 obj-$(CONFIG_USB_EG20T)		+= pch_udc.o
diff --git a/drivers/usb/gadget/s3c-hsotg.h b/drivers/usb/gadget/s3c-hsotg.h
deleted file mode 100644
index 85f549f..0000000
--- a/drivers/usb/gadget/s3c-hsotg.h
+++ /dev/null
@@ -1,378 +0,0 @@
-/* drivers/usb/gadget/s3c-hsotg.h
- *
- * Copyright 2008 Openmoko, Inc.
- * Copyright 2008 Simtec Electronics
- *      http://armlinux.simtec.co.uk/
- *      Ben Dooks <ben@simtec.co.uk>
- *
- * USB2.0 Highspeed/OtG Synopsis DWC2 device block registers
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __REGS_USB_HSOTG_H
-#define __REGS_USB_HSOTG_H __FILE__
-
-#define HSOTG_REG(x) (x)
-
-#define GOTGCTL				HSOTG_REG(0x000)
-#define GOTGCTL_BSESVLD			(1 << 19)
-#define GOTGCTL_ASESVLD			(1 << 18)
-#define GOTGCTL_DBNC_SHORT			(1 << 17)
-#define GOTGCTL_CONID_B			(1 << 16)
-#define GOTGCTL_DEVHNPEN			(1 << 11)
-#define GOTGCTL_HSSETHNPEN			(1 << 10)
-#define GOTGCTL_HNPREQ				(1 << 9)
-#define GOTGCTL_HSTNEGSCS			(1 << 8)
-#define GOTGCTL_SESREQ				(1 << 1)
-#define GOTGCTL_SESREQSCS			(1 << 0)
-
-#define GOTGINT				HSOTG_REG(0x004)
-#define GOTGINT_DbnceDone			(1 << 19)
-#define GOTGINT_ADevTOUTChg			(1 << 18)
-#define GOTGINT_HstNegDet			(1 << 17)
-#define GOTGINT_HstnegSucStsChng		(1 << 9)
-#define GOTGINT_SesReqSucStsChng		(1 << 8)
-#define GOTGINT_SesEndDet			(1 << 2)
-
-#define GAHBCFG				HSOTG_REG(0x008)
-#define GAHBCFG_PTxFEmpLvl			(1 << 8)
-#define GAHBCFG_NPTxFEmpLvl			(1 << 7)
-#define GAHBCFG_DMAEn				(1 << 5)
-#define GAHBCFG_HBstLen_MASK			(0xf << 1)
-#define GAHBCFG_HBstLen_SHIFT			(1)
-#define GAHBCFG_HBstLen_Single			(0x0 << 1)
-#define GAHBCFG_HBstLen_Incr			(0x1 << 1)
-#define GAHBCFG_HBstLen_Incr4			(0x3 << 1)
-#define GAHBCFG_HBstLen_Incr8			(0x5 << 1)
-#define GAHBCFG_HBstLen_Incr16			(0x7 << 1)
-#define GAHBCFG_GlblIntrEn			(1 << 0)
-
-#define GUSBCFG				HSOTG_REG(0x00C)
-#define GUSBCFG_PHYLPClkSel			(1 << 15)
-#define GUSBCFG_HNPCap				(1 << 9)
-#define GUSBCFG_SRPCap				(1 << 8)
-#define GUSBCFG_PHYIf16			(1 << 3)
-#define GUSBCFG_PHYIf8				(0 << 3)
-#define GUSBCFG_TOutCal_MASK			(0x7 << 0)
-#define GUSBCFG_TOutCal_SHIFT			(0)
-#define GUSBCFG_TOutCal_LIMIT			(0x7)
-#define GUSBCFG_TOutCal(_x)			((_x) << 0)
-
-#define GRSTCTL				HSOTG_REG(0x010)
-
-#define GRSTCTL_AHBIdle			(1 << 31)
-#define GRSTCTL_DMAReq				(1 << 30)
-#define GRSTCTL_TxFNum_MASK			(0x1f << 6)
-#define GRSTCTL_TxFNum_SHIFT			(6)
-#define GRSTCTL_TxFNum_LIMIT			(0x1f)
-#define GRSTCTL_TxFNum(_x)			((_x) << 6)
-#define GRSTCTL_TxFFlsh			(1 << 5)
-#define GRSTCTL_RxFFlsh			(1 << 4)
-#define GRSTCTL_INTknQFlsh			(1 << 3)
-#define GRSTCTL_FrmCntrRst			(1 << 2)
-#define GRSTCTL_HSftRst			(1 << 1)
-#define GRSTCTL_CSftRst			(1 << 0)
-
-#define GINTSTS				HSOTG_REG(0x014)
-#define GINTMSK				HSOTG_REG(0x018)
-
-#define GINTSTS_WkUpInt			(1 << 31)
-#define GINTSTS_SessReqInt			(1 << 30)
-#define GINTSTS_DisconnInt			(1 << 29)
-#define GINTSTS_ConIDStsChng			(1 << 28)
-#define GINTSTS_PTxFEmp			(1 << 26)
-#define GINTSTS_HChInt				(1 << 25)
-#define GINTSTS_PrtInt				(1 << 24)
-#define GINTSTS_FetSusp			(1 << 22)
-#define GINTSTS_incompIP			(1 << 21)
-#define GINTSTS_IncomplSOIN			(1 << 20)
-#define GINTSTS_OEPInt				(1 << 19)
-#define GINTSTS_IEPInt				(1 << 18)
-#define GINTSTS_EPMis				(1 << 17)
-#define GINTSTS_EOPF				(1 << 15)
-#define GINTSTS_ISOutDrop			(1 << 14)
-#define GINTSTS_EnumDone			(1 << 13)
-#define GINTSTS_USBRst				(1 << 12)
-#define GINTSTS_USBSusp			(1 << 11)
-#define GINTSTS_ErlySusp			(1 << 10)
-#define GINTSTS_GOUTNakEff			(1 << 7)
-#define GINTSTS_GINNakEff			(1 << 6)
-#define GINTSTS_NPTxFEmp			(1 << 5)
-#define GINTSTS_RxFLvl				(1 << 4)
-#define GINTSTS_SOF				(1 << 3)
-#define GINTSTS_OTGInt				(1 << 2)
-#define GINTSTS_ModeMis			(1 << 1)
-#define GINTSTS_CurMod_Host			(1 << 0)
-
-#define GRXSTSR				HSOTG_REG(0x01C)
-#define GRXSTSP				HSOTG_REG(0x020)
-
-#define GRXSTS_FN_MASK				(0x7f << 25)
-#define GRXSTS_FN_SHIFT			(25)
-
-#define GRXSTS_PktSts_MASK			(0xf << 17)
-#define GRXSTS_PktSts_SHIFT			(17)
-#define GRXSTS_PktSts_GlobalOutNAK		(0x1 << 17)
-#define GRXSTS_PktSts_OutRX			(0x2 << 17)
-#define GRXSTS_PktSts_OutDone			(0x3 << 17)
-#define GRXSTS_PktSts_SetupDone		(0x4 << 17)
-#define GRXSTS_PktSts_SetupRX			(0x6 << 17)
-
-#define GRXSTS_DPID_MASK			(0x3 << 15)
-#define GRXSTS_DPID_SHIFT			(15)
-#define GRXSTS_ByteCnt_MASK			(0x7ff << 4)
-#define GRXSTS_ByteCnt_SHIFT			(4)
-#define GRXSTS_EPNum_MASK			(0xf << 0)
-#define GRXSTS_EPNum_SHIFT			(0)
-
-#define GRXFSIZ				HSOTG_REG(0x024)
-
-#define GNPTXFSIZ				HSOTG_REG(0x028)
-
-#define GNPTXFSIZ_NPTxFDep_MASK		(0xffff << 16)
-#define GNPTXFSIZ_NPTxFDep_SHIFT		(16)
-#define GNPTXFSIZ_NPTxFDep_LIMIT		(0xffff)
-#define GNPTXFSIZ_NPTxFDep(_x)			((_x) << 16)
-#define GNPTXFSIZ_NPTxFStAddr_MASK		(0xffff << 0)
-#define GNPTXFSIZ_NPTxFStAddr_SHIFT		(0)
-#define GNPTXFSIZ_NPTxFStAddr_LIMIT		(0xffff)
-#define GNPTXFSIZ_NPTxFStAddr(_x)		((_x) << 0)
-
-#define GNPTXSTS				HSOTG_REG(0x02C)
-
-#define GNPTXSTS_NPtxQTop_MASK			(0x7f << 24)
-#define GNPTXSTS_NPtxQTop_SHIFT		(24)
-
-#define GNPTXSTS_NPTxQSpcAvail_MASK		(0xff << 16)
-#define GNPTXSTS_NPTxQSpcAvail_SHIFT		(16)
-#define GNPTXSTS_NPTxQSpcAvail_GET(_v)		(((_v) >> 16) & 0xff)
-
-#define GNPTXSTS_NPTxFSpcAvail_MASK		(0xffff << 0)
-#define GNPTXSTS_NPTxFSpcAvail_SHIFT		(0)
-#define GNPTXSTS_NPTxFSpcAvail_GET(_v)		(((_v) >> 0) & 0xffff)
-
-
-#define HPTXFSIZ				HSOTG_REG(0x100)
-
-#define DPTXFSIZn(_a)		HSOTG_REG(0x104 + (((_a) - 1) * 4))
-
-#define DPTXFSIZn_DPTxFSize_MASK		(0xffff << 16)
-#define DPTXFSIZn_DPTxFSize_SHIFT		(16)
-#define DPTXFSIZn_DPTxFSize_GET(_v)		(((_v) >> 16) & 0xffff)
-#define DPTXFSIZn_DPTxFSize_LIMIT		(0xffff)
-#define DPTXFSIZn_DPTxFSize(_x)		((_x) << 16)
-
-#define DPTXFSIZn_DPTxFStAddr_MASK		(0xffff << 0)
-#define DPTXFSIZn_DPTxFStAddr_SHIFT		(0)
-
-/* Device mode registers */
-#define DCFG					HSOTG_REG(0x800)
-
-#define DCFG_EPMisCnt_MASK			(0x1f << 18)
-#define DCFG_EPMisCnt_SHIFT			(18)
-#define DCFG_EPMisCnt_LIMIT			(0x1f)
-#define DCFG_EPMisCnt(_x)			((_x) << 18)
-
-#define DCFG_PerFrInt_MASK			(0x3 << 11)
-#define DCFG_PerFrInt_SHIFT			(11)
-#define DCFG_PerFrInt_LIMIT			(0x3)
-#define DCFG_PerFrInt(_x)			((_x) << 11)
-
-#define DCFG_DevAddr_MASK			(0x7f << 4)
-#define DCFG_DevAddr_SHIFT			(4)
-#define DCFG_DevAddr_LIMIT			(0x7f)
-#define DCFG_DevAddr(_x)			((_x) << 4)
-
-#define DCFG_NZStsOUTHShk			(1 << 2)
-
-#define DCFG_DevSpd_MASK			(0x3 << 0)
-#define DCFG_DevSpd_SHIFT			(0)
-#define DCFG_DevSpd_HS				(0x0 << 0)
-#define DCFG_DevSpd_FS				(0x1 << 0)
-#define DCFG_DevSpd_LS				(0x2 << 0)
-#define DCFG_DevSpd_FS48			(0x3 << 0)
-
-#define DCTL					HSOTG_REG(0x804)
-
-#define DCTL_PWROnPrgDone			(1 << 11)
-#define DCTL_CGOUTNak				(1 << 10)
-#define DCTL_SGOUTNak				(1 << 9)
-#define DCTL_CGNPInNAK				(1 << 8)
-#define DCTL_SGNPInNAK				(1 << 7)
-#define DCTL_TstCtl_MASK			(0x7 << 4)
-#define DCTL_TstCtl_SHIFT			(4)
-#define DCTL_GOUTNakSts			(1 << 3)
-#define DCTL_GNPINNakSts			(1 << 2)
-#define DCTL_SftDiscon				(1 << 1)
-#define DCTL_RmtWkUpSig			(1 << 0)
-
-#define DSTS					HSOTG_REG(0x808)
-
-#define DSTS_SOFFN_MASK			(0x3fff << 8)
-#define DSTS_SOFFN_SHIFT			(8)
-#define DSTS_SOFFN_LIMIT			(0x3fff)
-#define DSTS_SOFFN(_x)				((_x) << 8)
-#define DSTS_ErraticErr			(1 << 3)
-#define DSTS_EnumSpd_MASK			(0x3 << 1)
-#define DSTS_EnumSpd_SHIFT			(1)
-#define DSTS_EnumSpd_HS			(0x0 << 1)
-#define DSTS_EnumSpd_FS			(0x1 << 1)
-#define DSTS_EnumSpd_LS			(0x2 << 1)
-#define DSTS_EnumSpd_FS48			(0x3 << 1)
-
-#define DSTS_SuspSts				(1 << 0)
-
-#define DIEPMSK				HSOTG_REG(0x810)
-
-#define DIEPMSK_TxFIFOEmpty			(1 << 7)
-#define DIEPMSK_INEPNakEffMsk			(1 << 6)
-#define DIEPMSK_INTknEPMisMsk			(1 << 5)
-#define DIEPMSK_INTknTXFEmpMsk			(1 << 4)
-#define DIEPMSK_TimeOUTMsk			(1 << 3)
-#define DIEPMSK_AHBErrMsk			(1 << 2)
-#define DIEPMSK_EPDisbldMsk			(1 << 1)
-#define DIEPMSK_XferComplMsk			(1 << 0)
-
-#define DOEPMSK				HSOTG_REG(0x814)
-
-#define DOEPMSK_Back2BackSetup			(1 << 6)
-#define DOEPMSK_OUTTknEPdisMsk			(1 << 4)
-#define DOEPMSK_SetupMsk			(1 << 3)
-#define DOEPMSK_AHBErrMsk			(1 << 2)
-#define DOEPMSK_EPDisbldMsk			(1 << 1)
-#define DOEPMSK_XferComplMsk			(1 << 0)
-
-#define DAINT					HSOTG_REG(0x818)
-#define DAINTMSK				HSOTG_REG(0x81C)
-
-#define DAINT_OutEP_SHIFT			(16)
-#define DAINT_OutEP(x)				(1 << ((x) + 16))
-#define DAINT_InEP(x)				(1 << (x))
-
-#define DTKNQR1				HSOTG_REG(0x820)
-#define DTKNQR2				HSOTG_REG(0x824)
-#define DTKNQR3				HSOTG_REG(0x830)
-#define DTKNQR4				HSOTG_REG(0x834)
-
-#define DVBUSDIS				HSOTG_REG(0x828)
-#define DVBUSPULSE				HSOTG_REG(0x82C)
-
-#define DIEPCTL0				HSOTG_REG(0x900)
-#define DOEPCTL0				HSOTG_REG(0xB00)
-#define DIEPCTL(_a)			HSOTG_REG(0x900 + ((_a) * 0x20))
-#define DOEPCTL(_a)			HSOTG_REG(0xB00 + ((_a) * 0x20))
-
-/* EP0 specialness:
- * bits[29..28] - reserved (no SetD0PID, SetD1PID)
- * bits[25..22] - should always be zero, this isn't a periodic endpoint
- * bits[10..0] - MPS setting differenct for EP0
- */
-#define D0EPCTL_MPS_MASK			(0x3 << 0)
-#define D0EPCTL_MPS_SHIFT			(0)
-#define D0EPCTL_MPS_64				(0x0 << 0)
-#define D0EPCTL_MPS_32				(0x1 << 0)
-#define D0EPCTL_MPS_16				(0x2 << 0)
-#define D0EPCTL_MPS_8				(0x3 << 0)
-
-#define DxEPCTL_EPEna				(1 << 31)
-#define DxEPCTL_EPDis				(1 << 30)
-#define DxEPCTL_SetD1PID			(1 << 29)
-#define DxEPCTL_SetOddFr			(1 << 29)
-#define DxEPCTL_SetD0PID			(1 << 28)
-#define DxEPCTL_SetEvenFr			(1 << 28)
-#define DxEPCTL_SNAK				(1 << 27)
-#define DxEPCTL_CNAK				(1 << 26)
-#define DxEPCTL_TxFNum_MASK			(0xf << 22)
-#define DxEPCTL_TxFNum_SHIFT			(22)
-#define DxEPCTL_TxFNum_LIMIT			(0xf)
-#define DxEPCTL_TxFNum(_x)			((_x) << 22)
-
-#define DxEPCTL_Stall				(1 << 21)
-#define DxEPCTL_Snp				(1 << 20)
-#define DxEPCTL_EPType_MASK			(0x3 << 18)
-#define DxEPCTL_EPType_SHIFT			(18)
-#define DxEPCTL_EPType_Control			(0x0 << 18)
-#define DxEPCTL_EPType_Iso			(0x1 << 18)
-#define DxEPCTL_EPType_Bulk			(0x2 << 18)
-#define DxEPCTL_EPType_Intterupt		(0x3 << 18)
-
-#define DxEPCTL_NAKsts				(1 << 17)
-#define DxEPCTL_DPID				(1 << 16)
-#define DxEPCTL_EOFrNum			(1 << 16)
-#define DxEPCTL_USBActEp			(1 << 15)
-#define DxEPCTL_NextEp_MASK			(0xf << 11)
-#define DxEPCTL_NextEp_SHIFT			(11)
-#define DxEPCTL_NextEp_LIMIT			(0xf)
-#define DxEPCTL_NextEp(_x)			((_x) << 11)
-
-#define DxEPCTL_MPS_MASK			(0x7ff << 0)
-#define DxEPCTL_MPS_SHIFT			(0)
-#define DxEPCTL_MPS_LIMIT			(0x7ff)
-#define DxEPCTL_MPS(_x)			((_x) << 0)
-
-#define DIEPINT(_a)			HSOTG_REG(0x908 + ((_a) * 0x20))
-#define DOEPINT(_a)			HSOTG_REG(0xB08 + ((_a) * 0x20))
-
-#define DxEPINT_INEPNakEff			(1 << 6)
-#define DxEPINT_Back2BackSetup			(1 << 6)
-#define DxEPINT_INTknEPMis			(1 << 5)
-#define DxEPINT_INTknTXFEmp			(1 << 4)
-#define DxEPINT_OUTTknEPdis			(1 << 4)
-#define DxEPINT_Timeout			(1 << 3)
-#define DxEPINT_Setup				(1 << 3)
-#define DxEPINT_AHBErr				(1 << 2)
-#define DxEPINT_EPDisbld			(1 << 1)
-#define DxEPINT_XferCompl			(1 << 0)
-
-#define DIEPTSIZ0				HSOTG_REG(0x910)
-
-#define DIEPTSIZ0_PktCnt_MASK			(0x3 << 19)
-#define DIEPTSIZ0_PktCnt_SHIFT			(19)
-#define DIEPTSIZ0_PktCnt_LIMIT			(0x3)
-#define DIEPTSIZ0_PktCnt(_x)			((_x) << 19)
-
-#define DIEPTSIZ0_XferSize_MASK		(0x7f << 0)
-#define DIEPTSIZ0_XferSize_SHIFT		(0)
-#define DIEPTSIZ0_XferSize_LIMIT		(0x7f)
-#define DIEPTSIZ0_XferSize(_x)			((_x) << 0)
-
-#define DOEPTSIZ0				HSOTG_REG(0xB10)
-#define DOEPTSIZ0_SUPCnt_MASK			(0x3 << 29)
-#define DOEPTSIZ0_SUPCnt_SHIFT			(29)
-#define DOEPTSIZ0_SUPCnt_LIMIT			(0x3)
-#define DOEPTSIZ0_SUPCnt(_x)			((_x) << 29)
-
-#define DOEPTSIZ0_PktCnt			(1 << 19)
-#define DOEPTSIZ0_XferSize_MASK		(0x7f << 0)
-#define DOEPTSIZ0_XferSize_SHIFT		(0)
-
-#define DIEPTSIZ(_a)			HSOTG_REG(0x910 + ((_a) * 0x20))
-#define DOEPTSIZ(_a)			HSOTG_REG(0xB10 + ((_a) * 0x20))
-
-#define DxEPTSIZ_MC_MASK			(0x3 << 29)
-#define DxEPTSIZ_MC_SHIFT			(29)
-#define DxEPTSIZ_MC_LIMIT			(0x3)
-#define DxEPTSIZ_MC(_x)			((_x) << 29)
-
-#define DxEPTSIZ_PktCnt_MASK			(0x3ff << 19)
-#define DxEPTSIZ_PktCnt_SHIFT			(19)
-#define DxEPTSIZ_PktCnt_GET(_v)		(((_v) >> 19) & 0x3ff)
-#define DxEPTSIZ_PktCnt_LIMIT			(0x3ff)
-#define DxEPTSIZ_PktCnt(_x)			((_x) << 19)
-
-#define DxEPTSIZ_XferSize_MASK			(0x7ffff << 0)
-#define DxEPTSIZ_XferSize_SHIFT		(0)
-#define DxEPTSIZ_XferSize_GET(_v)		(((_v) >> 0) & 0x7ffff)
-#define DxEPTSIZ_XferSize_LIMIT		(0x7ffff)
-#define DxEPTSIZ_XferSize(_x)			((_x) << 0)
-
-#define DIEPDMA(_a)			HSOTG_REG(0x914 + ((_a) * 0x20))
-#define DOEPDMA(_a)			HSOTG_REG(0xB14 + ((_a) * 0x20))
-#define DTXFSTS(_a)			HSOTG_REG(0x918 + ((_a) * 0x20))
-
-#define EPFIFO(_a)			HSOTG_REG(0x1000 + ((_a) * 0x1000))
-
-#endif /* __REGS_USB_HSOTG_H */
-- 
1.7.9.5
