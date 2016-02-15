From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v14 14/17] drm: bridge: analogix/dp: move hpd detect to connector detect function
Date: Mon, 15 Feb 2016 19:11:20 +0800
Message-ID: <1455534680-2112-1-git-send-email-ykk@rock-chips.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

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
Changes in v14: None
Changes in v13: None
Changes in v12: None
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
index 13986b7..cfdf695 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -904,12 +904,6 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
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
@@ -972,6 +966,11 @@ static const struct drm_connector_helper_funcs analogix_dp_connector_helper_func
 enum drm_connector_status
 analogix_dp_detect(struct drm_connector *connector, bool force)
 {
+	struct analogix_dp_device *dp = to_dp(connector);
+
+	if (analogix_dp_detect_hpd(dp))
+		return connector_status_disconnected;
+
 	return connector_status_connected;
 }
 
@@ -1051,13 +1050,6 @@ static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 
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
 
@@ -1090,11 +1082,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->plat_data->power_off)
 		dp->plat_data->power_off(dp->plat_data);
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_unprepare(dp->plat_data->panel))
-			DRM_ERROR("failed to turnoff the panel\n");
-	}
-
 	pm_runtime_put_sync(dp->dev);
 
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
@@ -1352,6 +1339,15 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
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
@@ -1385,6 +1381,12 @@ void analogix_dp_unbind(struct device *dev, struct device *master,
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
