From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 05/11] USB: s3c-hsotg: Ensure FIFOs are fully flushed after layout
Date: Wed, 26 May 2010 05:09:23 +0100
Message-ID: <1274846966-23247-6-git-send-email-ben-linux@fluff.org>
References: <1274846966-23247-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1274846966-23247-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

According to the design guide, if the FIFO layout is changed, then the
FIFOs must be flushed to ensure all FIFO pointers are correct.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 215beae..bce510c 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -301,6 +301,7 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	unsigned int ep;
 	unsigned int addr;
 	unsigned int size;
+	int timeout;
 	u32 val;
 
 	/* the ryu 2.6.24 release ahs
@@ -338,6 +339,32 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 
 		writel(val, hsotg->regs + S3C_DPTXFSIZn(ep));
 	}
+
+	/* according to p428 of the design guide, we need to ensure that
+	 * all fifos are flushed before continuing.
+	 */
+
+	writel(S3C_GRSTCTL_TxFNum(0x10) | S3C_GRSTCTL_TxFFlsh |
+	       S3C_GRSTCTL_RxFFlsh, hsotg->regs + S3C_GRSTCTL);
+
+	/* wait until the fifos are both flushed */
+	timeout = 100;
+	while (1) {
+		val = readl(hsotg->regs + S3C_GRSTCTL);
+
+		if ((val & (S3C_GRSTCTL_TxFFlsh | S3C_GRSTCTL_RxFFlsh)) == 0)
+			break;
+
+		if (--timeout == 0) {
+			dev_err(hsotg->dev,
+				"%s: timeout flushing fifos (GRSTCTL=%08x)\n",
+				__func__, val);
+		}
+
+		udelay(1);
+	}
+
+	dev_dbg(hsotg->dev, "FIFOs reset, timeout at %d\n", timeout);
 }
 
 /**
-- 
1.6.3.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
