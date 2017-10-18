From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v5 4/9] drm/bridge: analogix_dp: Fix connector & encoder cleanup
Date: Wed, 18 Oct 2017 20:09:39 +0800
Message-ID: <20171018120944.7819-5-jeffy.chen@rock-chips.com>
References: <20171018120944.7819-1-jeffy.chen@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.134]:57940 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934574AbdJRMK3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Oct 2017 08:10:29 -0400
In-Reply-To: <20171018120944.7819-1-jeffy.chen@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: briannorris@chromium.org, seanpaul@chromium.org, dianders@chromium.org, heiko@sntech.de, tfiga@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, Caesar Wang <wxt@rock-chips.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, zain wang <wzz@rock-chips.com>, Ar

Since we are initing connector in the core driver and encoder in the
plat driver, let's clean them up in the right places.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v5: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 --
 drivers/gpu/drm/exynos/exynos_dp.c                 |  7 +++++--
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 15 ++++++---------
 3 files changed, 11 insertions(+), 13 deletions(-)

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
index fa0365de31d2..c0fb3f3748f4 100644
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
@@ -361,12 +356,13 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	dp->psr_state = ~EDP_VSC_PSR_STATE_ACTIVE;
 	INIT_WORK(&dp->psr_work, analogix_dp_psr_work);
 
-	rockchip_drm_psr_register(&dp->encoder, analogix_dp_psr_set);
-
 	dp->adp = analogix_dp_bind(dev, dp->drm_dev, &dp->plat_data);
-	if (IS_ERR(dp->adp))
+	if (IS_ERR(dp->adp)) {
+		dp->encoder.funcs->destroy(&dp->encoder);
 		return PTR_ERR(dp->adp);
+	}
 
+	rockchip_drm_psr_register(&dp->encoder, analogix_dp_psr_set);
 	return 0;
 }
 
@@ -377,6 +373,7 @@ static void rockchip_dp_unbind(struct device *dev, struct device *master,
 
 	rockchip_drm_psr_unregister(&dp->encoder);
 	analogix_dp_unbind(dp->adp);
+	dp->encoder.funcs->destroy(&dp->encoder);
 }
 
 static const struct component_ops rockchip_dp_component_ops = {
-- 
2.11.0
