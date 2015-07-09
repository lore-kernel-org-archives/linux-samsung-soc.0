From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/7] drm/exynos/hdmi: remove private lock code
Date: Thu, 09 Jul 2015 16:28:08 +0200
Message-ID: <1436452092-20757-4-git-send-email-a.hajda@samsung.com>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46354 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606AbbGIO2Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 10:28:24 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NR800ETU5JB3G70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jul 2015 15:28:23 +0100 (BST)
In-reply-to: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Most of the code is called by drm core framework, so it is already synchronized.
The only async function is irq routine which only calls drm framework so it
does not need to be synchronized.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1d07bdf..f2e909d 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -22,7 +22,6 @@
 #include "regs-hdmi.h"
 
 #include <linux/kernel.h>
-#include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
@@ -188,7 +187,6 @@ struct hdmi_context {
 	struct drm_encoder		*encoder;
 	bool				powered;
 	bool				dvi_mode;
-	struct mutex			hdmi_mutex;
 
 	void __iomem			*regs;
 	int				irq;
@@ -1774,10 +1772,8 @@ static void hdmi_conf_apply(struct hdmi_context *hdata)
 	hdmiphy_conf_reset(hdata);
 	hdmiphy_conf_apply(hdata);
 
-	mutex_lock(&hdata->hdmi_mutex);
 	hdmi_start(hdata, false);
 	hdmi_conf_init(hdata);
-	mutex_unlock(&hdata->hdmi_mutex);
 
 	hdmi_audio_init(hdata);
 
@@ -2029,12 +2025,8 @@ static void hdmi_commit(struct exynos_drm_display *display)
 {
 	struct hdmi_context *hdata = display_to_hdmi(display);
 
-	mutex_lock(&hdata->hdmi_mutex);
-	if (!hdata->powered) {
-		mutex_unlock(&hdata->hdmi_mutex);
+	if (!hdata->powered)
 		return;
-	}
-	mutex_unlock(&hdata->hdmi_mutex);
 
 	hdmi_conf_apply(hdata);
 }
@@ -2043,16 +2035,11 @@ static void hdmi_poweron(struct hdmi_context *hdata)
 {
 	struct hdmi_resources *res = &hdata->res;
 
-	mutex_lock(&hdata->hdmi_mutex);
-	if (hdata->powered) {
-		mutex_unlock(&hdata->hdmi_mutex);
+	if (hdata->powered)
 		return;
-	}
 
 	hdata->powered = true;
 
-	mutex_unlock(&hdata->hdmi_mutex);
-
 	pm_runtime_get_sync(hdata->dev);
 
 	if (regulator_bulk_enable(res->regul_count, res->regul_bulk))
@@ -2073,10 +2060,8 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
 {
 	struct hdmi_resources *res = &hdata->res;
 
-	mutex_lock(&hdata->hdmi_mutex);
 	if (!hdata->powered)
-		goto out;
-	mutex_unlock(&hdata->hdmi_mutex);
+		return;
 
 	/* HDMI System Disable */
 	hdmi_reg_writemask(hdata, HDMI_CON_0, 0, HDMI_EN);
@@ -2096,11 +2081,7 @@ static void hdmi_poweroff(struct hdmi_context *hdata)
 
 	pm_runtime_put_sync(hdata->dev);
 
-	mutex_lock(&hdata->hdmi_mutex);
 	hdata->powered = false;
-
-out:
-	mutex_unlock(&hdata->hdmi_mutex);
 }
 
 static void hdmi_dpms(struct exynos_drm_display *display, int mode)
@@ -2330,8 +2311,6 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->display.type = EXYNOS_DISPLAY_TYPE_HDMI;
 	hdata->display.ops = &hdmi_display_ops;
 
-	mutex_init(&hdata->hdmi_mutex);
-
 	platform_set_drvdata(pdev, hdata);
 
 	match = of_match_node(hdmi_match_types, dev->of_node);
-- 
1.9.1
