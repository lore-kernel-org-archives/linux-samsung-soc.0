From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 04/11] USB: s3c-hsotg: Re-initialise all FIFOs on USB bus reset
Date: Wed,  7 Jul 2010 01:02:16 +0100
Message-ID: <1278460943-16224-5-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The USB documentation suggest that the FIFOs should be reset when a
bus reset event happens. Use the s3c_hsotg_init_fifo() to ensure that
the FIFO layout is correct and that the FIFOs are flushed before
acknowledging the reset.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 354fd45..9d32c9f 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2082,17 +2082,12 @@ irq_retry:
 		kill_all_requests(hsotg, &hsotg->eps[0], -ECONNRESET, true);
 
 		/* it seems after a reset we can end up with a situation
-		 * where the TXFIFO still has data in it... try flushing
-		 * it to remove anything that may still be in it.
+		 * where the TXFIFO still has data in it... the docs
+		 * suggest resetting all the fifos, so use the init_fifo
+		 * code to relayout and flush the fifos.
 		 */
 
-		if (1) {
-			writel(S3C_GRSTCTL_TxFNum(0) | S3C_GRSTCTL_TxFFlsh,
-			       hsotg->regs + S3C_GRSTCTL);
