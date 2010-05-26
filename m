From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 03/11] USB: s3c-hsotg: Ensure TX FIFO addresses setup when initialising FIFOs
Date: Wed, 26 May 2010 05:09:21 +0100
Message-ID: <1274846966-23247-4-git-send-email-ben-linux@fluff.org>
References: <1274846966-23247-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:41762 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751156Ab0EZEJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 May 2010 00:09:31 -0400
In-Reply-To: <1274846966-23247-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Some versions of the S3C HS OtG block startup with overlapping TX FIFO
information, so change the fifo_init code to ensure that known values
are set into the FIFO registers at initialisation/reset time.

This also ensures that the FIFO RAM pointers are in a known state
before use.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index dce9366..ed306ec 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -298,6 +298,11 @@ static void s3c_hsotg_ctrl_epint(struct s3c_hsotg *hsotg,
  */
 static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 {
+	unsigned int ep;
+	unsigned int addr;
+	unsigned int size;
+	u32 val;
+
 	/* the ryu 2.6.24 release ahs
 	   writel(0x1C0, hsotg->regs + S3C_GRXFSIZ);
 	   writel(S3C_GNPTXFSIZ_NPTxFStAddr(0x200) |
@@ -311,6 +316,28 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 	writel(S3C_GNPTXFSIZ_NPTxFStAddr(2048) |
 	       S3C_GNPTXFSIZ_NPTxFDep(0x1C0),
 	       hsotg->regs + S3C_GNPTXFSIZ);
+
+	/* Arange all the rest of the TX FIFOs, as some versions of this
+	 * block have overlapping default addresses. This also ensures
+	 * that if the settings have been changed, then they are set to
+	 * known values.
+	 */
+
+	/* start at the end of the GNPTXFSIZ, rounded up */
+	addr = 2048 + 1024;
+	size = 768;
+
+	/* currently we allocate TX FIFOs for all possible endpoints,
+	 * and assume that they are all the same size.
+	 */
+
+	for (ep = 0; ep <= 15; ep++) {
+		val = addr;
+		val |= size << S3C_DPTXFSIZn_DPTxFSize_SHIFT;
+		addr += size;
+
+		writel(val, hsotg->regs + S3C_DPTXFSIZn(ep));
+	}
 }
 
 /**
-- 
1.6.3.3
