From: <dinguyen@altera.com>
Subject: [RFC PATCH 1/2] staging: dwc2: Move DWC2 usb driver out of staging
Date: Tue, 14 Jan 2014 05:01:01 -0600
Message-ID: <1389697262-29065-2-git-send-email-dinguyen@altera.com>
References: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-db8lp0189.outbound.messaging.microsoft.com ([213.199.154.189]:59213
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751451AbaANLDK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jan 2014 06:03:10 -0500
In-Reply-To: <1389697262-29065-1-git-send-email-dinguyen@altera.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, gregkh@linuxfoundation.org
Cc: dinh.linux@gmail.com, Dinh Nguyen <dinguyen@altera.com>, Paul Zimmerman <paulz@synopsys.com>, Rashika Kheria <rashika.kheria@gmail.com>, Matthijs Kooijman <matthijs@stdin.nl>, Luis Ortega Perez de Villar <luiorpe1@upv.es>, Dom Cobley <popcornmix@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org

From: Dinh Nguyen <dinguyen@altera.com>

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
 drivers/staging/Kconfig                   |    2 --
 drivers/usb/Kconfig                       |    2 ++
 drivers/usb/Makefile                      |    1 +
 drivers/{staging => usb}/dwc2/Kconfig     |   29 +++++++++++++++++++++++++++++
 drivers/{staging => usb}/dwc2/Makefile    |    0
 drivers/{staging => usb}/dwc2/core.c      |    0
 drivers/{staging => usb}/dwc2/core.h      |    0
 drivers/{staging => usb}/dwc2/core_intr.c |    0
 drivers/{staging => usb}/dwc2/hcd.c       |    0
 drivers/{staging => usb}/dwc2/hcd.h       |    0
 drivers/{staging => usb}/dwc2/hcd_ddma.c  |    0
 drivers/{staging => usb}/dwc2/hcd_intr.c  |    0
 drivers/{staging => usb}/dwc2/hcd_queue.c |    0
 drivers/{staging => usb}/dwc2/hw.h        |   25 +++++++++++++++----------
 drivers/{staging => usb}/dwc2/pci.c       |    0
 drivers/{staging => usb}/dwc2/platform.c  |    0
 16 files changed, 47 insertions(+), 12 deletions(-)
 rename drivers/{staging => usb}/dwc2/Kconfig (69%)
 rename drivers/{staging => usb}/dwc2/Makefile (100%)
 rename drivers/{staging => usb}/dwc2/core.c (100%)
 rename drivers/{staging => usb}/dwc2/core.h (100%)
 rename drivers/{staging => usb}/dwc2/core_intr.c (100%)
 rename drivers/{staging => usb}/dwc2/hcd.c (100%)
 rename drivers/{staging => usb}/dwc2/hcd.h (100%)
 rename drivers/{staging => usb}/dwc2/hcd_ddma.c (100%)
 rename drivers/{staging => usb}/dwc2/hcd_intr.c (100%)
 rename drivers/{staging => usb}/dwc2/hcd_queue.c (100%)
 rename drivers/{staging => usb}/dwc2/hw.h (97%)
 rename drivers/{staging => usb}/dwc2/pci.c (100%)
 rename drivers/{staging => usb}/dwc2/platform.c (100%)

diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 3bfdaa8..16b3a5c 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -138,8 +138,6 @@ source "drivers/staging/netlogic/Kconfig"
 
 source "drivers/staging/mt29f_spinand/Kconfig"
 
-source "drivers/staging/dwc2/Kconfig"
-
 source "drivers/staging/lustre/Kconfig"
 
 source "drivers/staging/btmtk_usb/Kconfig"
diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index a34fb98..3bbce71 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -106,6 +106,8 @@ endif
 
 source "drivers/usb/musb/Kconfig"
 
+source "drivers/usb/dwc2/Kconfig"
+
 source "drivers/usb/dwc3/Kconfig"
 
 source "drivers/usb/chipidea/Kconfig"
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 70d7c5b..e4136d4 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -6,6 +6,7 @@
 
 obj-$(CONFIG_USB)		+= core/
 
+obj-$(CONFIG_USB_DWC2)		+= dwc2/
 obj-$(CONFIG_USB_DWC3)		+= dwc3/
 
 obj-$(CONFIG_USB_MON)		+= mon/
diff --git a/drivers/staging/dwc2/Kconfig b/drivers/usb/dwc2/Kconfig
similarity index 69%
rename from drivers/staging/dwc2/Kconfig
rename to drivers/usb/dwc2/Kconfig
index be947d6..299227a 100644
--- a/drivers/staging/dwc2/Kconfig
+++ b/drivers/usb/dwc2/Kconfig
@@ -20,6 +20,35 @@ config USB_DWC2
 
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
diff --git a/drivers/staging/dwc2/Makefile b/drivers/usb/dwc2/Makefile
similarity index 100%
rename from drivers/staging/dwc2/Makefile
rename to drivers/usb/dwc2/Makefile
diff --git a/drivers/staging/dwc2/core.c b/drivers/usb/dwc2/core.c
similarity index 100%
rename from drivers/staging/dwc2/core.c
rename to drivers/usb/dwc2/core.c
diff --git a/drivers/staging/dwc2/core.h b/drivers/usb/dwc2/core.h
similarity index 100%
rename from drivers/staging/dwc2/core.h
rename to drivers/usb/dwc2/core.h
diff --git a/drivers/staging/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
similarity index 100%
rename from drivers/staging/dwc2/core_intr.c
rename to drivers/usb/dwc2/core_intr.c
diff --git a/drivers/staging/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
similarity index 100%
rename from drivers/staging/dwc2/hcd.c
rename to drivers/usb/dwc2/hcd.c
diff --git a/drivers/staging/dwc2/hcd.h b/drivers/usb/dwc2/hcd.h
similarity index 100%
rename from drivers/staging/dwc2/hcd.h
rename to drivers/usb/dwc2/hcd.h
diff --git a/drivers/staging/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
similarity index 100%
rename from drivers/staging/dwc2/hcd_ddma.c
rename to drivers/usb/dwc2/hcd_ddma.c
diff --git a/drivers/staging/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
similarity index 100%
rename from drivers/staging/dwc2/hcd_intr.c
rename to drivers/usb/dwc2/hcd_intr.c
diff --git a/drivers/staging/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
similarity index 100%
rename from drivers/staging/dwc2/hcd_queue.c
rename to drivers/usb/dwc2/hcd_queue.c
diff --git a/drivers/staging/dwc2/hw.h b/drivers/usb/dwc2/hw.h
similarity index 97%
rename from drivers/staging/dwc2/hw.h
rename to drivers/usb/dwc2/hw.h
index 9c92a3c..c20d9d7 100644
--- a/drivers/staging/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -109,6 +109,7 @@
 #define GUSBCFG_FSINTF			(1 << 5)
 #define GUSBCFG_ULPI_UTMI_SEL		(1 << 4)
 #define GUSBCFG_PHYIF16			(1 << 3)
+#define GUSBCFG_PHYIF8			(0 << 3)
 #define GUSBCFG_TOUTCAL_MASK		(0x7 << 0)
 #define GUSBCFG_TOUTCAL_SHIFT		0
 #define GUSBCFG_TOUTCAL_LIMIT		0x7
@@ -151,7 +152,7 @@
 #define GINTSTS_ENUMDONE		(1 << 13)
 #define GINTSTS_USBRST			(1 << 12)
 #define GINTSTS_USBSUSP			(1 << 11)
-#define GINTSTS_ERLYSUSP		(1 << 10)
+#define GINTSTS_EARLYSUSP		(1 << 10)
 #define GINTSTS_I2CINT			(1 << 9)
 #define GINTSTS_ULPI_CK_INT		(1 << 8)
 #define GINTSTS_GOUTNAKEFF		(1 << 7)
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
diff --git a/drivers/staging/dwc2/pci.c b/drivers/usb/dwc2/pci.c
similarity index 100%
rename from drivers/staging/dwc2/pci.c
rename to drivers/usb/dwc2/pci.c
diff --git a/drivers/staging/dwc2/platform.c b/drivers/usb/dwc2/platform.c
similarity index 100%
rename from drivers/staging/dwc2/platform.c
rename to drivers/usb/dwc2/platform.c
-- 
1.7.9.5
