From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v3 05/10] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Tue, 14 Jun 2016 19:46:20 +0800
Message-ID: <1465904780-935-1-git-send-email-ykk@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tomasz.figa@chromium.com>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RK3399 and RK3288 shared the same eDP IP controller, only some light
difference with VOP configure and GRF configure.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Acked-by: Mark Yao <mark.yao@rock-chips.com>
---
Changes in v3:
- Give the "rk3399-edp" a separate line for clarity in document (Tomasz, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/346314/10/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt@5]
- Move 'output_type' setting before the return statement (Tomasz, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/346314/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@154]
- Add the acked flag from Mark.

Changes in v2:
- rebase with drm-next, fix some conflicts

 .../bindings/display/bridge/analogix_dp.txt        |  1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |  3 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 33 +++++++++++++++++++++-
 include/drm/bridge/analogix_dp.h                   |  1 +
 4 files changed, 36 insertions(+), 2 deletions(-)

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
index e832ff9..726c945 100644
--- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
@@ -2,7 +2,8 @@ Rockchip RK3288 specific extensions to the Analogix Display Port
 ================================
 
 Required properties:
-- compatible: "rockchip,rk3288-edp";
+- compatible: "rockchip,rk3288-edp",
+	      "rockchip,rk3399-edp";
 
 - reg: physical base address of the controller and length
 
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 315ebba..bcd9ecc 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -153,6 +153,8 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_connector_state *conn_state)
 {
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct rockchip_dp_device *dp = to_dp(encoder);
+	int ret;
 
 	/*
 	 * FIXME(Yakir): driver should configure the CRTC output video
@@ -167,7 +169,28 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 	 * But if I configure CTRC to RGBaaa, and eDP driver still keep
 	 * RGB666 input video mode, then screen would works prefect.
 	 */
-	s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
+
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	if (ret < 0)
+		return 0;
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
+
 	s->output_type = DRM_MODE_CONNECTOR_eDP;
 
 	return 0;
@@ -382,6 +405,13 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(rockchip_dp_suspend, rockchip_dp_resume)
 };
 
+static const struct rockchip_dp_chip_data rk3399_edp = {
+	.lcdsel_grf_reg = 0x6250,
+	.lcdsel_big = 0 | BIT(21),
+	.lcdsel_lit = BIT(5) | BIT(21),
+	.chip_type = RK3399_EDP,
+};
+
 static const struct rockchip_dp_chip_data rk3288_dp = {
 	.lcdsel_grf_reg = 0x025c,
 	.lcdsel_big = 0 | BIT(21),
@@ -391,6 +421,7 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
 
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
