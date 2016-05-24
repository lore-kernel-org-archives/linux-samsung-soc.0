From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 05/10] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Tue, 24 May 2016 13:02:27 +0800
Message-ID: <1464066147-22734-1-git-send-email-ykk@rock-chips.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>, Mark Yao <yzq@rock-chips.com>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Javier Martinez Canillas <javier@osg.samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

RK3399 and RK3288 shared the same eDP IP controller, only some light
difference with VOP configure and GRF configure.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2:
- rebase with drm-next, fix some conflicts

 .../bindings/display/bridge/analogix_dp.txt        |  1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |  2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 34 ++++++++++++++++++++--
 include/drm/bridge/analogix_dp.h                   |  1 +
 4 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
index 4f2ba8c..4a0f4f7 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
+++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
@@ -5,6 +5,7 @@ Required properties for dp-controller:
 		platform specific such as:
 		 * "samsung,exynos5-dp"
 		 * "rockchip,rk3288-dp"
+		 * "rockchip,rk3399-edp"
 	-reg:
 		physical base address of the controller and length
 		of memory mapped region.
diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
index e832ff9..5ae55ca 100644
--- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
@@ -2,7 +2,7 @@ Rockchip RK3288 specific extensions to the Analogix Display Port
 ================================
 
 Required properties:
-- compatible: "rockchip,rk3288-edp";
+- compatible: "rockchip,rk3288-edp" or "rockchip,rk3399-edp";
 
 - reg: physical base address of the controller and length
 
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 29c4105..d684c97 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -149,6 +149,8 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 {
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
 
+	s->output_type = DRM_MODE_CONNECTOR_eDP;
+
 	/*
 	 * FIXME(Yakir): driver should configure the CRTC output video
 	 * mode with the display information which indicated the monitor
@@ -162,8 +164,27 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 	 * But if I configure CTRC to RGBaaa, and eDP driver still keep
 	 * RGB666 input video mode, then screen would works prefect.
 	 */
-	s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
-	s->output_type = DRM_MODE_CONNECTOR_eDP;
+
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	if (ret < 0)
+		return;
+
+	switch (dp->data->chip_type) {
+	case RK3399_EDP:
+		/*
+		 * For RK3399, VOP Lit must code the out mode to RGB888,
+		 * VOP Big must code the out mode to RGB10.
+		 */
+		if (ret)
+			s->output_mode = ROCKCHIP_OUT_MODE_P888;
+		else
+			s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+
+	default:
+		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	}
 
 	return 0;
 }
@@ -377,6 +398,14 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(rockchip_dp_suspend, rockchip_dp_resume)
 };
 
+static const struct rockchip_dp_chip_data rk3399_edp = {
+	.lcdsel_grf_reg = 0x6250,
+	.lcdsel_big = 0,
+	.lcdsel_lit = BIT(5),
+	.lcdsel_mask = BIT(21),
+	.chip_type = RK3399_EDP,
+};
+
 static const struct rockchip_dp_chip_data rk3288_dp = {
 	.lcdsel_grf_reg = 0x025c,
 	.lcdsel_big = 0,
@@ -387,6 +416,7 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
 
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
+	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 06c0250..82b8135 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -20,6 +20,7 @@ enum analogix_dp_devtype {
 
 enum analogix_dp_sub_devtype {
 	RK3288_DP,
+	RK3399_EDP,
 };
 
 struct analogix_dp_plat_data {
-- 
1.9.1
