From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 04/11] USB: s3c-hsotg: SoftDisconnect minimum 3ms
Date: Wed, 26 May 2010 05:09:22 +0100
Message-ID: <1274846966-23247-5-git-send-email-ben-linux@fluff.org>
References: <1274846966-23247-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1274846966-23247-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The shortest period SoftDisconnect can be asserted for is 3 milliseconds
according to the V210 datasheet, so ensure that we add an msleep() to
the registration code to enforce this.

Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index ed306ec..215beae 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2602,6 +2602,9 @@ int usb_gadget_register_driver(struct usb_gadget_driver *driver)
 	writel(S3C_DCTL_CGOUTNak | S3C_DCTL_CGNPInNAK,
 	       hsotg->regs + S3C_DCTL);
 
+	/* must be at-least 3ms to allow bus to see disconnect */
+	msleep(3);
+
 	/* remove the soft-disconnect and let's go */
 	__bic32(hsotg->regs + S3C_DCTL, S3C_DCTL_SftDiscon);
 
-- 
1.6.3.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
