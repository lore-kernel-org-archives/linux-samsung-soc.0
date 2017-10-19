From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v6 04/10] drm/bridge: analogix_dp: Fix connector and encoder cleanup
Date: Thu, 19 Oct 2017 11:48:06 +0800
Message-ID: <20171019034812.13768-5-jeffy.chen@rock-chips.com>
References: <20171019034812.13768-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171019034812.13768-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: briannorris@chromium.org, seanpaul@chromium.org, dianders@chromium.org, heiko@sntech.de, tfiga@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, Caesar Wang <wxt@rock-chips.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, zain wang <wzz@rock-chips.com>, Archit Taneja <architt@codeaurora.org>
List-Id: linux-samsung-soc@vger.kernel.org

Since we are initing connector in the core driver and encoder in the
plat driver, let's clean them up in the right places.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

Changes in v6:
Don't change order of rockchip_drm_psr_register().

Changes in v5: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 --
 drivers/gpu/drm/exynos/exynos_dp.c                 |  7 +++++--
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 12 +++++-------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 74d274b6d31d..3f910ab36ff6 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1409,7 +1409,6 @@ analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 	ret = analogix_dp_create_bridge(drm_dev, dp);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
-		drm_encoder_cleanup(dp->encoder);
 		goto err_disable_pm_runtime;
 	}
 
@@ -1432,7 +1431,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
 	analogix_dp_bridge_disable(dp->bridge);
 	dp->connector.funcs->destroy(&dp->connector);
-	dp->encoder->funcs->destroy(dp->encoder);
 
 	if (dp->plat_data->panel) {
 		if (drm_panel_unprepare(dp->plat_data->panel))
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f7e5b2c405ed..33319a858f3a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -185,8 +185,10 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	dp->plat_data.encoder = encoder;
 
 	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
-	if (IS_ERR(dp->adp))
+	if (IS_ERR(dp->adp)) {
+		dp->encoder.funcs->destroy(&dp->encoder);
 		return PTR_ERR(dp->adp);
+	}
 
 	return 0;
 }
@@ -196,7 +198,8 @@ static void exynos_dp_unbind(struct device *dev, struct device *master,
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 
-	return analogix_dp_unbind(dp->adp);
+	analogix_dp_unbind(dp->adp);
+	dp->encoder.funcs->destroy(&dp->encoder);
 }
 
 static const struct component_ops exynos_dp_ops = {
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index fa0365de31d2..117585df73e1 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -261,13 +261,8 @@ static struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs = {
 	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
 };
 
-static void rockchip_dp_drm_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
 static struct drm_encoder_funcs rockchip_dp_encoder_funcs = {
-	.destroy = rockchip_dp_drm_encoder_destroy,
+	.destroy = drm_encoder_cleanup,
 };
 
 static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
@@ -364,8 +359,10 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	rockchip_drm_psr_register(&dp->encoder, analogix_dp_psr_set);
 
 	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
-	if (IS_ERR(dp->adp))
+	if (IS_ERR(dp->adp)) {
+		dp->encoder.funcs->destroy(&dp->encoder);
 		return PTR_ERR(dp->adp);
+	}
 
 	return 0;
 }
@@ -377,6 +374,7 @@ static void rockchip_dp_unbind(struct device *dev, struct device *master,
 
 	rockchip_drm_psr_unregister(&dp->encoder);
 	analogix_dp_unbind(dp->adp);
+	dp->encoder.funcs->destroy(&dp->encoder);
 }
 
 static const struct component_ops rockchip_dp_component_ops = {
-- 
2.11.0
