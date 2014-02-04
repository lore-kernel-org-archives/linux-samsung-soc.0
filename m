From: <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCHv1] usb: dwc2: Combine the dwc2 and s3c_hsotg into a single USB DRD driver.
Date: Tue, 4 Feb 2014 15:45:41 -0600
Message-ID: <1391550341-32509-2-git-send-email-dinguyen@altera.com>
References: <1391550341-32509-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391550341-32509-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Julien Delacou <julien.delacou-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kisho
List-Id: linux-samsung-soc@vger.kernel.org

From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

This means that the driver can be in host or peripheral mode when the appropriate
connector is used. When an A-cable is plugged in, the driver behaves in host
mode, and when a B-cable is used, the driver will be in peripheral mode.

This commit:
- Replaces in the defines used in s3c_hsotg.h with the defines used in the dwc2
  hw.h defines.
- Use the dw2_hsotg as the unified data structure for the host/gadget.
- Uses the dwc2 IRQ handler for host/gadget.
- A single spinlock.

Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>
Cc: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Julien Delacou <julien.delacou-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 drivers/usb/dwc2/Kconfig                 |   35 +-
 drivers/usb/dwc2/Makefile                |    2 +
 drivers/usb/dwc2/core.c                  |    1 +
 drivers/usb/dwc2/core.h                  |  173 ++-
 drivers/usb/dwc2/core_intr.c             |  134 ++-
 drivers/usb/dwc2/hcd.c                   |    7 +-
 drivers/usb/dwc2/hcd.h                   |    1 +
 drivers/usb/dwc2/hw.h                    |   23 +-
 drivers/usb/dwc2/platform.c              |   49 +-
 drivers/usb/{gadget => dwc2}/s3c-hsotg.c | 1835 ++++++++++++------------------
 drivers/usb/gadget/Kconfig               |    7 -
 drivers/usb/gadget/Makefile              |    1 -
 drivers/usb/gadget/s3c-hsotg.h           |  378 ------
 13 files changed, 1088 insertions(+), 1558 deletions(-)
 rename drivers/usb/{gadget => dwc2}/s3c-hsotg.c (57%)
 delete mode 100644 drivers/usb/gadget/s3c-hsotg.h

diff --git a/drivers/usb/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
index be947d6..27a3a69 100644
--- a/drivers/usb/dwc2/Kconfig
+++ b/drivers/usb/dwc2/Kconfig
@@ -12,14 +12,37 @@ config USB_DWC2
 	  (for controllers directly connected to the CPU) will be called
 	  dwc2_platform.ko.
 
-	  NOTE: This driver at present only implements the Host mode
-	  of the controller. The existing s3c-hsotg driver supports
-	  Peripheral mode, but only for the Samsung S3C platforms.
-	  There are plans to merge the s3c-hsotg driver with this
-	  driver in the near future to create a dual-role driver.
-
 if USB_DWC2
 
+choice
+	bool "DWC2 Mode Selection"
+	default USB_DWC2_DUAL_ROLE if (USB && USB_GADGET)
+	default USB_DWC2_HOST if (USB && !USB_GADGET)
+	default USB_DWC2_GADGET if (!USB && USB_GADGET)
+
+config USB_DWC2_HOST
+	bool "Host only mode"
+	depends on USB=y || USB=USB_DWC2
+	help
+	  Select this when you want to use DWC2 in host mode only,
+	  thereby the gadget feature will be regressed.
+
+config USB_DWC2_GADGET
+	bool "Gadget only mode"
+	depends on USB_GADGET=y || USB_GADGET=USB_DWC2
+	help
+	  Select this when you want to use DWC2 in gadget mode only,
+	  thereby the host feature will be regressed.
+
+config USB_DWC2_DUAL_ROLE
+	bool "Dual Role mode"
+	depends on ((USB=y || USB=USB_DWC2) && (USB_GADGET=y || USB_GADGET=USB_DWC2))
+	help
+	  This is the default mode of working of DWC2 controller where
+	  both host and gadget features are enabled.
+
+endchoice
+
 config USB_DWC2_DEBUG
 	bool "Enable Debugging Messages"
 	help
diff --git a/drivers/usb/dwc2/Makefile b/drivers/usb/dwc2/Makefile
index 11529d3..4d147ad 100644
--- a/drivers/usb/dwc2/Makefile
+++ b/drivers/usb/dwc2/Makefile
@@ -16,6 +16,8 @@ dwc2-y					+= core.o core_intr.o
 dwc2-y					+= hcd.o hcd_intr.o
 dwc2-y					+= hcd_queue.o hcd_ddma.o
 
+dwc2-y					+= s3c-hsotg.o
+
 ifneq ($(CONFIG_PCI),)
 	obj-$(CONFIG_USB_DWC2)		+= dwc2_pci.o
 endif
diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 1d12988..12e9465 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -467,6 +467,7 @@ int dwc2_core_init(struct dwc2_hsotg *hsotg, bool select_phy, int irq)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwc2_core_init);
 
 /**
  * dwc2_enable_host_interrupts() - Enables the Host mode interrupts
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 648519c..e0d3df5 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -37,6 +37,10 @@
 #ifndef __DWC2_CORE_H__
 #define __DWC2_CORE_H__
 
+#include <linux/phy/phy.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/gadget.h>
+#include <linux/usb/otg.h>
 #include <linux/usb/phy.h>
 #include "hw.h"
 
@@ -54,9 +58,144 @@ static inline void do_write(u32 value, void *addr)
 /* Maximum number of Endpoints/HostChannels */
 #define MAX_EPS_CHANNELS	16
 
+static const char * const s3c_hsotg_supply_names[] = {
+	"vusb_d",		/* digital USB supply, 1.2V */
+	"vusb_a",		/* analog USB supply, 1.1V */
+};
+
+struct s3c_hsotg;
+struct s3c_hsotg_req;
 struct dwc2_hsotg;
 struct dwc2_host_chan;
 
+/**
+ * struct s3c_hsotg_ep - driver endpoint definition.
+ * @ep: The gadget layer representation of the endpoint.
+ * @name: The driver generated name for the endpoint.
+ * @queue: Queue of requests for this endpoint.
+ * @parent: Reference back to the parent device structure.
+ * @req: The current request that the endpoint is processing. This is
+ *       used to indicate an request has been loaded onto the endpoint
+ *       and has yet to be completed (maybe due to data move, or simply
+ *	 awaiting an ack from the core all the data has been completed).
+ * @debugfs: File entry for debugfs file for this endpoint.
+ * @lock: State lock to protect contents of endpoint.
+ * @dir_in: Set to true if this endpoint is of the IN direction, which
+ *	    means that it is sending data to the Host.
+ * @index: The index for the endpoint registers.
+ * @mc: Multi Count - number of transactions per microframe
+ * @interval - Interval for periodic endpoints
+ * @name: The name array passed to the USB core.
+ * @halted: Set if the endpoint has been halted.
+ * @periodic: Set if this is a periodic ep, such as Interrupt
+ * @isochronous: Set if this is a isochronous ep
+ * @sent_zlp: Set if we've sent a zero-length packet.
+ * @total_data: The total number of data bytes done.
+ * @fifo_size: The size of the FIFO (for periodic IN endpoints)
+ * @fifo_load: The amount of data loaded into the FIFO (periodic IN)
+ * @last_load: The offset of data for the last start of request.
+ * @size_loaded: The last loaded size for DxEPTSIZE for periodic IN
+ *
+ * This is the driver's state for each registered enpoint, allowing it
+ * to keep track of transactions that need doing. Each endpoint has a
+ * lock to protect the state, to try and avoid using an overall lock
+ * for the host controller as much as possible.
+ *
+ * For periodic IN endpoints, we have fifo_size and fifo_load to try
+ * and keep track of the amount of data in the periodic FIFO for each
+ * of these as we don't have a status register that tells us how much
+ * is in each of them. (note, this may actually be useless information
+ * as in shared-fifo mode periodic in acts like a single-frame packet
+ * buffer than a fifo)
+ */
+struct s3c_hsotg_ep {
+	struct usb_ep		ep;
+	struct list_head	queue;
+	struct dwc2_hsotg	*parent;
+	struct s3c_hsotg_req	*req;
+	struct dentry		*debugfs;
+
+
+	unsigned long		total_data;
+	unsigned int		size_loaded;
+	unsigned int		last_load;
+	unsigned int		fifo_load;
+	unsigned short		fifo_size;
+
+	unsigned char		dir_in;
+	unsigned char		index;
+	unsigned char		mc;
+	unsigned char		interval;
+
+	unsigned int		halted:1;
+	unsigned int		periodic:1;
+	unsigned int		isochronous:1;
+	unsigned int		sent_zlp:1;
+
+	char			name[10];
+};
+
+/**
+ * struct s3c_hsotg - driver state.
+ * @dev: The parent device supplied to the probe function
+ * @driver: USB gadget driver
+ * @phy: The otg phy transceiver structure for phy control.
+ * @uphy: The otg phy transceiver structure for old USB phy control.
+ * @plat: The platform specific configuration data. This can be removed once
+ * all SoCs support usb transceiver.
+ * @supplies: Definition of USB power supplies
+ * @phyif: PHY interface width
+ * @dedicated_fifos: Set if the hardware has dedicated IN-EP fifos.
+ * @num_of_eps: Number of available EPs (excluding EP0)
+ * @debug_root: root directrory for debugfs.
+ * @debug_file: main status file for debugfs.
+ * @debug_fifo: FIFO status file for debugfs.
+ * @ep0_reply: Request used for ep0 reply.
+ * @ep0_buff: Buffer for EP0 reply data, if needed.
+ * @ctrl_buff: Buffer for EP0 control requests.
+ * @ctrl_req: Request for EP0 control packets.
+ * @setup: NAK management for EP0 SETUP
+ * @last_rst: Time of last reset
+ * @eps: The endpoints being supplied to the gadget framework
+ */
+struct s3c_hsotg {
+	struct phy		 *phy;
+	struct usb_phy		 *uphy;
+	struct s3c_hsotg_plat	 *plat;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(s3c_hsotg_supply_names)];
+
+	u32			phyif;
+	unsigned int		dedicated_fifos:1;
+	unsigned char           num_of_eps;
+
+	struct dentry		*debug_root;
+	struct dentry		*debug_file;
+	struct dentry		*debug_fifo;
+
+	struct usb_request	*ep0_reply;
+	struct usb_request	*ctrl_req;
+	u8			ep0_buff[8];
+	u8			ctrl_buff[8];
+
+	unsigned int		setup;
+	unsigned long           last_rst;
+};
+
+/**
+ * struct s3c_hsotg_req - data transfer request
+ * @req: The USB gadget request
+ * @queue: The list of requests for the endpoint this is queued for.
+ * @in_progress: Has already had size/packets written to core
+ * @mapped: DMA buffer for this request has been mapped via dma_map_single().
+ */
+struct s3c_hsotg_req {
+	struct usb_request	req;
+	struct list_head	queue;
+	unsigned char		in_progress;
+	unsigned char		mapped;
+};
+
 /* Device States */
 enum dwc2_lx_state {
 	DWC2_L0,	/* On state */
@@ -405,6 +544,8 @@ struct dwc2_hw_params {
 struct dwc2_hsotg {
 	struct device *dev;
 	void __iomem *regs;
+	struct clk              *clk;
+
 	/** Params detected from hardware */
 	struct dwc2_hw_params hw_params;
 	/** Params to actually use */
@@ -419,6 +560,11 @@ struct dwc2_hsotg {
 	struct timer_list wkp_timer;
 	enum dwc2_lx_state lx_state;
 
+	struct s3c_hsotg *s3c_hsotg;
+	struct usb_gadget       gadget;
+	struct usb_gadget_driver *driver;
+	struct s3c_hsotg_ep	*eps;
+
 	union dwc2_hcd_internal_flags {
 		u32 d32;
 		struct {
@@ -555,7 +701,7 @@ extern void dwc2_read_packet(struct dwc2_hsotg *hsotg, u8 *dest, u16 bytes);
 extern void dwc2_flush_tx_fifo(struct dwc2_hsotg *hsotg, const int num);
 extern void dwc2_flush_rx_fifo(struct dwc2_hsotg *hsotg);
 
-extern int dwc2_core_init(struct dwc2_hsotg *hsotg, bool select_phy, int irq);
+int dwc2_core_init(struct dwc2_hsotg *hsotg, bool select_phy, int irq);
 extern void dwc2_enable_global_interrupts(struct dwc2_hsotg *hcd);
 extern void dwc2_disable_global_interrupts(struct dwc2_hsotg *hcd);
 
@@ -765,4 +911,29 @@ extern void dwc2_dump_global_registers(struct dwc2_hsotg *hsotg);
  */
 extern u16 dwc2_get_otg_version(struct dwc2_hsotg *hsotg);
 
+/* Gadget defines */
+extern void s3c_hsotg_disconnect(struct dwc2_hsotg *dwc2);
+extern void s3c_hsotg_irq_enumdone(struct dwc2_hsotg *dwc2);
+extern void s3c_hsotg_epint(struct dwc2_hsotg *dwc2, unsigned int idx,
+					int dir_in);
+extern void kill_all_requests(struct dwc2_hsotg *dwc2,
+			struct s3c_hsotg_ep *ep, int result, bool force);
+extern void s3c_hsotg_core_init(struct dwc2_hsotg *dwc2);
+extern void s3c_hsotg_disable_gsint(struct dwc2_hsotg *dwc2, u32 ints);
+extern void s3c_hsotg_irq_fifoempty(struct dwc2_hsotg *dwc2, bool periodic);
+extern void s3c_hsotg_handle_rx(struct dwc2_hsotg *dwc2);
+extern void s3c_hsotg_dump(struct dwc2_hsotg *dwc2);
+void s3c_hsotg_remove(struct dwc2_hsotg *dwc2);
+
+
+#define call_gadget(_hs, _entry) \
+do { \
+	if ((_hs)->gadget.speed != USB_SPEED_UNKNOWN && \
+		(_hs)->driver && (_hs)->driver->_entry) { \
+			spin_unlock(&_hs->lock); \
+			(_hs)->driver->_entry(&(_hs)->gadget); \
+			spin_lock(&_hs->lock); \
+	} \
+} while (0)
+
 #endif /* __DWC2_CORE_H__ */
diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 7a26186..e037ad5 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -334,6 +334,7 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
 		}
 		/* Change to L0 state */
 		hsotg->lx_state = DWC2_L0;
+		call_gadget(hsotg, resume);
 	} else {
 		if (hsotg->lx_state != DWC2_L1) {
 			u32 pcgcctl = readl(hsotg->regs + PCGCTL);
@@ -383,6 +384,9 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
 
 	dev_dbg(hsotg->dev, "USB SUSPEND\n");
 
+	/* Clear interrupt */
+	writel(GINTSTS_USBSUSP, hsotg->regs + GINTSTS);
+
 	if (dwc2_is_device_mode(hsotg)) {
 		/*
 		 * Check the Device status register to determine if the Suspend
@@ -394,6 +398,8 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
 			"DSTS.Suspend Status=%d HWCFG4.Power Optimize=%d\n",
 			!!(dsts & DSTS_SUSPSTS),
 			hsotg->hw_params.power_optimized);
+
+		call_gadget(hsotg, suspend);
 	} else {
 		if (hsotg->op_state == OTG_STATE_A_PERIPHERAL) {
 			dev_dbg(hsotg->dev, "a_peripheral->a_host\n");
@@ -408,15 +414,11 @@ static void dwc2_handle_usb_suspend_intr(struct dwc2_hsotg *hsotg)
 
 	/* Change to L2 (suspend) state */
 	hsotg->lx_state = DWC2_L2;
-
-	/* Clear interrupt */
-	writel(GINTSTS_USBSUSP, hsotg->regs + GINTSTS);
 }
-
-#define GINTMSK_COMMON	(GINTSTS_WKUPINT | GINTSTS_SESSREQINT |		\
-			 GINTSTS_CONIDSTSCHNG | GINTSTS_OTGINT |	\
-			 GINTSTS_MODEMIS | GINTSTS_DISCONNINT |		\
-			 GINTSTS_USBSUSP | GINTSTS_PRTINT)
+/* IRQ flags which will trigger a retry around the IRQ loop */
+#define IRQ_RETRY_MASK (GINTSTS_NPTXFEMP | \
+			GINTSTS_PTXFEMP |  \
+			GINTSTS_RXFLVL)
 
 /*
  * This function returns the Core Interrupt register
@@ -426,19 +428,13 @@ static u32 dwc2_read_common_intr(struct dwc2_hsotg *hsotg)
 	u32 gintsts;
 	u32 gintmsk;
 	u32 gahbcfg;
-	u32 gintmsk_common = GINTMSK_COMMON;
 
 	gintsts = readl(hsotg->regs + GINTSTS);
 	gintmsk = readl(hsotg->regs + GINTMSK);
 	gahbcfg = readl(hsotg->regs + GAHBCFG);
 
-	/* If any common interrupts set */
-	if (gintsts & gintmsk_common)
-		dev_dbg(hsotg->dev, "gintsts=%08x  gintmsk=%08x\n",
-			gintsts, gintmsk);
-
 	if (gahbcfg & GAHBCFG_GLBL_INTR_EN)
-		return gintsts & gintmsk & gintmsk_common;
+		return gintsts & gintmsk;
 	else
 		return 0;
 }
@@ -460,7 +456,8 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev)
 {
 	struct dwc2_hsotg *hsotg = dev;
 	u32 gintsts;
-	irqreturn_t retval = IRQ_NONE;
+	int retry_count = 8;
+	irqreturn_t retval = IRQ_HANDLED;
 
 	if (!dwc2_is_controller_alive(hsotg)) {
 		dev_warn(hsotg->dev, "Controller is dead\n");
@@ -468,17 +465,91 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev)
 	}
 
 	spin_lock(&hsotg->lock);
-
+irq_retry:
 	gintsts = dwc2_read_common_intr(hsotg);
 	if (gintsts & ~GINTSTS_PRTINT)
 		retval = IRQ_HANDLED;
 
+	if (gintsts & GINTSTS_ENUMDONE) {
+		writel(GINTSTS_ENUMDONE, hsotg->regs + GINTSTS);
+		s3c_hsotg_irq_enumdone(hsotg);
+	}
+
 	if (gintsts & GINTSTS_MODEMIS)
 		dwc2_handle_mode_mismatch_intr(hsotg);
 	if (gintsts & GINTSTS_OTGINT)
 		dwc2_handle_otg_intr(hsotg);
 	if (gintsts & GINTSTS_CONIDSTSCHNG)
 		dwc2_handle_conn_id_status_change_intr(hsotg);
+
+	if (gintsts & (GINTSTS_OEPINT | GINTSTS_IEPINT)) {
+		u32 daint = readl(hsotg->regs + DAINT);
+		u32 daint_out = daint >> DAINT_OUTEP_SHIFT;
+		u32 daint_in = daint & ~(daint_out << DAINT_OUTEP_SHIFT);
+		int ep;
+
+		dev_dbg(hsotg->dev, "%s: daint=%08x\n", __func__, daint);
+		for (ep = 0; ep < 15 && daint_out; ep++, daint_out >>= 1) {
+			if (daint_out & 1)
+				s3c_hsotg_epint(hsotg, ep, 0);
+		}
+
+		for (ep = 0; ep < 15 && daint_in; ep++, daint_in >>= 1) {
+			if (daint_in & 1)
+				s3c_hsotg_epint(hsotg, ep, 1);
+		}
+	}
+
+	if (gintsts & GINTSTS_USBRST) {
+		u32 usb_status = readl(hsotg->regs + GOTGCTL);
+
+		dev_dbg(hsotg->dev, "%s: USBRST\n", __func__);
+		dev_dbg(hsotg->dev, "GNPTXSTS=%08x\n",
+			readl(hsotg->regs + GNPTXSTS));
+
+		writel(GINTSTS_USBRST, hsotg->regs + GINTSTS);
+
+		if (usb_status & GOTGCTL_BSESVLD) {
+			if (time_after(jiffies, hsotg->s3c_hsotg->last_rst +
+				msecs_to_jiffies(200))) {
+				kill_all_requests(hsotg, &hsotg->eps[0],
+					-ECONNRESET, true);
+				s3c_hsotg_core_init(hsotg);
+				hsotg->s3c_hsotg->last_rst = jiffies;
+			}
+		}
+	}
+
+	if (gintsts & GINTSTS_NPTXFEMP) {
+		dev_dbg(hsotg->dev, "NPTXFEMP\n");
+
+		/*
+		 * Disable the interrupt to stop it happening again
+		 * unless one of these endpoint routines decides that
+		 * it needs re-enabling
+		 */
+		s3c_hsotg_disable_gsint(hsotg, GINTSTS_NPTXFEMP);
+		s3c_hsotg_irq_fifoempty(hsotg, false);
+	}
+
+	if (gintsts & GINTSTS_PTXFEMP) {
+		dev_dbg(hsotg->dev, "PTXFEMP\n");
+
+		/* See note in GINTSTS_NPTxFEmp */
+		s3c_hsotg_disable_gsint(hsotg, GINTSTS_PTXFEMP);
+		s3c_hsotg_irq_fifoempty(hsotg, true);
+	}
+
+	if (gintsts & GINTSTS_RXFLVL) {
+		/*
+		 * note, since GINTSTS_RXFLVL doubles as FIFO-not-empty,
+		 * we need to retry s3c_hsotg_handle_rx if this is still
+		 * set.
+		 */
+		s3c_hsotg_handle_rx(hsotg);
+	}
+
+
 	if (gintsts & GINTSTS_DISCONNINT)
 		dwc2_handle_disconnect_intr(hsotg);
 	if (gintsts & GINTSTS_SESSREQINT)
@@ -488,6 +559,28 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev)
 	if (gintsts & GINTSTS_USBSUSP)
 		dwc2_handle_usb_suspend_intr(hsotg);
 
+	if (gintsts & GINTSTS_ERLYSUSP) {
+		dev_dbg(hsotg->dev, "GINTSTS_ERLYSUSP\n");
+		writel(GINTSTS_ERLYSUSP, hsotg->regs + GINTSTS);
+	}
+
+	/*
+	 * these next two seem to crop-up occasionally causing the core
+	 * to shutdown the USB transfer, so try clearing them and logging
+	 * the occurrence.
+	 */
+	if (gintsts & GINTSTS_GOUTNAKEFF) {
+		dev_dbg(hsotg->dev, "GOUTNAKEFF triggered\n");
+		writel(DCTL_CGOUTNAK, hsotg->regs + DCTL);
+		s3c_hsotg_dump(hsotg);
+	}
+
+	if (gintsts & GINTSTS_GINNAKEFF) {
+		dev_dbg(hsotg->dev, "GINNAKEFF triggered\n");
+		writel(DCTL_CGNPINNAK, hsotg->regs + DCTL);
+		s3c_hsotg_dump(hsotg);
+	}
+
 	if (gintsts & GINTSTS_PRTINT) {
 		/*
 		 * The port interrupt occurs while in device mode with HPRT0
@@ -503,6 +596,13 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev)
 		}
 	}
 
+	/*
+	 * if we've had fifo events, we should try and go around the
+	 * loop again to see if there's any point in returning yet.
+	 */
+	if (gintsts & IRQ_RETRY_MASK && --retry_count > 0)
+		goto irq_retry;
+
 	spin_unlock(&hsotg->lock);
 out:
 	return retval;
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index f59484d..2e949ef 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -1355,6 +1355,7 @@ static void dwc2_conn_id_status_change(struct work_struct *work)
 		hsotg->op_state = OTG_STATE_B_PERIPHERAL;
 		dwc2_core_init(hsotg, false, -1);
 		dwc2_enable_global_interrupts(hsotg);
+		s3c_hsotg_core_init(hsotg);
 	} else {
 		/* A-Device connector (Host Mode) */
 		dev_dbg(hsotg->dev, "connId A\n");
@@ -2798,11 +2799,6 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg, int irq,
 		goto error1;
 	hsotg->last_frame_num = HFNUM_MAX_FRNUM;
 #endif
-
-	hsotg->core_params = kzalloc(sizeof(*hsotg->core_params), GFP_KERNEL);
-	if (!hsotg->core_params)
-		goto error1;
-
 	dwc2_set_all_params(hsotg->core_params, -1);
 
 	/* Validate parameter values */
@@ -2834,7 +2830,6 @@ int dwc2_hcd_init(struct dwc2_hsotg *hsotg, int irq,
 
 	hcd->has_tt = 1;
 
-	spin_lock_init(&hsotg->lock);
 	((struct wrapper_priv_data *) &hcd->hcd_priv)->hsotg = hsotg;
 	hsotg->priv = hcd;
 
diff --git a/drivers/usb/dwc2/hcd.h b/drivers/usb/dwc2/hcd.h
index fdc6d48..c8884f8 100644
--- a/drivers/usb/dwc2/hcd.h
+++ b/drivers/usb/dwc2/hcd.h
@@ -449,6 +449,7 @@ static inline u8 dwc2_hcd_is_pipe_out(struct dwc2_hcd_pipe_info *pipe)
 	return !dwc2_hcd_is_pipe_in(pipe);
 }
 
+int dwc2_gadget_init(struct dwc2_hsotg *hsotg, int irq);
 extern int dwc2_hcd_init(struct dwc2_hsotg *hsotg, int irq,
 			 const struct dwc2_core_params *params);
 extern void dwc2_hcd_remove(struct dwc2_hsotg *hsotg);
diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index 9c92a3c..d3ae043 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -109,6 +109,7 @@
 #define GUSBCFG_FSINTF			(1 << 5)
 #define GUSBCFG_ULPI_UTMI_SEL		(1 << 4)
 #define GUSBCFG_PHYIF16			(1 << 3)
+#define GUSBCFG_PHYIF8			(0 << 3)
 #define GUSBCFG_TOUTCAL_MASK		(0x7 << 0)
 #define GUSBCFG_TOUTCAL_SHIFT		0
 #define GUSBCFG_TOUTCAL_LIMIT		0x7
@@ -169,14 +170,14 @@
 #define GRXSTS_FN_SHIFT			25
 #define GRXSTS_PKTSTS_MASK		(0xf << 17)
 #define GRXSTS_PKTSTS_SHIFT		17
-#define GRXSTS_PKTSTS_GLOBALOUTNAK	1
-#define GRXSTS_PKTSTS_OUTRX		2
+#define GRXSTS_PKTSTS_GLOBALOUTNAK	(0x1 << 17)
+#define GRXSTS_PKTSTS_OUTRX		(0x2 << 17)
 #define GRXSTS_PKTSTS_HCHIN		2
-#define GRXSTS_PKTSTS_OUTDONE		3
+#define GRXSTS_PKTSTS_OUTDONE		(0x3 << 17)
 #define GRXSTS_PKTSTS_HCHIN_XFER_COMP	3
-#define GRXSTS_PKTSTS_SETUPDONE		4
+#define GRXSTS_PKTSTS_SETUPDONE		(0x4 << 17)
 #define GRXSTS_PKTSTS_DATATOGGLEERR	5
-#define GRXSTS_PKTSTS_SETUPRX		6
+#define GRXSTS_PKTSTS_SETUPRX		(0x6 << 17)
 #define GRXSTS_PKTSTS_HCHHALTED		7
 #define GRXSTS_HCHNUM_MASK		(0xf << 0)
 #define GRXSTS_HCHNUM_SHIFT		0
@@ -403,6 +404,9 @@
 #define FIFOSIZE_DEPTH_SHIFT		16
 #define FIFOSIZE_STARTADDR_MASK		(0xffff << 0)
 #define FIFOSIZE_STARTADDR_SHIFT	0
+#define DPTXFSIZN_DPTXFSIZE_GET(_v)	(((_v) >> 16) & 0xffff)
+#define DPTXFSIZN_DPTXFSIZE(_x)		((_x) << 16)
+#define DPTXFSIZN_DPTXFADDR(_x)		((_x) << 0)
 
 /* Device mode registers */
 
@@ -520,10 +524,11 @@
 #define DXEPCTL_SNP			(1 << 20)
 #define DXEPCTL_EPTYPE_MASK		(0x3 << 18)
 #define DXEPCTL_EPTYPE_SHIFT		18
-#define DXEPCTL_EPTYPE_CONTROL		0
-#define DXEPCTL_EPTYPE_ISO		1
-#define DXEPCTL_EPTYPE_BULK		2
-#define DXEPCTL_EPTYPE_INTTERUPT	3
+#define DXEPCTL_EPTYPE_CONTROL		(0x0 << 18)
+#define DXEPCTL_EPTYPE_ISO		(0x1 << 18)
+#define DXEPCTL_EPTYPE_BULK		(0x2 << 18)
+#define DXEPCTL_EPTYPE_INTERRUPT	(0x3 << 18)
+
 #define DXEPCTL_NAKSTS			(1 << 17)
 #define DXEPCTL_DPID			(1 << 16)
 #define DXEPCTL_EOFRNUM			(1 << 16)
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index d01d0d3..79be78c 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -34,6 +34,7 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+#include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -41,11 +42,12 @@
 #include <linux/dma-mapping.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/usb/otg.h>
 
 #include "core.h"
 #include "hcd.h"
 
-static const char dwc2_driver_name[] = "dwc2";
+static const char dwc2_driver_name[] = "dwc2/s3c-hsotg";
 
 static const struct dwc2_core_params params_bcm2835 = {
 	.otg_cap			= 0,	/* HNP/SRP capable */
@@ -90,12 +92,21 @@ static int dwc2_driver_remove(struct platform_device *dev)
 {
 	struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
 
-	dwc2_hcd_remove(hsotg);
+	if (IS_ENABLED(CONFIG_USB_DWC2_GADGET))
+		s3c_hsotg_remove(hsotg);
+	else if (IS_ENABLED(CONFIG_USB_DWC2_HOST))
+		dwc2_hcd_remove(hsotg);
+	else { /* dual role */
+		s3c_hsotg_remove(hsotg);
+		dwc2_hcd_remove(hsotg);
+	}
+	clk_disable_unprepare(hsotg->clk);
 
 	return 0;
 }
 
 static const struct of_device_id dwc2_of_match_table[] = {
+	{ .compatible = "samsung,s3c6400-hsotg", },
 	{ .compatible = "brcm,bcm2835-usb", .data = &params_bcm2835 },
 	{ .compatible = "snps,dwc2", .data = NULL },
 	{},
@@ -137,6 +148,10 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (!hsotg)
 		return -ENOMEM;
 
+	hsotg->core_params = kzalloc(sizeof(*hsotg->core_params), GFP_KERNEL);
+	if (!hsotg->core_params)
+		return -ENOMEM;
+
 	hsotg->dev = &dev->dev;
 
 	/*
@@ -162,9 +177,33 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
 		(unsigned long)res->start, hsotg->regs);
 
-	retval = dwc2_hcd_init(hsotg, irq, params);
-	if (retval)
-		return retval;
+	hsotg->clk = devm_clk_get(hsotg->dev, "otg");
+	if (IS_ERR(hsotg->clk)) {
+		dev_err(hsotg->dev, "cannot get otg clock\n");
+		return PTR_ERR(hsotg->clk);
+	}
+	clk_prepare_enable(hsotg->clk);
+
+	if (IS_ENABLED(CONFIG_USB_DWC2_HOST)) {
+		retval = dwc2_hcd_init(hsotg, irq, params);
+		if (retval)
+			return retval;
+	} else if (IS_ENABLED(CONFIG_USB_DWC2_GADGET)) {
+		retval = dwc2_gadget_init(hsotg, irq);
+		if (retval)
+			return retval;
+		retval = dwc2_core_init(hsotg, true, irq);
+		if (retval)
+			return retval;
+	} else { /* dual role */
+		retval = dwc2_gadget_init(hsotg, irq);
+		if (retval)
+			return retval;
+		retval = dwc2_hcd_init(hsotg, irq, params);
+		if (retval)
+			return retval;
+	}
+	spin_lock_init(&hsotg->lock);
 
 	platform_set_drvdata(dev, hsotg);
 
diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/dwc2/s3c-hsotg.c
similarity index 57%
rename from drivers/usb/gadget/s3c-hsotg.c
rename to drivers/usb/dwc2/s3c-hsotg.c
index 1172eae..4317351 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/dwc2/s3c-hsotg.c
@@ -37,12 +37,8 @@
 #include <linux/usb/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
 
-#include "s3c-hsotg.h"
-
-static const char * const s3c_hsotg_supply_names[] = {
-	"vusb_d",		/* digital USB supply, 1.2V */
-	"vusb_a",		/* analog USB supply, 1.1V */
-};
+#include "hw.h"
+#include "core.h"
 
 /*
  * EP0_MPS_LIMIT
@@ -64,149 +60,6 @@ static const char * const s3c_hsotg_supply_names[] = {
  */
 #define EP0_MPS_LIMIT	64
 
-struct s3c_hsotg;
-struct s3c_hsotg_req;
-
-/**
- * struct s3c_hsotg_ep - driver endpoint definition.
- * @ep: The gadget layer representation of the endpoint.
- * @name: The driver generated name for the endpoint.
- * @queue: Queue of requests for this endpoint.
- * @parent: Reference back to the parent device structure.
- * @req: The current request that the endpoint is processing. This is
- *       used to indicate an request has been loaded onto the endpoint
- *       and has yet to be completed (maybe due to data move, or simply
- *	 awaiting an ack from the core all the data has been completed).
- * @debugfs: File entry for debugfs file for this endpoint.
- * @lock: State lock to protect contents of endpoint.
- * @dir_in: Set to true if this endpoint is of the IN direction, which
- *	    means that it is sending data to the Host.
- * @index: The index for the endpoint registers.
- * @mc: Multi Count - number of transactions per microframe
- * @interval - Interval for periodic endpoints
- * @name: The name array passed to the USB core.
- * @halted: Set if the endpoint has been halted.
- * @periodic: Set if this is a periodic ep, such as Interrupt
- * @isochronous: Set if this is a isochronous ep
- * @sent_zlp: Set if we've sent a zero-length packet.
- * @total_data: The total number of data bytes done.
- * @fifo_size: The size of the FIFO (for periodic IN endpoints)
- * @fifo_load: The amount of data loaded into the FIFO (periodic IN)
- * @last_load: The offset of data for the last start of request.
- * @size_loaded: The last loaded size for DxEPTSIZE for periodic IN
- *
- * This is the driver's state for each registered enpoint, allowing it
- * to keep track of transactions that need doing. Each endpoint has a
- * lock to protect the state, to try and avoid using an overall lock
- * for the host controller as much as possible.
- *
- * For periodic IN endpoints, we have fifo_size and fifo_load to try
- * and keep track of the amount of data in the periodic FIFO for each
- * of these as we don't have a status register that tells us how much
- * is in each of them. (note, this may actually be useless information
- * as in shared-fifo mode periodic in acts like a single-frame packet
- * buffer than a fifo)
- */
-struct s3c_hsotg_ep {
-	struct usb_ep		ep;
-	struct list_head	queue;
-	struct s3c_hsotg	*parent;
-	struct s3c_hsotg_req	*req;
-	struct dentry		*debugfs;
-
-
-	unsigned long		total_data;
-	unsigned int		size_loaded;
-	unsigned int		last_load;
-	unsigned int		fifo_load;
-	unsigned short		fifo_size;
-
-	unsigned char		dir_in;
-	unsigned char		index;
-	unsigned char		mc;
-	unsigned char		interval;
-
-	unsigned int		halted:1;
-	unsigned int		periodic:1;
-	unsigned int		isochronous:1;
-	unsigned int		sent_zlp:1;
-
-	char			name[10];
-};
-
-/**
- * struct s3c_hsotg - driver state.
- * @dev: The parent device supplied to the probe function
- * @driver: USB gadget driver
- * @phy: The otg phy transceiver structure for phy control.
- * @uphy: The otg phy transceiver structure for old USB phy control.
- * @plat: The platform specific configuration data. This can be removed once
- * all SoCs support usb transceiver.
- * @regs: The memory area mapped for accessing registers.
- * @irq: The IRQ number we are using
- * @supplies: Definition of USB power supplies
- * @phyif: PHY interface width
- * @dedicated_fifos: Set if the hardware has dedicated IN-EP fifos.
- * @num_of_eps: Number of available EPs (excluding EP0)
- * @debug_root: root directrory for debugfs.
- * @debug_file: main status file for debugfs.
- * @debug_fifo: FIFO status file for debugfs.
- * @ep0_reply: Request used for ep0 reply.
- * @ep0_buff: Buffer for EP0 reply data, if needed.
- * @ctrl_buff: Buffer for EP0 control requests.
- * @ctrl_req: Request for EP0 control packets.
- * @setup: NAK management for EP0 SETUP
- * @last_rst: Time of last reset
- * @eps: The endpoints being supplied to the gadget framework
- */
-struct s3c_hsotg {
-	struct device		 *dev;
-	struct usb_gadget_driver *driver;
-	struct phy		 *phy;
-	struct usb_phy		 *uphy;
-	struct s3c_hsotg_plat	 *plat;
-
-	spinlock_t              lock;
-
-	void __iomem		*regs;
-	int			irq;
-	struct clk		*clk;
-
-	struct regulator_bulk_data supplies[ARRAY_SIZE(s3c_hsotg_supply_names)];
-
-	u32			phyif;
-	unsigned int		dedicated_fifos:1;
-	unsigned char           num_of_eps;
-
-	struct dentry		*debug_root;
-	struct dentry		*debug_file;
-	struct dentry		*debug_fifo;
-
-	struct usb_request	*ep0_reply;
-	struct usb_request	*ctrl_req;
-	u8			ep0_buff[8];
-	u8			ctrl_buff[8];
-
-	struct usb_gadget	gadget;
-	unsigned int		setup;
-	unsigned long           last_rst;
-	struct s3c_hsotg_ep	*eps;
-};
-
-/**
- * struct s3c_hsotg_req - data transfer request
- * @req: The USB gadget request
- * @queue: The list of requests for the endpoint this is queued for.
- * @in_progress: Has already had size/packets written to core
- * @mapped: DMA buffer for this request has been mapped via dma_map_single().
- */
-struct s3c_hsotg_req {
-	struct usb_request	req;
-	struct list_head	queue;
-	unsigned char		in_progress;
-	unsigned char		mapped;
-};
-
 /* conversion functions */
 static inline struct s3c_hsotg_req *our_req(struct usb_request *req)
 {
@@ -218,9 +71,9 @@ static inline struct s3c_hsotg_ep *our_ep(struct usb_ep *ep)
 	return container_of(ep, struct s3c_hsotg_ep, ep);
 }
 
-static inline struct s3c_hsotg *to_hsotg(struct usb_gadget *gadget)
+static inline struct dwc2_hsotg *to_hsotg(struct usb_gadget *gadget)
 {
-	return container_of(gadget, struct s3c_hsotg, gadget);
+	return container_of(gadget, struct dwc2_hsotg, gadget);
 }
 
 static inline void __orr32(void __iomem *ptr, u32 val)
@@ -234,7 +87,6 @@ static inline void __bic32(void __iomem *ptr, u32 val)
 }
 
 /* forward decleration of functions */
-static void s3c_hsotg_dump(struct s3c_hsotg *hsotg);
 
 /**
  * using_dma - return the DMA status of the driver.
@@ -265,16 +117,16 @@ static inline bool using_dma(struct s3c_hsotg *hsotg)
  * @hsotg: The device state
  * @ints: A bitmask of the interrupts to enable
  */
-static void s3c_hsotg_en_gsint(struct s3c_hsotg *hsotg, u32 ints)
+static void s3c_hsotg_en_gsint(struct dwc2_hsotg *dwc2, u32 ints)
 {
-	u32 gsintmsk = readl(hsotg->regs + GINTMSK);
+	u32 gsintmsk = readl(dwc2->regs + GINTMSK);
 	u32 new_gsintmsk;
 
 	new_gsintmsk = gsintmsk | ints;
 
 	if (new_gsintmsk != gsintmsk) {
-		dev_dbg(hsotg->dev, "gsintmsk now 0x%08x\n", new_gsintmsk);
-		writel(new_gsintmsk, hsotg->regs + GINTMSK);
+		dev_dbg(dwc2->dev, "gsintmsk now 0x%08x\n", new_gsintmsk);
+		writel(new_gsintmsk, dwc2->regs + GINTMSK);
 	}
 }
 
@@ -283,15 +135,15 @@ static void s3c_hsotg_en_gsint(struct s3c_hsotg *hsotg, u32 ints)
  * @hsotg: The device state
  * @ints: A bitmask of the interrupts to enable
  */
-static void s3c_hsotg_disable_gsint(struct s3c_hsotg *hsotg, u32 ints)
+void s3c_hsotg_disable_gsint(struct dwc2_hsotg *dwc2, u32 ints)
 {
-	u32 gsintmsk = readl(hsotg->regs + GINTMSK);
+	u32 gsintmsk = readl(dwc2->regs + GINTMSK);
 	u32 new_gsintmsk;
 
 	new_gsintmsk = gsintmsk & ~ints;
 
 	if (new_gsintmsk != gsintmsk)
-		writel(new_gsintmsk, hsotg->regs + GINTMSK);
+		writel(new_gsintmsk, dwc2->regs + GINTMSK);
 }
 
 /**
@@ -304,7 +156,7 @@ static void s3c_hsotg_disable_gsint(struct s3c_hsotg *hsotg, u32 ints)
  * Set or clear the mask for an individual endpoint's interrupt
  * request.
  */
-static void s3c_hsotg_ctrl_epint(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_ctrl_epint(struct dwc2_hsotg *dwc2,
 				 unsigned int ep, unsigned int dir_in,
 				 unsigned int en)
 {
@@ -316,12 +168,12 @@ static void s3c_hsotg_ctrl_epint(struct s3c_hsotg *hsotg,
 		bit <<= 16;
 
 	local_irq_save(flags);
-	daint = readl(hsotg->regs + DAINTMSK);
+	daint = readl(dwc2->regs + DAINTMSK);
 	if (en)
 		daint |= bit;
 	else
 		daint &= ~bit;
-	writel(daint, hsotg->regs + DAINTMSK);
+	writel(daint, dwc2->regs + DAINTMSK);
 	local_irq_restore(flags);
 }
 
@@ -329,7 +181,7 @@ static void s3c_hsotg_ctrl_epint(struct s3c_hsotg *hsotg,
  * s3c_hsotg_init_fifo - initialise non-periodic FIFOs
  * @hsotg: The device instance.
  */
-static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_init_fifo(struct dwc2_hsotg *dwc2)
 {
 	unsigned int ep;
 	unsigned int addr;
@@ -339,10 +191,10 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 
 	/* set FIFO sizes to 2048/1024 */
 
-	writel(2048, hsotg->regs + GRXFSIZ);
-	writel(GNPTXFSIZ_NPTxFStAddr(2048) |
-	       GNPTXFSIZ_NPTxFDep(1024),
-	       hsotg->regs + GNPTXFSIZ);
+	writel(2048, dwc2->regs + GRXFSIZ);
+	writel(DPTXFSIZN_DPTXFADDR(2048) |
+	       DPTXFSIZN_DPTXFSIZE(1024),
+	       dwc2->regs + GNPTXFSIZ);
 
 	/*
 	 * arange all the rest of the TX FIFOs, as some versions of this
@@ -362,10 +214,10 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 
 	for (ep = 1; ep <= 15; ep++) {
 		val = addr;
-		val |= size << DPTXFSIZn_DPTxFSize_SHIFT;
+		val |= size << FIFOSIZE_DEPTH_SHIFT;
 		addr += size;
 
-		writel(val, hsotg->regs + DPTXFSIZn(ep));
+		writel(val, dwc2->regs + DPTXFSIZN(ep));
 	}
 
 	/*
@@ -373,19 +225,19 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	 * all fifos are flushed before continuing
 	 */
 
-	writel(GRSTCTL_TxFNum(0x10) | GRSTCTL_TxFFlsh |
-	       GRSTCTL_RxFFlsh, hsotg->regs + GRSTCTL);
+	writel(GRSTCTL_TXFNUM(0x10) | GRSTCTL_TXFFLSH |
+	       GRSTCTL_RXFFLSH, dwc2->regs + GRSTCTL);
 
 	/* wait until the fifos are both flushed */
 	timeout = 100;
 	while (1) {
-		val = readl(hsotg->regs + GRSTCTL);
+		val = readl(dwc2->regs + GRSTCTL);
 
-		if ((val & (GRSTCTL_TxFFlsh | GRSTCTL_RxFFlsh)) == 0)
+		if ((val & (GRSTCTL_TXFFLSH | GRSTCTL_RXFFLSH)) == 0)
 			break;
 
 		if (--timeout == 0) {
-			dev_err(hsotg->dev,
+			dev_err(dwc2->dev,
 				"%s: timeout flushing fifos (GRSTCTL=%08x)\n",
 				__func__, val);
 		}
@@ -393,7 +245,7 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 		udelay(1);
 	}
 
-	dev_dbg(hsotg->dev, "FIFOs reset, timeout at %d\n", timeout);
+	dev_dbg(dwc2->dev, "FIFOs reset, timeout at %d\n", timeout);
 }
 
 /**
@@ -437,7 +289,7 @@ static inline int is_ep_periodic(struct s3c_hsotg_ep *hs_ep)
  * This is the reverse of s3c_hsotg_map_dma(), called for the completion
  * of a request to ensure the buffer is ready for access by the caller.
  */
-static void s3c_hsotg_unmap_dma(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_unmap_dma(struct dwc2_hsotg *dwc2,
 				struct s3c_hsotg_ep *hs_ep,
 				struct s3c_hsotg_req *hs_req)
 {
@@ -447,7 +299,7 @@ static void s3c_hsotg_unmap_dma(struct s3c_hsotg *hsotg,
 	if (hs_req->req.length == 0)
 		return;
 
-	usb_gadget_unmap_request(&hsotg->gadget, req, hs_ep->dir_in);
+	usb_gadget_unmap_request(&dwc2->gadget, req, hs_ep->dir_in);
 }
 
 /**
@@ -466,12 +318,12 @@ static void s3c_hsotg_unmap_dma(struct s3c_hsotg *hsotg,
  *
  * This routine is only needed for PIO
  */
-static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
+static int s3c_hsotg_write_fifo(struct dwc2_hsotg *dwc2,
 				struct s3c_hsotg_ep *hs_ep,
 				struct s3c_hsotg_req *hs_req)
 {
 	bool periodic = is_ep_periodic(hs_ep);
-	u32 gnptxsts = readl(hsotg->regs + GNPTXSTS);
+	u32 gnptxsts = readl(dwc2->regs + GNPTXSTS);
 	int buf_pos = hs_req->req.actual;
 	int to_write = hs_ep->size_loaded;
 	void *data;
@@ -485,8 +337,8 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 	if (to_write == 0)
 		return 0;
 
-	if (periodic && !hsotg->dedicated_fifos) {
-		u32 epsize = readl(hsotg->regs + DIEPTSIZ(hs_ep->index));
+	if (periodic && !dwc2->s3c_hsotg->dedicated_fifos) {
+		u32 epsize = readl(dwc2->regs + DIEPTSIZ(hs_ep->index));
 		int size_left;
 		int size_done;
 
@@ -495,18 +347,18 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
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
+			s3c_hsotg_en_gsint(dwc2, GINTSTS_PTXFEMP);
 			return -ENOSPC;
 		}
 
-		dev_dbg(hsotg->dev, "%s: left=%d, load=%d, fifo=%d, size %d\n",
+		dev_dbg(dwc2->dev, "%s: left=%d, load=%d, fifo=%d, size %d\n",
 			__func__, size_left,
 			hs_ep->size_loaded, hs_ep->fifo_load, hs_ep->fifo_size);
 
@@ -515,39 +367,39 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 
 		/* how much data is left in the fifo */
 		can_write = hs_ep->fifo_load - size_done;
-		dev_dbg(hsotg->dev, "%s: => can_write1=%d\n",
+		dev_dbg(dwc2->dev, "%s: => can_write1=%d\n",
 			__func__, can_write);
 
 		can_write = hs_ep->fifo_size - can_write;
-		dev_dbg(hsotg->dev, "%s: => can_write2=%d\n",
+		dev_dbg(dwc2->dev, "%s: => can_write2=%d\n",
 			__func__, can_write);
 
 		if (can_write <= 0) {
-			s3c_hsotg_en_gsint(hsotg, GINTSTS_PTxFEmp);
+			s3c_hsotg_en_gsint(dwc2, GINTSTS_PTXFEMP);
 			return -ENOSPC;
 		}
-	} else if (hsotg->dedicated_fifos && hs_ep->index != 0) {
-		can_write = readl(hsotg->regs + DTXFSTS(hs_ep->index));
+	} else if (dwc2->s3c_hsotg->dedicated_fifos && hs_ep->index != 0) {
+		can_write = readl(dwc2->regs + DTXFSTS(hs_ep->index));
 
 		can_write &= 0xffff;
 		can_write *= 4;
 	} else {
-		if (GNPTXSTS_NPTxQSpcAvail_GET(gnptxsts) == 0) {
-			dev_dbg(hsotg->dev,
+		if (GNPTXSTS_NP_TXQ_SPC_AVAIL_GET(gnptxsts) == 0) {
+			dev_dbg(dwc2->dev,
 				"%s: no queue slots available (0x%08x)\n",
 				__func__, gnptxsts);
 
-			s3c_hsotg_en_gsint(hsotg, GINTSTS_NPTxFEmp);
+			s3c_hsotg_en_gsint(dwc2, GINTSTS_NPTXFEMP);
 			return -ENOSPC;
 		}
 
-		can_write = GNPTXSTS_NPTxFSpcAvail_GET(gnptxsts);
+		can_write = GNPTXSTS_NP_TXF_SPC_AVAIL_GET(gnptxsts);
 		can_write *= 4;	/* fifo size is in 32bit quantities. */
 	}
 
 	max_transfer = hs_ep->ep.maxpacket * hs_ep->mc;
 
-	dev_dbg(hsotg->dev, "%s: GNPTXSTS=%08x, can=%d, to=%d, max_transfer %d\n",
+	dev_dbg(dwc2->dev, "%s: GNPTXSTS=%08x, can=%d, to=%d, max_transfer %d\n",
 		 __func__, gnptxsts, can_write, to_write, max_transfer);
 
 	/*
@@ -567,10 +419,10 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		to_write = max_transfer;
 
 		/* it's needed only when we do not use dedicated fifos */
-		if (!hsotg->dedicated_fifos)
-			s3c_hsotg_en_gsint(hsotg,
-					   periodic ? GINTSTS_PTxFEmp :
-					   GINTSTS_NPTxFEmp);
+		if (!dwc2->s3c_hsotg->dedicated_fifos)
+			s3c_hsotg_en_gsint(dwc2,
+					   periodic ? GINTSTS_PTXFEMP :
+					   GINTSTS_NPTXFEMP);
 	}
 
 	/* see if we can write data */
@@ -596,13 +448,13 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		 */
 
 		/* it's needed only when we do not use dedicated fifos */
-		if (!hsotg->dedicated_fifos)
-			s3c_hsotg_en_gsint(hsotg,
-					   periodic ? GINTSTS_PTxFEmp :
-					   GINTSTS_NPTxFEmp);
+		if (!dwc2->s3c_hsotg->dedicated_fifos)
+			s3c_hsotg_en_gsint(dwc2,
+					   periodic ? GINTSTS_PTXFEMP :
+					   GINTSTS_NPTXFEMP);
 	}
 
-	dev_dbg(hsotg->dev, "write %d/%d, can_write %d, done %d\n",
+	dev_dbg(dwc2->dev, "write %d/%d, can_write %d, done %d\n",
 		 to_write, hs_req->req.length, can_write, buf_pos);
 
 	if (to_write <= 0)
@@ -617,7 +469,7 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 	to_write = DIV_ROUND_UP(to_write, 4);
 	data = hs_req->req.buf + buf_pos;
 
-	writesl(hsotg->regs + EPFIFO(hs_ep->index), data, to_write);
+	writesl(dwc2->regs + EPFIFO(hs_ep->index), data, to_write);
 
 	return (to_write >= can_write) ? -ENOSPC : 0;
 }
@@ -636,12 +488,12 @@ static unsigned get_ep_limit(struct s3c_hsotg_ep *hs_ep)
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
@@ -671,7 +523,7 @@ static unsigned get_ep_limit(struct s3c_hsotg_ep *hs_ep)
  * Start the given request running by setting the endpoint registers
  * appropriately, and writing any data to the FIFOs.
  */
-static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_start_req(struct dwc2_hsotg *dwc2,
 				struct s3c_hsotg_ep *hs_ep,
 				struct s3c_hsotg_req *hs_req,
 				bool continuing)
@@ -689,11 +541,11 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 
 	if (index != 0) {
 		if (hs_ep->req && !continuing) {
-			dev_err(hsotg->dev, "%s: active request\n", __func__);
+			dev_err(dwc2->dev, "%s: active request\n", __func__);
 			WARN_ON(1);
 			return;
 		} else if (hs_ep->req != hs_req && continuing) {
-			dev_err(hsotg->dev,
+			dev_err(dwc2->dev,
 				"%s: continue different req\n", __func__);
 			WARN_ON(1);
 			return;
@@ -703,23 +555,23 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	epctrl_reg = dir_in ? DIEPCTL(index) : DOEPCTL(index);
 	epsize_reg = dir_in ? DIEPTSIZ(index) : DOEPTSIZ(index);
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x, ep %d, dir %s\n",
-		__func__, readl(hsotg->regs + epctrl_reg), index,
+	dev_dbg(dwc2->dev, "%s: DXEPCTL=0x%08x, ep %d, dir %s\n",
+		__func__, readl(dwc2->regs + epctrl_reg), index,
 		hs_ep->dir_in ? "in" : "out");
 
 	/* If endpoint is stalled, we will restart request later */
-	ctrl = readl(hsotg->regs + epctrl_reg);
+	ctrl = readl(dwc2->regs + epctrl_reg);
 
-	if (ctrl & DxEPCTL_Stall) {
-		dev_warn(hsotg->dev, "%s: ep%d is stalled\n", __func__, index);
+	if (ctrl & DXEPCTL_STALL) {
+		dev_warn(dwc2->dev, "%s: ep%d is stalled\n", __func__, index);
 		return;
 	}
 
 	length = ureq->length - ureq->actual;
-	dev_dbg(hsotg->dev, "ureq->length:%d ureq->actual:%d\n",
+	dev_dbg(dwc2->dev, "ureq->length:%d ureq->actual:%d\n",
 		ureq->length, ureq->actual);
 	if (0)
-		dev_dbg(hsotg->dev,
+		dev_dbg(dwc2->dev,
 			"REQ buf %p len %d dma 0x%08x noi=%d zp=%d snok=%d\n",
 			ureq->buf, length, ureq->dma,
 			ureq->no_interrupt, ureq->zero, ureq->short_not_ok);
@@ -728,7 +580,7 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	if (length > maxreq) {
 		int round = maxreq % hs_ep->ep.maxpacket;
 
-		dev_dbg(hsotg->dev, "%s: length %d, max-req %d, r %d\n",
+		dev_dbg(dwc2->dev, "%s: length %d, max-req %d, r %d\n",
 			__func__, length, maxreq, round);
 
 		/* round down to multiple of packets */
@@ -744,15 +596,15 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 		packets = 1;	/* send one packet if length is zero. */
 
 	if (hs_ep->isochronous && length > (hs_ep->mc * hs_ep->ep.maxpacket)) {
-		dev_err(hsotg->dev, "req length > maxpacket*mc\n");
+		dev_err(dwc2->dev, "req length > maxpacket*mc\n");
 		return;
 	}
 
 	if (dir_in && index != 0)
 		if (hs_ep->isochronous)
-			epsize = DxEPTSIZ_MC(packets);
+			epsize = DXEPTSIZ_MC(packets);
 		else
-			epsize = DxEPTSIZ_MC(1);
+			epsize = DXEPTSIZ_MC(1);
 	else
 		epsize = 0;
 
@@ -766,19 +618,19 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 			packets++;
 	}
 
-	epsize |= DxEPTSIZ_PktCnt(packets);
-	epsize |= DxEPTSIZ_XferSize(length);
+	epsize |= DXEPTSIZ_PKTCNT(packets);
+	epsize |= DXEPTSIZ_XFERSIZE(length);
 
-	dev_dbg(hsotg->dev, "%s: %d@%d/%d, 0x%08x => 0x%08x\n",
+	dev_dbg(dwc2->dev, "%s: %d@%d/%d, 0x%08x => 0x%08x\n",
 		__func__, packets, length, ureq->length, epsize, epsize_reg);
 
 	/* store the request as the current one we're doing */
 	hs_ep->req = hs_req;
 
 	/* write size / packets */
-	writel(epsize, hsotg->regs + epsize_reg);
+	writel(epsize, dwc2->regs + epsize_reg);
 
-	if (using_dma(hsotg) && !continuing) {
+	if (using_dma(dwc2->s3c_hsotg) && !continuing) {
 		unsigned int dma_reg;
 
 		/*
@@ -787,26 +639,26 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 		 */
 
 		dma_reg = dir_in ? DIEPDMA(index) : DOEPDMA(index);
-		writel(ureq->dma, hsotg->regs + dma_reg);
+		writel(ureq->dma, dwc2->regs + dma_reg);
 
-		dev_dbg(hsotg->dev, "%s: 0x%08x => 0x%08x\n",
+		dev_dbg(dwc2->dev, "%s: 0x%08x => 0x%08x\n",
 			__func__, ureq->dma, dma_reg);
 	}
 
-	ctrl |= DxEPCTL_EPEna;	/* ensure ep enabled */
-	ctrl |= DxEPCTL_USBActEp;
+	ctrl |= DXEPCTL_EPENA;	/* ensure ep enabled */
+	ctrl |= DXEPCTL_USBACTEP;
 
-	dev_dbg(hsotg->dev, "setup req:%d\n", hsotg->setup);
+	dev_dbg(dwc2->dev, "setup req:%d\n", dwc2->s3c_hsotg->setup);
 
 	/* For Setup request do not clear NAK */
-	if (hsotg->setup && index == 0)
-		hsotg->setup = 0;
+	if (dwc2->s3c_hsotg->setup && index == 0)
+		dwc2->s3c_hsotg->setup = 0;
 	else
-		ctrl |= DxEPCTL_CNAK;	/* clear NAK set by core */
+		ctrl |= DXEPCTL_CNAK;	/* clear NAK set by core */
 
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x\n", __func__, ctrl);
-	writel(ctrl, hsotg->regs + epctrl_reg);
+	dev_dbg(dwc2->dev, "%s: DXEPCTL=0x%08x\n", __func__, ctrl);
+	writel(ctrl, dwc2->regs + epctrl_reg);
 
 	/*
 	 * set these, it seems that DMA support increments past the end
@@ -816,11 +668,11 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	hs_ep->size_loaded = length;
 	hs_ep->last_load = ureq->actual;
 
-	if (dir_in && !using_dma(hsotg)) {
+	if (dir_in && !using_dma(dwc2->s3c_hsotg)) {
 		/* set these anyway, we may need them for non-periodic in */
 		hs_ep->fifo_load = 0;
 
-		s3c_hsotg_write_fifo(hsotg, hs_ep, hs_req);
+		s3c_hsotg_write_fifo(dwc2, hs_ep, hs_req);
 	}
 
 	/*
@@ -828,8 +680,8 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	 * to debugging to see what is going on.
 	 */
 	if (dir_in)
-		writel(DIEPMSK_INTknTXFEmpMsk,
-		       hsotg->regs + DIEPINT(index));
+		writel(DIEPMSK_INTKNTXFEMPMSK,
+		       dwc2->regs + DIEPINT(index));
 
 	/*
 	 * Note, trying to clear the NAK here causes problems with transmit
@@ -837,16 +689,16 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
 	 */
 
 	/* check ep is enabled */
-	if (!(readl(hsotg->regs + epctrl_reg) & DxEPCTL_EPEna))
-		dev_warn(hsotg->dev,
-			 "ep%d: failed to become enabled (DxEPCTL=0x%08x)?\n",
-			 index, readl(hsotg->regs + epctrl_reg));
+	if (!(readl(dwc2->regs + epctrl_reg) & DXEPCTL_EPENA))
+		dev_warn(dwc2->dev,
+			 "ep%d: failed to become enabled (DXEPCTL=0x%08x)?\n",
+			 index, readl(dwc2->regs + epctrl_reg));
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x\n",
-		__func__, readl(hsotg->regs + epctrl_reg));
+	dev_dbg(dwc2->dev, "%s: DXEPCTL=0x%08x\n",
+		__func__, readl(dwc2->regs + epctrl_reg));
 
 	/* enable ep interrupts */
-	s3c_hsotg_ctrl_epint(hsotg, hs_ep->index, hs_ep->dir_in, 1);
+	s3c_hsotg_ctrl_epint(dwc2, hs_ep->index, hs_ep->dir_in, 1);
 }
 
 /**
@@ -861,7 +713,7 @@ static void s3c_hsotg_start_req(struct s3c_hsotg *hsotg,
  * DMA memory, then we map the memory and mark our request to allow us to
  * cleanup on completion.
  */
-static int s3c_hsotg_map_dma(struct s3c_hsotg *hsotg,
+static int s3c_hsotg_map_dma(struct dwc2_hsotg *dwc2,
 			     struct s3c_hsotg_ep *hs_ep,
 			     struct usb_request *req)
 {
@@ -872,14 +724,14 @@ static int s3c_hsotg_map_dma(struct s3c_hsotg *hsotg,
 	if (hs_req->req.length == 0)
 		return 0;
 
-	ret = usb_gadget_map_request(&hsotg->gadget, req, hs_ep->dir_in);
+	ret = usb_gadget_map_request(&dwc2->gadget, req, hs_ep->dir_in);
 	if (ret)
 		goto dma_error;
 
 	return 0;
 
 dma_error:
-	dev_err(hsotg->dev, "%s: failed to map buffer %p, %d bytes\n",
+	dev_err(dwc2->dev, "%s: failed to map buffer %p, %d bytes\n",
 		__func__, req->buf, req->length);
 
 	return -EIO;
@@ -890,10 +742,10 @@ static int s3c_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 {
 	struct s3c_hsotg_req *hs_req = our_req(req);
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hs = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	bool first;
 
-	dev_dbg(hs->dev, "%s: req %p: %d@%p, noi=%d, zero=%d, snok=%d\n",
+	dev_dbg(dwc2->dev, "%s: req %p: %d@%p, noi=%d, zero=%d, snok=%d\n",
 		ep->name, req, req->length, req->buf, req->no_interrupt,
 		req->zero, req->short_not_ok);
 
@@ -903,8 +755,8 @@ static int s3c_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 	req->status = -EINPROGRESS;
 
 	/* if we're using DMA, sync the buffers as necessary */
-	if (using_dma(hs)) {
-		int ret = s3c_hsotg_map_dma(hs, hs_ep, req);
+	if (using_dma(dwc2->s3c_hsotg)) {
+		int ret = s3c_hsotg_map_dma(dwc2, hs_ep, req);
 		if (ret)
 			return ret;
 	}
@@ -913,7 +765,7 @@ static int s3c_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 	list_add_tail(&hs_req->queue, &hs_ep->queue);
 
 	if (first)
-		s3c_hsotg_start_req(hs, hs_ep, hs_req, false);
+		s3c_hsotg_start_req(dwc2, hs_ep, hs_req, false);
 
 	return 0;
 }
@@ -922,13 +774,13 @@ static int s3c_hsotg_ep_queue_lock(struct usb_ep *ep, struct usb_request *req,
 			      gfp_t gfp_flags)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hs = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	unsigned long flags = 0;
 	int ret = 0;
 
-	spin_lock_irqsave(&hs->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 	ret = s3c_hsotg_ep_queue(ep, req, gfp_flags);
-	spin_unlock_irqrestore(&hs->lock, flags);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 
 	return ret;
 }
@@ -953,9 +805,9 @@ static void s3c_hsotg_complete_oursetup(struct usb_ep *ep,
 					struct usb_request *req)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 
-	dev_dbg(hsotg->dev, "%s: ep %p, req %p\n", __func__, ep, req);
+	dev_dbg(dwc2->dev, "%s: ep %p, req %p\n", __func__, ep, req);
 
 	s3c_hsotg_ep_free_request(ep, req);
 }
@@ -968,17 +820,17 @@ static void s3c_hsotg_complete_oursetup(struct usb_ep *ep,
  * Convert the given wIndex into a pointer to an driver endpoint
  * structure, or return NULL if it is not a valid endpoint.
  */
-static struct s3c_hsotg_ep *ep_from_windex(struct s3c_hsotg *hsotg,
+static struct s3c_hsotg_ep *ep_from_windex(struct dwc2_hsotg *dwc2,
 					   u32 windex)
 {
-	struct s3c_hsotg_ep *ep = &hsotg->eps[windex & 0x7F];
+	struct s3c_hsotg_ep *ep = &dwc2->eps[windex & 0x7F];
 	int dir = (windex & USB_DIR_IN) ? 1 : 0;
 	int idx = windex & 0x7F;
 
 	if (windex >= 0x100)
 		return NULL;
 
-	if (idx > hsotg->num_of_eps)
+	if (idx > dwc2->s3c_hsotg->num_of_eps)
 		return NULL;
 
 	if (idx && ep->dir_in != dir)
@@ -997,7 +849,7 @@ static struct s3c_hsotg_ep *ep_from_windex(struct s3c_hsotg *hsotg,
  * Create a request and queue it on the given endpoint. This is useful as
  * an internal method of sending replies to certain control requests, etc.
  */
-static int s3c_hsotg_send_reply(struct s3c_hsotg *hsotg,
+static int s3c_hsotg_send_reply(struct dwc2_hsotg *dwc2,
 				struct s3c_hsotg_ep *ep,
 				void *buff,
 				int length)
@@ -1005,16 +857,16 @@ static int s3c_hsotg_send_reply(struct s3c_hsotg *hsotg,
 	struct usb_request *req;
 	int ret;
 
-	dev_dbg(hsotg->dev, "%s: buff %p, len %d\n", __func__, buff, length);
+	dev_dbg(dwc2->dev, "%s: buff %p, len %d\n", __func__, buff, length);
 
 	req = s3c_hsotg_ep_alloc_request(&ep->ep, GFP_ATOMIC);
-	hsotg->ep0_reply = req;
+	dwc2->s3c_hsotg->ep0_reply = req;
 	if (!req) {
-		dev_warn(hsotg->dev, "%s: cannot alloc req\n", __func__);
+		dev_warn(dwc2->dev, "%s: cannot alloc req\n", __func__);
 		return -ENOMEM;
 	}
 
-	req->buf = hsotg->ep0_buff;
+	req->buf = dwc2->s3c_hsotg->ep0_buff;
 	req->length = length;
 	req->zero = 1; /* always do zero-length final transfer */
 	req->complete = s3c_hsotg_complete_oursetup;
@@ -1026,7 +878,7 @@ static int s3c_hsotg_send_reply(struct s3c_hsotg *hsotg,
 
 	ret = s3c_hsotg_ep_queue(&ep->ep, req, GFP_ATOMIC);
 	if (ret) {
-		dev_warn(hsotg->dev, "%s: cannot queue req\n", __func__);
+		dev_warn(dwc2->dev, "%s: cannot queue req\n", __func__);
 		return ret;
 	}
 
@@ -1038,18 +890,18 @@ static int s3c_hsotg_send_reply(struct s3c_hsotg *hsotg,
  * @hsotg: The device state
  * @ctrl: USB control request
  */
-static int s3c_hsotg_process_req_status(struct s3c_hsotg *hsotg,
+static int s3c_hsotg_process_req_status(struct dwc2_hsotg *dwc2,
 					struct usb_ctrlrequest *ctrl)
 {
-	struct s3c_hsotg_ep *ep0 = &hsotg->eps[0];
+	struct s3c_hsotg_ep *ep0 = &dwc2->eps[0];
 	struct s3c_hsotg_ep *ep;
 	__le16 reply;
 	int ret;
 
-	dev_dbg(hsotg->dev, "%s: USB_REQ_GET_STATUS\n", __func__);
+	dev_dbg(dwc2->dev, "%s: USB_REQ_GET_STATUS\n", __func__);
 
 	if (!ep0->dir_in) {
-		dev_warn(hsotg->dev, "%s: direction out?\n", __func__);
+		dev_warn(dwc2->dev, "%s: direction out?\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1065,7 +917,7 @@ static int s3c_hsotg_process_req_status(struct s3c_hsotg *hsotg,
 		break;
 
 	case USB_RECIP_ENDPOINT:
-		ep = ep_from_windex(hsotg, le16_to_cpu(ctrl->wIndex));
+		ep = ep_from_windex(dwc2, le16_to_cpu(ctrl->wIndex));
 		if (!ep)
 			return -ENOENT;
 
@@ -1079,9 +931,9 @@ static int s3c_hsotg_process_req_status(struct s3c_hsotg *hsotg,
 	if (le16_to_cpu(ctrl->wLength) != 2)
 		return -EINVAL;
 
-	ret = s3c_hsotg_send_reply(hsotg, ep0, &reply, 2);
+	ret = s3c_hsotg_send_reply(dwc2, ep0, &reply, 2);
 	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to send reply\n", __func__);
+		dev_err(dwc2->dev, "%s: failed to send reply\n", __func__);
 		return ret;
 	}
 
@@ -1109,10 +961,10 @@ static struct s3c_hsotg_req *get_ep_head(struct s3c_hsotg_ep *hs_ep)
  * @hsotg: The device state
  * @ctrl: USB control request
  */
-static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
+static int s3c_hsotg_process_req_feature(struct dwc2_hsotg *dwc2,
 					 struct usb_ctrlrequest *ctrl)
 {
-	struct s3c_hsotg_ep *ep0 = &hsotg->eps[0];
+	struct s3c_hsotg_ep *ep0 = &dwc2->eps[0];
 	struct s3c_hsotg_req *hs_req;
 	bool restart;
 	bool set = (ctrl->bRequest == USB_REQ_SET_FEATURE);
@@ -1120,13 +972,13 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
 	int ret;
 	bool halted;
 
-	dev_dbg(hsotg->dev, "%s: %s_FEATURE\n",
+	dev_dbg(dwc2->dev, "%s: %s_FEATURE\n",
 		__func__, set ? "SET" : "CLEAR");
 
 	if (ctrl->bRequestType == USB_RECIP_ENDPOINT) {
-		ep = ep_from_windex(hsotg, le16_to_cpu(ctrl->wIndex));
+		ep = ep_from_windex(dwc2, le16_to_cpu(ctrl->wIndex));
 		if (!ep) {
-			dev_dbg(hsotg->dev, "%s: no endpoint for 0x%04x\n",
+			dev_dbg(dwc2->dev, "%s: no endpoint for 0x%04x\n",
 				__func__, le16_to_cpu(ctrl->wIndex));
 			return -ENOENT;
 		}
@@ -1137,9 +989,9 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
 
 			s3c_hsotg_ep_sethalt(&ep->ep, set);
 
-			ret = s3c_hsotg_send_reply(hsotg, ep0, NULL, 0);
+			ret = s3c_hsotg_send_reply(dwc2, ep0, NULL, 0);
 			if (ret) {
-				dev_err(hsotg->dev,
+				dev_err(dwc2->dev,
 					"%s: failed to send reply\n", __func__);
 				return ret;
 			}
@@ -1166,7 +1018,7 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
 				restart = !list_empty(&ep->queue);
 				if (restart) {
 					hs_req = get_ep_head(ep);
-					s3c_hsotg_start_req(hsotg, ep,
+					s3c_hsotg_start_req(dwc2, ep,
 							    hs_req, false);
 				}
 			}
@@ -1182,8 +1034,7 @@ static int s3c_hsotg_process_req_feature(struct s3c_hsotg *hsotg,
 	return 1;
 }
 
-static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg);
-static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg);
+static void s3c_hsotg_enqueue_setup(struct dwc2_hsotg *dwc2);
 
 /**
  * s3c_hsotg_process_control - process a control request
@@ -1194,16 +1045,16 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg);
  * needs to work out what to do next (and whether to pass it on to the
  * gadget driver).
  */
-static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_process_control(struct dwc2_hsotg *dwc2,
 				      struct usb_ctrlrequest *ctrl)
 {
-	struct s3c_hsotg_ep *ep0 = &hsotg->eps[0];
+	struct s3c_hsotg_ep *ep0 = &dwc2->eps[0];
 	int ret = 0;
 	u32 dcfg;
 
 	ep0->sent_zlp = 0;
 
-	dev_dbg(hsotg->dev, "ctrl Req=%02x, Type=%02x, V=%04x, L=%04x\n",
+	dev_dbg(dwc2->dev, "ctrl Req=%02x, Type=%02x, V=%04x, L=%04x\n",
 		 ctrl->bRequest, ctrl->bRequestType,
 		 ctrl->wValue, ctrl->wLength);
 
@@ -1213,7 +1064,7 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 	 */
 
 	ep0->dir_in = (ctrl->bRequestType & USB_DIR_IN) ? 1 : 0;
-	dev_dbg(hsotg->dev, "ctrl: dir_in=%d\n", ep0->dir_in);
+	dev_dbg(dwc2->dev, "ctrl: dir_in=%d\n", ep0->dir_in);
 
 	/*
 	 * if we've no data with this request, then the last part of the
@@ -1225,36 +1076,36 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 	if ((ctrl->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
 		switch (ctrl->bRequest) {
 		case USB_REQ_SET_ADDRESS:
-			s3c_hsotg_disconnect(hsotg);
-			dcfg = readl(hsotg->regs + DCFG);
-			dcfg &= ~DCFG_DevAddr_MASK;
-			dcfg |= ctrl->wValue << DCFG_DevAddr_SHIFT;
-			writel(dcfg, hsotg->regs + DCFG);
+			s3c_hsotg_disconnect(dwc2);
+			dcfg = readl(dwc2->regs + DCFG);
+			dcfg &= ~DCFG_DEVADDR_MASK;
+			dcfg |= ctrl->wValue << DCFG_DEVADDR_SHIFT;
+			writel(dcfg, dwc2->regs + DCFG);
 
-			dev_info(hsotg->dev, "new address %d\n", ctrl->wValue);
+			dev_info(dwc2->dev, "new address %d\n", ctrl->wValue);
 
-			ret = s3c_hsotg_send_reply(hsotg, ep0, NULL, 0);
+			ret = s3c_hsotg_send_reply(dwc2, ep0, NULL, 0);
 			return;
 
 		case USB_REQ_GET_STATUS:
-			ret = s3c_hsotg_process_req_status(hsotg, ctrl);
+			ret = s3c_hsotg_process_req_status(dwc2, ctrl);
 			break;
 
 		case USB_REQ_CLEAR_FEATURE:
 		case USB_REQ_SET_FEATURE:
-			ret = s3c_hsotg_process_req_feature(hsotg, ctrl);
+			ret = s3c_hsotg_process_req_feature(dwc2, ctrl);
 			break;
 		}
 	}
 
 	/* as a fallback, try delivering it to the driver to deal with */
 
-	if (ret == 0 && hsotg->driver) {
-		spin_unlock(&hsotg->lock);
-		ret = hsotg->driver->setup(&hsotg->gadget, ctrl);
-		spin_lock(&hsotg->lock);
+	if (ret == 0 && dwc2->driver) {
+		spin_unlock(&dwc2->lock);
+		ret = dwc2->driver->setup(&dwc2->gadget, ctrl);
+		spin_lock(&dwc2->lock);
 		if (ret < 0)
-			dev_dbg(hsotg->dev, "driver->setup() ret %d\n", ret);
+			dev_dbg(dwc2->dev, "driver->setup() ret %d\n", ret);
 	}
 
 	/*
@@ -1266,22 +1117,22 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 		u32 reg;
 		u32 ctrl;
 
-		dev_dbg(hsotg->dev, "ep0 stall (dir=%d)\n", ep0->dir_in);
+		dev_dbg(dwc2->dev, "ep0 stall (dir=%d)\n", ep0->dir_in);
 		reg = (ep0->dir_in) ? DIEPCTL0 : DOEPCTL0;
 
 		/*
-		 * DxEPCTL_Stall will be cleared by EP once it has
+		 * DXEPCTL_Stall will be cleared by EP once it has
 		 * taken effect, so no need to clear later.
 		 */
 
-		ctrl = readl(hsotg->regs + reg);
-		ctrl |= DxEPCTL_Stall;
-		ctrl |= DxEPCTL_CNAK;
-		writel(ctrl, hsotg->regs + reg);
+		ctrl = readl(dwc2->regs + reg);
+		ctrl |= DXEPCTL_STALL;
+		ctrl |= DXEPCTL_CNAK;
+		writel(ctrl, dwc2->regs + reg);
 
-		dev_dbg(hsotg->dev,
-			"written DxEPCTL=0x%08x to %08x (DxEPCTL=0x%08x)\n",
-			ctrl, reg, readl(hsotg->regs + reg));
+		dev_dbg(dwc2->dev,
+			"written DXEPCTL=0x%08x to %08x (DXEPCTL=0x%08x)\n",
+			ctrl, reg, readl(dwc2->regs + reg));
 
 		/*
 		 * don't believe we need to anything more to get the EP
@@ -1292,7 +1143,7 @@ static void s3c_hsotg_process_control(struct s3c_hsotg *hsotg,
 		  * complete won't be called, so we enqueue
 		  * setup request here
 		  */
-		 s3c_hsotg_enqueue_setup(hsotg);
+		 s3c_hsotg_enqueue_setup(dwc2);
 	}
 }
 
@@ -1308,19 +1159,19 @@ static void s3c_hsotg_complete_setup(struct usb_ep *ep,
 				     struct usb_request *req)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 
 	if (req->status < 0) {
-		dev_dbg(hsotg->dev, "%s: failed %d\n", __func__, req->status);
+		dev_dbg(dwc2->dev, "%s: failed %d\n", __func__, req->status);
 		return;
 	}
 
-	spin_lock(&hsotg->lock);
+	spin_lock(&dwc2->lock);
 	if (req->actual == 0)
-		s3c_hsotg_enqueue_setup(hsotg);
+		s3c_hsotg_enqueue_setup(dwc2);
 	else
-		s3c_hsotg_process_control(hsotg, req->buf);
-	spin_unlock(&hsotg->lock);
+		s3c_hsotg_process_control(dwc2, req->buf);
+	spin_unlock(&dwc2->lock);
 }
 
 /**
@@ -1330,29 +1181,29 @@ static void s3c_hsotg_complete_setup(struct usb_ep *ep,
  * Enqueue a request on EP0 if necessary to received any SETUP packets
  * received from the host.
  */
-static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_enqueue_setup(struct dwc2_hsotg *dwc2)
 {
-	struct usb_request *req = hsotg->ctrl_req;
+	struct usb_request *req = dwc2->s3c_hsotg->ctrl_req;
 	struct s3c_hsotg_req *hs_req = our_req(req);
 	int ret;
 
-	dev_dbg(hsotg->dev, "%s: queueing setup request\n", __func__);
+	dev_dbg(dwc2->dev, "%s: queueing setup request\n", __func__);
 
 	req->zero = 0;
 	req->length = 8;
-	req->buf = hsotg->ctrl_buff;
+	req->buf = dwc2->s3c_hsotg->ctrl_buff;
 	req->complete = s3c_hsotg_complete_setup;
 
 	if (!list_empty(&hs_req->queue)) {
-		dev_dbg(hsotg->dev, "%s already queued???\n", __func__);
+		dev_dbg(dwc2->dev, "%s already queued???\n", __func__);
 		return;
 	}
 
-	hsotg->eps[0].dir_in = 0;
+	dwc2->eps[0].dir_in = 0;
 
-	ret = s3c_hsotg_ep_queue(&hsotg->eps[0].ep, req, GFP_ATOMIC);
+	ret = s3c_hsotg_ep_queue(&dwc2->eps[0].ep, req, GFP_ATOMIC);
 	if (ret < 0) {
-		dev_err(hsotg->dev, "%s: failed queue (%d)\n", __func__, ret);
+		dev_err(dwc2->dev, "%s: failed queue (%d)\n", __func__, ret);
 		/*
 		 * Don't think there's much we can do other than watch the
 		 * driver fail.
@@ -1373,7 +1224,7 @@ static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg)
  *
  * Note, expects the ep to already be locked as appropriate.
  */
-static void s3c_hsotg_complete_request(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_complete_request(struct dwc2_hsotg *dwc2,
 				       struct s3c_hsotg_ep *hs_ep,
 				       struct s3c_hsotg_req *hs_req,
 				       int result)
@@ -1381,11 +1232,11 @@ static void s3c_hsotg_complete_request(struct s3c_hsotg *hsotg,
 	bool restart;
 
 	if (!hs_req) {
-		dev_dbg(hsotg->dev, "%s: nothing to complete?\n", __func__);
+		dev_dbg(dwc2->dev, "%s: nothing to complete?\n", __func__);
 		return;
 	}
 
-	dev_dbg(hsotg->dev, "complete: ep %p %s, req %p, %d => %p\n",
+	dev_dbg(dwc2->dev, "complete: ep %p %s, req %p, %d => %p\n",
 		hs_ep, hs_ep->ep.name, hs_req, result, hs_req->req.complete);
 
 	/*
@@ -1399,8 +1250,8 @@ static void s3c_hsotg_complete_request(struct s3c_hsotg *hsotg,
 	hs_ep->req = NULL;
 	list_del_init(&hs_req->queue);
 
-	if (using_dma(hsotg))
-		s3c_hsotg_unmap_dma(hsotg, hs_ep, hs_req);
+	if (using_dma(dwc2->s3c_hsotg))
+		s3c_hsotg_unmap_dma(dwc2, hs_ep, hs_req);
 
 	/*
 	 * call the complete request with the locks off, just in case the
@@ -1408,9 +1259,9 @@ static void s3c_hsotg_complete_request(struct s3c_hsotg *hsotg,
 	 */
 
 	if (hs_req->req.complete) {
-		spin_unlock(&hsotg->lock);
+		spin_unlock(&dwc2->lock);
 		hs_req->req.complete(&hs_ep->ep, &hs_req->req);
-		spin_lock(&hsotg->lock);
+		spin_lock(&dwc2->lock);
 	}
 
 	/*
@@ -1423,7 +1274,7 @@ static void s3c_hsotg_complete_request(struct s3c_hsotg *hsotg,
 		restart = !list_empty(&hs_ep->queue);
 		if (restart) {
 			hs_req = get_ep_head(hs_ep);
-			s3c_hsotg_start_req(hsotg, hs_ep, hs_req, false);
+			s3c_hsotg_start_req(dwc2, hs_ep, hs_req, false);
 		}
 	}
 }
@@ -1438,22 +1289,22 @@ static void s3c_hsotg_complete_request(struct s3c_hsotg *hsotg,
  * endpoint, so sort out whether we need to read the data into a request
  * that has been made for that endpoint.
  */
-static void s3c_hsotg_rx_data(struct s3c_hsotg *hsotg, int ep_idx, int size)
+static void s3c_hsotg_rx_data(struct dwc2_hsotg *dwc2, int ep_idx, int size)
 {
-	struct s3c_hsotg_ep *hs_ep = &hsotg->eps[ep_idx];
+	struct s3c_hsotg_ep *hs_ep = &dwc2->eps[ep_idx];
 	struct s3c_hsotg_req *hs_req = hs_ep->req;
-	void __iomem *fifo = hsotg->regs + EPFIFO(ep_idx);
+	void __iomem *fifo = dwc2->regs + EPFIFO(ep_idx);
 	int to_read;
 	int max_req;
 	int read_ptr;
 
 
 	if (!hs_req) {
-		u32 epctl = readl(hsotg->regs + DOEPCTL(ep_idx));
+		u32 epctl = readl(dwc2->regs + DOEPCTL(ep_idx));
 		int ptr;
 
-		dev_warn(hsotg->dev,
-			 "%s: FIFO %d bytes on ep%d but no req (DxEPCTl=0x%08x)\n",
+		dev_warn(dwc2->dev,
+			 "%s: FIFO %d bytes on ep%d but no req (DXEPCTl=0x%08x)\n",
 			 __func__, size, ep_idx, epctl);
 
 		/* dump the data from the FIFO, we've nothing we can do */
@@ -1467,7 +1318,7 @@ static void s3c_hsotg_rx_data(struct s3c_hsotg *hsotg, int ep_idx, int size)
 	read_ptr = hs_req->req.actual;
 	max_req = hs_req->req.length - read_ptr;
 
-	dev_dbg(hsotg->dev, "%s: read %d/%d, done %d/%d\n",
+	dev_dbg(dwc2->dev, "%s: read %d/%d, done %d/%d\n",
 		__func__, to_read, max_req, read_ptr, hs_req->req.length);
 
 	if (to_read > max_req) {
@@ -1503,36 +1354,36 @@ static void s3c_hsotg_rx_data(struct s3c_hsotg *hsotg, int ep_idx, int size)
  * currently believed that we do not need to wait for any space in
  * the TxFIFO.
  */
-static void s3c_hsotg_send_zlp(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_send_zlp(struct dwc2_hsotg *dwc2,
 			       struct s3c_hsotg_req *req)
 {
 	u32 ctrl;
 
 	if (!req) {
-		dev_warn(hsotg->dev, "%s: no request?\n", __func__);
+		dev_warn(dwc2->dev, "%s: no request?\n", __func__);
 		return;
 	}
 
 	if (req->req.length == 0) {
-		hsotg->eps[0].sent_zlp = 1;
-		s3c_hsotg_enqueue_setup(hsotg);
+		dwc2->eps[0].sent_zlp = 1;
+		s3c_hsotg_enqueue_setup(dwc2);
 		return;
 	}
 
-	hsotg->eps[0].dir_in = 1;
-	hsotg->eps[0].sent_zlp = 1;
+	dwc2->eps[0].dir_in = 1;
+	dwc2->eps[0].sent_zlp = 1;
 
-	dev_dbg(hsotg->dev, "sending zero-length packet\n");
+	dev_dbg(dwc2->dev, "sending zero-length packet\n");
 
 	/* issue a zero-sized packet to terminate this */
-	writel(DxEPTSIZ_MC(1) | DxEPTSIZ_PktCnt(1) |
-	       DxEPTSIZ_XferSize(0), hsotg->regs + DIEPTSIZ(0));
+	writel(DXEPTSIZ_MC(1) | DXEPTSIZ_PKTCNT(1) |
+	       DXEPTSIZ_XFERSIZE(0), dwc2->regs + DIEPTSIZ(0));
 
-	ctrl = readl(hsotg->regs + DIEPCTL0);
-	ctrl |= DxEPCTL_CNAK;  /* clear NAK set by core */
-	ctrl |= DxEPCTL_EPEna; /* ensure ep enabled */
-	ctrl |= DxEPCTL_USBActEp;
-	writel(ctrl, hsotg->regs + DIEPCTL0);
+	ctrl = readl(dwc2->regs + DIEPCTL0);
+	ctrl |= DXEPCTL_CNAK;  /* clear NAK set by core */
+	ctrl |= DXEPCTL_EPENA; /* ensure ep enabled */
+	ctrl |= DXEPCTL_USBACTEP;
+	writel(ctrl, dwc2->regs + DIEPCTL0);
 }
 
 /**
@@ -1545,22 +1396,22 @@ static void s3c_hsotg_send_zlp(struct s3c_hsotg *hsotg,
  * transfer for an OUT endpoint has been completed, either by a short
  * packet or by the finish of a transfer.
  */
-static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_handle_outdone(struct dwc2_hsotg *dwc2,
 				     int epnum, bool was_setup)
 {
-	u32 epsize = readl(hsotg->regs + DOEPTSIZ(epnum));
-	struct s3c_hsotg_ep *hs_ep = &hsotg->eps[epnum];
+	u32 epsize = readl(dwc2->regs + DOEPTSIZ(epnum));
+	struct s3c_hsotg_ep *hs_ep = &dwc2->eps[epnum];
 	struct s3c_hsotg_req *hs_req = hs_ep->req;
 	struct usb_request *req = &hs_req->req;
-	unsigned size_left = DxEPTSIZ_XferSize_GET(epsize);
+	unsigned size_left = DXEPTSIZ_XFERSIZE_GET(epsize);
 	int result = 0;
 
 	if (!hs_req) {
-		dev_dbg(hsotg->dev, "%s: no request active\n", __func__);
+		dev_dbg(dwc2->dev, "%s: no request active\n", __func__);
 		return;
 	}
 
-	if (using_dma(hsotg)) {
+	if (using_dma(dwc2->s3c_hsotg)) {
 		unsigned size_done;
 
 		/*
@@ -1580,18 +1431,18 @@ static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
 
 	/* if there is more request to do, schedule new transfer */
 	if (req->actual < req->length && size_left == 0) {
-		s3c_hsotg_start_req(hsotg, hs_ep, hs_req, true);
+		s3c_hsotg_start_req(dwc2, hs_ep, hs_req, true);
 		return;
 	} else if (epnum == 0) {
 		/*
 		 * After was_setup = 1 =>
 		 * set CNAK for non Setup requests
 		 */
-		hsotg->setup = was_setup ? 0 : 1;
+		dwc2->s3c_hsotg->setup = was_setup ? 0 : 1;
 	}
 
 	if (req->actual < req->length && req->short_not_ok) {
-		dev_dbg(hsotg->dev, "%s: got %d/%d (short not ok) => error\n",
+		dev_dbg(dwc2->dev, "%s: got %d/%d (short not ok) => error\n",
 			__func__, req->actual, req->length);
 
 		/*
@@ -1606,10 +1457,10 @@ static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
 		 * send ZLP when we have an asynchronous request from gadget
 		 */
 		if (!was_setup && req->complete != s3c_hsotg_complete_setup)
-			s3c_hsotg_send_zlp(hsotg, hs_req);
+			s3c_hsotg_send_zlp(dwc2, hs_req);
 	}
 
-	s3c_hsotg_complete_request(hsotg, hs_ep, hs_req, result);
+	s3c_hsotg_complete_request(dwc2, hs_ep, hs_req, result);
 }
 
 /**
@@ -1618,11 +1469,11 @@ static void s3c_hsotg_handle_outdone(struct s3c_hsotg *hsotg,
  *
  * Return the current frame number
  */
-static u32 s3c_hsotg_read_frameno(struct s3c_hsotg *hsotg)
+static u32 s3c_hsotg_read_frameno(struct dwc2_hsotg *dwc2)
 {
 	u32 dsts;
 
-	dsts = readl(hsotg->regs + DSTS);
+	dsts = readl(dwc2->regs + DSTS);
 	dsts &= DSTS_SOFFN_MASK;
 	dsts >>= DSTS_SOFFN_SHIFT;
 
@@ -1645,65 +1496,65 @@ static u32 s3c_hsotg_read_frameno(struct s3c_hsotg *hsotg)
  * as the actual data should be sent to the memory directly and we turn
  * on the completion interrupts to get notifications of transfer completion.
  */
-static void s3c_hsotg_handle_rx(struct s3c_hsotg *hsotg)
+void s3c_hsotg_handle_rx(struct dwc2_hsotg *dwc2)
 {
-	u32 grxstsr = readl(hsotg->regs + GRXSTSP);
+	u32 grxstsr = readl(dwc2->regs + GRXSTSP);
 	u32 epnum, status, size;
 
-	WARN_ON(using_dma(hsotg));
+	WARN_ON(using_dma(dwc2->s3c_hsotg));
 
-	epnum = grxstsr & GRXSTS_EPNum_MASK;
-	status = grxstsr & GRXSTS_PktSts_MASK;
+	epnum = grxstsr & GRXSTS_EPNUM_MASK;
+	status = grxstsr & GRXSTS_PKTSTS_MASK;
 
-	size = grxstsr & GRXSTS_ByteCnt_MASK;
-	size >>= GRXSTS_ByteCnt_SHIFT;
+	size = grxstsr & GRXSTS_BYTECNT_MASK;
+	size >>= GRXSTS_BYTECNT_SHIFT;
 
 	if (1)
-		dev_dbg(hsotg->dev, "%s: GRXSTSP=0x%08x (%d@%d)\n",
+		dev_dbg(dwc2->dev, "%s: GRXSTSP=0x%08x (%d@%d)\n",
 			__func__, grxstsr, size, epnum);
 
-#define __status(x) ((x) >> GRXSTS_PktSts_SHIFT)
+#define __status(x) ((x) >> GRXSTS_PKTSTS_SHIFT)
 
-	switch (status >> GRXSTS_PktSts_SHIFT) {
-	case __status(GRXSTS_PktSts_GlobalOutNAK):
-		dev_dbg(hsotg->dev, "GlobalOutNAK\n");
+	switch (status >> GRXSTS_PKTSTS_SHIFT) {
+	case __status(GRXSTS_PKTSTS_GLOBALOUTNAK):
+		dev_dbg(dwc2->dev, "GLOBALOUTNAK\n");
 		break;
 
-	case __status(GRXSTS_PktSts_OutDone):
-		dev_dbg(hsotg->dev, "OutDone (Frame=0x%08x)\n",
-			s3c_hsotg_read_frameno(hsotg));
+	case __status(GRXSTS_PKTSTS_OUTDONE):
+		dev_dbg(dwc2->dev, "OutDone (Frame=0x%08x)\n",
+			s3c_hsotg_read_frameno(dwc2));
 
-		if (!using_dma(hsotg))
-			s3c_hsotg_handle_outdone(hsotg, epnum, false);
+		if (!using_dma(dwc2->s3c_hsotg))
+			s3c_hsotg_handle_outdone(dwc2, epnum, false);
 		break;
 
-	case __status(GRXSTS_PktSts_SetupDone):
-		dev_dbg(hsotg->dev,
+	case __status(GRXSTS_PKTSTS_SETUPDONE):
+		dev_dbg(dwc2->dev,
 			"SetupDone (Frame=0x%08x, DOPEPCTL=0x%08x)\n",
-			s3c_hsotg_read_frameno(hsotg),
-			readl(hsotg->regs + DOEPCTL(0)));
+			s3c_hsotg_read_frameno(dwc2),
+			readl(dwc2->regs + DOEPCTL(0)));
 
-		s3c_hsotg_handle_outdone(hsotg, epnum, true);
+		s3c_hsotg_handle_outdone(dwc2, epnum, true);
 		break;
 
-	case __status(GRXSTS_PktSts_OutRX):
-		s3c_hsotg_rx_data(hsotg, epnum, size);
+	case __status(GRXSTS_PKTSTS_OUTRX):
+		s3c_hsotg_rx_data(dwc2, epnum, size);
 		break;
 
-	case __status(GRXSTS_PktSts_SetupRX):
-		dev_dbg(hsotg->dev,
+	case __status(GRXSTS_PKTSTS_SETUPRX):
+		dev_dbg(dwc2->dev,
 			"SetupRX (Frame=0x%08x, DOPEPCTL=0x%08x)\n",
-			s3c_hsotg_read_frameno(hsotg),
-			readl(hsotg->regs + DOEPCTL(0)));
+			s3c_hsotg_read_frameno(dwc2),
+			readl(dwc2->regs + DOEPCTL(0)));
 
-		s3c_hsotg_rx_data(hsotg, epnum, size);
+		s3c_hsotg_rx_data(dwc2, epnum, size);
 		break;
 
 	default:
-		dev_warn(hsotg->dev, "%s: unknown status %08x\n",
+		dev_warn(dwc2->dev, "%s: unknown status %08x\n",
 			 __func__, grxstsr);
 
-		s3c_hsotg_dump(hsotg);
+		s3c_hsotg_dump(dwc2);
 		break;
 	}
 }
@@ -1739,11 +1590,11 @@ static u32 s3c_hsotg_ep0_mps(unsigned int mps)
  * Configure the maximum packet size for the given endpoint, updating
  * the hardware control registers to reflect this.
  */
-static void s3c_hsotg_set_ep_maxpacket(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_set_ep_maxpacket(struct dwc2_hsotg *dwc2,
 				       unsigned int ep, unsigned int mps)
 {
-	struct s3c_hsotg_ep *hs_ep = &hsotg->eps[ep];
-	void __iomem *regs = hsotg->regs;
+	struct s3c_hsotg_ep *hs_ep = &dwc2->eps[ep];
+	void __iomem *regs = dwc2->regs;
 	u32 mpsval;
 	u32 mcval;
 	u32 reg;
@@ -1756,7 +1607,7 @@ static void s3c_hsotg_set_ep_maxpacket(struct s3c_hsotg *hsotg,
 		hs_ep->ep.maxpacket = mps;
 		hs_ep->mc = 1;
 	} else {
-		mpsval = mps & DxEPCTL_MPS_MASK;
+		mpsval = mps & DXEPCTL_MPS_MASK;
 		if (mpsval > 1024)
 			goto bad_mps;
 		mcval = ((mps >> 11) & 0x3) + 1;
@@ -1772,13 +1623,13 @@ static void s3c_hsotg_set_ep_maxpacket(struct s3c_hsotg *hsotg,
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
@@ -1786,7 +1637,7 @@ static void s3c_hsotg_set_ep_maxpacket(struct s3c_hsotg *hsotg,
 	return;
 
 bad_mps:
-	dev_err(hsotg->dev, "ep%d: bad mps of %d\n", ep, mps);
+	dev_err(dwc2->dev, "ep%d: bad mps of %d\n", ep, mps);
 }
 
 /**
@@ -1794,25 +1645,25 @@ bad_mps:
  * @hsotg: The driver state
  * @idx: The index for the endpoint (0..15)
  */
-static void s3c_hsotg_txfifo_flush(struct s3c_hsotg *hsotg, unsigned int idx)
+static void s3c_hsotg_txfifo_flush(struct dwc2_hsotg *dwc2, unsigned int idx)
 {
 	int timeout;
 	int val;
 
-	writel(GRSTCTL_TxFNum(idx) | GRSTCTL_TxFFlsh,
-		hsotg->regs + GRSTCTL);
+	writel(GRSTCTL_TXFNUM(idx) | GRSTCTL_TXFFLSH,
+		dwc2->regs + GRSTCTL);
 
 	/* wait until the fifo is flushed */
 	timeout = 100;
 
 	while (1) {
-		val = readl(hsotg->regs + GRSTCTL);
+		val = readl(dwc2->regs + GRSTCTL);
 
-		if ((val & (GRSTCTL_TxFFlsh)) == 0)
+		if ((val & (GRSTCTL_TXFFLSH)) == 0)
 			break;
 
 		if (--timeout == 0) {
-			dev_err(hsotg->dev,
+			dev_err(dwc2->dev,
 				"%s: timeout flushing fifo (GRSTCTL=%08x)\n",
 				__func__, val);
 		}
@@ -1829,7 +1680,7 @@ static void s3c_hsotg_txfifo_flush(struct s3c_hsotg *hsotg, unsigned int idx)
  * Check to see if there is a request that has data to send, and if so
  * make an attempt to write data into the FIFO.
  */
-static int s3c_hsotg_trytx(struct s3c_hsotg *hsotg,
+static int s3c_hsotg_trytx(struct dwc2_hsotg *dwc2,
 			   struct s3c_hsotg_ep *hs_ep)
 {
 	struct s3c_hsotg_req *hs_req = hs_ep->req;
@@ -1840,15 +1691,15 @@ static int s3c_hsotg_trytx(struct s3c_hsotg *hsotg,
 		 * for endpoints, excepting ep0
 		 */
 		if (hs_ep->index != 0)
-			s3c_hsotg_ctrl_epint(hsotg, hs_ep->index,
+			s3c_hsotg_ctrl_epint(dwc2, hs_ep->index,
 					     hs_ep->dir_in, 0);
 		return 0;
 	}
 
 	if (hs_req->req.actual < hs_req->req.length) {
-		dev_dbg(hsotg->dev, "trying to write more for ep%d\n",
+		dev_dbg(dwc2->dev, "trying to write more for ep%d\n",
 			hs_ep->index);
-		return s3c_hsotg_write_fifo(hsotg, hs_ep, hs_req);
+		return s3c_hsotg_write_fifo(dwc2, hs_ep, hs_req);
 	}
 
 	return 0;
@@ -1862,22 +1713,22 @@ static int s3c_hsotg_trytx(struct s3c_hsotg *hsotg,
  * An IN transfer has been completed, update the transfer's state and then
  * call the relevant completion routines.
  */
-static void s3c_hsotg_complete_in(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_complete_in(struct dwc2_hsotg *dwc2,
 				  struct s3c_hsotg_ep *hs_ep)
 {
 	struct s3c_hsotg_req *hs_req = hs_ep->req;
-	u32 epsize = readl(hsotg->regs + DIEPTSIZ(hs_ep->index));
+	u32 epsize = readl(dwc2->regs + DIEPTSIZ(hs_ep->index));
 	int size_left, size_done;
 
 	if (!hs_req) {
-		dev_dbg(hsotg->dev, "XferCompl but no req\n");
+		dev_dbg(dwc2->dev, "XferCompl but no req\n");
 		return;
 	}
 
 	/* Finish ZLP handling for IN EP0 transactions */
-	if (hsotg->eps[0].sent_zlp) {
-		dev_dbg(hsotg->dev, "zlp packet received\n");
-		s3c_hsotg_complete_request(hsotg, hs_ep, hs_req, 0);
+	if (dwc2->eps[0].sent_zlp) {
+		dev_dbg(dwc2->dev, "zlp packet received\n");
+		s3c_hsotg_complete_request(dwc2, hs_ep, hs_req, 0);
 		return;
 	}
 
@@ -1891,17 +1742,17 @@ static void s3c_hsotg_complete_in(struct s3c_hsotg *hsotg,
 	 * aligned).
 	 */
 
-	size_left = DxEPTSIZ_XferSize_GET(epsize);
+	size_left = DXEPTSIZ_XFERSIZE_GET(epsize);
 
 	size_done = hs_ep->size_loaded - size_left;
 	size_done += hs_ep->last_load;
 
 	if (hs_req->req.actual != size_done)
-		dev_dbg(hsotg->dev, "%s: adjusting size done %d => %d\n",
+		dev_dbg(dwc2->dev, "%s: adjusting size done %d => %d\n",
 			__func__, hs_req->req.actual, size_done);
 
 	hs_req->req.actual = size_done;
-	dev_dbg(hsotg->dev, "req->length:%d req->actual:%d req->zero:%d\n",
+	dev_dbg(dwc2->dev, "req->length:%d req->actual:%d req->zero:%d\n",
 		hs_req->req.length, hs_req->req.actual, hs_req->req.zero);
 
 	/*
@@ -1918,17 +1769,17 @@ static void s3c_hsotg_complete_in(struct s3c_hsotg *hsotg,
 	    hs_req->req.length == hs_req->req.actual &&
 	    !(hs_req->req.length % hs_ep->ep.maxpacket)) {
 
-		dev_dbg(hsotg->dev, "ep0 zlp IN packet sent\n");
-		s3c_hsotg_send_zlp(hsotg, hs_req);
+		dev_dbg(dwc2->dev, "ep0 zlp IN packet sent\n");
+		s3c_hsotg_send_zlp(dwc2, hs_req);
 
 		return;
 	}
 
 	if (!size_left && hs_req->req.actual < hs_req->req.length) {
-		dev_dbg(hsotg->dev, "%s trying more for req...\n", __func__);
-		s3c_hsotg_start_req(hsotg, hs_ep, hs_req, true);
+		dev_dbg(dwc2->dev, "%s trying more for req...\n", __func__);
+		s3c_hsotg_start_req(dwc2, hs_ep, hs_req, true);
 	} else
-		s3c_hsotg_complete_request(hsotg, hs_ep, hs_req, 0);
+		s3c_hsotg_complete_request(dwc2, hs_ep, hs_req, 0);
 }
 
 /**
@@ -1939,83 +1790,83 @@ static void s3c_hsotg_complete_in(struct s3c_hsotg *hsotg,
  *
  * Process and clear any interrupt pending for an individual endpoint
  */
-static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
+void s3c_hsotg_epint(struct dwc2_hsotg *dwc2, unsigned int idx,
 			    int dir_in)
 {
-	struct s3c_hsotg_ep *hs_ep = &hsotg->eps[idx];
+	struct s3c_hsotg_ep *hs_ep = &dwc2->eps[idx];
 	u32 epint_reg = dir_in ? DIEPINT(idx) : DOEPINT(idx);
 	u32 epctl_reg = dir_in ? DIEPCTL(idx) : DOEPCTL(idx);
 	u32 epsiz_reg = dir_in ? DIEPTSIZ(idx) : DOEPTSIZ(idx);
 	u32 ints;
 	u32 ctrl;
 
-	ints = readl(hsotg->regs + epint_reg);
-	ctrl = readl(hsotg->regs + epctl_reg);
+	ints = readl(dwc2->regs + epint_reg);
+	ctrl = readl(dwc2->regs + epctl_reg);
 
 	/* Clear endpoint interrupts */
-	writel(ints, hsotg->regs + epint_reg);
+	writel(ints, dwc2->regs + epint_reg);
 
-	dev_dbg(hsotg->dev, "%s: ep%d(%s) DxEPINT=0x%08x\n",
+	dev_dbg(dwc2->dev, "%s: ep%d(%s) DXEPINT=0x%08x\n",
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
-			writel(ctrl, hsotg->regs + epctl_reg);
+				ctrl |= DXEPCTL_SETODDFR;
+			writel(ctrl, dwc2->regs + epctl_reg);
 		}
 
-		dev_dbg(hsotg->dev,
-			"%s: XferCompl: DxEPCTL=0x%08x, DxEPTSIZ=%08x\n",
-			__func__, readl(hsotg->regs + epctl_reg),
-			readl(hsotg->regs + epsiz_reg));
+		dev_dbg(dwc2->dev,
+			"%s: XferCompl: DXEPCTL=0x%08x, DXEPTSIZ=%08x\n",
+			__func__, readl(dwc2->regs + epctl_reg),
+			readl(dwc2->regs + epsiz_reg));
 
 		/*
 		 * we get OutDone from the FIFO, so we only need to look
 		 * at completing IN requests here
 		 */
 		if (dir_in) {
-			s3c_hsotg_complete_in(hsotg, hs_ep);
+			s3c_hsotg_complete_in(dwc2, hs_ep);
 
 			if (idx == 0 && !hs_ep->req)
-				s3c_hsotg_enqueue_setup(hsotg);
-		} else if (using_dma(hsotg)) {
+				s3c_hsotg_enqueue_setup(dwc2);
+		} else if (using_dma(dwc2->s3c_hsotg)) {
 			/*
 			 * We're using DMA, we need to fire an OutDone here
 			 * as we ignore the RXFIFO.
 			 */
 
-			s3c_hsotg_handle_outdone(hsotg, idx, false);
+			s3c_hsotg_handle_outdone(dwc2, idx, false);
 		}
 	}
 
-	if (ints & DxEPINT_EPDisbld) {
-		dev_dbg(hsotg->dev, "%s: EPDisbld\n", __func__);
+	if (ints & DXEPINT_EPDISBLD) {
+		dev_dbg(dwc2->dev, "%s: EPDisbld\n", __func__);
 
 		if (dir_in) {
-			int epctl = readl(hsotg->regs + epctl_reg);
+			int epctl = readl(dwc2->regs + epctl_reg);
 
-			s3c_hsotg_txfifo_flush(hsotg, idx);
+			s3c_hsotg_txfifo_flush(dwc2, idx);
 
-			if ((epctl & DxEPCTL_Stall) &&
-				(epctl & DxEPCTL_EPType_Bulk)) {
-				int dctl = readl(hsotg->regs + DCTL);
+			if ((epctl & DXEPCTL_STALL) &&
+				(epctl & DXEPCTL_EPTYPE_BULK)) {
+				int dctl = readl(dwc2->regs + DCTL);
 
-				dctl |= DCTL_CGNPInNAK;
-				writel(dctl, hsotg->regs + DCTL);
+				dctl |= DCTL_CGNPINNAK;
+				writel(dctl, dwc2->regs + DCTL);
 			}
 		}
 	}
 
-	if (ints & DxEPINT_AHBErr)
-		dev_dbg(hsotg->dev, "%s: AHBErr\n", __func__);
+	if (ints & DXEPINT_AHBERR)
+		dev_dbg(dwc2->dev, "%s: AHBErr\n", __func__);
 
-	if (ints & DxEPINT_Setup) {  /* Setup or Timeout */
-		dev_dbg(hsotg->dev, "%s: Setup/Timeout\n",  __func__);
+	if (ints & DXEPINT_SETUP) {  /* Setup or Timeout */
+		dev_dbg(dwc2->dev, "%s: Setup/Timeout\n",  __func__);
 
-		if (using_dma(hsotg) && idx == 0) {
+		if (using_dma(dwc2->s3c_hsotg) && idx == 0) {
 			/*
 			 * this is the notification we've received a
 			 * setup packet. In non-DMA mode we'd get this
@@ -2026,33 +1877,33 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
 			if (dir_in)
 				WARN_ON_ONCE(1);
 			else
-				s3c_hsotg_handle_outdone(hsotg, 0, true);
+				s3c_hsotg_handle_outdone(dwc2, 0, true);
 		}
 	}
 
-	if (ints & DxEPINT_Back2BackSetup)
-		dev_dbg(hsotg->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
+	if (ints & DXEPINT_BACK2BACKSETUP)
+		dev_dbg(dwc2->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
 
 	if (dir_in && !hs_ep->isochronous) {
 		/* not sure if this is important, but we'll clear it anyway */
-		if (ints & DIEPMSK_INTknTXFEmpMsk) {
-			dev_dbg(hsotg->dev, "%s: ep%d: INTknTXFEmpMsk\n",
+		if (ints & DIEPMSK_INTKNTXFEMPMSK) {
+			dev_dbg(dwc2->dev, "%s: ep%d: INTKNTXFEMPMSK\n",
 				__func__, idx);
 		}
 
 		/* this probably means something bad is happening */
-		if (ints & DIEPMSK_INTknEPMisMsk) {
-			dev_warn(hsotg->dev, "%s: ep%d: INTknEP\n",
+		if (ints & DIEPMSK_INTKNEPMISMSK) {
+			dev_warn(dwc2->dev, "%s: ep%d: INTKNEP\n",
 				 __func__, idx);
 		}
 
 		/* FIFO has space or is empty (see GAHBCFG) */
-		if (hsotg->dedicated_fifos &&
-		    ints & DIEPMSK_TxFIFOEmpty) {
-			dev_dbg(hsotg->dev, "%s: ep%d: TxFIFOEmpty\n",
+		if (dwc2->s3c_hsotg->dedicated_fifos &&
+		    ints & DIEPMSK_TXFIFOEMPTY) {
+			dev_dbg(dwc2->dev, "%s: ep%d: TXFIFOEMPTY\n",
 				__func__, idx);
-			if (!using_dma(hsotg))
-				s3c_hsotg_trytx(hsotg, hs_ep);
+			if (!using_dma(dwc2->s3c_hsotg))
+				s3c_hsotg_trytx(dwc2, hs_ep);
 		}
 	}
 }
@@ -2064,9 +1915,9 @@ static void s3c_hsotg_epint(struct s3c_hsotg *hsotg, unsigned int idx,
  * Handle updating the device settings after the enumeration phase has
  * been completed.
  */
-static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
+void s3c_hsotg_irq_enumdone(struct dwc2_hsotg *dwc2)
 {
-	u32 dsts = readl(hsotg->regs + DSTS);
+	u32 dsts = readl(dwc2->regs + DSTS);
 	int ep0_mps = 0, ep_mps;
 
 	/*
@@ -2075,7 +1926,7 @@ static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
 	 * we connected at.
 	 */
 
-	dev_dbg(hsotg->dev, "EnumDone (DSTS=0x%08x)\n", dsts);
+	dev_dbg(dwc2->dev, "EnumDone (DSTS=0x%08x)\n", dsts);
 
 	/*
 	 * note, since we're limited by the size of transfer on EP0, and
@@ -2084,22 +1935,22 @@ static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
 	 */
 
 	/* catch both EnumSpd_FS and EnumSpd_FS48 */
-	switch (dsts & DSTS_EnumSpd_MASK) {
-	case DSTS_EnumSpd_FS:
-	case DSTS_EnumSpd_FS48:
-		hsotg->gadget.speed = USB_SPEED_FULL;
+	switch (dsts & DSTS_ENUMSPD_MASK) {
+	case DSTS_ENUMSPD_FS:
+	case DSTS_ENUMSPD_FS48:
+		dwc2->gadget.speed = USB_SPEED_FULL;
 		ep0_mps = EP0_MPS_LIMIT;
 		ep_mps = 1023;
 		break;
 
-	case DSTS_EnumSpd_HS:
-		hsotg->gadget.speed = USB_SPEED_HIGH;
+	case DSTS_ENUMSPD_HS:
+		dwc2->gadget.speed = USB_SPEED_HIGH;
 		ep0_mps = EP0_MPS_LIMIT;
 		ep_mps = 1024;
 		break;
 
-	case DSTS_EnumSpd_LS:
-		hsotg->gadget.speed = USB_SPEED_LOW;
+	case DSTS_ENUMSPD_LS:
+		dwc2->gadget.speed = USB_SPEED_LOW;
 		/*
 		 * note, we don't actually support LS in this driver at the
 		 * moment, and the documentation seems to imply that it isn't
@@ -2107,8 +1958,8 @@ static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
 		 */
 		break;
 	}
-	dev_info(hsotg->dev, "new device is %s\n",
-		 usb_speed_string(hsotg->gadget.speed));
+	dev_info(dwc2->dev, "new device is %s\n",
+		 usb_speed_string(dwc2->gadget.speed));
 
 	/*
 	 * we should now know the maximum packet size for an
@@ -2117,18 +1968,18 @@ static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
 
 	if (ep0_mps) {
 		int i;
-		s3c_hsotg_set_ep_maxpacket(hsotg, 0, ep0_mps);
-		for (i = 1; i < hsotg->num_of_eps; i++)
-			s3c_hsotg_set_ep_maxpacket(hsotg, i, ep_mps);
+		s3c_hsotg_set_ep_maxpacket(dwc2, 0, ep0_mps);
+		for (i = 1; i < dwc2->s3c_hsotg->num_of_eps; i++)
+			s3c_hsotg_set_ep_maxpacket(dwc2, i, ep_mps);
 	}
 
 	/* ensure after enumeration our EP0 is active */
 
-	s3c_hsotg_enqueue_setup(hsotg);
+	s3c_hsotg_enqueue_setup(dwc2);
 
-	dev_dbg(hsotg->dev, "EP0: DIEPCTL0=0x%08x, DOEPCTL0=0x%08x\n",
-		readl(hsotg->regs + DIEPCTL0),
-		readl(hsotg->regs + DOEPCTL0));
+	dev_dbg(dwc2->dev, "EP0: DIEPCTL0=0x%08x, DOEPCTL0=0x%08x\n",
+		readl(dwc2->regs + DIEPCTL0),
+		readl(dwc2->regs + DOEPCTL0));
 }
 
 /**
@@ -2141,7 +1992,7 @@ static void s3c_hsotg_irq_enumdone(struct s3c_hsotg *hsotg)
  * Go through the requests on the given endpoint and mark them
  * completed with the given result code.
  */
-static void kill_all_requests(struct s3c_hsotg *hsotg,
+void kill_all_requests(struct dwc2_hsotg *dwc2,
 			      struct s3c_hsotg_ep *ep,
 			      int result, bool force)
 {
@@ -2156,24 +2007,14 @@ static void kill_all_requests(struct s3c_hsotg *hsotg,
 		if (ep->req == req && ep->dir_in && !force)
 			continue;
 
-		s3c_hsotg_complete_request(hsotg, ep, req,
+		s3c_hsotg_complete_request(dwc2, ep, req,
 					   result);
 	}
-	if(hsotg->dedicated_fifos)
-		if ((readl(hsotg->regs + DTXFSTS(ep->index)) & 0xffff) * 4 < 3072)
-			s3c_hsotg_txfifo_flush(hsotg, ep->index);
+	if (dwc2->s3c_hsotg->dedicated_fifos)
+		if ((readl(dwc2->regs + DTXFSTS(ep->index)) & 0xffff) * 4 < 3072)
+			s3c_hsotg_txfifo_flush(dwc2, ep->index);
 }
 
-#define call_gadget(_hs, _entry) \
-do { \
-	if ((_hs)->gadget.speed != USB_SPEED_UNKNOWN &&	\
-	    (_hs)->driver && (_hs)->driver->_entry) { \
-		spin_unlock(&_hs->lock); \
-		(_hs)->driver->_entry(&(_hs)->gadget); \
-		spin_lock(&_hs->lock); \
-	} \
-} while (0)
-
 /**
  * s3c_hsotg_disconnect - disconnect service
  * @hsotg: The device state.
@@ -2182,14 +2023,14 @@ do { \
  * transactions and signal the gadget driver that this
  * has happened.
  */
-static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
+void s3c_hsotg_disconnect(struct dwc2_hsotg *dwc2)
 {
 	unsigned ep;
 
-	for (ep = 0; ep < hsotg->num_of_eps; ep++)
-		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
+	for (ep = 0; ep < dwc2->s3c_hsotg->num_of_eps; ep++)
+		kill_all_requests(dwc2, &dwc2->eps[ep], -ESHUTDOWN, true);
 
-	call_gadget(hsotg, disconnect);
+	call_gadget(dwc2, disconnect);
 }
 
 /**
@@ -2197,15 +2038,15 @@ static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg)
  * @hsotg: The device state:
  * @periodic: True if this is a periodic FIFO interrupt
  */
-static void s3c_hsotg_irq_fifoempty(struct s3c_hsotg *hsotg, bool periodic)
+void s3c_hsotg_irq_fifoempty(struct dwc2_hsotg *dwc2, bool periodic)
 {
 	struct s3c_hsotg_ep *ep;
 	int epno, ret;
 
 	/* look through for any more data to transmit */
 
-	for (epno = 0; epno < hsotg->num_of_eps; epno++) {
-		ep = &hsotg->eps[epno];
+	for (epno = 0; epno < dwc2->s3c_hsotg->num_of_eps; epno++) {
+		ep = &dwc2->eps[epno];
 
 		if (!ep->dir_in)
 			continue;
@@ -2214,16 +2055,16 @@ static void s3c_hsotg_irq_fifoempty(struct s3c_hsotg *hsotg, bool periodic)
 		    (!periodic && ep->periodic))
 			continue;
 
-		ret = s3c_hsotg_trytx(hsotg, ep);
+		ret = s3c_hsotg_trytx(dwc2, ep);
 		if (ret < 0)
 			break;
 	}
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
@@ -2231,45 +2072,45 @@ static void s3c_hsotg_irq_fifoempty(struct s3c_hsotg *hsotg, bool periodic)
  *
  * Issue a soft reset to the core, and await the core finishing it.
  */
-static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
+static int s3c_hsotg_corereset(struct dwc2_hsotg *dwc2)
 {
 	int timeout;
 	u32 grstctl;
 
-	dev_dbg(hsotg->dev, "resetting core\n");
+	dev_dbg(dwc2->dev, "resetting core\n");
 
 	/* issue soft reset */
-	writel(GRSTCTL_CSftRst, hsotg->regs + GRSTCTL);
+	writel(GRSTCTL_CSFTRST, dwc2->regs + GRSTCTL);
 
 	timeout = 10000;
 	do {
-		grstctl = readl(hsotg->regs + GRSTCTL);
-	} while ((grstctl & GRSTCTL_CSftRst) && timeout-- > 0);
+		grstctl = readl(dwc2->regs + GRSTCTL);
+	} while ((grstctl & GRSTCTL_CSFTRST) && timeout-- > 0);
 
-	if (grstctl & GRSTCTL_CSftRst) {
-		dev_err(hsotg->dev, "Failed to get CSftRst asserted\n");
+	if (grstctl & GRSTCTL_CSFTRST) {
+		dev_err(dwc2->dev, "Failed to get CSftRst asserted\n");
 		return -EINVAL;
 	}
 
 	timeout = 10000;
 
 	while (1) {
-		u32 grstctl = readl(hsotg->regs + GRSTCTL);
+		u32 grstctl = readl(dwc2->regs + GRSTCTL);
 
 		if (timeout-- < 0) {
-			dev_info(hsotg->dev,
+			dev_info(dwc2->dev,
 				 "%s: reset failed, GRSTCTL=%08x\n",
 				 __func__, grstctl);
 			return -ETIMEDOUT;
 		}
 
-		if (!(grstctl & GRSTCTL_AHBIdle))
+		if (!(grstctl & GRSTCTL_AHBIDLE))
 			continue;
 
 		break;		/* reset done */
 	}
 
-	dev_dbg(hsotg->dev, "reset successful\n");
+	dev_dbg(dwc2->dev, "reset successful\n");
 	return 0;
 }
 
@@ -2279,9 +2120,10 @@ static int s3c_hsotg_corereset(struct s3c_hsotg *hsotg)
  *
  * Issue a soft reset to the core, and await the core finishing it.
  */
-static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
+#if defined(CONFIG_USB_DWC2_DUAL_ROLE) || defined(CONFIG_USB_DWC2_GADGET)
+void s3c_hsotg_core_init(struct dwc2_hsotg *dwc2)
 {
-	s3c_hsotg_corereset(hsotg);
+	s3c_hsotg_corereset(dwc2);
 
 	/*
 	 * we must now enable ep0 ready for host detection and then
@@ -2289,37 +2131,37 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	 */
 
 	/* set the PLL on, remove the HNP/SRP and set the PHY */
-	writel(hsotg->phyif | GUSBCFG_TOutCal(7) |
-	       (0x5 << 10), hsotg->regs + GUSBCFG);
+	writel(dwc2->s3c_hsotg->phyif | GUSBCFG_TOUTCAL(7) |
+	       (0x5 << 10), dwc2->regs + GUSBCFG);
 
-	s3c_hsotg_init_fifo(hsotg);
+	s3c_hsotg_init_fifo(dwc2);
 
-	__orr32(hsotg->regs + DCTL, DCTL_SftDiscon);
+	__orr32(dwc2->regs + DCTL, DCTL_SFTDISCON);
 
-	writel(1 << 18 | DCFG_DevSpd_HS,  hsotg->regs + DCFG);
+	writel(1 << 18 | DCFG_DEVSPD_HS,  dwc2->regs + DCFG);
 
 	/* Clear any pending OTG interrupts */
-	writel(0xffffffff, hsotg->regs + GOTGINT);
+	writel(0xffffffff, dwc2->regs + GOTGINT);
 
 	/* Clear any pending interrupts */
-	writel(0xffffffff, hsotg->regs + GINTSTS);
-
-	writel(GINTSTS_ErlySusp | GINTSTS_SessReqInt |
-	       GINTSTS_GOUTNakEff | GINTSTS_GINNakEff |
-	       GINTSTS_ConIDStsChng | GINTSTS_USBRst |
-	       GINTSTS_EnumDone | GINTSTS_OTGInt |
-	       GINTSTS_USBSusp | GINTSTS_WkUpInt,
-	       hsotg->regs + GINTMSK);
-
-	if (using_dma(hsotg))
-		writel(GAHBCFG_GlblIntrEn | GAHBCFG_DMAEn |
-		       GAHBCFG_HBstLen_Incr4,
-		       hsotg->regs + GAHBCFG);
+	writel(0xffffffff, dwc2->regs + GINTSTS);
+
+	writel(GINTSTS_ERLYSUSP | GINTSTS_SESSREQINT |
+	       GINTSTS_GOUTNAKEFF | GINTSTS_GINNAKEFF |
+	       GINTSTS_CONIDSTSCHNG | GINTSTS_USBRST |
+	       GINTSTS_ENUMDONE | GINTSTS_OTGINT |
+	       GINTSTS_USBSUSP | GINTSTS_WKUPINT,
+	       dwc2->regs + GINTMSK);
+
+	if (using_dma(dwc2->s3c_hsotg))
+		writel(GAHBCFG_GLBL_INTR_EN | GAHBCFG_DMA_EN |
+		       GAHBCFG_HBSTLEN_INCR4,
+		       dwc2->regs + GAHBCFG);
 	else
-		writel(((hsotg->dedicated_fifos) ? (GAHBCFG_NPTxFEmpLvl |
-						    GAHBCFG_PTxFEmpLvl) : 0) |
-		       GAHBCFG_GlblIntrEn,
-		       hsotg->regs + GAHBCFG);
+		writel(((dwc2->s3c_hsotg->dedicated_fifos) ? (GAHBCFG_NP_TXF_EMP_LVL |
+						    GAHBCFG_P_TXF_EMP_LVL) : 0) |
+		       GAHBCFG_GLBL_INTR_EN,
+		       dwc2->regs + GAHBCFG);
 
 	/*
 	 * If INTknTXFEmpMsk is enabled, it's important to disable ep interrupts
@@ -2327,272 +2169,89 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
 	 * interrupts.
 	 */
 
-	writel(((hsotg->dedicated_fifos) ? DIEPMSK_TxFIFOEmpty |
-	       DIEPMSK_INTknTXFEmpMsk : 0) |
-	       DIEPMSK_EPDisbldMsk | DIEPMSK_XferComplMsk |
-	       DIEPMSK_TimeOUTMsk | DIEPMSK_AHBErrMsk |
-	       DIEPMSK_INTknEPMisMsk,
-	       hsotg->regs + DIEPMSK);
+	writel(((dwc2->s3c_hsotg->dedicated_fifos) ? DIEPMSK_TXFIFOEMPTY |
+		DIEPMSK_INTKNTXFEMPMSK : 0) |
+		DIEPMSK_EPDISBLDMSK | DIEPMSK_XFERCOMPLMSK |
+		DIEPMSK_TIMEOUTMSK | DIEPMSK_AHBERRMSK |
+		DIEPMSK_INTKNEPMISMSK,
+		dwc2->regs + DIEPMSK);
 
 	/*
 	 * don't need XferCompl, we get that from RXFIFO in slave mode. In
 	 * DMA mode we may need this.
 	 */
-	writel((using_dma(hsotg) ? (DIEPMSK_XferComplMsk |
-				    DIEPMSK_TimeOUTMsk) : 0) |
-	       DOEPMSK_EPDisbldMsk | DOEPMSK_AHBErrMsk |
-	       DOEPMSK_SetupMsk,
-	       hsotg->regs + DOEPMSK);
+	writel((using_dma(dwc2->s3c_hsotg) ? (DIEPMSK_XFERCOMPLMSK |
+				    DIEPMSK_TIMEOUTMSK) : 0) |
+	       DOEPMSK_EPDISBLDMSK | DOEPMSK_AHBERRMSK |
+	       DOEPMSK_SETUPMSK,
+	       dwc2->regs + DOEPMSK);
 
-	writel(0, hsotg->regs + DAINTMSK);
+	writel(0, dwc2->regs + DAINTMSK);
 
-	dev_dbg(hsotg->dev, "EP0: DIEPCTL0=0x%08x, DOEPCTL0=0x%08x\n",
-		readl(hsotg->regs + DIEPCTL0),
-		readl(hsotg->regs + DOEPCTL0));
+	dev_dbg(dwc2->dev, "EP0: DIEPCTL0=0x%08x, DOEPCTL0=0x%08x\n",
+		readl(dwc2->regs + DIEPCTL0),
+		readl(dwc2->regs + DOEPCTL0));
 
 	/* enable in and out endpoint interrupts */
-	s3c_hsotg_en_gsint(hsotg, GINTSTS_OEPInt | GINTSTS_IEPInt);
+	s3c_hsotg_en_gsint(dwc2, GINTSTS_OEPINT | GINTSTS_IEPINT);
 
 	/*
 	 * Enable the RXFIFO when in slave mode, as this is how we collect
 	 * the data. In DMA mode, we get events from the FIFO but also
 	 * things we cannot process, so do not use it.
 	 */
-	if (!using_dma(hsotg))
-		s3c_hsotg_en_gsint(hsotg, GINTSTS_RxFLvl);
+	if (!using_dma(dwc2->s3c_hsotg))
+		s3c_hsotg_en_gsint(dwc2, GINTSTS_RXFLVL);
 
 	/* Enable interrupts for EP0 in and out */
-	s3c_hsotg_ctrl_epint(hsotg, 0, 0, 1);
-	s3c_hsotg_ctrl_epint(hsotg, 0, 1, 1);
+	s3c_hsotg_ctrl_epint(dwc2, 0, 0, 1);
+	s3c_hsotg_ctrl_epint(dwc2, 0, 1, 1);
 
-	__orr32(hsotg->regs + DCTL, DCTL_PWROnPrgDone);
+	__orr32(dwc2->regs + DCTL, DCTL_PWRONPRGDONE);
 	udelay(10);  /* see openiboot */
-	__bic32(hsotg->regs + DCTL, DCTL_PWROnPrgDone);
+	__bic32(dwc2->regs + DCTL, DCTL_PWRONPRGDONE);
 
-	dev_dbg(hsotg->dev, "DCTL=0x%08x\n", readl(hsotg->regs + DCTL));
+	dev_dbg(dwc2->dev, "DCTL=0x%08x\n", readl(dwc2->regs + DCTL));
 
 	/*
-	 * DxEPCTL_USBActEp says RO in manual, but seems to be set by
+	 * DXEPCTL_USBActEp says RO in manual, but seems to be set by
 	 * writing to the EPCTL register..
 	 */
 
 	/* set to read 1 8byte packet */
-	writel(DxEPTSIZ_MC(1) | DxEPTSIZ_PktCnt(1) |
-	       DxEPTSIZ_XferSize(8), hsotg->regs + DOEPTSIZ0);
+	writel(DXEPTSIZ_MC(1) | DXEPTSIZ_PKTCNT(1) |
+	       DXEPTSIZ_XFERSIZE(8), dwc2->regs + DOEPTSIZ0);
 
-	writel(s3c_hsotg_ep0_mps(hsotg->eps[0].ep.maxpacket) |
-	       DxEPCTL_CNAK | DxEPCTL_EPEna |
-	       DxEPCTL_USBActEp,
-	       hsotg->regs + DOEPCTL0);
+	writel(s3c_hsotg_ep0_mps(dwc2->eps[0].ep.maxpacket) |
+	       DXEPCTL_CNAK | DXEPCTL_EPENA |
+	       DXEPCTL_USBACTEP,
+	       dwc2->regs + DOEPCTL0);
 
 	/* enable, but don't activate EP0in */
-	writel(s3c_hsotg_ep0_mps(hsotg->eps[0].ep.maxpacket) |
-	       DxEPCTL_USBActEp, hsotg->regs + DIEPCTL0);
+	writel(s3c_hsotg_ep0_mps(dwc2->eps[0].ep.maxpacket) |
+	       DXEPCTL_USBACTEP, dwc2->regs + DIEPCTL0);
 
-	s3c_hsotg_enqueue_setup(hsotg);
+	s3c_hsotg_enqueue_setup(dwc2);
 
-	dev_dbg(hsotg->dev, "EP0: DIEPCTL0=0x%08x, DOEPCTL0=0x%08x\n",
-		readl(hsotg->regs + DIEPCTL0),
-		readl(hsotg->regs + DOEPCTL0));
+	dev_dbg(dwc2->dev, "EP0: DIEPCTL0=0x%08x, DOEPCTL0=0x%08x\n",
+		readl(dwc2->regs + DIEPCTL0),
+		readl(dwc2->regs + DOEPCTL0));
 
 	/* clear global NAKs */
-	writel(DCTL_CGOUTNak | DCTL_CGNPInNAK,
-	       hsotg->regs + DCTL);
+	writel(DCTL_CGOUTNAK | DCTL_CGNPINNAK,
+	       dwc2->regs + DCTL);
 
 	/* must be at-least 3ms to allow bus to see disconnect */
 	mdelay(3);
 
 	/* remove the soft-disconnect and let's go */
-	__bic32(hsotg->regs + DCTL, DCTL_SftDiscon);
+	__bic32(dwc2->regs + DCTL, DCTL_SFTDISCON);
 }
-
-/**
- * s3c_hsotg_irq - handle device interrupt
- * @irq: The IRQ number triggered
- * @pw: The pw value when registered the handler.
- */
-static irqreturn_t s3c_hsotg_irq(int irq, void *pw)
+#else
+void s3c_hsotg_core_init(struct dwc2_hsotg *dwc2)
 {
-	struct s3c_hsotg *hsotg = pw;
-	int retry_count = 8;
-	u32 gintsts;
-	u32 gintmsk;
-
-	spin_lock(&hsotg->lock);
-irq_retry:
-	gintsts = readl(hsotg->regs + GINTSTS);
-	gintmsk = readl(hsotg->regs + GINTMSK);
-
-	dev_dbg(hsotg->dev, "%s: %08x %08x (%08x) retry %d\n",
-		__func__, gintsts, gintsts & gintmsk, gintmsk, retry_count);
-
-	gintsts &= gintmsk;
-
-	if (gintsts & GINTSTS_OTGInt) {
-		u32 otgint = readl(hsotg->regs + GOTGINT);
-
-		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
-
-		writel(otgint, hsotg->regs + GOTGINT);
-	}
-
-	if (gintsts & GINTSTS_SessReqInt) {
-		dev_dbg(hsotg->dev, "%s: SessReqInt\n", __func__);
-		writel(GINTSTS_SessReqInt, hsotg->regs + GINTSTS);
-	}
-
-	if (gintsts & GINTSTS_EnumDone) {
-		writel(GINTSTS_EnumDone, hsotg->regs + GINTSTS);
-
-		s3c_hsotg_irq_enumdone(hsotg);
-	}
-
-	if (gintsts & GINTSTS_ConIDStsChng) {
-		dev_dbg(hsotg->dev, "ConIDStsChg (DSTS=0x%08x, GOTCTL=%08x)\n",
-			readl(hsotg->regs + DSTS),
-			readl(hsotg->regs + GOTGCTL));
-
-		writel(GINTSTS_ConIDStsChng, hsotg->regs + GINTSTS);
-	}
-
-	if (gintsts & (GINTSTS_OEPInt | GINTSTS_IEPInt)) {
-		u32 daint = readl(hsotg->regs + DAINT);
-		u32 daintmsk = readl(hsotg->regs + DAINTMSK);
-		u32 daint_out, daint_in;
-		int ep;
-
-		daint &= daintmsk;
-		daint_out = daint >> DAINT_OutEP_SHIFT;
-		daint_in = daint & ~(daint_out << DAINT_OutEP_SHIFT);
-
-		dev_dbg(hsotg->dev, "%s: daint=%08x\n", __func__, daint);
-
-		for (ep = 0; ep < 15 && daint_out; ep++, daint_out >>= 1) {
-			if (daint_out & 1)
-				s3c_hsotg_epint(hsotg, ep, 0);
-		}
-
-		for (ep = 0; ep < 15 && daint_in; ep++, daint_in >>= 1) {
-			if (daint_in & 1)
-				s3c_hsotg_epint(hsotg, ep, 1);
-		}
-	}
-
-	if (gintsts & GINTSTS_USBRst) {
-
-		u32 usb_status = readl(hsotg->regs + GOTGCTL);
-
-		dev_info(hsotg->dev, "%s: USBRst\n", __func__);
-		dev_dbg(hsotg->dev, "GNPTXSTS=%08x\n",
-			readl(hsotg->regs + GNPTXSTS));
-
-		writel(GINTSTS_USBRst, hsotg->regs + GINTSTS);
-
-		if (usb_status & GOTGCTL_BSESVLD) {
-			if (time_after(jiffies, hsotg->last_rst +
-				       msecs_to_jiffies(200))) {
-
-				kill_all_requests(hsotg, &hsotg->eps[0],
-							  -ECONNRESET, true);
-
-				s3c_hsotg_core_init(hsotg);
-				hsotg->last_rst = jiffies;
-			}
-		}
-	}
-
-	/* check both FIFOs */
-
-	if (gintsts & GINTSTS_NPTxFEmp) {
-		dev_dbg(hsotg->dev, "NPTxFEmp\n");
-
-		/*
-		 * Disable the interrupt to stop it happening again
-		 * unless one of these endpoint routines decides that
-		 * it needs re-enabling
-		 */
-
-		s3c_hsotg_disable_gsint(hsotg, GINTSTS_NPTxFEmp);
-		s3c_hsotg_irq_fifoempty(hsotg, false);
-	}
-
-	if (gintsts & GINTSTS_PTxFEmp) {
-		dev_dbg(hsotg->dev, "PTxFEmp\n");
-
-		/* See note in GINTSTS_NPTxFEmp */
-
-		s3c_hsotg_disable_gsint(hsotg, GINTSTS_PTxFEmp);
-		s3c_hsotg_irq_fifoempty(hsotg, true);
-	}
-
-	if (gintsts & GINTSTS_RxFLvl) {
-		/*
-		 * note, since GINTSTS_RxFLvl doubles as FIFO-not-empty,
-		 * we need to retry s3c_hsotg_handle_rx if this is still
-		 * set.
-		 */
-
-		s3c_hsotg_handle_rx(hsotg);
-	}
-
-	if (gintsts & GINTSTS_ModeMis) {
-		dev_warn(hsotg->dev, "warning, mode mismatch triggered\n");
-		writel(GINTSTS_ModeMis, hsotg->regs + GINTSTS);
-	}
-
-	if (gintsts & GINTSTS_USBSusp) {
-		dev_info(hsotg->dev, "GINTSTS_USBSusp\n");
-		writel(GINTSTS_USBSusp, hsotg->regs + GINTSTS);
-
-		call_gadget(hsotg, suspend);
-	}
-
-	if (gintsts & GINTSTS_WkUpInt) {
-		dev_info(hsotg->dev, "GINTSTS_WkUpIn\n");
-		writel(GINTSTS_WkUpInt, hsotg->regs + GINTSTS);
-
-		call_gadget(hsotg, resume);
-	}
-
-	if (gintsts & GINTSTS_ErlySusp) {
-		dev_dbg(hsotg->dev, "GINTSTS_ErlySusp\n");
-		writel(GINTSTS_ErlySusp, hsotg->regs + GINTSTS);
-	}
-
-	/*
-	 * these next two seem to crop-up occasionally causing the core
-	 * to shutdown the USB transfer, so try clearing them and logging
-	 * the occurrence.
-	 */
-
-	if (gintsts & GINTSTS_GOUTNakEff) {
-		dev_info(hsotg->dev, "GOUTNakEff triggered\n");
-
-		writel(DCTL_CGOUTNak, hsotg->regs + DCTL);
-
-		s3c_hsotg_dump(hsotg);
-	}
-
-	if (gintsts & GINTSTS_GINNakEff) {
-		dev_info(hsotg->dev, "GINNakEff triggered\n");
-
-		writel(DCTL_CGNPInNAK, hsotg->regs + DCTL);
-
-		s3c_hsotg_dump(hsotg);
-	}
-
-	/*
-	 * if we've had fifo events, we should try and go around the
-	 * loop again to see if there's any point in returning yet.
-	 */
-
-	if (gintsts & IRQ_RETRY_MASK && --retry_count > 0)
-			goto irq_retry;
-
-	spin_unlock(&hsotg->lock);
-
-	return IRQ_HANDLED;
 }
+#endif
 
 /**
  * s3c_hsotg_ep_enable - enable the given endpoint
@@ -2605,7 +2264,7 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 			       const struct usb_endpoint_descriptor *desc)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	unsigned long flags;
 	int index = hs_ep->index;
 	u32 epctrl_reg;
@@ -2614,17 +2273,17 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	int dir_in;
 	int ret = 0;
 
-	dev_dbg(hsotg->dev,
+	/*dev_info(dwc2->dev,
 		"%s: ep %s: a 0x%02x, attr 0x%02x, mps 0x%04x, intr %d\n",
 		__func__, ep->name, desc->bEndpointAddress, desc->bmAttributes,
 		desc->wMaxPacketSize, desc->bInterval);
-
+	*/
 	/* not to be called for EP0 */
 	WARN_ON(index == 0);
 
 	dir_in = (desc->bEndpointAddress & USB_ENDPOINT_DIR_MASK) ? 1 : 0;
 	if (dir_in != hs_ep->dir_in) {
-		dev_err(hsotg->dev, "%s: direction mismatch!\n", __func__);
+		dev_err(dwc2->dev, "%s: direction mismatch!\n", __func__);
 		return -EINVAL;
 	}
 
@@ -2633,21 +2292,21 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	/* note, we handle this here instead of s3c_hsotg_set_ep_maxpacket */
 
 	epctrl_reg = dir_in ? DIEPCTL(index) : DOEPCTL(index);
-	epctrl = readl(hsotg->regs + epctrl_reg);
+	epctrl = readl(dwc2->regs + epctrl_reg);
 
-	dev_dbg(hsotg->dev, "%s: read DxEPCTL=0x%08x from 0x%08x\n",
+	/*dev_info(dwc2->dev, "%s: read DXEPCTL=0x%08x from 0x%08x\n",
 		__func__, epctrl, epctrl_reg);
+	*/
+	spin_lock_irqsave(&dwc2->lock, flags);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-
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
@@ -2656,10 +2315,10 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	 * size register hasn't been set.
 	 */
 
-	epctrl |= DxEPCTL_SNAK;
+	epctrl |= DXEPCTL_SNAK;
 
 	/* update the endpoint state */
-	s3c_hsotg_set_ep_maxpacket(hsotg, hs_ep->index, mps);
+	s3c_hsotg_set_ep_maxpacket(dwc2, hs_ep->index, mps);
 
 	/* default, set to non-periodic */
 	hs_ep->isochronous = 0;
@@ -2668,19 +2327,19 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	hs_ep->interval = desc->bInterval;
 
 	if (hs_ep->interval > 1 && hs_ep->mc > 1)
-		dev_err(hsotg->dev, "MC > 1 when interval is not 1\n");
+		dev_err(dwc2->dev, "MC > 1 when interval is not 1\n");
 
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
@@ -2693,14 +2352,14 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
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
 
@@ -2708,24 +2367,24 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 	 * if the hardware has dedicated fifos, we must give each IN EP
 	 * a unique tx-fifo even if it is non-periodic.
 	 */
-	if (dir_in && hsotg->dedicated_fifos)
-		epctrl |= DxEPCTL_TxFNum(index);
+	if (dir_in && dwc2->s3c_hsotg->dedicated_fifos)
+		epctrl |= DXEPCTL_TXFNUM(index);
 
 	/* for non control endpoints, set PID to D0 */
 	if (index)
-		epctrl |= DxEPCTL_SetD0PID;
+		epctrl |= DXEPCTL_SETD0PID;
 
-	dev_dbg(hsotg->dev, "%s: write DxEPCTL=0x%08x\n",
+	/*dev_info(dwc2->dev, "%s: write DXEPCTL=0x%08x\n",
 		__func__, epctrl);
-
-	writel(epctrl, hsotg->regs + epctrl_reg);
-	dev_dbg(hsotg->dev, "%s: read DxEPCTL=0x%08x\n",
-		__func__, readl(hsotg->regs + epctrl_reg));
-
+	*/
+	writel(epctrl, dwc2->regs + epctrl_reg);
+	/*dev_info(dwc2->dev, "%s: read DXEPCTL=0x%08x\n",
+		__func__, readl(dwc2->regs + epctrl_reg));
+	*/
 	/* enable the endpoint interrupt */
-	s3c_hsotg_ctrl_epint(hsotg, index, dir_in, 1);
+	s3c_hsotg_ctrl_epint(dwc2, index, dir_in, 1);
 
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 	return ret;
 }
 
@@ -2736,39 +2395,39 @@ static int s3c_hsotg_ep_enable(struct usb_ep *ep,
 static int s3c_hsotg_ep_disable(struct usb_ep *ep)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hsotg = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	int dir_in = hs_ep->dir_in;
 	int index = hs_ep->index;
 	unsigned long flags;
 	u32 epctrl_reg;
 	u32 ctrl;
 
-	dev_info(hsotg->dev, "%s(ep %p)\n", __func__, ep);
+	dev_info(dwc2->dev, "%s(ep %p)\n", __func__, ep);
 
-	if (ep == &hsotg->eps[0].ep) {
-		dev_err(hsotg->dev, "%s: called for ep0\n", __func__);
+	if (ep == &dwc2->eps[0].ep) {
+		dev_err(dwc2->dev, "%s: called for ep0\n", __func__);
 		return -EINVAL;
 	}
 
 	epctrl_reg = dir_in ? DIEPCTL(index) : DOEPCTL(index);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 	/* terminate all requests with shutdown */
-	kill_all_requests(hsotg, hs_ep, -ESHUTDOWN, false);
+	kill_all_requests(dwc2, hs_ep, -ESHUTDOWN, false);
 
 
-	ctrl = readl(hsotg->regs + epctrl_reg);
-	ctrl &= ~DxEPCTL_EPEna;
-	ctrl &= ~DxEPCTL_USBActEp;
-	ctrl |= DxEPCTL_SNAK;
+	ctrl = readl(dwc2->regs + epctrl_reg);
+	ctrl &= ~DXEPCTL_EPENA;
+	ctrl &= ~DXEPCTL_USBACTEP;
+	ctrl |= DXEPCTL_SNAK;
 
-	dev_dbg(hsotg->dev, "%s: DxEPCTL=0x%08x\n", __func__, ctrl);
-	writel(ctrl, hsotg->regs + epctrl_reg);
+	dev_dbg(dwc2->dev, "%s: DXEPCTL=0x%08x\n", __func__, ctrl);
+	writel(ctrl, dwc2->regs + epctrl_reg);
 
 	/* disable endpoint interrupts */
-	s3c_hsotg_ctrl_epint(hsotg, hs_ep->index, hs_ep->dir_in, 0);
+	s3c_hsotg_ctrl_epint(dwc2, hs_ep->index, hs_ep->dir_in, 0);
 
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 	return 0;
 }
 
@@ -2798,20 +2457,20 @@ static int s3c_hsotg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
 	struct s3c_hsotg_req *hs_req = our_req(req);
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hs = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	unsigned long flags;
 
-	dev_info(hs->dev, "ep_dequeue(%p,%p)\n", ep, req);
+	dev_info(dwc2->dev, "ep_dequeue(%p,%p)\n", ep, req);
 
-	spin_lock_irqsave(&hs->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 
 	if (!on_list(hs_ep, hs_req)) {
-		spin_unlock_irqrestore(&hs->lock, flags);
+		spin_unlock_irqrestore(&dwc2->lock, flags);
 		return -EINVAL;
 	}
 
-	s3c_hsotg_complete_request(hs, hs_ep, hs_req, -ECONNRESET);
-	spin_unlock_irqrestore(&hs->lock, flags);
+	s3c_hsotg_complete_request(dwc2, hs_ep, hs_req, -ECONNRESET);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 
 	return 0;
 }
@@ -2824,47 +2483,47 @@ static int s3c_hsotg_ep_dequeue(struct usb_ep *ep, struct usb_request *req)
 static int s3c_hsotg_ep_sethalt(struct usb_ep *ep, int value)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hs = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	int index = hs_ep->index;
 	u32 epreg;
 	u32 epctl;
 	u32 xfertype;
 
-	dev_info(hs->dev, "%s(ep %p %s, %d)\n", __func__, ep, ep->name, value);
+	dev_dbg(dwc2->dev, "%s(ep %p %s, %d)\n", __func__, ep, ep->name, value);
 
 	/* write both IN and OUT control registers */
 
 	epreg = DIEPCTL(index);
-	epctl = readl(hs->regs + epreg);
+	epctl = readl(dwc2->regs + epreg);
 
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
 
-	writel(epctl, hs->regs + epreg);
+	writel(epctl, dwc2->regs + epreg);
 
 	epreg = DOEPCTL(index);
-	epctl = readl(hs->regs + epreg);
+	epctl = readl(dwc2->regs + epreg);
 
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
 
-	writel(epctl, hs->regs + epreg);
+	writel(epctl, dwc2->regs + epreg);
 
 	hs_ep->halted = value;
 
@@ -2879,13 +2538,13 @@ static int s3c_hsotg_ep_sethalt(struct usb_ep *ep, int value)
 static int s3c_hsotg_ep_sethalt_lock(struct usb_ep *ep, int value)
 {
 	struct s3c_hsotg_ep *hs_ep = our_ep(ep);
-	struct s3c_hsotg *hs = hs_ep->parent;
+	struct dwc2_hsotg *dwc2 = hs_ep->parent;
 	unsigned long flags = 0;
 	int ret = 0;
 
-	spin_lock_irqsave(&hs->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 	ret = s3c_hsotg_ep_sethalt(ep, value);
-	spin_unlock_irqrestore(&hs->lock, flags);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 
 	return ret;
 }
@@ -2908,19 +2567,18 @@ static struct usb_ep_ops s3c_hsotg_ep_ops = {
  * A wrapper for platform code responsible for controlling
  * low-level USB code
  */
-static void s3c_hsotg_phy_enable(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_phy_enable(struct dwc2_hsotg *dwc2)
 {
-	struct platform_device *pdev = to_platform_device(hsotg->dev);
+	struct platform_device *pdev = to_platform_device(dwc2->dev);
 
-	dev_dbg(hsotg->dev, "pdev 0x%p\n", pdev);
-
-	if (hsotg->phy) {
-		phy_init(hsotg->phy);
-		phy_power_on(hsotg->phy);
-	} else if (hsotg->uphy)
-		usb_phy_init(hsotg->uphy);
-	else if (hsotg->plat->phy_init)
-		hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
+	dev_dbg(dwc2->dev, "pdev 0x%p\n", pdev);
+	if (dwc2->s3c_hsotg->phy) {
+		phy_init(dwc2->s3c_hsotg->phy);
+		phy_power_on(dwc2->s3c_hsotg->phy);
+	} else if (dwc2->s3c_hsotg->uphy)
+		usb_phy_init(dwc2->s3c_hsotg->uphy);
+	else if (dwc2->s3c_hsotg->plat->phy_init)
+		dwc2->s3c_hsotg->plat->phy_init(pdev, dwc2->s3c_hsotg->plat->phy_type);
 }
 
 /**
@@ -2930,60 +2588,60 @@ static void s3c_hsotg_phy_enable(struct s3c_hsotg *hsotg)
  * A wrapper for platform code responsible for controlling
  * low-level USB code
  */
-static void s3c_hsotg_phy_disable(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_phy_disable(struct dwc2_hsotg *dwc2)
 {
-	struct platform_device *pdev = to_platform_device(hsotg->dev);
+	struct platform_device *pdev = to_platform_device(dwc2->dev);
 
-	if (hsotg->phy) {
-		phy_power_off(hsotg->phy);
-		phy_exit(hsotg->phy);
-	} else if (hsotg->uphy)
-		usb_phy_shutdown(hsotg->uphy);
-	else if (hsotg->plat->phy_exit)
-		hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
+	if (dwc2->s3c_hsotg->phy) {
+		phy_power_off(dwc2->s3c_hsotg->phy);
+		phy_exit(dwc2->s3c_hsotg->phy);
+	} else if (dwc2->s3c_hsotg->uphy)
+		usb_phy_shutdown(dwc2->s3c_hsotg->uphy);
+	else if (dwc2->s3c_hsotg->plat->phy_exit)
+		dwc2->s3c_hsotg->plat->phy_exit(pdev, dwc2->s3c_hsotg->plat->phy_type);
 }
 
 /**
  * s3c_hsotg_init - initalize the usb core
  * @hsotg: The driver state
  */
-static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_init(struct dwc2_hsotg *dwc2)
 {
 	/* unmask subset of endpoint interrupts */
 
-	writel(DIEPMSK_TimeOUTMsk | DIEPMSK_AHBErrMsk |
-	       DIEPMSK_EPDisbldMsk | DIEPMSK_XferComplMsk,
-	       hsotg->regs + DIEPMSK);
+	writel(DIEPMSK_TIMEOUTMSK | DIEPMSK_AHBERRMSK |
+	       DIEPMSK_EPDISBLDMSK | DIEPMSK_XFERCOMPLMSK,
+	       dwc2->regs + DIEPMSK);
 
-	writel(DOEPMSK_SetupMsk | DOEPMSK_AHBErrMsk |
-	       DOEPMSK_EPDisbldMsk | DOEPMSK_XferComplMsk,
-	       hsotg->regs + DOEPMSK);
+	writel(DOEPMSK_SETUPMSK | DOEPMSK_AHBERRMSK |
+	       DOEPMSK_EPDISBLDMSK | DOEPMSK_XFERCOMPLMSK,
+	       dwc2->regs + DOEPMSK);
 
-	writel(0, hsotg->regs + DAINTMSK);
+	writel(0, dwc2->regs + DAINTMSK);
 
 	/* Be in disconnected state until gadget is registered */
-	__orr32(hsotg->regs + DCTL, DCTL_SftDiscon);
+	__orr32(dwc2->regs + DCTL, DCTL_SFTDISCON);
 
 	if (0) {
 		/* post global nak until we're ready */
-		writel(DCTL_SGNPInNAK | DCTL_SGOUTNak,
-		       hsotg->regs + DCTL);
+		writel(DCTL_SGNPINNAK | DCTL_SGOUTNAK,
+		       dwc2->regs + DCTL);
 	}
 
 	/* setup fifos */
 
-	dev_dbg(hsotg->dev, "GRXFSIZ=0x%08x, GNPTXFSIZ=0x%08x\n",
-		readl(hsotg->regs + GRXFSIZ),
-		readl(hsotg->regs + GNPTXFSIZ));
+	dev_dbg(dwc2->dev, "GRXFSIZ=0x%08x, GNPTXFSIZ=0x%08x\n",
+		readl(dwc2->regs + GRXFSIZ),
+		readl(dwc2->regs + GNPTXFSIZ));
 
-	s3c_hsotg_init_fifo(hsotg);
+	s3c_hsotg_init_fifo(dwc2);
 
 	/* set the PLL on, remove the HNP/SRP and set the PHY */
-	writel(GUSBCFG_PHYIf16 | GUSBCFG_TOutCal(7) | (0x5 << 10),
-	       hsotg->regs + GUSBCFG);
+	writel(GUSBCFG_PHYIF16 | GUSBCFG_TOUTCAL(7) | (0x5 << 10),
+	       dwc2->regs + GUSBCFG);
 
-	writel(using_dma(hsotg) ? GAHBCFG_DMAEn : 0x0,
-	       hsotg->regs + GAHBCFG);
+	writel(using_dma(dwc2->s3c_hsotg) ? GAHBCFG_DMA_EN : 0x0,
+	       dwc2->regs + GAHBCFG);
 }
 
 /**
@@ -2997,47 +2655,47 @@ static void s3c_hsotg_init(struct s3c_hsotg *hsotg)
 static int s3c_hsotg_udc_start(struct usb_gadget *gadget,
 			   struct usb_gadget_driver *driver)
 {
-	struct s3c_hsotg *hsotg = to_hsotg(gadget);
+	struct dwc2_hsotg *dwc2 = to_hsotg(gadget);
 	int ret;
 
-	if (!hsotg) {
+	if (!dwc2) {
 		pr_err("%s: called with no device\n", __func__);
 		return -ENODEV;
 	}
 
 	if (!driver) {
-		dev_err(hsotg->dev, "%s: no driver\n", __func__);
+		dev_err(dwc2->dev, "%s: no driver\n", __func__);
 		return -EINVAL;
 	}
 
 	if (driver->max_speed < USB_SPEED_FULL)
-		dev_err(hsotg->dev, "%s: bad speed\n", __func__);
+		dev_err(dwc2->dev, "%s: bad speed\n", __func__);
 
 	if (!driver->setup) {
-		dev_err(hsotg->dev, "%s: missing entry points\n", __func__);
+		dev_err(dwc2->dev, "%s: missing entry points\n", __func__);
 		return -EINVAL;
 	}
 
-	WARN_ON(hsotg->driver);
+	WARN_ON(dwc2->driver);
 
 	driver->driver.bus = NULL;
-	hsotg->driver = driver;
-	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
-	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+	dwc2->driver = driver;
+	dwc2->gadget.dev.of_node = dwc2->dev->of_node;
+	dwc2->gadget.speed = USB_SPEED_UNKNOWN;
+	ret = regulator_bulk_enable(ARRAY_SIZE(dwc2->s3c_hsotg->supplies),
+				    dwc2->s3c_hsotg->supplies);
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-				    hsotg->supplies);
 	if (ret) {
-		dev_err(hsotg->dev, "failed to enable supplies: %d\n", ret);
+		dev_err(dwc2->dev, "failed to enable supplies: %d\n", ret);
 		goto err;
 	}
 
-	hsotg->last_rst = jiffies;
-	dev_info(hsotg->dev, "bound driver %s\n", driver->driver.name);
+	dwc2->s3c_hsotg->last_rst = jiffies;
+	dev_info(dwc2->dev, "bound driver %s\n", driver->driver.name);
 	return 0;
 
 err:
-	hsotg->driver = NULL;
+	dwc2->driver = NULL;
 	return ret;
 }
 
@@ -3051,29 +2709,29 @@ err:
 static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 			  struct usb_gadget_driver *driver)
 {
-	struct s3c_hsotg *hsotg = to_hsotg(gadget);
+	struct dwc2_hsotg *dwc2 = to_hsotg(gadget);
 	unsigned long flags = 0;
 	int ep;
 
-	if (!hsotg)
+	if (!dwc2)
 		return -ENODEV;
 
 	/* all endpoints should be shutdown */
-	for (ep = 0; ep < hsotg->num_of_eps; ep++)
-		s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
+	for (ep = 0; ep < dwc2->s3c_hsotg->num_of_eps; ep++)
+		s3c_hsotg_ep_disable(&dwc2->eps[ep].ep);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 
-	s3c_hsotg_phy_disable(hsotg);
+	s3c_hsotg_phy_disable(dwc2);
 
 	if (!driver)
-		hsotg->driver = NULL;
+		dwc2->driver = NULL;
 
-	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
+	dwc2->gadget.speed = USB_SPEED_UNKNOWN;
 
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 
-	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(dwc2->s3c_hsotg->supplies), dwc2->s3c_hsotg->supplies);
 
 	return 0;
 }
@@ -3098,22 +2756,22 @@ static int s3c_hsotg_gadget_getframe(struct usb_gadget *gadget)
  */
 static int s3c_hsotg_pullup(struct usb_gadget *gadget, int is_on)
 {
-	struct s3c_hsotg *hsotg = to_hsotg(gadget);
+	struct dwc2_hsotg *dwc2 = to_hsotg(gadget);
 	unsigned long flags = 0;
 
-	dev_dbg(hsotg->dev, "%s: is_in: %d\n", __func__, is_on);
+	dev_dbg(dwc2->dev, "%s: is_in: %d\n", __func__, is_on);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 	if (is_on) {
-		s3c_hsotg_phy_enable(hsotg);
-		s3c_hsotg_core_init(hsotg);
+		s3c_hsotg_phy_enable(dwc2);
+		s3c_hsotg_core_init(dwc2);
 	} else {
-		s3c_hsotg_disconnect(hsotg);
-		s3c_hsotg_phy_disable(hsotg);
+		s3c_hsotg_disconnect(dwc2);
+		s3c_hsotg_phy_disable(dwc2);
 	}
 
-	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+	dwc2->gadget.speed = USB_SPEED_UNKNOWN;
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 
 	return 0;
 }
@@ -3135,7 +2793,7 @@ static const struct usb_gadget_ops s3c_hsotg_gadget_ops = {
  * creation) to give to the gadget driver. Setup the endpoint name, any
  * direction information and other state that may be required.
  */
-static void s3c_hsotg_initep(struct s3c_hsotg *hsotg,
+static void s3c_hsotg_initep(struct dwc2_hsotg *dwc2,
 				       struct s3c_hsotg_ep *hs_ep,
 				       int epnum)
 {
@@ -3160,9 +2818,9 @@ static void s3c_hsotg_initep(struct s3c_hsotg *hsotg,
 
 	/* add to the list of endpoints known by the gadget driver */
 	if (epnum)
-		list_add_tail(&hs_ep->ep.ep_list, &hsotg->gadget.ep_list);
+		list_add_tail(&hs_ep->ep.ep_list, &dwc2->gadget.ep_list);
 
-	hs_ep->parent = hsotg;
+	hs_ep->parent = dwc2;
 	hs_ep->ep.name = hs_ep->name;
 	usb_ep_set_maxpacket_limit(&hs_ep->ep, epnum ? 1024 : EP0_MPS_LIMIT);
 	hs_ep->ep.ops = &s3c_hsotg_ep_ops;
@@ -3173,18 +2831,18 @@ static void s3c_hsotg_initep(struct s3c_hsotg *hsotg,
 	 * code is changed to make each endpoint's direction changeable.
 	 */
 
-	ptxfifo = readl(hsotg->regs + DPTXFSIZn(epnum));
-	hs_ep->fifo_size = DPTXFSIZn_DPTxFSize_GET(ptxfifo) * 4;
+	ptxfifo = readl(dwc2->regs + DPTXFSIZN(epnum));
+	hs_ep->fifo_size = DPTXFSIZN_DPTXFSIZE_GET(ptxfifo) * 4;
 
 	/*
 	 * if we're using dma, we need to set the next-endpoint pointer
 	 * to be something valid.
 	 */
 
-	if (using_dma(hsotg)) {
-		u32 next = DxEPCTL_NextEp((epnum + 1) % 15);
-		writel(next, hsotg->regs + DIEPCTL(epnum));
-		writel(next, hsotg->regs + DOEPCTL(epnum));
+	if (using_dma(dwc2->s3c_hsotg)) {
+		u32 next = DXEPCTL_NEXTEP((epnum + 1) % 15);
+		writel(next, dwc2->regs + DIEPCTL(epnum));
+		writel(next, dwc2->regs + DOEPCTL(epnum));
 	}
 }
 
@@ -3194,32 +2852,32 @@ static void s3c_hsotg_initep(struct s3c_hsotg *hsotg,
  *
  * Read the USB core HW configuration registers
  */
-static void s3c_hsotg_hw_cfg(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_hw_cfg(struct dwc2_hsotg *dwc2)
 {
 	u32 cfg2, cfg4;
 	/* check hardware configuration */
 
-	cfg2 = readl(hsotg->regs + 0x48);
-	hsotg->num_of_eps = (cfg2 >> 10) & 0xF;
+	cfg2 = readl(dwc2->regs + 0x48);
+	dwc2->s3c_hsotg->num_of_eps = (cfg2 >> 10) & 0xF;
 
-	dev_info(hsotg->dev, "EPs:%d\n", hsotg->num_of_eps);
+	dev_info(dwc2->dev, "EPs:%d\n", dwc2->s3c_hsotg->num_of_eps);
 
-	cfg4 = readl(hsotg->regs + 0x50);
-	hsotg->dedicated_fifos = (cfg4 >> 25) & 1;
+	cfg4 = readl(dwc2->regs + 0x50);
+	dwc2->s3c_hsotg->dedicated_fifos = (cfg4 >> 25) & 1;
 
-	dev_info(hsotg->dev, "%s fifos\n",
-		 hsotg->dedicated_fifos ? "dedicated" : "shared");
+	dev_info(dwc2->dev, "%s fifos\n",
+		 dwc2->s3c_hsotg->dedicated_fifos ? "dedicated" : "shared");
 }
 
 /**
  * s3c_hsotg_dump - dump state of the udc
  * @param: The device state
  */
-static void s3c_hsotg_dump(struct s3c_hsotg *hsotg)
+void s3c_hsotg_dump(struct dwc2_hsotg *dwc2)
 {
 #ifdef DEBUG
-	struct device *dev = hsotg->dev;
-	void __iomem *regs = hsotg->regs;
+	struct device *dev = dwc2->dev;
+	void __iomem *regs = dwc2->regs;
 	u32 val;
 	int idx;
 
@@ -3236,10 +2894,10 @@ static void s3c_hsotg_dump(struct s3c_hsotg *hsotg)
 	/* show periodic fifo settings */
 
 	for (idx = 1; idx <= 15; idx++) {
-		val = readl(regs + DPTXFSIZn(idx));
+		val = readl(regs + DPTXFSIZN(idx));
 		dev_info(dev, "DPTx[%d] FSize=%d, StAddr=0x%08x\n", idx,
-			 val >> DPTXFSIZn_DPTxFSize_SHIFT,
-			 val & DPTXFSIZn_DPTxFStAddr_MASK);
+			 val >> FIFOSIZE_DEPTH_SHIFT,
+			 val & FIFOSIZE_STARTADDR_MASK);
 	}
 
 	for (idx = 0; idx < 15; idx++) {
@@ -3274,8 +2932,8 @@ static void s3c_hsotg_dump(struct s3c_hsotg *hsotg)
  */
 static int state_show(struct seq_file *seq, void *v)
 {
-	struct s3c_hsotg *hsotg = seq->private;
-	void __iomem *regs = hsotg->regs;
+	struct dwc2_hsotg *dwc2 = seq->private;
+	void __iomem *regs = dwc2->regs;
 	int idx;
 
 	seq_printf(seq, "DCFG=0x%08x, DCTL=0x%08x, DSTS=0x%08x\n",
@@ -3344,8 +3002,8 @@ static const struct file_operations state_fops = {
  */
 static int fifo_show(struct seq_file *seq, void *v)
 {
-	struct s3c_hsotg *hsotg = seq->private;
-	void __iomem *regs = hsotg->regs;
+	struct dwc2_hsotg *dwc2 = seq->private;
+	void __iomem *regs = dwc2->regs;
 	u32 val;
 	int idx;
 
@@ -3354,17 +3012,17 @@ static int fifo_show(struct seq_file *seq, void *v)
 
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
@@ -3400,9 +3058,9 @@ static const char *decode_direction(int is_in)
 static int ep_show(struct seq_file *seq, void *v)
 {
 	struct s3c_hsotg_ep *ep = seq->private;
-	struct s3c_hsotg *hsotg = ep->parent;
+	struct dwc2_hsotg *dwc2 = ep->parent;
 	struct s3c_hsotg_req *req;
-	void __iomem *regs = hsotg->regs;
+	void __iomem *regs = dwc2->regs;
 	int index = ep->index;
 	int show_limit = 15;
 	unsigned long flags;
@@ -3435,7 +3093,7 @@ static int ep_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "request list (%p,%p):\n",
 		   ep->queue.next, ep->queue.prev);
 
-	spin_lock_irqsave(&hsotg->lock, flags);
+	spin_lock_irqsave(&dwc2->lock, flags);
 
 	list_for_each_entry(req, &ep->queue, queue) {
 		if (--show_limit < 0) {
@@ -3450,7 +3108,7 @@ static int ep_show(struct seq_file *seq, void *v)
 			   req->req.actual, req->req.status);
 	}
 
-	spin_unlock_irqrestore(&hsotg->lock, flags);
+	spin_unlock_irqrestore(&dwc2->lock, flags);
 
 	return 0;
 }
@@ -3477,42 +3135,42 @@ static const struct file_operations ep_fops = {
  * with the same name as the device itself, in case we end up
  * with multiple blocks in future systems.
  */
-static void s3c_hsotg_create_debug(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_create_debug(struct dwc2_hsotg *dwc2)
 {
 	struct dentry *root;
 	unsigned epidx;
 
-	root = debugfs_create_dir(dev_name(hsotg->dev), NULL);
-	hsotg->debug_root = root;
+	root = debugfs_create_dir(dev_name(dwc2->dev), NULL);
+	dwc2->s3c_hsotg->debug_root = root;
 	if (IS_ERR(root)) {
-		dev_err(hsotg->dev, "cannot create debug root\n");
+		dev_err(dwc2->dev, "cannot create debug root\n");
 		return;
 	}
 
 	/* create general state file */
 
-	hsotg->debug_file = debugfs_create_file("state", 0444, root,
-						hsotg, &state_fops);
+	dwc2->s3c_hsotg->debug_file = debugfs_create_file("state", 0444, root,
+						dwc2, &state_fops);
 
-	if (IS_ERR(hsotg->debug_file))
-		dev_err(hsotg->dev, "%s: failed to create state\n", __func__);
+	if (IS_ERR(dwc2->s3c_hsotg->debug_file))
+		dev_err(dwc2->dev, "%s: failed to create state\n", __func__);
 
-	hsotg->debug_fifo = debugfs_create_file("fifo", 0444, root,
-						hsotg, &fifo_fops);
+	dwc2->s3c_hsotg->debug_fifo = debugfs_create_file("fifo", 0444, root,
+						dwc2, &fifo_fops);
 
-	if (IS_ERR(hsotg->debug_fifo))
-		dev_err(hsotg->dev, "%s: failed to create fifo\n", __func__);
+	if (IS_ERR(dwc2->s3c_hsotg->debug_fifo))
+		dev_err(dwc2->dev, "%s: failed to create fifo\n", __func__);
 
 	/* create one file for each endpoint */
 
-	for (epidx = 0; epidx < hsotg->num_of_eps; epidx++) {
-		struct s3c_hsotg_ep *ep = &hsotg->eps[epidx];
+	for (epidx = 0; epidx < dwc2->s3c_hsotg->num_of_eps; epidx++) {
+		struct s3c_hsotg_ep *ep = &dwc2->eps[epidx];
 
 		ep->debugfs = debugfs_create_file(ep->name, 0444,
 						  root, ep, &ep_fops);
 
 		if (IS_ERR(ep->debugfs))
-			dev_err(hsotg->dev, "failed to create %s debug file\n",
+			dev_err(dwc2->dev, "failed to create %s debug file\n",
 				ep->name);
 	}
 }
@@ -3523,40 +3181,38 @@ static void s3c_hsotg_create_debug(struct s3c_hsotg *hsotg)
  *
  * Cleanup (remove) the debugfs files for use on module exit.
  */
-static void s3c_hsotg_delete_debug(struct s3c_hsotg *hsotg)
+static void s3c_hsotg_delete_debug(struct dwc2_hsotg *dwc2)
 {
 	unsigned epidx;
 
-	for (epidx = 0; epidx < hsotg->num_of_eps; epidx++) {
-		struct s3c_hsotg_ep *ep = &hsotg->eps[epidx];
+	for (epidx = 0; epidx < dwc2->s3c_hsotg->num_of_eps; epidx++) {
+		struct s3c_hsotg_ep *ep = &dwc2->eps[epidx];
 		debugfs_remove(ep->debugfs);
 	}
 
-	debugfs_remove(hsotg->debug_file);
-	debugfs_remove(hsotg->debug_fifo);
-	debugfs_remove(hsotg->debug_root);
+	debugfs_remove(dwc2->s3c_hsotg->debug_file);
+	debugfs_remove(dwc2->s3c_hsotg->debug_fifo);
+	debugfs_remove(dwc2->s3c_hsotg->debug_root);
 }
 
 /**
- * s3c_hsotg_probe - probe function for hsotg driver
+ * dwc2_gadget_init - probe function for hsotg driver
  * @pdev: The platform information for the driver
  */
 
-static int s3c_hsotg_probe(struct platform_device *pdev)
+int dwc2_gadget_init(struct dwc2_hsotg *dwc2, int irq)
 {
-	struct s3c_hsotg_plat *plat = dev_get_platdata(&pdev->dev);
+	struct s3c_hsotg_plat *plat = dev_get_platdata(dwc2->dev);
 	struct phy *phy;
 	struct usb_phy *uphy;
-	struct device *dev = &pdev->dev;
+	struct device *dev = dwc2->dev;
 	struct s3c_hsotg_ep *eps;
-	struct s3c_hsotg *hsotg;
-	struct resource *res;
 	int epnum;
 	int ret;
 	int i;
 
-	hsotg = devm_kzalloc(&pdev->dev, sizeof(struct s3c_hsotg), GFP_KERNEL);
-	if (!hsotg) {
+	dwc2->s3c_hsotg = devm_kzalloc(dwc2->dev, sizeof(struct s3c_hsotg), GFP_KERNEL);
+	if (!dwc2->s3c_hsotg) {
 		dev_err(dev, "cannot get memory\n");
 		return -ENOMEM;
 	}
@@ -3565,117 +3221,78 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 	 * Attempt to find a generic PHY, then look for an old style
 	 * USB PHY, finally fall back to pdata
 	 */
-	phy = devm_phy_get(&pdev->dev, "usb2-phy");
+	phy = devm_phy_get(dwc2->dev, "usb2-phy");
 	if (IS_ERR(phy)) {
 		uphy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 		if (IS_ERR(uphy)) {
 			/* Fallback for pdata */
-			plat = dev_get_platdata(&pdev->dev);
+			plat = dev_get_platdata(dwc2->dev);
 			if (!plat) {
-				dev_err(&pdev->dev,
+				dev_err(dwc2->dev,
 				"no platform data or transceiver defined\n");
 				return -EPROBE_DEFER;
 			}
-			hsotg->plat = plat;
+			dwc2->s3c_hsotg->plat = plat;
 		} else
-			hsotg->uphy = uphy;
+			dwc2->s3c_hsotg->uphy = uphy;
 	} else
-		hsotg->phy = phy;
+		dwc2->s3c_hsotg->phy = phy;
 
-	hsotg->dev = dev;
+	dwc2->dev = dev;
 
-	hsotg->clk = devm_clk_get(&pdev->dev, "otg");
-	if (IS_ERR(hsotg->clk)) {
-		dev_err(dev, "cannot get otg clock\n");
-		return PTR_ERR(hsotg->clk);
-	}
-
-	platform_set_drvdata(pdev, hsotg);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	hsotg->regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(hsotg->regs)) {
-		ret = PTR_ERR(hsotg->regs);
-		goto err_clk;
-	}
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err(dev, "cannot find IRQ\n");
-		goto err_clk;
-	}
-
-	spin_lock_init(&hsotg->lock);
-
-	hsotg->irq = ret;
-
-	ret = devm_request_irq(&pdev->dev, hsotg->irq, s3c_hsotg_irq, 0,
-				dev_name(dev), hsotg);
-	if (ret < 0) {
-		dev_err(dev, "cannot claim IRQ\n");
-		goto err_clk;
-	}
-
-	dev_info(dev, "regs %p, irq %d\n", hsotg->regs, hsotg->irq);
-
-	hsotg->gadget.max_speed = USB_SPEED_HIGH;
-	hsotg->gadget.ops = &s3c_hsotg_gadget_ops;
-	hsotg->gadget.name = dev_name(dev);
-
-	/* reset the system */
-
-	clk_prepare_enable(hsotg->clk);
+	dwc2->gadget.max_speed = USB_SPEED_HIGH;
+	dwc2->gadget.ops = &s3c_hsotg_gadget_ops;
+	dwc2->gadget.name = dev_name(dev);
 
 	/* regulators */
 
-	for (i = 0; i < ARRAY_SIZE(hsotg->supplies); i++)
-		hsotg->supplies[i].supply = s3c_hsotg_supply_names[i];
+	for (i = 0; i < ARRAY_SIZE(dwc2->s3c_hsotg->supplies); i++)
+		dwc2->s3c_hsotg->supplies[i].supply = s3c_hsotg_supply_names[i];
 
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hsotg->supplies),
-				 hsotg->supplies);
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dwc2->s3c_hsotg->supplies),
+				 dwc2->s3c_hsotg->supplies);
 	if (ret) {
 		dev_err(dev, "failed to request supplies: %d\n", ret);
 		goto err_clk;
 	}
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(hsotg->supplies),
-				    hsotg->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(dwc2->s3c_hsotg->supplies),
+				    dwc2->s3c_hsotg->supplies);
 
 	if (ret) {
-		dev_err(hsotg->dev, "failed to enable supplies: %d\n", ret);
+		dev_err(dwc2->dev, "failed to enable supplies: %d\n", ret);
 		goto err_supplies;
 	}
 
 	/* Set default UTMI width */
-	hsotg->phyif = GUSBCFG_PHYIf16;
+	dwc2->s3c_hsotg->phyif = GUSBCFG_PHYIF16;
 
 	/*
 	 * If using the generic PHY framework, check if the PHY bus
 	 * width is 8-bit and set the phyif appropriately.
 	 */
-	if (hsotg->phy && (phy_get_bus_width(phy) == 8))
-		hsotg->phyif = GUSBCFG_PHYIf8;
+	if (dwc2->s3c_hsotg->phy && (phy_get_bus_width(phy) == 8))
+		dwc2->s3c_hsotg->phyif = GUSBCFG_PHYIF8;
 
-	if (hsotg->phy)
-		phy_init(hsotg->phy);
+	if (dwc2->s3c_hsotg->phy)
+		phy_init(dwc2->s3c_hsotg->phy);
 
 	/* usb phy enable */
-	s3c_hsotg_phy_enable(hsotg);
+	s3c_hsotg_phy_enable(dwc2);
 
-	s3c_hsotg_corereset(hsotg);
-	s3c_hsotg_init(hsotg);
-	s3c_hsotg_hw_cfg(hsotg);
+	s3c_hsotg_corereset(dwc2);
+	s3c_hsotg_init(dwc2);
+	s3c_hsotg_hw_cfg(dwc2);
 
 	/* hsotg->num_of_eps holds number of EPs other than ep0 */
 
-	if (hsotg->num_of_eps == 0) {
+	if (dwc2->s3c_hsotg->num_of_eps == 0) {
 		dev_err(dev, "wrong number of EPs (zero)\n");
 		ret = -EINVAL;
 		goto err_supplies;
 	}
 
-	eps = kcalloc(hsotg->num_of_eps + 1, sizeof(struct s3c_hsotg_ep),
+	eps = kcalloc(dwc2->s3c_hsotg->num_of_eps + 1, sizeof(struct s3c_hsotg_ep),
 		      GFP_KERNEL);
 	if (!eps) {
 		dev_err(dev, "cannot get memory\n");
@@ -3683,112 +3300,74 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 		goto err_supplies;
 	}
 
-	hsotg->eps = eps;
+	dwc2->eps = eps;
 
 	/* setup endpoint information */
 
-	INIT_LIST_HEAD(&hsotg->gadget.ep_list);
-	hsotg->gadget.ep0 = &hsotg->eps[0].ep;
+	INIT_LIST_HEAD(&dwc2->gadget.ep_list);
+	dwc2->gadget.ep0 = &dwc2->eps[0].ep;
 
 	/* allocate EP0 request */
 
-	hsotg->ctrl_req = s3c_hsotg_ep_alloc_request(&hsotg->eps[0].ep,
+	dwc2->s3c_hsotg->ctrl_req = s3c_hsotg_ep_alloc_request(&dwc2->eps[0].ep,
 						     GFP_KERNEL);
-	if (!hsotg->ctrl_req) {
+	if (!dwc2->s3c_hsotg->ctrl_req) {
 		dev_err(dev, "failed to allocate ctrl req\n");
 		ret = -ENOMEM;
 		goto err_ep_mem;
 	}
 
 	/* initialise the endpoints now the core has been initialised */
-	for (epnum = 0; epnum < hsotg->num_of_eps; epnum++)
-		s3c_hsotg_initep(hsotg, &hsotg->eps[epnum], epnum);
+	for (epnum = 0; epnum < dwc2->s3c_hsotg->num_of_eps; epnum++)
+		s3c_hsotg_initep(dwc2, &dwc2->eps[epnum], epnum);
 
 	/* disable power and clock */
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies),
-				    hsotg->supplies);
+	ret = regulator_bulk_disable(ARRAY_SIZE(dwc2->s3c_hsotg->supplies),
+				    dwc2->s3c_hsotg->supplies);
 	if (ret) {
-		dev_err(hsotg->dev, "failed to disable supplies: %d\n", ret);
+		dev_err(dwc2->dev, "failed to disable supplies: %d\n", ret);
 		goto err_ep_mem;
 	}
 
-	s3c_hsotg_phy_disable(hsotg);
+	s3c_hsotg_phy_disable(dwc2);
 
-	ret = usb_add_gadget_udc(&pdev->dev, &hsotg->gadget);
+	ret = usb_add_gadget_udc(dwc2->dev, &dwc2->gadget);
 	if (ret)
 		goto err_ep_mem;
 
-	s3c_hsotg_create_debug(hsotg);
+	s3c_hsotg_create_debug(dwc2);
 
-	s3c_hsotg_dump(hsotg);
+	s3c_hsotg_dump(dwc2);
 
 	return 0;
 
 err_ep_mem:
 	kfree(eps);
 err_supplies:
-	s3c_hsotg_phy_disable(hsotg);
+	s3c_hsotg_phy_disable(dwc2);
 err_clk:
-	clk_disable_unprepare(hsotg->clk);
+	clk_disable_unprepare(dwc2->clk);
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dwc2_gadget_init);
 
-/**
- * s3c_hsotg_remove - remove function for hsotg driver
- * @pdev: The platform information for the driver
- */
-static int s3c_hsotg_remove(struct platform_device *pdev)
+void s3c_hsotg_remove(struct dwc2_hsotg *dwc2)
 {
-	struct s3c_hsotg *hsotg = platform_get_drvdata(pdev);
+	usb_del_gadget_udc(&dwc2->gadget);
 
-	usb_del_gadget_udc(&hsotg->gadget);
+	s3c_hsotg_delete_debug(dwc2);
 
-	s3c_hsotg_delete_debug(hsotg);
-
-	if (hsotg->driver) {
+	if (dwc2->driver) {
 		/* should have been done already by driver model core */
-		usb_gadget_unregister_driver(hsotg->driver);
+		usb_gadget_unregister_driver(dwc2->driver);
 	}
 
-	s3c_hsotg_phy_disable(hsotg);
-	if (hsotg->phy)
-		phy_exit(hsotg->phy);
-	clk_disable_unprepare(hsotg->clk);
+	s3c_hsotg_phy_disable(dwc2);
+	if (dwc2->s3c_hsotg->phy)
+		phy_exit(dwc2->s3c_hsotg->phy);
 
-	return 0;
+	return;
 }
-
-#if 1
-#define s3c_hsotg_suspend NULL
-#define s3c_hsotg_resume NULL
-#endif
-
-#ifdef CONFIG_OF
-static const struct of_device_id s3c_hsotg_of_ids[] = {
-	{ .compatible = "samsung,s3c6400-hsotg", },
-	{ .compatible = "snps,dwc2", },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, s3c_hsotg_of_ids);
-#endif
-
-static struct platform_driver s3c_hsotg_driver = {
-	.driver		= {
-		.name	= "s3c-hsotg",
-		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(s3c_hsotg_of_ids),
-	},
-	.probe		= s3c_hsotg_probe,
-	.remove		= s3c_hsotg_remove,
-	.suspend	= s3c_hsotg_suspend,
-	.resume		= s3c_hsotg_resume,
-};
-
-module_platform_driver(s3c_hsotg_driver);
-
-MODULE_DESCRIPTION("Samsung S3C USB High-speed/OtG device");
-MODULE_AUTHOR("Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:s3c-hsotg");
+EXPORT_SYMBOL_GPL(s3c_hsotg_remove);
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 8154165..ca04ae6 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -300,13 +300,6 @@ config USB_PXA27X
 	   dynamically linked module called "pxa27x_udc" and force all
 	   gadget drivers to also be dynamically linked.
 
-config USB_S3C_HSOTG
-	depends on ARM
-	tristate "Designware/S3C HS/OtG USB Device controller"
-	help
-	  The Designware USB2.0 high-speed gadget controller
-	  integrated into many SoCs.
-
 config USB_S3C2410
 	tristate "S3C2410 USB Device Controller"
 	depends on ARCH_S3C24XX
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
- *      Ben Dooks <ben-Y5A6D6n0/KfQXOPxS62xeg@public.gmane.org>
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
