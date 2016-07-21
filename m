From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1.1 2/2] drm/bridge: analogix_dp: turn off the panel when eDP need to disable
Date: Thu, 21 Jul 2016 22:14:12 +0800
Message-ID: <1469110452-8806-1-git-send-email-ykk@rock-chips.com>
References: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469106874-4912-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Some panels (like Sharp LQ123P1JX31) need to be turn off when eDP
controller stop to send valid video signal, otherwhise panel would
go burn in, and keep flicker and flicker.

So it's better to turn off the panel when eDP need to disable, and
we need to turn on the panel in connector->detect() callback, so
that driver would detect panel status rightly.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---

Changes in v1.1:
- unprepare the panel at the end of bridge->disable() function

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 32715da..2e519bd 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -961,6 +961,14 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
 
+	/*
+	 * Panle would prepare for several times here, but don't worry it
+	 * would only enable the hardware at the first prepare time.
+	 */
+	if (dp->plat_data->panel)
+		if (drm_panel_prepare(dp->plat_data->panel))
+			DRM_ERROR("failed to setup the panel\n");
+
 	if (analogix_dp_detect_hpd(dp))
 		return connector_status_disconnected;
 
@@ -1077,6 +1085,13 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
+	if (dp->plat_data->panel) {
+		if (drm_panel_unprepare(dp->plat_data->panel)) {
+			DRM_ERROR("failed to turnoff the panel\n");
+			return;
+		}
+	}
+
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 }
 
@@ -1333,13 +1348,6 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
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
