From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v11 15/19] drm: bridge: analogix/dp: move hpd detect to connector detect function
Date: Wed, 16 Dec 2015 11:53:29 +0800
Message-ID: <1450238009-3128-1-git-send-email-ykk@rock-chips.com>
References: <1450236018-1118-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:54907 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754366AbbLPDzh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Dec 2015 22:55:37 -0500
In-Reply-To: <1450236018-1118-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, emil.l.velikov@gmail.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

This change just make a little clean to make code more like
drm core expect, move hdp detect code from bridge->enable(),
and place them into connector->detect().

Note: Gustavo Padovan try to remove the controller and phy
power on function in bind time at bellow commit:
	drm/exynos: do not start enabling DP at bind() phase

But for now the connector status don't hardcode to connected,
need to operate dp phy in .detect function, so we need to revert
parts if Gustavo Padovan's changes, add phy poweron
function in bind time.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
Changes in v11:
- Revert parts of Gustavo Padovan's changes in commit:
	drm/exynos: do not start enabling DP at bind() phase
  Add dp phy poweron function in bind time.
- Move the panel prepare from get_modes time to bind time, and move
  the panel unprepare from bridge->disable to unbind time. (Heiko)

Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- Take Jingoo suggest, add commit messages.

Changes in v3:
- move dp hpd detect to connector detect function.

Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 38 ++++++++++++----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9eb17ce..952c2c3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -901,12 +901,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 			DRM_ERROR("failed to disable the panel\n");
 	}
 
-	ret = analogix_dp_detect_hpd(dp);
-	if (ret) {
-		/* Cable has been disconnected, we're done */
-		return;
-	}
-
 	ret = analogix_dp_handle_edid(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to handle edid\n");
@@ -941,6 +935,11 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 
 enum drm_connector_status analogix_dp_detect(struct device *dev, bool force)
 {
+	struct analogix_dp_device *dp = dev_get_drvdata(dev);
+
+	if (analogix_dp_detect_hpd(dp))
+		return connector_status_disconnected;
+
 	return connector_status_connected;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_detect);
@@ -1006,13 +1005,6 @@ static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 
 	pm_runtime_get_sync(dp->dev);
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_prepare(dp->plat_data->panel)) {
-			DRM_ERROR("failed to setup the panel\n");
-			return;
-		}
-	}
-
 	if (dp->plat_data->power_on)
 		dp->plat_data->power_on(dp->plat_data);
 
@@ -1045,11 +1037,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->plat_data->power_off)
 		dp->plat_data->power_off(dp->plat_data);
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_unprepare(dp->plat_data->panel))
-			DRM_ERROR("failed to turnoff the panel\n");
-	}
-
 	pm_runtime_put_sync(dp->dev);
 
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
@@ -1307,6 +1294,15 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
 	pm_runtime_enable(dev);
 
+	phy_power_on(dp->phy);
+
+	if (dp->plat_data->panel) {
+		if (drm_panel_prepare(dp->plat_data->panel)) {
+			DRM_ERROR("failed to setup the panel\n");
+			return -EBUSY;
+		}
+	}
+
 	ret = devm_request_irq(&pdev->dev, dp->irq, analogix_dp_irq_handler,
 			       irq_flags, "analogix-dp", dp);
 	if (ret) {
@@ -1340,6 +1336,12 @@ void analogix_dp_unbind(struct device *dev, struct device *master,
 	struct analogix_dp_device *dp = dev_get_drvdata(dev);
 
 	analogix_dp_bridge_disable(dp->bridge);
+
+	if (dp->plat_data->panel) {
+		if (drm_panel_unprepare(dp->plat_data->panel))
+			DRM_ERROR("failed to turnoff the panel\n");
+	}
+
 	pm_runtime_disable(dev);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
1.9.1
