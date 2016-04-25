From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v1 3/8] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Mon, 25 Apr 2016 19:34:19 +0800
Message-ID: <1461584059-6119-1-git-send-email-ykk@rock-chips.com>
References: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461583748-5777-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

RK3399 and RK3288 shared the same eDP IP controller, only some light
difference with VOP configure and GRF configure.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../bindings/display/bridge/analogix_dp.txt        |  1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |  2 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 45 +++++++++++++++++++---
 3 files changed, 41 insertions(+), 7 deletions(-)

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
index 4f55bdf..f559b5c 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -36,11 +36,17 @@
 
 #define to_dp(nm)	container_of(nm, struct rockchip_dp_device, nm)
 
+enum rockchip_dp_chip_type {
+	RK3288_DP,
+	RK3399_EDP,
+};
+
 struct rockchip_dp_chip_data {
 	u32	lcdsel_grf_reg;
 	u32	lcdsel_big;
 	u32	lcdsel_lit;
 	u32	lcdsel_mask;
+	u32	chip_type;
 };
 
 struct rockchip_dp_device {
@@ -115,9 +121,31 @@ static void rockchip_dp_drm_encoder_mode_set(struct drm_encoder *encoder,
 static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_dp_device *dp = to_dp(encoder);
+	int out_mode;
 	int ret;
 	u32 val;
 
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
+			out_mode = ROCKCHIP_OUT_MODE_P888;
+		else
+			out_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+
+	default:
+		out_mode = ROCKCHIP_OUT_MODE_AAAA;
+		break;
+	}
+
 	/*
 	 * FIXME(Yakir): driver should configure the CRTC output video
 	 * mode with the display information which indicated the monitor
@@ -132,17 +160,12 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
 	 * RGB666 input video mode, then screen would works prefect.
 	 */
 	ret = rockchip_drm_crtc_mode_config(encoder->crtc,
-					    DRM_MODE_CONNECTOR_eDP,
-					    ROCKCHIP_OUT_MODE_AAAA);
+					    DRM_MODE_CONNECTOR_eDP, out_mode);
 	if (ret < 0) {
 		dev_err(dp->dev, "Could not set crtc mode config (%d)\n", ret);
 		return;
 	}
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
-	if (ret < 0)
-		return;
-
 	if (ret)
 		val = dp->data->lcdsel_lit | dp->data->lcdsel_mask;
 	else
@@ -369,15 +392,25 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
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
 	.lcdsel_lit = BIT(5),
 	.lcdsel_mask = BIT(21),
+	.chip_type = RK3288_DP,
 };
 
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
+	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
-- 
1.9.1
