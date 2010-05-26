From: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 02/11] USB: s3c_hsotg: define USB_GADGET_DUALSPEED in Kconfig
Date: Wed, 26 May 2010 05:09:20 +0100
Message-ID: <1274846966-23247-3-git-send-email-ben-linux@fluff.org>
References: <1274846966-23247-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1274846966-23247-1-git-send-email-ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The s3c_hsotg driver sets usb_gadget->is_dualspeed to 1, yet it doesn't define
USB_GADGET_DUALSPEED in Kconfig. This triggers a NULL pointer dereference in
the composite driver (which is fixed in another patch).

Signed-off-by: Maurus Cuelenaere <mcuelenaere-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 drivers/usb/gadget/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 649c0c5..591ae9f 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -295,6 +295,7 @@ config USB_GADGET_S3C_HSOTG
 	boolean "S3C HS/OtG USB Device controller"
 	depends on S3C_DEV_USB_HSOTG
 	select USB_GADGET_S3C_HSOTG_PIO
+	select USB_GADGET_DUALSPEED
 	help
 	  The Samsung S3C64XX USB2.0 high-speed gadget controller
 	  integrated into the S3C64XX series SoC.
-- 
1.6.3.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
