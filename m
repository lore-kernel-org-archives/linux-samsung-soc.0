From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] usb: gadget: s3c-hsotg: fix kernel panic
Date: Fri, 16 Mar 2012 13:35:20 +0000
Message-ID: <1331904920-19685-1-git-send-email-sangwook.lee@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:44606 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030751Ab2CPNh0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Mar 2012 09:37:26 -0400
Received: by wibhq7 with SMTP id hq7so887394wib.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Mar 2012 06:37:25 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, l.Majewski@samsung.com, linux-samsung-soc@vger.kernel.org, patches@linaro.org, linaro-dev@lists.linaro.org, Sangwook Lee <sangwook.lee@linaro.org>

Fix kernel panic from s3c_hsotg_udc_stop.
if udc_is_newstyle is true, s3c_hsotg_udc_stop should not
call disconnect, unbind.

As running rmmod g_mass_storage, kernel panic happens.

(composite_unbind+0x14/0x164 [g_mass_storage])
from [<c023e950>] (s3c_hsotg_udc_stop)

This patch is based on Lukasz Majewski's patches:
[PATCH 0/9] USB: s3c-hsotg: USB S3C-HSOTG driver fixes and code cleanu

in order to test g_mass_storage in Origen board:

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 4262df8..9925661 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -2883,16 +2883,12 @@ static int s3c_hsotg_udc_stop(struct usb_gadget *gadget,
 	for (ep = 0; ep < hsotg->num_of_eps; ep++)
 		s3c_hsotg_ep_disable(&hsotg->eps[ep].ep);
 
-	call_gadget(hsotg, disconnect);
-
-	driver->unbind(&hsotg->gadget);
 	s3c_hsotg_phy_disable(hsotg);
 	regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies), hsotg->supplies);
 
 	hsotg->driver = NULL;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-
-	device_del(&hsotg->gadget.dev);
+	hsotg->gadget.dev.driver = NULL;
 
 	dev_info(hsotg->dev, "unregistered gadget driver '%s'\n",
 		 driver->driver.name);
@@ -3526,7 +3522,10 @@ static int __devexit s3c_hsotg_remove(struct platform_device *pdev)
 
 	s3c_hsotg_delete_debug(hsotg);
 
-	usb_gadget_unregister_driver(hsotg->driver);
+	if (hsotg->driver) {
+		/* should have been done already by driver model core */
+		usb_gadget_unregister_driver(hsotg->driver);
+	}
 
 	free_irq(hsotg->irq, hsotg);
 	iounmap(hsotg->regs);
@@ -3540,6 +3539,7 @@ static int __devexit s3c_hsotg_remove(struct platform_device *pdev)
 	clk_disable(hsotg->clk);
 	clk_put(hsotg->clk);
 
+	device_unregister(&hsotg->gadget.dev);
 	kfree(hsotg);
 	return 0;
 }
-- 
1.7.4.1
