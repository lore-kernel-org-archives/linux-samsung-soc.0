From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 08/11] USB: s3c-hsotg: Fix max EP0 IN request length
Date: Wed,  7 Jul 2010 01:02:20 +0100
Message-ID: <1278460943-16224-9-git-send-email-ben-linux@fluff.org>
References: <1278460943-16224-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1278460943-16224-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The maximum length for any EP0 IN request on EP0 is 127 bytes, not 128
as the driver currently has it.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 10aeee1..1020006 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -612,8 +612,7 @@ static unsigned get_ep_limit(struct s3c_hsotg_ep *hs_ep)
 		maxpkt = S3C_DxEPTSIZ_PktCnt_LIMIT + 1;
 	} else {
 		if (hs_ep->dir_in) {
-			/* maxsize = S3C_DIEPTSIZ0_XferSize_LIMIT + 1; */
-			maxsize = 64+64+1;
+			maxsize = 64+64;
 			maxpkt = S3C_DIEPTSIZ0_PktCnt_LIMIT + 1;
 		} else {
 			maxsize = 0x3f;
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
