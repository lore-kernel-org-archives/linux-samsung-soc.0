From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 02/11] USB: s3c-hsotg: The NPTX/PTX FIFO sizes are in words, not bytes
Date: Mon, 19 Jul 2010 09:40:41 +0100
Message-ID: <1279528850-28245-3-git-send-email-ben-linux@fluff.org>
References: <1279528850-28245-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:36501 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1760334Ab0GSJWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 05:22:19 -0400
In-Reply-To: <1279528850-28245-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: gregkh@suse.de, Ben Dooks <ben-linux@fluff.org>

Fix a problem where we have been underestimating the space available in
the IN PTX/NPTX FIFOs by assuming that they where simply word aligned
instead of in number-of-words. This means all length calculations need
to be multiplied-by-4.

Note, we do not change the information about fifo size or start addresses
available to userspace as we assume the user can multiply by four easily
and is already knows these values are in words.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 81f62da..4a25145 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -505,6 +505,7 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 		}
 
 		can_write = S3C_GNPTXSTS_NPTxFSpcAvail_GET(gnptxsts);
+		can_write *= 4;	/* fifo size is in 32bit quantities. */
 	}
 
 	dev_dbg(hsotg->dev, "%s: GNPTXSTS=%08x, can=%d, to=%d, mps %d\n",
@@ -2732,7 +2733,7 @@ static void __devinit s3c_hsotg_initep(struct s3c_hsotg *hsotg,
 	 */
 
 	ptxfifo = readl(hsotg->regs + S3C_DPTXFSIZn(epnum));
-	hs_ep->fifo_size = S3C_DPTXFSIZn_DPTxFSize_GET(ptxfifo);
+	hs_ep->fifo_size = S3C_DPTXFSIZn_DPTxFSize_GET(ptxfifo) * 4;
 
 	/* if we're using dma, we need to set the next-endpoint pointer
 	 * to be something valid.
-- 
1.7.0.4
