From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/7] drm/exynos/hdmi: remove old platform data code
Date: Thu, 09 Jul 2015 16:28:06 +0200
Message-ID: <1436452092-20757-2-git-send-email-a.hajda@samsung.com>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44869 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752638AbbGIO2Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 10:28:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NR800CV75J8OI70@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jul 2015 15:28:20 +0100 (BST)
In-reply-to: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

s5p_hdmi_platform_data were used before device tree introduction.
As HDMI driver is DT only we can drop this struct completely.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 4a00990..3cf09bb 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -48,7 +48,6 @@
 #include "exynos_mixer.h"
 
 #include <linux/gpio.h>
-#include <media/s5p_hdmi.h>
 
 #define ctx_from_connector(c)	container_of(c, struct hdmi_context, connector)
 
@@ -2259,30 +2258,6 @@ fail:
 	return ret;
 }
 
-static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
-					(struct device *dev)
-{
-	struct device_node *np = dev->of_node;
-	struct s5p_hdmi_platform_data *pd;
-	u32 value;
-
-	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
-	if (!pd)
-		goto err_data;
-
-	if (!of_find_property(np, "hpd-gpio", &value)) {
-		DRM_ERROR("no hpd gpio property found\n");
-		goto err_data;
-	}
-
-	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
-
-	return pd;
-
-err_data:
-	return NULL;
-}
-
 static struct of_device_id hdmi_match_types[] = {
 	{
 		.compatible = "samsung,exynos5-hdmi",
@@ -2343,7 +2318,6 @@ static struct device_node *hdmi_legacy_phy_dt_binding(struct device *dev)
 static int hdmi_probe(struct platform_device *pdev)
 {
 	struct device_node *ddc_node, *phy_node;
-	struct s5p_hdmi_platform_data *pdata;
 	struct hdmi_driver_data *drv_data;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
@@ -2354,10 +2328,6 @@ static int hdmi_probe(struct platform_device *pdev)
 	if (!dev->of_node)
 		return -ENODEV;
 
-	pdata = drm_hdmi_dt_parse_pdata(dev);
-	if (!pdata)
-		return -EINVAL;
-
 	hdata = devm_kzalloc(dev, sizeof(struct hdmi_context), GFP_KERNEL);
 	if (!hdata)
 		return -ENOMEM;
@@ -2378,8 +2348,12 @@ static int hdmi_probe(struct platform_device *pdev)
 	hdata->phy_confs = drv_data->phy_confs;
 	hdata->phy_conf_count = drv_data->phy_conf_count;
 
-	hdata->hpd_gpio = pdata->hpd_gpio;
 	hdata->dev = dev;
+	hdata->hpd_gpio = of_get_named_gpio(dev->of_node, "hpd-gpio", 0);
+	if (hdata->hpd_gpio < 0) {
+		DRM_ERROR("cannot get hpd gpio property\n");
+		return hdata->hpd_gpio;
+	}
 
 	ret = hdmi_resources_init(hdata);
 	if (ret) {
-- 
1.9.1
