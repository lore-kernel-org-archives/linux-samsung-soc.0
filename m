From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 2/6] USB: s3c_hsotg: define USB_GADGET_DUALSPEED in Kconfig
Date: Tue, 25 May 2010 05:36:49 +0100
Message-ID: <1274762213-3404-3-git-send-email-ben-linux@fluff.org>
References: <1274762213-3404-1-git-send-email-ben-linux@fluff.org>
 <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:32862 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751513Ab0EYEg6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 May 2010 00:36:58 -0400
In-Reply-To: <1274762213-3404-2-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, Ben Dooks <ben-linux@fluff.org>

From: Maurus Cuelenaere <mcuelenaere@gmail.com>

The s3c_hsotg driver sets usb_gadget->is_dualspeed to 1, yet it doesn't define
USB_GADGET_DUALSPEED in Kconfig. This triggers a NULL pointer dereference in
the composite driver (which is fixed in another patch).

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
Signed-off-by: Ben Dooks <ben-linux@fluff.org>
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
