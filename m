From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/4] driver core: handle -EPROBE_DEFER from bus_type.match()
Date: Thu, 26 Nov 2015 13:49:48 +0100
Message-ID: <1448542190-19498-3-git-send-email-m.szyprowski@samsung.com>
References: <1448542190-19498-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56621 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751046AbbKZMuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 07:50:03 -0500
In-reply-to: <1448542190-19498-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

From: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Lets implementations of the match() callback in struct bus_type to
return errors and if it's -EPROBE_DEFER then queue the device for
deferred probing.

This is useful to buses such as AMBA in which devices are registered
before their matching information can be retrieved from the HW
(typically because a clock driver hasn't probed yet).

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/base/dd.c      | 24 ++++++++++++++++++++++--
 include/linux/device.h |  2 +-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index a641cf3..a20c119 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -490,6 +490,7 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 	struct device_attach_data *data = _data;
 	struct device *dev = data->dev;
 	bool async_allowed;
+	int ret;
 
 	/*
 	 * Check if device has already been claimed. This may
@@ -500,8 +501,17 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 	if (dev->driver)
 		return -EBUSY;
 
-	if (!driver_match_device(drv, dev))
+	ret = driver_match_device(drv, dev);
+	if (!ret)
 		return 0;
+	else if (ret < 0) {
+		if (ret == -EPROBE_DEFER) {
+			dev_dbg(dev, "Device match requests probe deferral\n");
+			driver_deferred_probe_add(dev);
+		} else
+			dev_warn(dev, "Bus failed to match device: %d", ret);
+		return ret;
+	}
 
 	async_allowed = driver_allows_async_probing(drv);
 
@@ -621,6 +631,7 @@ void device_initial_probe(struct device *dev)
 static int __driver_attach(struct device *dev, void *data)
 {
 	struct device_driver *drv = data;
+	int ret;
 
 	/*
 	 * Lock device and try to bind to it. We drop the error
@@ -632,8 +643,17 @@ static int __driver_attach(struct device *dev, void *data)
 	 * is an error.
 	 */
 
-	if (!driver_match_device(drv, dev))
+	ret = driver_match_device(drv, dev);
+	if (!ret)
+		return 0;
+	else if (ret < 0) {
+		if (ret == -EPROBE_DEFER) {
+			dev_dbg(dev, "Device match requests probe deferral\n");
+			driver_deferred_probe_add(dev);
+		} else
+			dev_warn(dev, "Bus failed to match device: %d", ret);
 		return 0;
+	}
 
 	if (dev->parent)	/* Needed for USB */
 		device_lock(dev->parent);
diff --git a/include/linux/device.h b/include/linux/device.h
index b8f411b..d4e7d1f 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -70,7 +70,7 @@ extern void bus_remove_file(struct bus_type *, struct bus_attribute *);
  * @dev_groups:	Default attributes of the devices on the bus.
  * @drv_groups: Default attributes of the device drivers on the bus.
  * @match:	Called, perhaps multiple times, whenever a new device or driver
- *		is added for this bus. It should return a nonzero value if the
+ *		is added for this bus. It should return a positive value if the
  *		given device can be handled by the given driver.
  * @uevent:	Called when a device is added, removed, or a few other things
  *		that generate uevents to add the environment variables.
-- 
1.9.2
