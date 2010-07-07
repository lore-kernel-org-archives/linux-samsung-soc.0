From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 06/11] USB: s3c-hsotg: Only load packet per fifo write
Date: Wed,  7 Jul 2010 01:02:18 +0100
Message-ID: <1278460943-16224-7-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Limit the IN FIFO write to a single packet per attempt at writing,
as per the specifications and ensure that we don't return fifo-full
so that we can continue writing packets if we have the space.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 4196e37..df6a39d 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -538,6 +538,17 @@ static int s3c_hsotg_write_fifo(struct s3c_hsotg *hsotg,
 	if (can_write > 512)
 		can_write = 512;
 
+	/* limit the write to one max-packet size worth of data, but allow
+	 * the transfer to return that it did not run out of fifo space
+	 * doing it. */
+	if (to_write > hs_ep->ep.maxpacket) {
+		to_write = hs_ep->ep.maxpacket;
+
+		s3c_hsotg_en_gsint(hsotg,
+				   periodic ? S3C_GINTSTS_PTxFEmp :
+				   S3C_GINTSTS_NPTxFEmp);
+	}
+
 	/* see if we can write data */
 
 	if (to_write > can_write) {
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
