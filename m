From: Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] drm/analogix_dp: Ensure the panel is properly prepared/unprepared
Date: Fri, 29 Jul 2016 15:16:31 -0400
Message-ID: <1469819791-31860-1-git-send-email-seanpaul@chromium.org>
References: <CAOw6vbKbLzm4mPtp2LsG=7=KJkS_4Oe7rA4Of0uT5vM_Xoiphw@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:33951 "EHLO
	mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752439AbcG2TRX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jul 2016 15:17:23 -0400
Received: by mail-qk0-f174.google.com with SMTP id o67so99513921qke.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2016 12:17:22 -0700 (PDT)
In-Reply-To: <CAOw6vbKbLzm4mPtp2LsG=7=KJkS_4Oe7rA4Of0uT5vM_Xoiphw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ykk@rock-chips.com
Cc: yzq@rock-chips.com, inki.dae@samsung.com, treding@nvidia.com, heiko@sntech.de, jingoohan1@gmail.com, javier@osg.samsung.com, marcheu@chromium.org, tfiga@chromium.org, dianders@chromium.org, airlied@linux.ie, daniel.vetter@ffwll.ch, k.kozlowski@samsung.com, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>

Instead of just preparing the panel on bind, actually prepare/unprepare
during modeset/disable. The panel must be prepared in order to read hpd
status, so we need to refcount the prepares in order to ensure we don't
accidentally turn the panel off at the wrong time.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---


Hi Yakir,
This is what I was talking about upthread. I've tested it and it seems to be working.

What do you think?

Sean



drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 48 +++++++++++++++++-----
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 32715da..7b764a4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -960,11 +960,27 @@ enum drm_connector_status
 analogix_dp_detect(struct drm_connector *connector, bool force)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
+	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
 
-	if (analogix_dp_detect_hpd(dp))
-		return connector_status_disconnected;
+	if (dp->plat_data->panel && dp->dpms_mode != DRM_MODE_DPMS_ON) {
+		ret = drm_panel_prepare(dp->plat_data->panel);
+		if (ret) {
+			DRM_ERROR("failed to setup panel (%d)\n", ret);
+			return connector_status_disconnected;
+		}
+	}
+
+	if (!analogix_dp_detect_hpd(dp))
+		status = connector_status_connected;
+
+	if (dp->plat_data->panel && dp->dpms_mode != DRM_MODE_DPMS_ON) {
+		ret = drm_panel_unprepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	}
 
-	return connector_status_connected;
+	return status;
 }
 
 static void analogix_dp_connector_destroy(struct drm_connector *connector)
@@ -1035,6 +1051,18 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge)
 	return 0;
 }
 
+static void analogix_dp_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	struct analogix_dp_device *dp = bridge->driver_private;
+	int ret;
+
+	if (dp->plat_data->panel) {
+		ret = drm_panel_prepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	}
+}
+
 static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
@@ -1058,6 +1086,7 @@ static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
+	int ret;
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
@@ -1077,6 +1106,10 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
+	ret = drm_panel_unprepare(dp->plat_data->panel);
+	if (ret)
+		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
@@ -1165,9 +1198,9 @@ static void analogix_dp_bridge_nop(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
+	.pre_enable = analogix_dp_bridge_pre_enable,
 	.enable = analogix_dp_bridge_enable,
 	.disable = analogix_dp_bridge_disable,
-	.pre_enable = analogix_dp_bridge_nop,
 	.post_disable = analogix_dp_bridge_nop,
 	.mode_set = analogix_dp_bridge_mode_set,
 	.attach = analogix_dp_bridge_attach,
@@ -1333,13 +1366,6 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
 	phy_power_on(dp->phy);
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_prepare(dp->plat_data->panel)) {
-			DRM_ERROR("failed to setup the panel\n");
-			return -EBUSY;
-		}
-	}
-
 	analogix_dp_init_dp(dp);
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
-- 
2.8.0.rc3.226.g39d4020
