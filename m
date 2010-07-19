From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 01/11] USB: s3c-hsotg: Increase TX fifo limit
Date: Mon, 19 Jul 2010 09:40:40 +0100
Message-ID: <1279528850-28245-2-git-send-email-ben-linux@fluff.org>
References: <1279528850-28245-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1279528850-28245-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-l3A5Bk7waGM@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Up the FIFO size for the TX to 1024 entries, as this now seems to work
with all the cores. This fixes a problem when using large packets on
a core with MPS set to 512 can hang due to insufficient space for the
writes.

The hang arises due to getting the non-periodic FIFO empty IRQ but
not being able to satisfy any requests since there is never enough
space to write 512 bytes into the buffer. This means we end up with
a stream of interrupt requests.

It is easier to up the TX FIFO to fill the space we left for it
than to try and fix the positions in the code where we should have
limited the max-packet size to < TXFIFOSIZE, since the TXFIFOSIZE
depends on how the TX FIFOs have been setup.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 26193ec..81f62da 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -310,11 +310,11 @@ static void s3c_hsotg_init_fifo(struct s3c_hsotg *hsotg)
 		hsotg->regs + S3C_GNPTXFSIZ);
 	*/
 
-	/* set FIFO sizes to 2048/0x1C0 */
+	/* set FIFO sizes to 2048/1024 */
 
 	writel(2048, hsotg->regs + S3C_GRXFSIZ);
 	writel(S3C_GNPTXFSIZ_NPTxFStAddr(2048) |
-	       S3C_GNPTXFSIZ_NPTxFDep(0x1C0),
+	       S3C_GNPTXFSIZ_NPTxFDep(1024),
 	       hsotg->regs + S3C_GNPTXFSIZ);
 
 	/* arange all the rest of the TX FIFOs, as some versions of this
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
