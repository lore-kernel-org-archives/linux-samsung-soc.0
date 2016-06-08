From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC v4 2/7] Revert "extcon: usb-gpio: switch to use pm wakeirq apis"
Date: Wed, 08 Jun 2016 15:48:01 +0200
Message-ID: <1465393686-16644-3-git-send-email-k.kozlowski@samsung.com>
References: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:51303 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754215AbcFHNs0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 09:48:26 -0400
In-reply-to: <1465393686-16644-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rogerq@ti.com, Peter Chen <peter.chen@freescale.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, balbi@ti.com, kishon@ti.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This reverts commit 8106e404174253639731cc30a44f5b3ab764c5b7.

When using PM wakeirq API only one wakeup IRQ can be set. However the
driver will support also VBUS GPIO so we need two wakeup interrupts.
---
 drivers/extcon/extcon-usb-gpio.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index 2512660dc4b9..a36aab007022 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -24,7 +24,6 @@
 #include <linux/module.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/pm_wakeirq.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/acpi.h>
@@ -143,8 +142,7 @@ static int usb_extcon_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, info);
-	device_init_wakeup(dev, true);
-	dev_pm_set_wake_irq(dev, info->id_irq);
+	device_init_wakeup(dev, 1);
 
 	/* Perform initial detection */
 	usb_extcon_detect_cable(&info->wq_detcable.work);
@@ -158,9 +156,6 @@ static int usb_extcon_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&info->wq_detcable);
 
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-
 	return 0;
 }
 
@@ -170,6 +165,12 @@ static int usb_extcon_suspend(struct device *dev)
 	struct usb_extcon_info *info = dev_get_drvdata(dev);
 	int ret = 0;
 
+	if (device_may_wakeup(dev)) {
+		ret = enable_irq_wake(info->id_irq);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * We don't want to process any IRQs after this point
 	 * as GPIOs used behind I2C subsystem might not be
@@ -185,6 +186,12 @@ static int usb_extcon_resume(struct device *dev)
 	struct usb_extcon_info *info = dev_get_drvdata(dev);
 	int ret = 0;
 
+	if (device_may_wakeup(dev)) {
+		ret = disable_irq_wake(info->id_irq);
+		if (ret)
+			return ret;
+	}
+
 	enable_irq(info->id_irq);
 	if (!device_may_wakeup(dev))
 		queue_delayed_work(system_power_efficient_wq,
-- 
1.9.1
