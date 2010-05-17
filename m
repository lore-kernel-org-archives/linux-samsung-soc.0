From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/2] USB: s3c_hsotg: define USB_GADGET_DUALSPEED in Kconfig
Date: Mon, 17 May 2010 21:12:28 +0200
Message-ID: <4BF1951C.1080108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:10267 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753506Ab0EQTMb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 May 2010 15:12:31 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>, Greg Kroah-Hartman <gregkh@suse.de>, David Brownell <dbrownell@users.sourceforge.net>

The s3c_hsotg driver sets usb_gadget->is_dualspeed to 1, yet it doesn't define
USB_GADGET_DUALSPEED in Kconfig. This triggers a NULL pointer dereference in
the composite driver (which is fixed in another patch).

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 drivers/usb/gadget/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 11a3e0f..b9df8a5 100644
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
1.7.1
