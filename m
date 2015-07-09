From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] drm/exynos/hdmi: Simplify HPD gpio handling
Date: Thu, 09 Jul 2015 16:28:07 +0200
Message-ID: <1436452092-20757-3-git-send-email-a.hajda@samsung.com>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46415 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752582AbbGIO2Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 10:28:24 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NR800G5F5JAEK80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jul 2015 15:28:22 +0100 (BST)
In-reply-to: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

GPIO is tested only in hdmi_detect, so there is no reason to set it in
other places and to preserve its value in context.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 3cf09bb..1d07bdf 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -186,7 +186,6 @@ struct hdmi_context {
 	struct drm_device		*drm_dev;
 	struct drm_connector		connector;
 	struct drm_encoder		*encoder;
-	bool				hpd;
 	bool				powered;
 	bool				dvi_mode;
 	struct mutex			hdmi_mutex;
@@ -1037,10 +1036,10 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
 {
 	struct hdmi_context *hdata = ctx_from_connector(connector);
 
-	hdata->hpd = gpio_get_value(hdata->hpd_gpio);
+	if (gpio_get_value(hdata->hpd_gpio))
+		return connector_status_connected;
 
-	return hdata->hpd ? connector_status_connected :
-			connector_status_disconnected;
+	return connector_status_disconnected;
 }
 
 static void hdmi_connector_destroy(struct drm_connector *connector)
@@ -2156,10 +2155,6 @@ static void hdmi_hotplug_work_func(struct work_struct *work)
 
 	hdata = container_of(work, struct hdmi_context, hotplug_work.work);
 
-	mutex_lock(&hdata->hdmi_mutex);
-	hdata->hpd = gpio_get_value(hdata->hpd_gpio);
-	mutex_unlock(&hdata->hdmi_mutex);
-
 	if (hdata->drm_dev)
 		drm_helper_hpd_irq_event(hdata->drm_dev);
 }
@@ -2428,8 +2423,6 @@ out_get_phy_port:
 		goto err_hdmiphy;
 	}
 
-	hdata->hpd = gpio_get_value(hdata->hpd_gpio);
-
 	INIT_DELAYED_WORK(&hdata->hotplug_work, hdmi_hotplug_work_func);
 
 	ret = devm_request_threaded_irq(dev, hdata->irq, NULL,
-- 
1.9.1
