From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 4/7] s3c-hsudc: move device registration to probe
Date: Mon, 19 Dec 2011 14:25:51 +0100
Message-ID: <201112191425.52266.heiko@sntech.de>
References: <201112191423.21461.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201112191423.21461.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Ben Dooks' <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Instead of adding and deleting the gadget device in the start and stop
invocations. Use device_register in the probe method to initialize
and add the gadget device.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsudc.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsudc.c
index 6c2b2ce..42bcd97 100644
--- a/drivers/usb/gadget/s3c-hsudc.c
+++ b/drivers/usb/gadget/s3c-hsudc.c
@@ -1156,11 +1156,6 @@ static int s3c_hsudc_start(struct usb_gadget_driver *driver,
 	hsudc->driver = driver;
 	hsudc->gadget.dev.driver = &driver->driver;
 	hsudc->gadget.speed = USB_SPEED_UNKNOWN;
-	ret = device_add(&hsudc->gadget.dev);
-	if (ret) {
-		dev_err(hsudc->dev, "failed to probe gadget device");
-		return ret;
-	}
 
 	ret = bind(&hsudc->gadget);
 	if (ret) {
@@ -1180,8 +1175,6 @@ static int s3c_hsudc_start(struct usb_gadget_driver *driver,
 					hsudc->gadget.name);
 			driver->unbind(&hsudc->gadget);
 
-			device_del(&hsudc->gadget.dev);
-
 			hsudc->driver = NULL;
 			hsudc->gadget.dev.driver = NULL;
 			return ret;
@@ -1222,7 +1215,6 @@ static int s3c_hsudc_stop(struct usb_gadget_driver *driver)
 		(void) otg_set_peripheral(hsudc->transceiver, NULL);
 
 	driver->unbind(&hsudc->gadget);
-	device_del(&hsudc->gadget.dev);
 	disable_irq(hsudc->irq);
 
 	dev_info(hsudc->dev, "unregistered gadget driver '%s'\n",
@@ -1307,7 +1299,6 @@ static int __devinit s3c_hsudc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&hsudc->lock);
 
-	device_initialize(&hsudc->gadget.dev);
 	dev_set_name(&hsudc->gadget.dev, "gadget");
 
 	hsudc->gadget.max_speed = USB_SPEED_HIGH;
@@ -1348,12 +1339,20 @@ static int __devinit s3c_hsudc_probe(struct platform_device *pdev)
 	disable_irq(hsudc->irq);
 	local_irq_enable();
 
+	ret = device_register(&hsudc->gadget.dev);
+	if (ret) {
+		put_device(&hsudc->gadget.dev);
+		goto err_add_device;
+	}
+
 	ret = usb_add_gadget_udc(&pdev->dev, &hsudc->gadget);
 	if (ret)
 		goto err_add_udc;
 
 	return 0;
 err_add_udc:
+	device_unregister(&hsudc->gadget.dev);
+err_add_device:
 	clk_disable(hsudc->uclk);
 	clk_put(hsudc->uclk);
 err_clk:
-- 
1.7.5.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
