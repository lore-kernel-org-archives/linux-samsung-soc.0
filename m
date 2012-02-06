From: Anton Tikhomirov <av.tikhomirov@samsung.com>
Subject: [PATCH 3/3] USB: EXYNOS USB3.0 device controller driver
Date: Mon, 06 Feb 2012 17:13:28 +0900
Message-ID: <001101cce4a7$35500610$9ff01230$%tikhomirov@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64757 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753909Ab2BFINb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Feb 2012 03:13:31 -0500
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Greg Kroah-Hartman' <gregkh@suse.de>, 'Felipe Balbi' <balbi@ti.com>, 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>

Cc: Kukjin Kim <kgene.kim <at> samsung.com>
Cc: Greg Kroah-Hartman <gregkh <at> suse.de>
Cc: Felipe Balbi <balbi <at> ti.com>

Adds Exynos USB3.0 device controller driver to support USB peripherals
on Exynos5 chips.

Signed-off-by: Anton Tikhomirov <av.tikhomirov@samsung.com>
---
 drivers/usb/gadget/Kconfig         |   13 +
 drivers/usb/gadget/Makefile        |    1 +
 drivers/usb/gadget/exynos_ss_udc.c | 2511 ++++++++++++++++++++++++++++++++++++
 drivers/usb/gadget/exynos_ss_udc.h |  342 +++++
 4 files changed, 2867 insertions(+), 0 deletions(-)
 create mode 100644 drivers/usb/gadget/exynos_ss_udc.c
 create mode 100644 drivers/usb/gadget/exynos_ss_udc.h

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 7ecb68a..8d3bc6e 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -268,6 +268,19 @@ config USB_S3C_HSOTG
 	  The Samsung S3C64XX USB2.0 high-speed gadget controller
 	  integrated into the S3C64XX series SoC.
 
+config USB_EXYNOS_SS_UDC
+	tristate "EXYNOS SuperSpeed USB 3.0 Device controller"
+	depends on EXYNOS_DEV_SS_UDC
+	select USB_GADGET_DUALSPEED
+	select USB_GADGET_SUPERSPEED
+	help
+	  The Samsung Exynos SuperSpeed USB 3.0 device controller
+	  integrated into the Exynos5 series SoC.
+
+	  Say "y" to link the driver statically, or "m" to build a
+	  dynamically linked module called "exynos_ss_udc" and force all
+	  gadget drivers to also be dynamically linked.
+
 config USB_IMX
 	tristate "Freescale i.MX1 USB Peripheral Controller"
 	depends on ARCH_MXC
diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index b7f6eef..092bc76 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_USB_FSL_QE)	+= fsl_qe_udc.o
 obj-$(CONFIG_USB_CI13XXX_PCI)	+= ci13xxx_pci.o
 obj-$(CONFIG_USB_S3C_HSOTG)	+= s3c-hsotg.o
 obj-$(CONFIG_USB_S3C_HSUDC)	+= s3c-hsudc.o
+obj-$(CONFIG_USB_EXYNOS_SS_UDC) += exynos_ss_udc.o
 obj-$(CONFIG_USB_LANGWELL)	+= langwell_udc.o
 obj-$(CONFIG_USB_EG20T)		+= pch_udc.o
 obj-$(CONFIG_USB_MV_UDC)	+= mv_udc.o
diff --git a/drivers/usb/gadget/exynos_ss_udc.c b/drivers/usb/gadget/exynos_ss_udc.c
new file mode 100644
index 0000000..aaad33c
--- /dev/null
+++ b/drivers/usb/gadget/exynos_ss_udc.c
@@ -0,0 +1,2511 @@
+/* linux/drivers/usb/gadget/exynos_ss_udc.c
+ *
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *	http://www.samsung.com/
+ *
+ * EXYNOS SuperSpeed USB 3.0 Device Controlle driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+
+#include <linux/usb/ch9.h>
+#include <linux/usb/gadget.h>
+
+#include <asm/byteorder.h>
+
+#include <mach/map.h>
+
+#include <plat/regs-usb3-exynos-drd.h>
+#include <plat/udc-ss.h>
+#include <plat/usb-phy.h>
+
+#include "exynos_ss_udc.h"
+
+static void exynos_ss_udc_kill_all_requests(struct exynos_ss_udc *udc,
+					    struct exynos_ss_udc_ep *udc_ep,
+					    int result);
+static void exynos_ss_udc_complete_setup(struct usb_ep *ep,
+					 struct usb_request *req);
+static void exynos_ss_udc_complete_request(struct exynos_ss_udc *udc,
+					   struct exynos_ss_udc_ep *udc_ep,
+					   struct exynos_ss_udc_req *udc_req,
+					   int result);
+static void exynos_ss_udc_start_req(struct exynos_ss_udc *udc,
+				    struct exynos_ss_udc_ep *udc_ep,
+				    struct exynos_ss_udc_req *udc_req,
+				    bool continuing);
+static void exynos_ss_udc_ep_activate(struct exynos_ss_udc *udc,
+				      struct exynos_ss_udc_ep *udc_ep);
+static void exynos_ss_udc_ep_deactivate(struct exynos_ss_udc *udc,
+					struct exynos_ss_udc_ep *udc_ep);
+static int exynos_ss_udc_start(struct usb_gadget *gadget,
+			       struct usb_gadget_driver *driver);
+static int exynos_ss_udc_stop(struct usb_gadget *gadget,
+			      struct usb_gadget_driver *driver);
+
+
+static int poll_bit_set(void __iomem *ptr, u32 val, int timeout)
+{
+	u32 reg;
+
+	do {
+		reg = readl(ptr);
+		if (reg & val)
+			return 0;
+
+		udelay(1);
+	} while (timeout-- > 0);
+
+	return -ETIME;
+}
+
+static int poll_bit_clear(void __iomem *ptr, u32 val, int timeout)
+{
+	u32 reg;
+
+	do {
+		reg = readl(ptr);
+		if (!(reg & val))
+			return 0;
+
+		udelay(1);
+	} while (timeout-- > 0);
+
+	return -ETIME;
+}
+
+/**
+ * ep_from_windex - convert control wIndex value to endpoint
+ * @udc: The device state.
+ * @windex: The control request wIndex field (in host order).
+ *
+ * Convert the given wIndex into a pointer to an driver endpoint
+ * structure, or return NULL if it is not a valid endpoint.
+ */
+static struct exynos_ss_udc_ep *ep_from_windex(struct exynos_ss_udc *udc,
+					       u32 windex)
+{
+	struct exynos_ss_udc_ep *ep = &udc->eps[windex & 0x7F];
+	int dir = (windex & USB_DIR_IN) ? 1 : 0;
+	int idx = windex & 0x7F;
+
+	if (windex >= 0x100)
+		return NULL;
+
+	if (idx > EXYNOS_USB3_EPS)
+		return NULL;
+
+	if (idx && ep->dir_in != dir)
+		return NULL;
+
+	return ep;
+}
+
+/**
+ * get_ep_head - return the first request on the endpoint
+ * @udc_ep: The endpoint to get request from.
+ *
+ * Get the first request on the endpoint.
+ */
+static struct exynos_ss_udc_req *get_ep_head(struct exynos_ss_udc_ep *udc_ep)
+{
+	if (list_empty(&udc_ep->queue))
+		return NULL;
+
+	return list_first_entry(&udc_ep->queue,
+				struct exynos_ss_udc_req,
+				queue);
+}
+
+/**
+ * on_list - check request is on the given endpoint
+ * @ep: The endpoint to check.
+ * @test: The request to test if it is on the endpoint.
+ */
+static bool on_list(struct exynos_ss_udc_ep *udc_ep,
+		    struct exynos_ss_udc_req *test)
+{
+	struct exynos_ss_udc_req *udc_req, *treq;
+
+	list_for_each_entry_safe(udc_req, treq, &udc_ep->queue, queue) {
+		if (udc_req == test)
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * exynos_ss_udc_map_dma - map the DMA memory being used for the request
+ * @udc: The device state.
+ * @udc_ep: The endpoint the request is on.
+ * @req: The request being processed.
+ *
+ * We've been asked to queue a request, so ensure that the memory buffer
+ * is correctly setup for DMA. If we've been passed an extant DMA address
+ * then ensure the buffer has been synced to memory. If our buffer has no
+ * DMA memory, then we map the memory and mark our request to allow us to
+ * cleanup on completion.
+ */
+static int exynos_ss_udc_map_dma(struct exynos_ss_udc *udc,
+				 struct exynos_ss_udc_ep *udc_ep,
+				 struct usb_request *req)
+{
+	enum dma_data_direction dir;
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+
+	dir = udc_ep->dir_in ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+
+	/* if the length is zero, ignore the DMA data */
+	if (udc_req->req.length == 0)
+		return 0;
+
+	if (req->dma == DMA_ADDR_INVALID) {
+		dma_addr_t dma;
+
+		dma = dma_map_single(udc->dev,
+				     req->buf, req->length, dir);
+
+		if (unlikely(dma_mapping_error(udc->dev, dma)))
+			goto dma_error;
+
+		udc_req->mapped = 1;
+		req->dma = dma;
+	} else
+		dma_sync_single_for_device(udc->dev,
+					   req->dma, req->length, dir);
+
+	return 0;
+
+dma_error:
+	dev_err(udc->dev, "%s: failed to map buffer %p, %d bytes\n",
+			  __func__, req->buf, req->length);
+
+	return -EIO;
+}
+
+/**
+ * exynos_ss_udc_unmap_dma - unmap the DMA memory being used for the request
+ * @udc: The device state.
+ * @udc_ep: The endpoint for the request.
+ * @udc_req: The request being processed.
+ *
+ * This is the reverse of exynos_ss_udc_map_dma(), called for the completion
+ * of a request to ensure the buffer is ready for access by the caller.
+ */
+static void exynos_ss_udc_unmap_dma(struct exynos_ss_udc *udc,
+				    struct exynos_ss_udc_ep *udc_ep,
+				    struct exynos_ss_udc_req *udc_req)
+{
+	struct usb_request *req = &udc_req->req;
+	enum dma_data_direction dir;
+
+	dir = udc_ep->dir_in ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+
+	/* ignore this if we're not moving any data */
+	if (udc_req->req.length == 0)
+		return;
+
+	if (udc_req->mapped) {
+		/* we mapped this, so unmap and remove the dma */
+
+		dma_unmap_single(udc->dev, req->dma, req->length, dir);
+
+		req->dma = DMA_ADDR_INVALID;
+		udc_req->mapped = 0;
+	}
+}
+
+/**
+ * exynos_ss_udc_issue_epcmd - issue physical endpoint-specific command
+ * @udc: The device state.
+ * @epcmd: The command to issue.
+ */
+static int exynos_ss_udc_issue_epcmd(struct exynos_ss_udc *udc,
+				     struct exynos_ss_udc_ep_command *epcmd)
+{
+	int res;
+	u32 depcmd;
+
+	/* If some of parameters are not in use, we will write it anyway
+	   for simplification */
+	writel(epcmd->param0, udc->regs + EXYNOS_USB3_DEPCMDPAR0(epcmd->ep));
+	writel(epcmd->param1, udc->regs + EXYNOS_USB3_DEPCMDPAR1(epcmd->ep));
+	writel(epcmd->param2, udc->regs + EXYNOS_USB3_DEPCMDPAR2(epcmd->ep));
+
+	depcmd = epcmd->cmdtyp | epcmd->cmdflags;
+	writel(depcmd, udc->regs + EXYNOS_USB3_DEPCMD(epcmd->ep));
+
+	res = poll_bit_clear(udc->regs + EXYNOS_USB3_DEPCMD(epcmd->ep),
+			     EXYNOS_USB3_DEPCMDx_CmdAct,
+			     1000);
+	return res;
+}
+
+/**
+ * exynos_ss_udc_run_stop - start/stop the device controller operation
+ * @udc: The device state.
+ * @is_on: The action to take (1 - start, 0 - stop).
+ */
+static void exynos_ss_udc_run_stop(struct exynos_ss_udc *udc, int is_on)
+{
+	int res;
+
+	if (is_on) {
+		__orr32(udc->regs + EXYNOS_USB3_DCTL,
+			EXYNOS_USB3_DCTL_Run_Stop);
+		res = poll_bit_clear(udc->regs + EXYNOS_USB3_DSTS,
+				     EXYNOS_USB3_DSTS_DevCtrlHlt,
+				     1000);
+	} else {
+		__bic32(udc->regs + EXYNOS_USB3_DCTL,
+			EXYNOS_USB3_DCTL_Run_Stop);
+		res = poll_bit_set(udc->regs + EXYNOS_USB3_DSTS,
+				   EXYNOS_USB3_DSTS_DevCtrlHlt,
+				   1000);
+	}
+
+	if (res < 0)
+		dev_dbg(udc->dev, "Failed to %sconnect by software\n",
+				  is_on ? "" : "dis");
+}
+
+/**
+ * exynos_ss_udc_pullup - software-controlled connect/disconnect to USB host
+ * @gadget: The peripheral being connected/disconnected.
+ * @is_on: The action to take (1 - connect, 0 - disconnect).
+ */
+static int exynos_ss_udc_pullup(struct usb_gadget *gadget, int is_on)
+{
+	struct exynos_ss_udc *udc = our_udc(gadget);
+
+	exynos_ss_udc_run_stop(udc, is_on);
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_get_config_params - get UDC configuration
+ * @params: The controller parameters being returned to the caller.
+ */
+void exynos_ss_udc_get_config_params(struct usb_dcd_config_params *params)
+{
+	params->bU1devExitLat = EXYNOS_USB3_U1_DEV_EXIT_LAT;
+	params->bU2DevExitLat = cpu_to_le16(EXYNOS_USB3_U2_DEV_EXIT_LAT);
+}
+
+static struct usb_gadget_ops exynos_ss_udc_gadget_ops = {
+	.pullup			= exynos_ss_udc_pullup,
+	.get_config_params	= exynos_ss_udc_get_config_params,
+	.udc_start		= exynos_ss_udc_start,
+	.udc_stop		= exynos_ss_udc_stop,
+};
+
+/**
+ * exynos_ss_udc_ep_enable - configure endpoint, making it usable
+ * @ep: The endpoint being configured.
+ * @desc: The descriptor for desired behavior.
+ */
+static int exynos_ss_udc_ep_enable(struct usb_ep *ep,
+				   const struct usb_endpoint_descriptor *desc)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	unsigned long flags;
+	int dir_in;
+	int epnum;
+
+	dev_dbg(udc->dev,
+		"%s: ep %s: a 0x%02x, attr 0x%02x, mps 0x%04x, intr %d\n",
+		__func__, ep->name, desc->bEndpointAddress, desc->bmAttributes,
+		desc->wMaxPacketSize, desc->bInterval);
+
+	/* not to be called for EP0 */
+	WARN_ON(udc_ep->epnum == 0);
+
+	if (udc_ep->enabled)
+		return -EINVAL;
+
+	epnum = (desc->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK);
+	if (epnum != udc_ep->epnum) {
+		dev_err(udc->dev, "%s: EP number mismatch!\n", __func__);
+		return -EINVAL;
+	}
+
+	dir_in = (desc->bEndpointAddress & USB_ENDPOINT_DIR_MASK) ? 1 : 0;
+	if (dir_in != udc_ep->dir_in) {
+		dev_err(udc->dev, "%s: EP direction mismatch!\n", __func__);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&udc_ep->lock, flags);
+
+	/* update the endpoint state */
+	udc_ep->ep.maxpacket = le16_to_cpu(desc->wMaxPacketSize);
+	udc_ep->type = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
+
+	switch (udc_ep->type) {
+	case USB_ENDPOINT_XFER_ISOC:
+		dev_err(udc->dev, "no current ISOC support\n");
+		spin_unlock_irqrestore(&udc_ep->lock, flags);
+		return -EINVAL;
+
+	case USB_ENDPOINT_XFER_BULK:
+		dev_dbg(udc->dev, "Bulk endpoint\n");
+		break;
+
+	case USB_ENDPOINT_XFER_INT:
+		dev_dbg(udc->dev, "Interrupt endpoint\n");
+		break;
+
+	case USB_ENDPOINT_XFER_CONTROL:
+		dev_dbg(udc->dev, "Control endpoint\n");
+		break;
+	}
+
+	exynos_ss_udc_ep_activate(udc, udc_ep);
+	udc_ep->enabled = 1;
+	udc_ep->halted = udc_ep->wedged = 0;
+	spin_unlock_irqrestore(&udc_ep->lock, flags);
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_ep_disable - endpoint is no longer usable
+ * @ep: The endpoint being unconfigured.
+ */
+static int exynos_ss_udc_ep_disable(struct usb_ep *ep)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	unsigned long flags;
+
+	dev_dbg(udc->dev, "%s: ep%d%s\n", __func__,
+			  udc_ep->epnum, udc_ep->dir_in ? "in" : "out");
+
+	spin_lock_irqsave(&udc_ep->lock, flags);
+	exynos_ss_udc_ep_deactivate(udc, udc_ep);
+	udc_ep->enabled = 0;
+	spin_unlock_irqrestore(&udc_ep->lock, flags);
+
+	/* terminate all requests with shutdown */
+	exynos_ss_udc_kill_all_requests(udc, udc_ep, -ESHUTDOWN);
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_ep_alloc_request - allocate a request object
+ * @ep: The endpoint to be used with the request.
+ * @flags: Allocation flags.
+ *
+ * Allocate a new USB request structure appropriate for the specified endpoint.
+ */
+static struct usb_request *exynos_ss_udc_ep_alloc_request(struct usb_ep *ep,
+							  gfp_t flags)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	struct exynos_ss_udc_req *req;
+
+	dev_dbg(udc->dev, "%s: ep%d\n", __func__, udc_ep->epnum);
+
+	req = kzalloc(sizeof(struct exynos_ss_udc_req), flags);
+	if (!req)
+		return NULL;
+
+	INIT_LIST_HEAD(&req->queue);
+
+	req->req.dma = DMA_ADDR_INVALID;
+	return &req->req;
+}
+
+/**
+ * exynos_ss_udc_ep_free_request - free a request object
+ * @ep: The endpoint associated with the request.
+ * @req: The request being freed.
+ *
+ * Reverse the effect of exynos_ss_udc_ep_alloc_request().
+ */
+static void exynos_ss_udc_ep_free_request(struct usb_ep *ep,
+					  struct usb_request *req)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+
+	dev_dbg(udc->dev, "%s: ep%d, req %p\n", __func__, udc_ep->epnum, req);
+
+	kfree(udc_req);
+}
+
+/**
+ * exynos_ss_udc_ep_queue - queue (submit) an I/O request to an endpoint
+ * @ep: The endpoint associated with the request.
+ * @req: The request being submitted.
+ * @gfp_flags: Not used.
+ *
+ * Queue a request and start it if the first.
+ */
+static int exynos_ss_udc_ep_queue(struct usb_ep *ep,
+				  struct usb_request *req,
+				  gfp_t gfp_flags)
+{
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	unsigned long irqflags;
+	bool first;
+	int ret;
+
+	dev_dbg(udc->dev, "%s: ep%d%s (%p): %d@%p, noi=%d, zero=%d, snok=%d\n",
+			  __func__, udc_ep->epnum,
+			  udc_ep->dir_in ? "in" : "out", req,
+			  req->length, req->buf, req->no_interrupt,
+			  req->zero, req->short_not_ok);
+
+	/* initialise status of the request */
+	INIT_LIST_HEAD(&udc_req->queue);
+
+	req->actual = 0;
+	req->status = -EINPROGRESS;
+
+	/* Sync the buffers as necessary */
+	if (req->buf == udc->ctrl_buff)
+		req->dma = udc->ctrl_buff_dma;
+	else if (req->buf == udc->ep0_buff)
+		req->dma = udc->ep0_buff_dma;
+	else {
+		ret = exynos_ss_udc_map_dma(udc, udc_ep, req);
+		if (ret)
+			return ret;
+	}
+
+	spin_lock_irqsave(&udc_ep->lock, irqflags);
+
+	first = list_empty(&udc_ep->queue);
+	list_add_tail(&udc_req->queue, &udc_ep->queue);
+
+	if (first && !udc_ep->not_ready)
+		exynos_ss_udc_start_req(udc, udc_ep, udc_req, false);
+
+	spin_unlock_irqrestore(&udc_ep->lock, irqflags);
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_ep_dequeue - dequeue an I/O request from an endpoint
+ * @ep: The endpoint associated with the request.
+ * @req: The request being canceled.
+ *
+ * Dequeue a request and call its completion routine.
+ */
+static int exynos_ss_udc_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
+{
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	unsigned long flags;
+
+	dev_dbg(udc->dev, "%s: ep%d%s (%p)\n", __func__,
+			  udc_ep->epnum, udc_ep->dir_in ? "in" : "out", req);
+
+	spin_lock_irqsave(&udc_ep->lock, flags);
+
+	if (!on_list(udc_ep, udc_req)) {
+		spin_unlock_irqrestore(&udc_ep->lock, flags);
+		return -EINVAL;
+	}
+
+	exynos_ss_udc_complete_request(udc, udc_ep, udc_req, -ECONNRESET);
+	spin_unlock_irqrestore(&udc_ep->lock, flags);
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_ep_sethalt - set/clear the endpoint halt feature
+ * @ep: The endpoint being stalled/reset.
+ * @value: The action to take (1 - set stall, 0 - clear stall).
+ */
+static int exynos_ss_udc_ep_sethalt(struct usb_ep *ep, int value)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	struct exynos_ss_udc_ep_command epcmd;
+	int index = get_phys_epnum(udc_ep);
+	unsigned long irqflags;
+	int res;
+
+	dev_dbg(udc->dev, "%s(ep %p %s, %d)\n", __func__, ep, ep->name, value);
+
+	spin_lock_irqsave(&udc_ep->lock, irqflags);
+
+	if (value && udc_ep->dir_in && udc_ep->req) {
+		dev_dbg(udc->dev, "%s: transfer in progress!\n", __func__);
+		spin_unlock_irqrestore(&udc_ep->lock, irqflags);
+		return -EAGAIN;
+	}
+
+	if (udc_ep->epnum == 0)
+		/* Only OUT direction can be stalled */
+		epcmd.ep = 0;
+	else
+		epcmd.ep = index;
+
+	if (value)
+		epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSSTALL;
+	else
+		epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCSTALL;
+
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0) {
+		dev_err(udc->dev, "Failed to set/clear stall\n");
+		spin_unlock_irqrestore(&udc_ep->lock, irqflags);
+		return res;
+	}
+
+	if (udc_ep->epnum == 0 && value)
+		udc->ep0_state = EP0_STALL;
+
+	/* If everything is Ok, we mark endpoint as halted */
+	if (value)
+		udc_ep->halted = 1;
+	else
+		udc_ep->halted = udc_ep->wedged = 0;
+
+	spin_unlock_irqrestore(&udc_ep->lock, irqflags);
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_ep_setwedge - set the halt feature and ignore clear requests
+ * @ep: The endpoint being wedged.
+ */
+static int exynos_ss_udc_ep_setwedge(struct usb_ep *ep)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&udc_ep->lock, irqflags);
+	udc_ep->wedged = 1;
+	spin_unlock_irqrestore(&udc_ep->lock, irqflags);
+
+	return exynos_ss_udc_ep_sethalt(ep, 1);
+}
+
+static struct usb_ep_ops exynos_ss_udc_ep_ops = {
+	.enable		= exynos_ss_udc_ep_enable,
+	.disable	= exynos_ss_udc_ep_disable,
+	.alloc_request	= exynos_ss_udc_ep_alloc_request,
+	.free_request	= exynos_ss_udc_ep_free_request,
+	.queue		= exynos_ss_udc_ep_queue,
+	.dequeue	= exynos_ss_udc_ep_dequeue,
+	.set_halt	= exynos_ss_udc_ep_sethalt,
+	.set_wedge	= exynos_ss_udc_ep_setwedge,
+};
+
+/**
+ * exynos_ss_udc_start_req - start a USB request from an endpoint's queue
+ * @udc: The device state.
+ * @udc_ep: The endpoint to process a request for.
+ * @udc_req: The request being started.
+ * @continuing: True if we are doing more for the current request.
+ *
+ * Start the given request running by setting the TRB appropriately,
+ * and issuing Start Transfer endpoint command.
+ */
+static void exynos_ss_udc_start_req(struct exynos_ss_udc *udc,
+				    struct exynos_ss_udc_ep *udc_ep,
+				    struct exynos_ss_udc_req *udc_req,
+				    bool continuing)
+{
+	struct exynos_ss_udc_ep_command epcmd;
+	struct usb_request *ureq = &udc_req->req;
+	enum trb_control trb_type = NORMAL;
+	int epnum = udc_ep->epnum;
+	int xfer_length;
+	int res;
+
+	dev_dbg(udc->dev, "%s: ep%d%s, req %p\n", __func__, epnum,
+			   udc_ep->dir_in ? "in" : "out", ureq);
+
+	/* If endpoint is stalled, we will restart request later */
+	if (udc_ep->halted) {
+		dev_dbg(udc->dev, "%s: ep%d is stalled\n", __func__, epnum);
+		return;
+	}
+
+	udc_ep->req = udc_req;
+
+	/* Get type of TRB */
+	if (epnum == 0 && !continuing)
+		switch (udc->ep0_state) {
+		case EP0_SETUP_PHASE:
+			trb_type = CONTROL_SETUP;
+			break;
+
+		case EP0_DATA_PHASE:
+			trb_type = CONTROL_DATA;
+			break;
+
+		case EP0_STATUS_PHASE_2:
+			trb_type = CONTROL_STATUS_2;
+			break;
+
+		case EP0_STATUS_PHASE_3:
+			trb_type = CONTROL_STATUS_3;
+			break;
+		default:
+			dev_warn(udc->dev, "%s: Erroneous EP0 state (%d)",
+					   __func__, udc->ep0_state);
+			return;
+			break;
+		}
+	else
+		trb_type = NORMAL;
+
+	/* Get transfer length */
+	if (udc_ep->dir_in)
+		xfer_length = ureq->length;
+	else
+		xfer_length = (ureq->length + udc_ep->ep.maxpacket - 1) &
+			~(udc_ep->ep.maxpacket - 1);
+
+	/* Fill TRB */
+	udc_ep->trb->buff_ptr_low = (u32) ureq->dma;
+	udc_ep->trb->buff_ptr_high = 0;
+	udc_ep->trb->param1 = EXYNOS_USB3_TRB_BUFSIZ(xfer_length);
+	udc_ep->trb->param2 = EXYNOS_USB3_TRB_IOC |
+			      EXYNOS_USB3_TRB_LST |
+			      EXYNOS_USB3_TRB_HWO |
+			      EXYNOS_USB3_TRB_TRBCTL(trb_type);
+
+	/* Start Transfer */
+	epcmd.ep = get_phys_epnum(udc_ep);
+	epcmd.param0 = 0;
+	epcmd.param1 = udc_ep->trb_dma;
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSTRTXFER;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to start transfer\n");
+
+	udc_ep->tri = (readl(udc->regs + EXYNOS_USB3_DEPCMD(epcmd.ep)) >>
+				EXYNOS_USB3_DEPCMDx_EventParam_SHIFT) &
+				EXYNOS_USB3_DEPCMDx_XferRscIdx_LIMIT;
+}
+
+/**
+ * exynos_ss_udc_enqueue_status - start a request for EP0 status stage
+ * @udc: The device state.
+ */
+static void exynos_ss_udc_enqueue_status(struct exynos_ss_udc *udc)
+{
+	struct usb_request *req = udc->ctrl_req;
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+	int ret;
+
+	dev_dbg(udc->dev, "%s: queueing status request\n", __func__);
+
+	req->zero = 0;
+	req->length = 0;
+	req->buf = udc->ctrl_buff;
+	req->complete = NULL;
+
+	if (!list_empty(&udc_req->queue)) {
+		dev_info(udc->dev, "%s already queued???\n", __func__);
+		return;
+	}
+
+	ret = exynos_ss_udc_ep_queue(&udc->eps[0].ep, req, GFP_ATOMIC);
+	if (ret < 0)
+		dev_err(udc->dev, "%s: failed queue (%d)\n", __func__, ret);
+}
+
+/**
+ * exynos_ss_udc_enqueue_data - start a request for EP0 data stage
+ * @udc: The device state.
+ * @buff: The buffer used for data.
+ * @length: The length of data.
+ * @complete: The function called when request completes.
+ */
+static int exynos_ss_udc_enqueue_data(struct exynos_ss_udc *udc,
+				      void *buff, int length,
+				      void (*complete) (struct usb_ep *ep,
+						struct usb_request *req))
+{
+	struct usb_request *req = udc->ctrl_req;
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+	int ret;
+
+	dev_dbg(udc->dev, "%s: queueing data request\n", __func__);
+
+	req->zero = 0;
+	req->length = length;
+
+	if (buff == NULL)
+		req->buf = udc->ep0_buff;
+	else
+		req->buf = buff;
+
+	req->complete = complete;
+
+	if (!list_empty(&udc_req->queue)) {
+		dev_info(udc->dev, "%s: already queued???\n", __func__);
+		return -EAGAIN;
+	}
+
+	ret = exynos_ss_udc_ep_queue(&udc->eps[0].ep, req, GFP_ATOMIC);
+	if (ret < 0) {
+		dev_err(udc->dev, "%s: failed to enqueue data request (%d)\n",
+				   __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_enqueue_setup - start a request for EP0 setup stage
+ * @udc: The device state.
+ *
+ * Enqueue a request on EP0 if necessary to receive any SETUP packets
+ * from the host.
+ */
+static void exynos_ss_udc_enqueue_setup(struct exynos_ss_udc *udc)
+{
+	struct usb_request *req = udc->ctrl_req;
+	struct exynos_ss_udc_req *udc_req = our_req(req);
+	int ret;
+
+	dev_dbg(udc->dev, "%s: queueing setup request\n", __func__);
+
+	req->zero = 0;
+	req->length = EXYNOS_USB3_CTRL_BUFF_SIZE;
+	req->buf = udc->ctrl_buff;
+	req->complete = exynos_ss_udc_complete_setup;
+
+	if (!list_empty(&udc_req->queue)) {
+		dev_dbg(udc->dev, "%s already queued???\n", __func__);
+		return;
+	}
+
+	udc->eps[0].dir_in = 0;
+
+	ret = exynos_ss_udc_ep_queue(&udc->eps[0].ep, req, GFP_ATOMIC);
+	if (ret < 0)
+		dev_err(udc->dev, "%s: failed queue (%d)\n", __func__, ret);
+}
+
+/**
+ * exynos_ss_udc_complete_set_sel - completion of SET_SEL request data stage
+ * @ep: The endpoint the request was on.
+ * @req: The request completed.
+ */
+static void exynos_ss_udc_complete_set_sel(struct usb_ep *ep,
+					   struct usb_request *req)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+	u8 *sel = req->buf;
+	u32 param;
+	u32 dgcmd;
+	int res;
+
+	/* Our device is U1/U2 enabled, so we will use U2PEL */
+	param = sel[5] << 8 | sel[4];
+	/* Documentation says "If the value is greater than 125us, then
+	 * software must program a value of zero into this register */
+	if (param > 125)
+		param = 0;
+
+	dev_dbg(udc->dev, "%s: dgcmd_param = 0x%08x\n", __func__, param);
+
+	dgcmd = EXYNOS_USB3_DGCMD_CmdAct |
+		EXYNOS_USB3_DGCMD_CmdTyp_SetPerParams;
+
+	writel(param, udc->regs + EXYNOS_USB3_DGCMDPAR);
+	writel(dgcmd, udc->regs + EXYNOS_USB3_DGCMD);
+	res = poll_bit_clear(udc->regs + EXYNOS_USB3_DGCMD,
+			     EXYNOS_USB3_DGCMD_CmdAct,
+			     1000);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to set periodic parameters\n");
+}
+
+/**
+ * exynos_ss_udc_process_set_sel - process request SET_SEL
+ * @udc: The device state.
+ */
+static int exynos_ss_udc_process_set_sel(struct exynos_ss_udc *udc)
+{
+	int ret;
+
+	dev_dbg(udc->dev, "%s\n", __func__);
+
+	ret = exynos_ss_udc_enqueue_data(udc, udc->ep0_buff,
+					 EXYNOS_USB3_EP0_BUFF_SIZE,
+					 exynos_ss_udc_complete_set_sel);
+	if (ret < 0) {
+		dev_err(udc->dev, "%s: failed to become ready for SEL data\n",
+				   __func__);
+		return ret;
+	}
+
+	return 1;
+}
+
+/**
+ * exynos_ss_udc_process_clr_feature - process request CLEAR_FEATURE
+ * @udc: The device state.
+ * @ctrl: The USB control request.
+ */
+static int exynos_ss_udc_process_clr_feature(struct exynos_ss_udc *udc,
+					     struct usb_ctrlrequest *ctrl)
+{
+	struct exynos_ss_udc_ep *udc_ep;
+	struct exynos_ss_udc_req *udc_req;
+	bool restart;
+
+	dev_dbg(udc->dev, "%s\n", __func__);
+
+	switch (ctrl->bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		switch (le16_to_cpu(ctrl->wValue)) {
+		case USB_DEVICE_U1_ENABLE:
+			__bic32(udc->regs + EXYNOS_USB3_DCTL,
+				EXYNOS_USB3_DCTL_InitU1Ena);
+			break;
+
+		case USB_DEVICE_U2_ENABLE:
+			__bic32(udc->regs + EXYNOS_USB3_DCTL,
+				EXYNOS_USB3_DCTL_InitU2Ena);
+			break;
+
+		default:
+			return -ENOENT;
+		}
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		udc_ep = ep_from_windex(udc, le16_to_cpu(ctrl->wIndex));
+		if (!udc_ep) {
+			dev_dbg(udc->dev, "%s: no endpoint for 0x%04x\n",
+					  __func__, le16_to_cpu(ctrl->wIndex));
+			return -ENOENT;
+		}
+
+		switch (le16_to_cpu(ctrl->wValue)) {
+		case USB_ENDPOINT_HALT:
+			if (!udc_ep->wedged) {
+				exynos_ss_udc_ep_sethalt(&udc_ep->ep, 0);
+
+				/* If we have pending request, then start it */
+				restart = !list_empty(&udc_ep->queue);
+				if (restart) {
+					udc_req = get_ep_head(udc_ep);
+					exynos_ss_udc_start_req(udc, udc_ep,
+								udc_req, false);
+				}
+			}
+			break;
+
+		default:
+			return -ENOENT;
+		}
+
+		break;
+
+	default:
+		return -ENOENT;
+	}
+
+	return 1;
+}
+
+/**
+ * exynos_ss_udc_process_set_feature - process request SET_FEATURE
+ * @udc: The device state.
+ * @ctrl: The USB control request.
+ */
+static int exynos_ss_udc_process_set_feature(struct exynos_ss_udc *udc,
+					     struct usb_ctrlrequest *ctrl)
+{
+	struct exynos_ss_udc_ep *udc_ep;
+
+	dev_dbg(udc->dev, "%s\n", __func__);
+
+	switch (ctrl->bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		switch (le16_to_cpu(ctrl->wValue)) {
+		case USB_DEVICE_U1_ENABLE:
+			/* Temporarily disabled because of HW bug */
+#if 0
+			__orr32(udc->regs + EXYNOS_USB3_DCTL,
+				EXYNOS_USB3_DCTL_InitU1Ena);
+#endif
+			break;
+
+		case USB_DEVICE_U2_ENABLE:
+			/* Temporarily disabled because of HW bug */
+#if 0
+			__orr32(udc->regs + EXYNOS_USB3_DCTL,
+				EXYNOS_USB3_DCTL_InitU2Ena);
+#endif
+			break;
+
+		default:
+			return -ENOENT;
+		}
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		udc_ep = ep_from_windex(udc, le16_to_cpu(ctrl->wIndex));
+		if (!udc_ep) {
+			dev_dbg(udc->dev, "%s: no endpoint for 0x%04x\n",
+					  __func__, le16_to_cpu(ctrl->wIndex));
+			return -ENOENT;
+		}
+
+		switch (le16_to_cpu(ctrl->wValue)) {
+		case USB_ENDPOINT_HALT:
+			exynos_ss_udc_ep_sethalt(&udc_ep->ep, 1);
+			break;
+
+		default:
+			return -ENOENT;
+		}
+
+		break;
+
+	default:
+		return -ENOENT;
+	}
+
+	return 1;
+}
+
+/**
+ * exynos_ss_udc_process_get_status - process request GET_STATUS
+ * @udc: The device state.
+ * @ctrl: The USB control request.
+ */
+static int exynos_ss_udc_process_get_status(struct exynos_ss_udc *udc,
+					    struct usb_ctrlrequest *ctrl)
+{
+	struct exynos_ss_udc_ep *udc_ep0 = &udc->eps[0];
+	struct exynos_ss_udc_ep *udc_ep;
+	u8 *reply = udc->ep0_buff;
+	u32 reg;
+	int ret;
+
+	dev_dbg(udc->dev, "%s: USB_REQ_GET_STATUS\n", __func__);
+
+	if (!udc_ep0->dir_in) {
+		dev_warn(udc->dev, "%s: direction out?\n", __func__);
+		return -EINVAL;
+	}
+
+	if (le16_to_cpu(ctrl->wLength) != 2)
+		return -EINVAL;
+
+	switch (ctrl->bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		*reply = 1;
+		if (udc->gadget.speed == USB_SPEED_SUPER) {
+			reg = readl(udc->regs + EXYNOS_USB3_DCTL);
+
+			if (reg & EXYNOS_USB3_DCTL_InitU1Ena)
+				*reply |= 1 << 2;
+
+			if (reg & EXYNOS_USB3_DCTL_InitU2Ena)
+				*reply |= 1 << 3;
+		}
+		*(reply + 1) = 0;
+		break;
+
+	case USB_RECIP_INTERFACE:
+		/* currently, the data result should be zero */
+		*reply = 0;
+		*(reply + 1) = 0;
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		udc_ep = ep_from_windex(udc, le16_to_cpu(ctrl->wIndex));
+		if (!udc_ep)
+			return -ENOENT;
+
+		*reply = udc_ep->halted ? 1 : 0;
+		*(reply + 1) = 0;
+		break;
+
+	default:
+		return 0;
+	}
+
+	ret = exynos_ss_udc_enqueue_data(udc, reply, 2, NULL);
+	if (ret) {
+		dev_err(udc->dev, "%s: failed to send reply\n", __func__);
+		return ret;
+	}
+
+	return 1;
+}
+
+/**
+ * exynos_ss_udc_process_control - process a control request
+ * @udc: The device state.
+ * @ctrl: The control request received.
+ *
+ * The controller has received the SETUP phase of a control request, and
+ * needs to work out what to do next (and whether to pass it on to the
+ * gadget driver).
+ */
+static void exynos_ss_udc_process_control(struct exynos_ss_udc *udc,
+					  struct usb_ctrlrequest *ctrl)
+{
+	struct exynos_ss_udc_ep *ep0 = &udc->eps[0];
+	int ret = 0;
+
+	dev_dbg(udc->dev, "ctrl Req=%02x, Type=%02x, V=%04x, L=%04x\n",
+		ctrl->bRequest, ctrl->bRequestType,
+		ctrl->wValue, ctrl->wLength);
+
+	/* record the direction of the request, for later use when enquing
+	 * packets onto EP0. */
+
+	ep0->dir_in = (ctrl->bRequestType & USB_DIR_IN) ? 1 : 0;
+	dev_dbg(udc->dev, "ctrl: dir_in=%d\n", ep0->dir_in);
+
+	/* if we've no data with this request, then the last part of the
+	 * transaction is going to implicitly be IN. */
+	if (ctrl->wLength == 0) {
+		ep0->dir_in = 1;
+		udc->ep0_three_stage = 0;
+		udc->ep0_state = EP0_STATUS_PHASE_2;
+	} else
+		udc->ep0_three_stage = 1;
+
+	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
+		switch (ctrl->bRequest) {
+		case USB_REQ_SET_ADDRESS:
+			__bic32(udc->regs + EXYNOS_USB3_DCFG,
+				EXYNOS_USB3_DCFG_DevAddr_MASK);
+			__orr32(udc->regs + EXYNOS_USB3_DCFG,
+				EXYNOS_USB3_DCFG_DevAddr(ctrl->wValue));
+
+			dev_info(udc->dev, "new address %d\n", ctrl->wValue);
+
+			udc->ep0_state = EP0_WAIT_NRDY;
+			return;
+
+		case USB_REQ_GET_STATUS:
+			ret = exynos_ss_udc_process_get_status(udc, ctrl);
+			break;
+
+		case USB_REQ_CLEAR_FEATURE:
+			ret = exynos_ss_udc_process_clr_feature(udc, ctrl);
+			udc->ep0_state = EP0_WAIT_NRDY;
+			break;
+
+		case USB_REQ_SET_FEATURE:
+			ret = exynos_ss_udc_process_set_feature(udc, ctrl);
+			udc->ep0_state = EP0_WAIT_NRDY;
+			break;
+
+		case USB_REQ_SET_SEL:
+			ret = exynos_ss_udc_process_set_sel(udc);
+			break;
+		}
+	}
+
+	/* as a fallback, try delivering it to the driver to deal with */
+
+	if (ret == 0 && udc->driver) {
+		ret = udc->driver->setup(&udc->gadget, ctrl);
+		if (ret < 0)
+			dev_dbg(udc->dev, "driver->setup() ret %d\n", ret);
+	}
+
+	/* the request is either unhandlable, or is not formatted correctly
+	 * so respond with a STALL for the status stage to indicate failure.
+	 */
+
+	if (ret < 0) {
+		struct exynos_ss_udc_ep_command epcmd;
+		int res;
+
+		dev_dbg(udc->dev, "ep0 stall (dir=%d)\n", ep0->dir_in);
+		epcmd.ep = 0;
+		epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSSTALL;
+		epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+		res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+		if (res < 0)
+			dev_err(udc->dev, "Failed to set/clear stall\n");
+
+		udc->ep0_state = EP0_SETUP_PHASE;
+		exynos_ss_udc_enqueue_setup(udc);
+	}
+}
+
+/**
+ * exynos_ss_udc_complete_setup - completion of a setup transfer
+ * @ep: The endpoint the request was on.
+ * @req: The request completed.
+ *
+ * Called on completion of any requests the driver itself submitted for
+ * EP0 setup packets.
+ */
+static void exynos_ss_udc_complete_setup(struct usb_ep *ep,
+					 struct usb_request *req)
+{
+	struct exynos_ss_udc_ep *udc_ep = our_ep(ep);
+	struct exynos_ss_udc *udc = udc_ep->parent;
+
+	if (req->status < 0) {
+		dev_dbg(udc->dev, "%s: failed %d\n", __func__, req->status);
+		return;
+	}
+
+	exynos_ss_udc_process_control(udc, req->buf);
+}
+
+/**
+ * exynos_ss_udc_kill_all_requests - remove all requests from the endpoint's queue
+ * @udc: The device state.
+ * @ep: The endpoint the requests may be on.
+ * @result: The result code to use.
+ *
+ * Go through the requests on the given endpoint and mark them
+ * completed with the given result code.
+ */
+static void exynos_ss_udc_kill_all_requests(struct exynos_ss_udc *udc,
+					    struct exynos_ss_udc_ep *udc_ep,
+					    int result)
+{
+	struct exynos_ss_udc_req *udc_req, *treq;
+	unsigned long flags;
+
+	dev_dbg(udc->dev, "%s: ep%d\n", __func__, udc_ep->epnum);
+
+	spin_lock_irqsave(&udc_ep->lock, flags);
+
+	list_for_each_entry_safe(udc_req, treq, &udc_ep->queue, queue) {
+
+		exynos_ss_udc_complete_request(udc, udc_ep, udc_req, result);
+	}
+
+	spin_unlock_irqrestore(&udc_ep->lock, flags);
+}
+
+/**
+ * exynos_ss_udc_complete_request - complete a request given to us
+ * @udc: The device state.
+ * @udc_ep: The endpoint the request was on.
+ * @udc_req: The request being completed.
+ * @result: The result code (0 => Ok, otherwise errno)
+ *
+ * The given request has finished, so call the necessary completion
+ * if it has one and then look to see if we can start a new request
+ * on the endpoint.
+ *
+ * Note, expects the ep to already be locked as appropriate.
+ */
+static void exynos_ss_udc_complete_request(struct exynos_ss_udc *udc,
+					   struct exynos_ss_udc_ep *udc_ep,
+					   struct exynos_ss_udc_req *udc_req,
+					   int result)
+{
+	bool restart;
+
+	if (!udc_req) {
+		dev_dbg(udc->dev, "%s: nothing to complete\n", __func__);
+		return;
+	}
+
+	dev_dbg(udc->dev, "complete: ep %p %s, req %p, %d => %p\n",
+		udc_ep, udc_ep->ep.name, udc_req,
+		result, udc_req->req.complete);
+
+	/* only replace the status if we've not already set an error
+	 * from a previous transaction */
+
+	if (udc_req->req.status == -EINPROGRESS)
+		udc_req->req.status = result;
+
+	udc_ep->req = NULL;
+	udc_ep->tri = 0;
+	list_del_init(&udc_req->queue);
+
+	if (udc_req->req.buf != udc->ctrl_buff &&
+	    udc_req->req.buf != udc->ep0_buff)
+		exynos_ss_udc_unmap_dma(udc, udc_ep, udc_req);
+
+	if (udc_ep->epnum == 0) {
+		switch (udc->ep0_state) {
+		case EP0_SETUP_PHASE:
+			udc->ep0_state = EP0_DATA_PHASE;
+			break;
+		case EP0_DATA_PHASE:
+			udc->ep0_state = EP0_WAIT_NRDY;
+			break;
+		case EP0_STATUS_PHASE_2:
+		case EP0_STATUS_PHASE_3:
+			udc->ep0_state = EP0_SETUP_PHASE;
+			break;
+		default:
+			dev_err(udc->dev, "%s: Erroneous EP0 state (%d)",
+					  __func__, udc->ep0_state);
+			/* Will try to repair from it */
+			udc->ep0_state = EP0_SETUP_PHASE;
+			return;
+			break;
+		}
+	}
+
+	/* call the complete request with the locks off, just in case the
+	 * request tries to queue more work for this endpoint. */
+
+	if (udc_req->req.complete) {
+		spin_unlock(&udc_ep->lock);
+		udc_req->req.complete(&udc_ep->ep, &udc_req->req);
+		spin_lock(&udc_ep->lock);
+	}
+
+	/* Look to see if there is anything else to do. Note, the completion
+	 * of the previous request may have caused a new request to be started
+	 * so be careful when doing this. */
+
+	if (!udc_ep->req && result >= 0) {
+		restart = !list_empty(&udc_ep->queue);
+		if (restart) {
+			udc_req = get_ep_head(udc_ep);
+			exynos_ss_udc_start_req(udc, udc_ep, udc_req, false);
+		}
+	}
+}
+
+/**
+ * exynos_ss_udc_complete_request_lock - complete a request given to us (locked)
+ * @udc: The device state.
+ * @udc_ep: The endpoint the request was on.
+ * @udc_req: The request being completed.
+ * @result: The result code (0 => Ok, otherwise errno).
+ *
+ * See exynos_ss_udc_complete_request(), but called with the endpoint's
+ * lock held.
+ */
+static void exynos_ss_udc_complete_request_lock(struct exynos_ss_udc *udc,
+					struct exynos_ss_udc_ep *udc_ep,
+					struct exynos_ss_udc_req *udc_req,
+					int result)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&udc_ep->lock, flags);
+	exynos_ss_udc_complete_request(udc, udc_ep, udc_req, result);
+	spin_unlock_irqrestore(&udc_ep->lock, flags);
+}
+
+/**
+ * exynos_ss_udc_complete_in - complete IN transfer
+ * @udc: The device state.
+ * @udc_ep: The endpoint that has just completed.
+ *
+ * An IN transfer has been completed, update the transfer's state and then
+ * call the relevant completion routines.
+ */
+static void exynos_ss_udc_complete_in(struct exynos_ss_udc *udc,
+				      struct exynos_ss_udc_ep *udc_ep)
+{
+	struct exynos_ss_udc_req *udc_req = udc_ep->req;
+	struct usb_request *req = &udc_req->req;
+	int size_left;
+
+	dev_dbg(udc->dev, "%s: ep%d, req %p\n", __func__, udc_ep->epnum, req);
+
+	if (!udc_req) {
+		dev_dbg(udc->dev, "XferCompl but no req\n");
+		return;
+	}
+
+	if (udc_ep->trb->param2 & EXYNOS_USB3_TRB_HWO) {
+		dev_dbg(udc->dev, "%s: HWO bit set!\n", __func__);
+		return;
+	}
+
+	size_left = udc_ep->trb->param1 & EXYNOS_USB3_TRB_BUFSIZ_MASK;
+	udc_req->req.actual = udc_req->req.length - size_left;
+
+	if (size_left)
+		dev_dbg(udc->dev, "%s: BUFSIZ is not zero (%d)",
+				  __func__, size_left);
+
+	exynos_ss_udc_complete_request_lock(udc, udc_ep, udc_req, 0);
+}
+
+
+/**
+ * exynos_ss_udc_complete_out - complete OUT transfer
+ * @udc: The device state.
+ * @epnum: The endpoint that has just completed.
+ *
+ * An OUT transfer has been completed, update the transfer's state and then
+ * call the relevant completion routines.
+ */
+static void exynos_ss_udc_complete_out(struct exynos_ss_udc *udc,
+				       struct exynos_ss_udc_ep *udc_ep)
+{
+	struct exynos_ss_udc_req *udc_req = udc_ep->req;
+	struct usb_request *req = &udc_req->req;
+	int len, size_left;
+
+	dev_dbg(udc->dev, "%s: ep%d, req %p\n", __func__, udc_ep->epnum, req);
+
+	if (!udc_req) {
+		dev_dbg(udc->dev, "%s: no request active\n", __func__);
+		return;
+	}
+
+	if (udc_ep->trb->param2 & EXYNOS_USB3_TRB_HWO) {
+		dev_dbg(udc->dev, "%s: HWO bit set!\n", __func__);
+		return;
+	}
+
+	size_left = udc_ep->trb->param1 & EXYNOS_USB3_TRB_BUFSIZ_MASK;
+	len = (req->length + udc_ep->ep.maxpacket - 1) &
+		~(udc_ep->ep.maxpacket - 1);
+	udc_req->req.actual = len - size_left;
+
+	if (size_left)
+		dev_dbg(udc->dev, "%s: BUFSIZ is not zero (%d)",
+				  __func__, size_left);
+
+	exynos_ss_udc_complete_request_lock(udc, udc_ep, udc_req, 0);
+}
+
+/**
+ * exynos_ss_udc_irq_connectdone - process event Connection Done
+ * @udc: The device state.
+ *
+ * Get the speed of connection and configure physical endpoints 0 & 1.
+ */
+static void exynos_ss_udc_irq_connectdone(struct exynos_ss_udc *udc)
+{
+	struct exynos_ss_udc_ep_command epcmd;
+	u32 reg, speed;
+	int mps0, mps;
+	int i;
+	int res;
+
+	dev_dbg(udc->dev, "%s\n", __func__);
+
+	reg = readl(udc->regs + EXYNOS_USB3_DSTS);
+	speed = reg & EXYNOS_USB3_DSTS_ConnectSpd_MASK;
+
+	/* Suspend the inactive Phy */
+	if (speed == USB_SPEED_SUPER)
+		__orr32(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0),
+			EXYNOS_USB3_GUSB2PHYCFGx_SusPHY);
+	else
+		__orr32(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0),
+			EXYNOS_USB3_GUSB3PIPECTLx_SuspSSPhy);
+
+	switch (speed) {
+	/* High-speed */
+	case 0:
+		udc->gadget.speed = USB_SPEED_HIGH;
+		mps0 = EP0_HS_MPS;
+		mps = EP_HS_MPS;
+		break;
+	/* Full-speed */
+	case 1:
+	case 3:
+		udc->gadget.speed = USB_SPEED_FULL;
+		mps0 = EP0_FS_MPS;
+		mps = EP_FS_MPS;
+		break;
+	/* Low-speed */
+	case 2:
+		udc->gadget.speed = USB_SPEED_LOW;
+		mps0 = EP0_LS_MPS;
+		mps = EP_LS_MPS;
+		break;
+	/* SuperSpeed */
+	case 4:
+		udc->gadget.speed = USB_SPEED_SUPER;
+		mps0 = EP0_SS_MPS;
+		mps = EP_SS_MPS;
+		break;
+	}
+
+	udc->eps[0].ep.maxpacket = mps0;
+	for (i = 1; i < EXYNOS_USB3_EPS; i++)
+		udc->eps[i].ep.maxpacket = mps;
+
+	epcmd.ep = 0;
+	epcmd.param0 = EXYNOS_USB3_DEPCMDPAR0x_MPS(mps0);
+	epcmd.param1 = EXYNOS_USB3_DEPCMDPAR1x_XferNRdyEn |
+		       EXYNOS_USB3_DEPCMDPAR1x_XferCmplEn;
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCFG;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to configure physical EP0\n");
+
+	epcmd.ep = 1;
+	epcmd.param1 = EXYNOS_USB3_DEPCMDPAR1x_EpDir |
+		       EXYNOS_USB3_DEPCMDPAR1x_XferNRdyEn |
+		       EXYNOS_USB3_DEPCMDPAR1x_XferCmplEn;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to configure physical EP1\n");
+}
+
+/**
+ * exynos_ss_udc_irq_usbrst - process event USB Reset
+ * @udc: The device state.
+ */
+static void exynos_ss_udc_irq_usbrst(struct exynos_ss_udc *udc)
+{
+	struct exynos_ss_udc_ep_command epcmd;
+	struct exynos_ss_udc_ep *ep;
+	int res;
+	int epnum;
+
+	dev_dbg(udc->dev, "%s\n", __func__);
+
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPENDXFER;
+
+	/* End transfer, kill all requests and clear STALL on the
+	   non-EP0 endpoints */
+	for (epnum = 1; epnum < EXYNOS_USB3_EPS; epnum++) {
+
+		ep = &udc->eps[epnum];
+
+		epcmd.ep = get_phys_epnum(ep);
+
+		if (ep->tri) {
+			epcmd.cmdflags = (ep->tri <<
+				EXYNOS_USB3_DEPCMDx_CommandParam_SHIFT) |
+				EXYNOS_USB3_DEPCMDx_HiPri_ForceRM |
+				EXYNOS_USB3_DEPCMDx_CmdIOC |
+				EXYNOS_USB3_DEPCMDx_CmdAct;
+
+			res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+			if (res < 0) {
+				dev_err(udc->dev, "Failed to end transfer\n");
+				ep->not_ready = 1;
+			}
+
+			ep->tri = 0;
+		}
+
+		exynos_ss_udc_kill_all_requests(udc, ep, -ECONNRESET);
+
+		if (ep->halted)
+			exynos_ss_udc_ep_sethalt(&ep->ep, 0);
+	}
+
+	/* Set device address to 0 */
+	__bic32(udc->regs + EXYNOS_USB3_DCFG, EXYNOS_USB3_DCFG_DevAddr_MASK);
+}
+
+/**
+ * exynos_ss_udc_handle_depevt - handle endpoint-specific event
+ * @udc: The device state.
+ * @event: The event being handled.
+ */
+static void exynos_ss_udc_handle_depevt(struct exynos_ss_udc *udc, u32 event)
+{
+	int index = (event & EXYNOS_USB3_DEPEVT_EPNUM_MASK) >> 1;
+	int dir_in = index & 1;
+	int epnum = get_usb_epnum(index);
+	struct exynos_ss_udc_ep *udc_ep = &udc->eps[epnum];
+	struct exynos_ss_udc_ep_command *epcmd, *tepcmd;
+	struct exynos_ss_udc_req *udc_req;
+	bool restart;
+	int res;
+
+	switch (event & EXYNOS_USB3_DEPEVT_EVENT_MASK) {
+	case EXYNOS_USB3_DEPEVT_EVENT_XferNotReady:
+		dev_dbg(udc->dev, "Xfer Not Ready: ep%d%s\n",
+				  epnum, dir_in ? "in" : "out");
+		if (epnum == 0 && udc->ep0_state == EP0_WAIT_NRDY) {
+			udc_ep->dir_in = dir_in;
+
+			if (udc->ep0_three_stage)
+				udc->ep0_state = EP0_STATUS_PHASE_3;
+			else
+				udc->ep0_state = EP0_STATUS_PHASE_2;
+
+			exynos_ss_udc_enqueue_status(udc);
+		}
+		break;
+
+	case EXYNOS_USB3_DEPEVT_EVENT_XferComplete:
+		dev_dbg(udc->dev, "Xfer Complete: ep%d%s\n",
+				  epnum, dir_in ? "in" : "out");
+		if (dir_in) {
+			/* Handle "transfer complete" for IN EPs */
+			exynos_ss_udc_complete_in(udc, udc_ep);
+		} else {
+			/* Handle "transfer complete" for OUT EPs */
+			exynos_ss_udc_complete_out(udc, udc_ep);
+		}
+
+		if (epnum == 0 && udc->ep0_state == EP0_SETUP_PHASE)
+			exynos_ss_udc_enqueue_setup(udc);
+
+		break;
+
+	case EXYNOS_USB3_DEPEVT_EVENT_EPCmdCmplt:
+		dev_dbg(udc->dev, "EP Cmd complete: ep%d%s\n",
+				  epnum, dir_in ? "in" : "out");
+
+		udc_ep->not_ready = 0;
+
+		/* Issue all pending commands for endpoint */
+		list_for_each_entry_safe(epcmd, tepcmd,
+					 &udc_ep->cmd_queue, queue) {
+
+			dev_dbg(udc->dev, "Pending command %02xh for ep%d%s\n",
+					  epcmd->cmdtyp, epnum,
+					  dir_in ? "in" : "out");
+
+			res = exynos_ss_udc_issue_epcmd(udc, epcmd);
+			if (res < 0)
+				dev_err(udc->dev, "Failed to issue command\n");
+
+			list_del_init(&epcmd->queue);
+			kfree(epcmd);
+		}
+
+		/* If we have pending request, then start it */
+		restart = !list_empty(&udc_ep->queue);
+		if (restart) {
+			udc_req = get_ep_head(udc_ep);
+			exynos_ss_udc_start_req(udc, udc_ep,
+						udc_req, false);
+		}
+
+		break;
+	}
+}
+
+/**
+ * exynos_ss_udc_handle_devt - handle device-specific event
+ * @udc: The driver state.
+ * @event: The event being handled.
+ */
+static void exynos_ss_udc_handle_devt(struct exynos_ss_udc *udc, u32 event)
+{
+	switch (event & EXYNOS_USB3_DEVT_EVENT_MASK) {
+	case EXYNOS_USB3_DEVT_EVENT_ULStChng:
+		dev_dbg(udc->dev, "USB-Link State Change");
+		break;
+
+	case EXYNOS_USB3_DEVT_EVENT_ConnectDone:
+		dev_dbg(udc->dev, "Connection Done");
+		exynos_ss_udc_irq_connectdone(udc);
+		break;
+
+	case EXYNOS_USB3_DEVT_EVENT_USBRst:
+		dev_info(udc->dev, "USB Reset");
+		exynos_ss_udc_irq_usbrst(udc);
+		break;
+
+	case EXYNOS_USB3_DEVT_EVENT_DisconnEvt:
+		dev_info(udc->dev, "Disconnection Detected");
+		call_gadget(udc, disconnect);
+		break;
+
+	default:
+		break;
+	}
+}
+
+static void exynos_ss_udc_handle_otgevt(struct exynos_ss_udc *udc, u32 event)
+{}
+
+static void exynos_ss_udc_handle_gevt(struct exynos_ss_udc *udc, u32 event)
+{}
+
+/**
+ * exynos_ss_udc_irq - handle device interrupt
+ * @irq: The IRQ number triggered.
+ * @pw: The pw value when registered the handler.
+ */
+static irqreturn_t exynos_ss_udc_irq(int irq, void *pw)
+{
+	struct exynos_ss_udc *udc = pw;
+	int indx = udc->event_indx;
+	int gevntcount;
+	u32 event;
+	u32 ecode1, ecode2;
+
+	gevntcount = readl(udc->regs + EXYNOS_USB3_GEVNTCOUNT(0)) &
+			EXYNOS_USB3_GEVNTCOUNTx_EVNTCount_MASK;
+
+	dev_dbg(udc->dev, "INTERRUPT (%d)\n", gevntcount >> 2);
+
+	while (gevntcount) {
+		event = udc->event_buff[indx++];
+
+		dev_dbg(udc->dev, "event[%x] = 0x%08x\n",
+			(unsigned int) &udc->event_buff[indx - 1], event);
+
+		ecode1 = event & 0x01;
+
+		if (ecode1 == 0)
+			/* Device Endpoint-Specific Event */
+			exynos_ss_udc_handle_depevt(udc, event);
+		else {
+			ecode2 = (event & 0xfe) >> 1;
+
+			switch (ecode2) {
+			/* Device-Specific Event */
+			case 0x00:
+				exynos_ss_udc_handle_devt(udc, event);
+			break;
+
+			/* OTG Event */
+			case 0x01:
+				exynos_ss_udc_handle_otgevt(udc, event);
+			break;
+
+			/* Other Core Event */
+			case 0x03:
+			case 0x04:
+				exynos_ss_udc_handle_gevt(udc, event);
+			break;
+
+			/* Unknown Event Type */
+			default:
+				dev_info(udc->dev, "Unknown event type\n");
+			break;
+			}
+		}
+		/* We processed 1 event (4 bytes) */
+		writel(4, udc->regs + EXYNOS_USB3_GEVNTCOUNT(0));
+
+		if (indx > (EXYNOS_USB3_EVENT_BUFF_WSIZE - 1))
+			indx = 0;
+
+		gevntcount -= 4;
+	}
+
+	udc->event_indx = indx;
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * exynos_ss_udc_free_all_trb - free all allocated TRBs
+ * @udc: The device state.
+ */
+static void exynos_ss_udc_free_all_trb(struct exynos_ss_udc *udc)
+{
+	int epnum;
+
+	for (epnum = 0; epnum < EXYNOS_USB3_EPS; epnum++) {
+		struct exynos_ss_udc_ep *udc_ep = &udc->eps[epnum];
+
+		if (udc_ep->trb_dma)
+			dma_free_coherent(NULL,
+					  sizeof(struct exynos_ss_udc_trb),
+					  udc_ep->trb,
+					  udc_ep->trb_dma);
+	}
+}
+
+/**
+ * exynos_ss_udc_initep - initialize a single endpoint
+ * @udc: The device state.
+ * @udc_ep: The endpoint being initialised.
+ * @epnum: The endpoint number.
+ *
+ * Initialise the given endpoint (as part of the probe and device state
+ * creation) to give to the gadget driver. Setup the endpoint name, any
+ * direction information and other state that may be required.
+ */
+static int __devinit exynos_ss_udc_initep(struct exynos_ss_udc *udc,
+					  struct exynos_ss_udc_ep *udc_ep,
+					  int epnum)
+{
+	char *dir;
+
+	if (epnum == 0)
+		dir = "";
+	else if ((epnum % 2) == 0) {
+		dir = "out";
+	} else {
+		dir = "in";
+		udc_ep->dir_in = 1;
+	}
+
+	udc_ep->epnum = epnum;
+
+	snprintf(udc_ep->name, sizeof(udc_ep->name), "ep%d%s", epnum, dir);
+
+	INIT_LIST_HEAD(&udc_ep->queue);
+	INIT_LIST_HEAD(&udc_ep->cmd_queue);
+	INIT_LIST_HEAD(&udc_ep->ep.ep_list);
+
+	spin_lock_init(&udc_ep->lock);
+
+	/* add to the list of endpoints known by the gadget driver */
+	if (epnum)
+		list_add_tail(&udc_ep->ep.ep_list, &udc->gadget.ep_list);
+
+	udc_ep->parent = udc;
+	udc_ep->ep.name = udc_ep->name;
+	udc_ep->ep.maxpacket = epnum ? EP_SS_MPS : EP0_SS_MPS;
+	udc_ep->ep.ops = &exynos_ss_udc_ep_ops;
+	udc_ep->trb = dma_alloc_coherent(NULL,
+					 sizeof(struct exynos_ss_udc_trb),
+					 &udc_ep->trb_dma,
+					 GFP_KERNEL);
+	if (!udc_ep->trb)
+		return -ENOMEM;
+
+	memset(udc_ep->trb, 0, sizeof(struct exynos_ss_udc_trb));
+
+	if (epnum == 0) {
+		/* allocate EP0 control request */
+		udc->ctrl_req = exynos_ss_udc_ep_alloc_request(&udc->eps[0].ep,
+							       GFP_KERNEL);
+		if (!udc->ctrl_req)
+			return -ENOMEM;
+
+		udc->ep0_state = EP0_UNCONNECTED;
+	}
+
+	return 0;
+}
+
+/**
+ * exynos_ss_udc_phy_set - intitialize the controller PHY interface
+ * @pdev: The platform-level device instance.
+ */
+static void exynos_ss_udc_phy_set(struct platform_device *pdev)
+{
+	struct exynos_ss_udc_plat *plat = pdev->dev.platform_data;
+	struct exynos_ss_udc *udc = platform_get_drvdata(pdev);
+	/* The reset values:
+	 *	GUSB2PHYCFG(0)	= 0x00002400
+	 *	GUSB3PIPECTL(0)	= 0x00260002
+	 */
+
+	__orr32(udc->regs + EXYNOS_USB3_GCTL, EXYNOS_USB3_GCTL_CoreSoftReset);
+	__orr32(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0),
+		EXYNOS_USB3_GUSB2PHYCFGx_PHYSoftRst);
+	__orr32(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0),
+		EXYNOS_USB3_GUSB3PIPECTLx_PHYSoftRst);
+
+	/* PHY initialization */
+	if (plat && plat->phy_init)
+		plat->phy_init(pdev, S5P_USB_PHY_DRD);
+
+	__bic32(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0),
+		EXYNOS_USB3_GUSB2PHYCFGx_PHYSoftRst);
+	__bic32(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0),
+		EXYNOS_USB3_GUSB3PIPECTLx_PHYSoftRst);
+	__bic32(udc->regs + EXYNOS_USB3_GCTL, EXYNOS_USB3_GCTL_CoreSoftReset);
+
+
+	__bic32(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0),
+		EXYNOS_USB3_GUSB2PHYCFGx_SusPHY |
+		EXYNOS_USB3_GUSB2PHYCFGx_EnblSlpM |
+		EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim_MASK);
+	__orr32(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0),
+		EXYNOS_USB3_GUSB2PHYCFGx_USBTrdTim(9));
+
+	__bic32(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0),
+		EXYNOS_USB3_GUSB3PIPECTLx_SuspSSPhy);
+
+	dev_dbg(udc->dev, "GUSB2PHYCFG(0)=0x%08x, GUSB3PIPECTL(0)=0x%08x",
+			  readl(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0)),
+			  readl(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0)));
+}
+
+/**
+ * exynos_ss_udc_phy_unset - disable the controller PHY interface
+ * @pdev: The platform-level device instance.
+ */
+static void exynos_ss_udc_phy_unset(struct platform_device *pdev)
+{
+	struct exynos_ss_udc_plat *plat = pdev->dev.platform_data;
+	struct exynos_ss_udc *udc = platform_get_drvdata(pdev);
+
+	__orr32(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0),
+		EXYNOS_USB3_GUSB2PHYCFGx_SusPHY |
+		EXYNOS_USB3_GUSB2PHYCFGx_EnblSlpM);
+	__orr32(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0),
+		EXYNOS_USB3_GUSB3PIPECTLx_SuspSSPhy);
+
+	if (plat && plat->phy_exit)
+		plat->phy_exit(pdev, S5P_USB_PHY_DRD);
+
+	dev_dbg(udc->dev, "GUSB2PHYCFG(0)=0x%08x, GUSB3PIPECTL(0)=0x%08x",
+			  readl(udc->regs + EXYNOS_USB3_GUSB2PHYCFG(0)),
+			  readl(udc->regs + EXYNOS_USB3_GUSB3PIPECTL(0)));
+}
+
+/**
+ * exynos_ss_udc_corereset - issue softreset to the core
+ * @udc: The device state.
+ *
+ * Issue a soft reset to the core, and await the core finishing it.
+ */
+static int exynos_ss_udc_corereset(struct exynos_ss_udc *udc)
+{
+	int res;
+
+	/* issue soft reset */
+	__orr32(udc->regs + EXYNOS_USB3_DCTL, EXYNOS_USB3_DCTL_CSftRst);
+
+	res = poll_bit_clear(udc->regs + EXYNOS_USB3_DCTL,
+			     EXYNOS_USB3_DCTL_CSftRst,
+			     1000);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to get CSftRst asserted\n");
+
+	return res;
+}
+
+/**
+ * exynos_ss_udc_ep0_activate - activate USB endpoint 0
+ * @udc: The device state.
+ *
+ * Configure physical endpoints 0 & 1.
+ */
+static void exynos_ss_udc_ep0_activate(struct exynos_ss_udc *udc)
+{
+	struct exynos_ss_udc_ep_command epcmd;
+	int res;
+
+	/* Start New Configuration */
+	epcmd.ep = 0;
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSTARTCFG;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to start new configuration\n");
+
+	/* Configure Physical Endpoint 0 */
+	epcmd.ep = 0;
+	epcmd.param0 = EXYNOS_USB3_DEPCMDPAR0x_MPS(EP0_SS_MPS);
+	epcmd.param1 = EXYNOS_USB3_DEPCMDPAR1x_XferNRdyEn |
+		       EXYNOS_USB3_DEPCMDPAR1x_XferCmplEn;
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCFG;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to configure physical EP0\n");
+
+	/* Configure Physical Endpoint 1 */
+	epcmd.ep = 1;
+	epcmd.param0 = EXYNOS_USB3_DEPCMDPAR0x_MPS(EP0_SS_MPS);
+	epcmd.param1 = EXYNOS_USB3_DEPCMDPAR1x_EpDir |
+		       EXYNOS_USB3_DEPCMDPAR1x_XferNRdyEn |
+		       EXYNOS_USB3_DEPCMDPAR1x_XferCmplEn;
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCFG;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev, "Failed to configure physical EP1\n");
+
+	/* Configure Pysical Endpoint 0 Transfer Resource */
+	epcmd.ep = 0;
+	epcmd.param0 = EXYNOS_USB3_DEPCMDPAR0x_NumXferRes(1);
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPXFERCFG;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev,
+			"Failed to configure physical EP0 transfer resource\n");
+
+	/* Configure Pysical Endpoint 1 Transfer Resource */
+	epcmd.ep = 1;
+	epcmd.param0 = EXYNOS_USB3_DEPCMDPAR0x_NumXferRes(1);
+	epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPXFERCFG;
+	epcmd.cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+	if (res < 0)
+		dev_err(udc->dev,
+			"Failed to configure physical EP1 transfer resource\n");
+
+	/* Enable Physical Endpoints 0 and 1 */
+	writel(3, udc->regs + EXYNOS_USB3_DALEPENA);
+}
+
+/**
+ * exynos_ss_udc_ep_activate - activate USB endpoint
+ * @udc: The device state.
+ * @udc_ep: The endpoint being activated.
+ *
+ * Configure physical endpoints > 1.
+ */
+static void exynos_ss_udc_ep_activate(struct exynos_ss_udc *udc,
+				      struct exynos_ss_udc_ep *udc_ep)
+{
+	struct exynos_ss_udc_ep_command ep_command;
+	struct exynos_ss_udc_ep_command *epcmd = &ep_command;
+	int epnum = udc_ep->epnum;
+	int maxburst = udc_ep->ep.maxburst;
+	int res;
+
+	if (!udc->eps_enabled) {
+		udc->eps_enabled = true;
+
+		/* Start New Configuration */
+		epcmd->ep = 0;
+		epcmd->cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSTARTCFG;
+		epcmd->cmdflags =
+			(2 << EXYNOS_USB3_DEPCMDx_CommandParam_SHIFT) |
+			EXYNOS_USB3_DEPCMDx_CmdAct;
+
+		res = exynos_ss_udc_issue_epcmd(udc, epcmd);
+		if (res < 0)
+			dev_err(udc->dev, "Failed to start new configuration\n");
+	}
+
+	if (udc_ep->not_ready) {
+		epcmd = kzalloc(sizeof(struct exynos_ss_udc_ep_command),
+				GFP_ATOMIC);
+		if (!epcmd) {
+			/* Will try to issue command immediately */
+			epcmd = &ep_command;
+			udc_ep->not_ready = 0;
+		}
+	}
+
+	epcmd->ep = get_phys_epnum(udc_ep);
+	epcmd->param0 = EXYNOS_USB3_DEPCMDPAR0x_EPType(udc_ep->type) |
+			EXYNOS_USB3_DEPCMDPAR0x_MPS(udc_ep->ep.maxpacket) |
+			EXYNOS_USB3_DEPCMDPAR0x_BrstSiz(maxburst);
+	if (udc_ep->dir_in)
+		epcmd->param0 |= EXYNOS_USB3_DEPCMDPAR0x_FIFONum(epnum);
+	epcmd->param1 = EXYNOS_USB3_DEPCMDPAR1x_EpNum(epnum) |
+			(udc_ep->dir_in ? EXYNOS_USB3_DEPCMDPAR1x_EpDir : 0) |
+			EXYNOS_USB3_DEPCMDPAR1x_XferNRdyEn |
+			EXYNOS_USB3_DEPCMDPAR1x_XferCmplEn;
+	epcmd->cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCFG;
+	epcmd->cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	if (udc_ep->not_ready)
+		list_add_tail(&epcmd->queue, &udc_ep->cmd_queue);
+	else {
+		res = exynos_ss_udc_issue_epcmd(udc, epcmd);
+		if (res < 0)
+			dev_err(udc->dev, "Failed to configure physical EP\n");
+	}
+
+	/* Configure Pysical Endpoint Transfer Resource */
+	if (udc_ep->not_ready) {
+		epcmd = kzalloc(sizeof(struct exynos_ss_udc_ep_command),
+				GFP_ATOMIC);
+		if (!epcmd) {
+			epcmd = &ep_command;
+			udc_ep->not_ready = 0;
+		}
+	}
+
+	epcmd->ep = get_phys_epnum(udc_ep);
+	epcmd->param0 = EXYNOS_USB3_DEPCMDPAR0x_NumXferRes(1);
+	epcmd->cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPXFERCFG;
+	epcmd->cmdflags = EXYNOS_USB3_DEPCMDx_CmdAct;
+
+	if (udc_ep->not_ready)
+		list_add_tail(&epcmd->queue, &udc_ep->cmd_queue);
+	else {
+		res = exynos_ss_udc_issue_epcmd(udc, epcmd);
+		if (res < 0)
+			dev_err(udc->dev, "Failed to configure physical EP "
+					  "transfer resource\n");
+	}
+
+	/* Enable Physical Endpoint */
+	__orr32(udc->regs + EXYNOS_USB3_DALEPENA, 1 << epcmd->ep);
+}
+
+/**
+ * exynos_ss_udc_ep_deactivate - deactivate USB endpoint
+ * @udc: The device state.
+ * @udc_ep: The endpoint being deactivated.
+ *
+ * End any active transfer and disable endpoint.
+ */
+static void exynos_ss_udc_ep_deactivate(struct exynos_ss_udc *udc,
+					struct exynos_ss_udc_ep *udc_ep)
+{
+	struct exynos_ss_udc_ep_command epcmd;
+	int index = get_phys_epnum(udc_ep);
+
+	udc->eps_enabled = false;
+
+	if (udc_ep->tri && !udc_ep->not_ready) {
+		int res;
+
+		epcmd.ep = get_phys_epnum(udc_ep);
+		epcmd.cmdtyp = EXYNOS_USB3_DEPCMDx_CmdTyp_DEPENDXFER;
+		epcmd.cmdflags = (udc_ep->tri <<
+			EXYNOS_USB3_DEPCMDx_CommandParam_SHIFT) |
+			EXYNOS_USB3_DEPCMDx_HiPri_ForceRM |
+			EXYNOS_USB3_DEPCMDx_CmdIOC |
+			EXYNOS_USB3_DEPCMDx_CmdAct;
+
+		res = exynos_ss_udc_issue_epcmd(udc, &epcmd);
+		if (res < 0) {
+			dev_err(udc->dev, "Failed to end transfer\n");
+			udc_ep->not_ready = 1;
+		}
+
+		udc_ep->tri = 0;
+	}
+
+	__bic32(udc->regs + EXYNOS_USB3_DALEPENA, 1 << index);
+}
+
+/**
+ * exynos_ss_udc_init - initialize the controller
+ * @udc: The device state.
+ *
+ * Initialize the event buffer, enable events, activate USB EP0,
+ * and start the controller operation.
+ */
+static void exynos_ss_udc_init(struct exynos_ss_udc *udc)
+{
+	u32 reg;
+
+	reg = readl(udc->regs + EXYNOS_USB3_GSNPSID);
+	udc->release = reg & 0xffff;
+	dev_info(udc->dev, "Core ID Number: 0x%04x\n", reg >> 16);
+	dev_info(udc->dev, "Release Number: 0x%04x\n", udc->release);
+
+	__orr32(udc->regs + EXYNOS_USB3_GCTL, EXYNOS_USB3_GCTL_U2RSTECN);
+
+	writel(EXYNOS_USB3_GSBUSCFG0_INCR16BrstEna,
+	       udc->regs + EXYNOS_USB3_GSBUSCFG0);
+	writel(EXYNOS_USB3_GSBUSCFG1_BREQLIMIT(3),
+	       udc->regs + EXYNOS_USB3_GSBUSCFG1);
+
+	/* Event buffer */
+	udc->event_indx = 0;
+	writel(0, udc->regs + EXYNOS_USB3_GEVNTADR_63_32(0));
+	writel(udc->event_buff_dma,
+	       udc->regs + EXYNOS_USB3_GEVNTADR_31_0(0));
+	/* Set Event Buffer size */
+	writel(EXYNOS_USB3_EVENT_BUFF_BSIZE,
+	       udc->regs + EXYNOS_USB3_GEVNTSIZ(0));
+
+	writel(EXYNOS_USB3_DCFG_NumP(1) | EXYNOS_USB3_DCFG_PerFrInt(2) |
+	       EXYNOS_USB3_DCFG_DevSpd(4),
+	       udc->regs + EXYNOS_USB3_DCFG);
+
+	/* Flush any pending events */
+	__orr32(udc->regs + EXYNOS_USB3_GEVNTSIZ(0),
+		EXYNOS_USB3_GEVNTSIZx_EvntIntMask);
+
+	reg = readl(udc->regs + EXYNOS_USB3_GEVNTCOUNT(0));
+	writel(reg, udc->regs + EXYNOS_USB3_GEVNTCOUNT(0));
+
+	__bic32(udc->regs + EXYNOS_USB3_GEVNTSIZ(0),
+		EXYNOS_USB3_GEVNTSIZx_EvntIntMask);
+
+	/* Enable events */
+	writel(EXYNOS_USB3_DEVTEN_ULStCngEn | EXYNOS_USB3_DEVTEN_ConnectDoneEn |
+	       EXYNOS_USB3_DEVTEN_USBRstEn | EXYNOS_USB3_DEVTEN_DisconnEvtEn,
+	       udc->regs + EXYNOS_USB3_DEVTEN);
+
+	exynos_ss_udc_ep0_activate(udc);
+
+	/* Start the device controller operation */
+	exynos_ss_udc_run_stop(udc, 1);
+}
+
+static int exynos_ss_udc_start(struct usb_gadget *gadget,
+			       struct usb_gadget_driver *driver)
+{
+	struct exynos_ss_udc *udc = our_udc(gadget);
+
+	if (!udc) {
+		printk(KERN_ERR "%s: called with no device\n", __func__);
+		return -ENODEV;
+	}
+
+	if (!driver) {
+		dev_err(udc->dev, "%s: no driver\n", __func__);
+		return -EINVAL;
+	}
+
+	if (driver->max_speed < USB_SPEED_FULL) {
+		dev_err(udc->dev, "%s: bad speed\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!driver->setup) {
+		dev_err(udc->dev, "%s: missing entry points\n", __func__);
+		return -EINVAL;
+	}
+
+	WARN_ON(udc->driver);
+
+	driver->driver.bus = NULL;
+	udc->driver = driver;
+	udc->gadget.dev.driver = &driver->driver;
+
+	exynos_ss_udc_corereset(udc);
+
+	exynos_ss_udc_init(udc);
+
+	udc->ep0_state = EP0_SETUP_PHASE;
+	exynos_ss_udc_enqueue_setup(udc);
+
+	dev_info(udc->dev, "bound driver %s\n", driver->driver.name);
+	return 0;
+}
+
+static int exynos_ss_udc_stop(struct usb_gadget *gadget,
+			      struct usb_gadget_driver *driver)
+{
+	struct exynos_ss_udc *udc = our_udc(gadget);
+	int ep;
+
+	if (!udc)
+		return -ENODEV;
+
+	if (!driver || driver != udc->driver)
+		return -EINVAL;
+
+	/* all endpoints should be shutdown */
+	for (ep = 0; ep < EXYNOS_USB3_EPS; ep++)
+		exynos_ss_udc_ep_disable(&udc->eps[ep].ep);
+
+	call_gadget(udc, disconnect);
+
+	udc->driver = NULL;
+	udc->gadget.dev.driver = NULL;
+	udc->gadget.speed = USB_SPEED_UNKNOWN;
+
+	exynos_ss_udc_run_stop(udc, 0);
+	dev_info(udc->dev, "unregistered gadget driver '%s'\n",
+		 driver->driver.name);
+
+	return 0;
+}
+
+static int __devinit exynos_ss_udc_probe(struct platform_device *pdev)
+{
+	struct exynos_ss_udc_plat *plat = pdev->dev.platform_data;
+	struct device *dev = &pdev->dev;
+	struct exynos_ss_udc *udc;
+	struct resource *res;
+	int epnum;
+	int ret;
+
+	if (!plat) {
+		dev_err(dev, "cannot get platform data\n");
+		return -ENODEV;
+	}
+
+	udc = kzalloc(sizeof(struct exynos_ss_udc), GFP_KERNEL);
+	if (!udc) {
+		dev_err(dev, "cannot get memory\n");
+		ret = -ENOMEM;
+		goto err_mem;
+	}
+
+	udc->dev = dev;
+	udc->plat = plat;
+
+	udc->event_buff = dma_alloc_coherent(NULL,
+					     EXYNOS_USB3_EVENT_BUFF_BSIZE,
+					     &udc->event_buff_dma,
+					     GFP_KERNEL);
+	if (!udc->event_buff) {
+		dev_err(dev, "cannot get memory for event buffer\n");
+		ret = -ENOMEM;
+		goto err_mem;
+	}
+	memset(udc->event_buff, 0, EXYNOS_USB3_EVENT_BUFF_BSIZE);
+
+	udc->ctrl_buff = dma_alloc_coherent(NULL,
+					    EXYNOS_USB3_CTRL_BUFF_SIZE,
+					    &udc->ctrl_buff_dma,
+					    GFP_KERNEL);
+	if (!udc->ctrl_buff) {
+		dev_err(dev, "cannot get memory for control buffer\n");
+		ret = -ENOMEM;
+		goto err_mem;
+	}
+	memset(udc->ctrl_buff, 0, EXYNOS_USB3_CTRL_BUFF_SIZE);
+
+	udc->ep0_buff = dma_alloc_coherent(NULL,
+					   EXYNOS_USB3_EP0_BUFF_SIZE,
+					   &udc->ep0_buff_dma,
+					   GFP_KERNEL);
+	if (!udc->ep0_buff) {
+		dev_err(dev, "cannot get memory for EP0 buffer\n");
+		ret = -ENOMEM;
+		goto err_mem;
+	}
+	memset(udc->ep0_buff, 0, EXYNOS_USB3_EP0_BUFF_SIZE);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "cannot find register resource 0\n");
+		ret = -EINVAL;
+		goto err_mem;
+	}
+
+	if (!request_mem_region(res->start, resource_size(res),
+				dev_name(dev))) {
+		dev_err(dev, "cannot reserve registers\n");
+		ret = -ENOENT;
+		goto err_mem;
+	}
+
+	udc->regs = ioremap(res->start, resource_size(res));
+	if (!udc->regs) {
+		dev_err(dev, "cannot map registers\n");
+		ret = -ENXIO;
+		goto err_remap;
+	}
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(dev, "cannot find irq\n");
+		goto err_irq;
+	}
+
+	udc->irq = ret;
+
+	ret = request_irq(ret, exynos_ss_udc_irq, 0, dev_name(dev), udc);
+	if (ret < 0) {
+		dev_err(dev, "cannot claim IRQ\n");
+		goto err_irq;
+	}
+
+	dev_info(dev, "regs %p, irq %d\n", udc->regs, udc->irq);
+
+	udc->clk = clk_get(&pdev->dev, "usbdev30");
+	if (IS_ERR(udc->clk)) {
+		dev_err(dev, "cannot get UDC clock\n");
+		ret = -EINVAL;
+		goto err_clk;
+	}
+
+	dev_set_name(&udc->gadget.dev, "gadget");
+
+	udc->gadget.max_speed = USB_SPEED_SUPER;
+	udc->gadget.ops = &exynos_ss_udc_gadget_ops;
+	udc->gadget.name = dev_name(dev);
+	udc->gadget.dev.parent = dev;
+	udc->gadget.dev.dma_mask = dev->dma_mask;
+	udc->gadget.speed = USB_SPEED_UNKNOWN;
+
+	/* setup endpoint information */
+
+	INIT_LIST_HEAD(&udc->gadget.ep_list);
+	udc->gadget.ep0 = &udc->eps[0].ep;
+
+	/* initialise the endpoints */
+	for (epnum = 0; epnum < EXYNOS_USB3_EPS; epnum++) {
+		ret = exynos_ss_udc_initep(udc, &udc->eps[epnum], epnum);
+		if (ret < 0) {
+			dev_err(dev, "cannot get memory for TRB\n");
+			goto err_ep;
+		}
+	}
+
+	platform_set_drvdata(pdev, udc);
+
+	clk_enable(udc->clk);
+	exynos_ss_udc_phy_set(pdev);
+
+	ret = device_register(&udc->gadget.dev);
+	if (ret) {
+		dev_err(udc->dev, "failed to register gadget device\n");
+		goto err_add_device;
+	}
+
+	ret = usb_add_gadget_udc(&pdev->dev, &udc->gadget);
+	if (ret) {
+		dev_err(udc->dev, "failed to add gadget to udc list\n");
+		goto err_add_udc;
+	}
+
+	return 0;
+
+err_add_udc:
+	device_unregister(&udc->gadget.dev);
+err_add_device:
+	exynos_ss_udc_phy_unset(pdev);
+	clk_disable(udc->clk);
+	platform_set_drvdata(pdev, NULL);
+err_ep:
+	exynos_ss_udc_ep_free_request(&udc->eps[0].ep, udc->ctrl_req);
+	exynos_ss_udc_free_all_trb(udc);
+	clk_put(udc->clk);
+err_clk:
+	free_irq(udc->irq, udc);
+err_irq:
+	iounmap(udc->regs);
+err_remap:
+	release_mem_region(res->start, resource_size(res));
+err_mem:
+	if (udc->ep0_buff)
+		dma_free_coherent(NULL, EXYNOS_USB3_EP0_BUFF_SIZE,
+				  udc->ep0_buff, udc->ep0_buff_dma);
+	if (udc->ctrl_buff)
+		dma_free_coherent(NULL, EXYNOS_USB3_CTRL_BUFF_SIZE,
+				  udc->ctrl_buff, udc->ctrl_buff_dma);
+	if (udc->event_buff)
+		dma_free_coherent(NULL, EXYNOS_USB3_EVENT_BUFF_BSIZE,
+				  udc->event_buff, udc->event_buff_dma);
+	kfree(udc);
+
+	return ret;
+}
+
+static int __devexit exynos_ss_udc_remove(struct platform_device *pdev)
+{
+	struct exynos_ss_udc *udc = platform_get_drvdata(pdev);
+	struct resource *res;
+
+	usb_gadget_unregister_driver(udc->driver);
+
+	usb_del_gadget_udc(&udc->gadget);
+
+	exynos_ss_udc_phy_unset(pdev);
+
+	clk_disable(udc->clk);
+	clk_put(udc->clk);
+
+	free_irq(udc->irq, udc);
+
+	iounmap(udc->regs);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	release_mem_region(res->start, resource_size(res));
+
+	device_unregister(&udc->gadget.dev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	exynos_ss_udc_ep_free_request(&udc->eps[0].ep, udc->ctrl_req);
+	exynos_ss_udc_free_all_trb(udc);
+
+	dma_free_coherent(NULL, EXYNOS_USB3_EP0_BUFF_SIZE,
+			  udc->ep0_buff, udc->ep0_buff_dma);
+	dma_free_coherent(NULL, EXYNOS_USB3_CTRL_BUFF_SIZE,
+			  udc->ctrl_buff, udc->ctrl_buff_dma);
+	dma_free_coherent(NULL, EXYNOS_USB3_EVENT_BUFF_BSIZE,
+			  udc->event_buff, udc->event_buff_dma);
+	kfree(udc);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int exynos_ss_udc_suspend(struct platform_device *pdev,
+				 pm_message_t state)
+{
+	struct exynos_ss_udc *udc = platform_get_drvdata(pdev);
+	int ep;
+
+	if (udc->driver) {
+		call_gadget(udc, suspend);
+
+		/* all endpoints should be shutdown */
+		for (ep = 0; ep < EXYNOS_USB3_EPS; ep++)
+			exynos_ss_udc_ep_disable(&udc->eps[ep].ep);
+
+		call_gadget(udc, disconnect);
+		udc->gadget.speed = USB_SPEED_UNKNOWN;
+	}
+
+	exynos_ss_udc_run_stop(udc, 0);
+	exynos_ss_udc_phy_unset(pdev);
+
+	clk_disable(udc->clk);
+
+	return 0;
+}
+
+static int exynos_ss_udc_resume(struct platform_device *pdev)
+{
+	struct exynos_ss_udc *udc = platform_get_drvdata(pdev);
+
+	clk_enable(udc->clk);
+
+	exynos_ss_udc_phy_set(pdev);
+
+	if (udc->driver) {
+		/* we must now enable ep0 ready for host detection and then
+		 * set configuration. */
+
+		exynos_ss_udc_corereset(udc);
+
+		exynos_ss_udc_init(udc);
+
+		udc->ep0_state = EP0_SETUP_PHASE;
+		exynos_ss_udc_enqueue_setup(udc);
+
+		call_gadget(udc, resume);
+	}
+
+	return 0;
+}
+#else
+#define exynos_ss_udc_suspend NULL
+#define exynos_ss_udc_resume NULL
+#endif /* CONFIG_PM */
+
+static struct platform_driver exynos_ss_udc_driver = {
+	.driver		= {
+		.name	= "exynos-ss-udc",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= exynos_ss_udc_probe,
+	.remove		= __devexit_p(exynos_ss_udc_remove),
+	.suspend	= exynos_ss_udc_suspend,
+	.resume		= exynos_ss_udc_resume,
+};
+
+module_platform_driver(exynos_ss_udc_driver);
+
+MODULE_DESCRIPTION("EXYNOS SuperSpeed USB 3.0 Device Controller");
+MODULE_AUTHOR("Anton Tikhomirov <av.tikhomirov@samsung.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/gadget/exynos_ss_udc.h b/drivers/usb/gadget/exynos_ss_udc.h
new file mode 100644
index 0000000..a98a978
--- /dev/null
+++ b/drivers/usb/gadget/exynos_ss_udc.h
@@ -0,0 +1,342 @@
+/* linux/drivers/usb/gadget/exynos_ss_udc.h
+ *
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *	http://www.samsung.com/
+ *
+ * EXYNOS SuperSpeed USB 3.0 Device Controlle driver
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __EXYNOS_SS_UDC_H__
+#define __EXYNOS_SS_UDC_H__
+
+#define DMA_ADDR_INVALID (~((dma_addr_t)0))
+
+/* Maximum packet size for different speeds */
+#define EP0_LS_MPS	8
+#define EP_LS_MPS	8
+
+#define EP0_FS_MPS	64
+#define EP_FS_MPS	64
+
+#define EP0_HS_MPS	64
+#define EP_HS_MPS	512
+
+#define EP0_SS_MPS	512
+#define EP_SS_MPS	1024
+
+#define EXYNOS_USB3_EPS	9
+
+/* Has to be multiple of four */
+#define EXYNOS_USB3_EVENT_BUFF_WSIZE	256
+#define EXYNOS_USB3_EVENT_BUFF_BSIZE	(EXYNOS_USB3_EVENT_BUFF_WSIZE << 2)
+
+#define EXYNOS_USB3_CTRL_BUFF_SIZE	8
+#define EXYNOS_USB3_EP0_BUFF_SIZE	512
+
+#define EXYNOS_USB3_U1_DEV_EXIT_LAT	0
+#define EXYNOS_USB3_U2_DEV_EXIT_LAT	0x20
+
+
+/* Device register definitions */
+
+#define EXYNOS_USB3_DCFG		0xC700
+#define EXYNOS_USB3_DCFG_NumP(_x)			((_x) << 17)
+#define EXYNOS_USB3_DCFG_PerFrInt(_x)			((_x) << 10)
+#define EXYNOS_USB3_DCFG_DevAddr_MASK			(0x7f << 3)
+#define EXYNOS_USB3_DCFG_DevAddr(_x)			((_x) << 3)
+#define EXYNOS_USB3_DCFG_DevSpd(_x)			((_x) << 0)
+
+#define EXYNOS_USB3_DCTL		0xC704
+#define EXYNOS_USB3_DCTL_Run_Stop			(1 << 31)
+#define EXYNOS_USB3_DCTL_CSftRst			(1 << 30)
+#define EXYNOS_USB3_DCTL_InitU2Ena			(1 << 12)
+#define EXYNOS_USB3_DCTL_InitU1Ena			(1 << 10)
+
+#define EXYNOS_USB3_DEVTEN		0xC708
+#define EXYNOS_USB3_DEVTEN_ULStCngEn			(1 << 3)
+#define EXYNOS_USB3_DEVTEN_ConnectDoneEn		(1 << 2)
+#define EXYNOS_USB3_DEVTEN_USBRstEn			(1 << 1)
+#define EXYNOS_USB3_DEVTEN_DisconnEvtEn			(1 << 0)
+
+#define EXYNOS_USB3_DSTS		0xC70C
+#define EXYNOS_USB3_DSTS_DevCtrlHlt			(1 << 22)
+#define EXYNOS_USB3_DSTS_ConnectSpd_MASK		(0x7 << 0)
+
+#define EXYNOS_USB3_DGCMDPAR		0xC710
+
+#define EXYNOS_USB3_DGCMD		0xC714
+#define EXYNOS_USB3_DGCMD_CmdAct			(1 << 10)
+/* Device generic commands */
+#define EXYNOS_USB3_DGCMD_CmdTyp_SetPerParams		(0x2 << 0)
+
+#define EXYNOS_USB3_DALEPENA		0xC720
+
+#define EXYNOS_USB3_DEPCMDPAR2(_a)	(0xC800 + ((_a) * 0x10))
+
+#define EXYNOS_USB3_DEPCMDPAR1(_a)	(0xC804 + ((_a) * 0x10))
+/* DEPCFG command parameter 1 */
+#define EXYNOS_USB3_DEPCMDPAR1x_EpNum(_x)		((_x) << 26)
+#define EXYNOS_USB3_DEPCMDPAR1x_EpDir			(1 << 25)
+#define EXYNOS_USB3_DEPCMDPAR1x_XferNRdyEn		(1 << 10)
+#define EXYNOS_USB3_DEPCMDPAR1x_XferCmplEn		(1 << 8)
+
+#define EXYNOS_USB3_DEPCMDPAR0(_a)	(0xC808 + ((_a) * 0x10))
+/* DEPCFG command parameter 0 */
+#define EXYNOS_USB3_DEPCMDPAR0x_MPS(_x)			((_x) << 3)
+#define EXYNOS_USB3_DEPCMDPAR0x_BrstSiz(_x)		((_x) << 22)
+#define EXYNOS_USB3_DEPCMDPAR0x_FIFONum(_x)		((_x) << 17)
+#define EXYNOS_USB3_DEPCMDPAR0x_EPType(_x)		((_x) << 1)
+/* DEPXFERCFG command parameter 0 */
+#define EXYNOS_USB3_DEPCMDPAR0x_NumXferRes(_x)		((_x) << 0)
+
+#define EXYNOS_USB3_DEPCMD(_a)		(0xC80C + ((_a) * 0x10))
+#define EXYNOS_USB3_DEPCMDx_CommandParam_SHIFT		16
+#define EXYNOS_USB3_DEPCMDx_EventParam_SHIFT		16
+#define EXYNOS_USB3_DEPCMDx_XferRscIdx_LIMIT		(0x7f)
+#define EXYNOS_USB3_DEPCMDx_HiPri_ForceRM		(1 << 11)
+#define EXYNOS_USB3_DEPCMDx_CmdAct			(1 << 10)
+#define EXYNOS_USB3_DEPCMDx_CmdIOC			(1 << 8)
+/* Physical Endpoint commands */
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCFG		(0x1 << 0)
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPXFERCFG		(0x2 << 0)
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSSTALL		(0x4 << 0)
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPCSTALL		(0x5 << 0)
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSTRTXFER		(0x6 << 0)
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPENDXFER		(0x8 << 0)
+#define EXYNOS_USB3_DEPCMDx_CmdTyp_DEPSTARTCFG		(0x9 << 0)
+
+/* Transfer Request Block */
+#define EXYNOS_USB3_TRB_BUFSIZ_MASK			(0xffffff << 0)
+#define EXYNOS_USB3_TRB_BUFSIZ(_x)			((_x) << 0)
+#define EXYNOS_USB3_TRB_IOC				(1 << 11)
+#define EXYNOS_USB3_TRB_TRBCTL(_x)			((_x) << 4)
+#define EXYNOS_USB3_TRB_LST				(1 << 1)
+#define EXYNOS_USB3_TRB_HWO				(1 << 0)
+/************************/
+
+#define call_gadget(_udc, _entry)	do {			\
+	if ((_udc)->gadget.speed != USB_SPEED_UNKNOWN &&	\
+	    (_udc)->driver && (_udc)->driver->_entry)		\
+		(_udc)->driver->_entry(&(_udc)->gadget);	\
+} while (0)
+
+/**
+ * States of EP0
+ */
+enum ctrl_ep_state {
+	EP0_UNCONNECTED,
+	EP0_SETUP_PHASE,
+	EP0_DATA_PHASE,
+	EP0_WAIT_NRDY,
+	EP0_STATUS_PHASE_2,
+	EP0_STATUS_PHASE_3,
+	EP0_STALL,
+};
+
+/**
+ * Types of TRB
+ */
+enum trb_control {
+	NORMAL = 1,
+	CONTROL_SETUP,
+	CONTROL_STATUS_2,
+	CONTROL_STATUS_3,
+	CONTROL_DATA,
+	ISOCHRONOUS_FIRST,
+	ISOCHRONOUS,
+	LINK_TRB,
+};
+
+/**
+ * struct exynos_ss_udc_trb - transfer request block (TRB)
+ * @buff_ptr_low: Buffer pointer low.
+ * @buff_ptr_high: Buffer pointer high.
+ * @param1: TRB parameter 1.
+ * @param2: TRB parameter 2.
+ */
+struct exynos_ss_udc_trb {
+	u32 buff_ptr_low;
+	u32 buff_ptr_high;
+	u32 param1;
+	u32 param2;
+};
+
+/**
+ * struct exynos_ss_udc_ep_command - endpoint command.
+ * @queue: The list of commands for the endpoint.
+ * @ep: physical endpoint number.
+ * @param0: Command parameter 0.
+ * @param1: Command parameter 1.
+ * @param2: Command parameter 2.
+ * @cmdtype: Command to issue.
+ * @cmdflags: Command flags.
+ */
+struct exynos_ss_udc_ep_command {
+	struct list_head	queue;
+
+	int ep;
+	u32 param0;
+	u32 param1;
+	u32 param2;
+	u32 cmdtyp;
+	u32 cmdflags;
+};
+
+/**
+ * struct exynos_ss_udc_req - data transfer request
+ * @req: The USB gadget request.
+ * @queue: The list of requests for the endpoint this is queued for.
+ * @mapped: DMA buffer for this request has been mapped via dma_map_single().
+ */
+struct exynos_ss_udc_req {
+	struct usb_request	req;
+	struct list_head	queue;
+	unsigned char		mapped;
+};
+
+/**
+ * struct exynos_ss_udc_ep - driver endpoint definition.
+ * @ep: The gadget layer representation of the endpoint.
+ * @queue: Queue of requests for this endpoint.
+ * @cmd_queue: Queue of commands for this endpoint.
+ * @parent: Reference back to the parent device structure.
+ * @req: The current request that the endpoint is processing. This is
+ *       used to indicate an request has been loaded onto the endpoint
+ *       and has yet to be completed (maybe due to data move, or simply
+ *	 awaiting an ack from the core all the data has been completed).
+ * @lock: State lock to protect contents of endpoint.
+ * @trb: Transfer Request Block.
+ * @trb_dma: Transfer Request Block DMA address.
+ * @tri: Transfer resource index.
+ * @epnum: The USB endpoint number.
+ * @type: The endpoint type.
+ * @dir_in: Set to true if this endpoint is of the IN direction, which
+ *	    means that it is sending data to the Host.
+ * @halted: Set if the endpoint has been halted.
+ * @enabled: Set to true if endpoint is enabled.
+ * @wedged: Set if the endpoint has been wedged.
+ * @not_ready: Set to true if a command for the endpoint hasn't completed
+ *	       during timeout interval.
+ * @name: The driver generated name for the endpoint.
+ *
+ * This is the driver's state for each registered enpoint, allowing it
+ * to keep track of transactions that need doing. Each endpoint has a
+ * lock to protect the state, to try and avoid using an overall lock
+ * for the host controller as much as possible.
+ */
+struct exynos_ss_udc_ep {
+	struct usb_ep			ep;
+	struct list_head		queue;
+	struct list_head		cmd_queue;
+	struct exynos_ss_udc		*parent;
+	struct exynos_ss_udc_req	*req;
+
+	spinlock_t			lock;
+
+	struct exynos_ss_udc_trb	*trb;
+	dma_addr_t			trb_dma;
+	u8				tri;
+
+	unsigned char		epnum;
+	unsigned int		type;
+	unsigned int		dir_in:1;
+	unsigned int		halted:1;
+	unsigned int		enabled:1;
+	unsigned int		wedged:1;
+	unsigned int		not_ready:1;
+
+	char			name[10];
+};
+
+/**
+ * struct exynos_ss_udc - driver state.
+ * @dev: The parent device supplied to the probe function
+ * @driver: USB gadget driver
+ * @plat: The platform specific configuration data.
+ * @regs: The memory area mapped for accessing registers.
+ * @irq: The IRQ number we are using.
+ * @clk: The clock we are using.
+ * @release: The core release number.
+ * @event_buff: Event buffer.
+ * @event_buff_dma: Event buffer DMA address.
+ * @event_indx: Event buffer index.
+ * @eps_enabled: Set if new configuration for physical endpoints > 1 started.
+ * @ep0_state: State of EP0.
+ * @ep0_three_stage: Set if control transfer has three stages.
+ * @ep0_buff: Buffer for EP0 data.
+ * @ep0_buff_dma: EP0 data buffer DMA address.
+ * @ctrl_buff: Buffer for EP0 control requests.
+ * @ctrl_buff_dma: EP0 control request buffer DMA address.
+ * @ctrl_req: Request for EP0 control packets.
+ * @gadget: Represents USB slave device.
+ * @eps: The endpoints being supplied to the gadget framework
+ */
+struct exynos_ss_udc {
+	struct device			*dev;
+	struct usb_gadget_driver	*driver;
+	struct exynos_ss_udc_plat	*plat;
+
+	void __iomem		*regs;
+	int			irq;
+	struct clk		*clk;
+
+	u16			release;
+
+	u32			*event_buff;
+	dma_addr_t		event_buff_dma;
+	u32			event_indx;
+
+	bool			eps_enabled;
+	enum ctrl_ep_state	ep0_state;
+	int			ep0_three_stage;
+
+	u8			*ep0_buff;
+	dma_addr_t		ep0_buff_dma;
+	u8			*ctrl_buff;
+	dma_addr_t		ctrl_buff_dma;
+	struct usb_request	*ctrl_req;
+
+	struct usb_gadget	gadget;
+	struct exynos_ss_udc_ep	eps[EXYNOS_USB3_EPS];
+};
+
+/* conversion functions */
+static inline struct exynos_ss_udc *our_udc(struct usb_gadget *gadget)
+{
+	return container_of(gadget, struct exynos_ss_udc, gadget);
+}
+
+static inline struct exynos_ss_udc_req *our_req(struct usb_request *req)
+{
+	return container_of(req, struct exynos_ss_udc_req, req);
+}
+
+static inline struct exynos_ss_udc_ep *our_ep(struct usb_ep *ep)
+{
+	return container_of(ep, struct exynos_ss_udc_ep, ep);
+}
+
+static inline void __orr32(void __iomem *ptr, u32 val)
+{
+	writel(readl(ptr) | val, ptr);
+}
+
+static inline void __bic32(void __iomem *ptr, u32 val)
+{
+	writel(readl(ptr) & ~val, ptr);
+}
+
+static inline int get_phys_epnum(struct exynos_ss_udc_ep *udc_ep)
+{
+	return udc_ep->epnum * 2 + udc_ep->dir_in;
+}
+
+static inline int get_usb_epnum(int index)
+{
+	return index >> 1;
+}
+
+#endif /* __EXYNOS_SS_UDC_H__ */
-- 
1.7.1
