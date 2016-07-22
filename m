From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 2/3] drm/bridge: analogix_dp: turn off the panel when eDP need to disable
Date: Fri, 22 Jul 2016 09:50:40 +0800
Message-ID: <1469152240-7316-1-git-send-email-ykk@rock-chips.com>
References: <1469151750-7130-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.135]:46457 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752139AbcGVBuz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 21:50:55 -0400
In-Reply-To: <1469151750-7130-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

Some panels (like Sharp LQ123P1JX31) need to be turn off when eDP
controller stop to send valid video signal, otherwhise panel would
go burn in, and keep flicker and flicker.

So it's better to turn off the panel when eDP need to disable, and
we need to turn on the panel in connector->detect() callback, so
that driver would detect panel status rightly.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2:
- s/Panle/Panel/ (Sean)
- Move the drm_panel_xxxx out of a conditional, and throw the return
  code away (Sean)
- Add comments about why we need unprepare the panel in bridge_disable (Sean)
- Unprepare the panel at the end of bridge->disable() function.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 37 ++++++++++++++++------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 32715da..0ddaf93 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -960,6 +960,17 @@ enum drm_connector_status
 analogix_dp_detect(struct drm_connector *connector, bool force)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
+	int ret;
+
+	/*
+	 * Panel would prepare for several times here, but don't worry, it
+	 * would only enable the hardware at the first prepare time.
+	 */
+	if (dp->plat_data->panel) {
+		ret = drm_panel_prepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	}
 
 	if (analogix_dp_detect_hpd(dp))
 		return connector_status_disconnected;
@@ -1058,13 +1069,15 @@ static void analogix_dp_bridge_enable(struct drm_bridge *bridge)
 static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 {
 	struct analogix_dp_device *dp = bridge->driver_private;
+	int ret;
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
 	if (dp->plat_data->panel) {
-		if (drm_panel_disable(dp->plat_data->panel)) {
-			DRM_ERROR("failed to disable the panel\n");
+		ret = drm_panel_disable(dp->plat_data->panel);
+		if (ret) {
+			DRM_ERROR("failed to disable the panel [%d]\n", ret);
 			return;
 		}
 	}
@@ -1077,6 +1090,19 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
+	/*
+	 * Some panels need to be turn off when eDP controller stop to send
+	 * valid video signal, otherwhise panel would go burn in, and keep
+	 * flicker and flicker.
+	 */
+	if (dp->plat_data->panel) {
+		 ret = drm_panel_unprepare(dp->plat_data->panel);
+		 if (ret) {
+			DRM_ERROR("failed to turnoff the panel [%d]\n", ret);
+			return;
+		}
+	}
+
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
@@ -1333,13 +1359,6 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
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
1.9.1
