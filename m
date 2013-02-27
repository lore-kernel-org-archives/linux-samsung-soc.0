From: Felipe Balbi <balbi@ti.com>
Subject: [PATCH] usb: phy: samsung: let it be built as a module
Date: Wed, 27 Feb 2013 12:48:53 +0200
Message-ID: <1361962133-21296-1-git-send-email-balbi@ti.com>
References: <CAFp+6iEfVSbyGVNhDFc2wW7w=ZMGwVpcc28GAGOgHffCWQRLMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:52320 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756581Ab3B0KtE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 05:49:04 -0500
In-Reply-To: <CAFp+6iEfVSbyGVNhDFc2wW7w=ZMGwVpcc28GAGOgHffCWQRLMQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linux USB Mailing List <linux-usb@vger.kernel.org>
Cc: gautamvivek1987@gmail.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@ti.com>

There's no reason not to allow samsung PHY
drivers be built as modules. This patch changes
Kconfig to allow that.

Signed-off-by: Felipe Balbi <balbi@ti.com>
---

Hi,

I will take your patches but I'm planning to add this on top
as there is no reason not to allow these drivers being built
as modules.

cheers

 drivers/usb/phy/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 723d7b1..4f696d0 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -67,7 +67,7 @@ config USB_RCAR_PHY
 	  module will be called rcar-phy.
 
 config SAMSUNG_USB2PHY
-	bool "Samsung USB 2.0 PHY controller Driver"
+	tristate "Samsung USB 2.0 PHY controller Driver"
 	select SAMSUNG_USBPHY
 	select USB_OTG_UTILS
 	help
@@ -75,7 +75,7 @@ config SAMSUNG_USB2PHY
 	  driver for Samsung SoCs.
 
 config SAMSUNG_USB3PHY
-	bool "Samsung USB 3.0 PHY controller Driver"
+	tristate "Samsung USB 3.0 PHY controller Driver"
 	select SAMSUNG_USBPHY
 	select USB_OTG_UTILS
 	help
@@ -83,7 +83,7 @@ config SAMSUNG_USB3PHY
 	  for samsung SoCs.
 
 config SAMSUNG_USBPHY
-	bool "Samsung USB PHY Driver"
+	tristate "Samsung USB PHY Driver"
 	help
 	  Enable this to support Samsung USB phy helper driver for Samsung SoCs.
 	  This driver provides common interface to interact, for Samsung USB 2.0 PHY
-- 
1.8.1.rc1.5.g7e0651a
