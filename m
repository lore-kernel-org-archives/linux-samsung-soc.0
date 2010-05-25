From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 5/6] USB: s3c-hsotg: Ensure FIFOs are fully flushed after layout
Date: Tue, 25 May 2010 05:36:52 +0100
Message-ID: <1274762213-3404-6-git-send-email-ben-linux@fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-4-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-5-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32861 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751743Ab0EYEg6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 00:36:58 -0400
In-Reply-To: <1274762213-3404-5-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

According to the design guide, if the FIFO layout is changed, then the
FIFOs must be flushed to ensure all FIFO pointers are correct.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 8ed4f8a..0cb0462 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -301,6 +301,7 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	unsigned int ep;
 	unsigned int addr;
 	unsigned int size;
+	int timeout;
 	u32 val;
 
 	/* the ryu 2.6.24 release ahs
@@ -336,6 +337,31 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 
 		writel(val, hsotg->regs + S3C_DPTXFSIZn(ep));
 	}
+
+	/* according to p428 of the design guide, we need to ensure that
+	 * all fifos are flushed before continuing */
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
