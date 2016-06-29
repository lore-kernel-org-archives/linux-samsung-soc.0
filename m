From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 04/11] drm/rockchip: analogix_dp: add rk3399 eDP support
Date: Wed, 29 Jun 2016 17:15:26 +0800
Message-ID: <1467191726-17264-1-git-send-email-ykk@rock-chips.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1467191657-16941-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

RK3399 and RK3288 shared the same eDP IP controller, only some light
difference with VOP configure and GRF configure.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Tomasz Figa <tomasz.figa-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>
---
Changes in v4:
- Improved the overly complicated .atomic_check function. (Sean)
- Add reviewed flag from Tomasz

Changes in v3:
- Give the "rk3399-edp" a separate line for clarity in document (Tomasz, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/346314/10/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt@5]
- Move 'output_type' setting before the return statement (Tomasz, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/346314/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@154]
- Add the acked flag from Mark.

 .../bindings/display/bridge/analogix_dp.txt        |  1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |  3 ++-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 23 ++++++++++++++++++++++
 include/drm/bridge/analogix_dp.h                   |  3 ++-
 4 files changed, 28 insertions(+), 2 deletions(-)

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
index 0a30931..8557a08 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -36,6 +36,8 @@
 
 #define RK3288_GRF_SOC_CON6		0x25c
 #define RK3288_EDP_LCDC_SEL		BIT(5)
+#define RK3399_GRF_SOC_CON20		0x6250
+#define RK3399_EDP_LCDC_SEL		BIT(5)
 
 #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
 
@@ -159,6 +161,8 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 				      struct drm_connector_state *conn_state)
 {
 	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+	struct rockchip_dp_device *dp = to_dp(encoder);
+	int ret;
 
 	/*
 	 * FIXME(Yakir): driver should configure the CRTC output video
@@ -173,8 +177,19 @@ rockchip_dp_drm_encoder_atomic_check(struct drm_encoder *encoder,
 	 * But if I configure CTRC to RGBaaa, and eDP driver still keep
 	 * RGB666 input video mode, then screen would works prefect.
 	 */
+
 	s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 	s->output_type = DRM_MODE_CONNECTOR_eDP;
+	if (dp->data->chip_type == RK3399_EDP) {
+		/*
+		 * For RK3399, VOP Lit must code the out mode to RGB888,
+		 * VOP Big must code the out mode to RGB10.
+		 */
+		ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node,
+							encoder);
+		if (ret > 0)
+			s->output_mode = ROCKCHIP_OUT_MODE_P888;
+	}
 
 	return 0;
 }
@@ -378,6 +393,13 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
 #endif
 };
 
+static const struct rockchip_dp_chip_data rk3399_edp = {
+	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
+	.lcdsel_big = HIWORD_UPDATE(0, RK3399_EDP_LCDC_SEL),
+	.lcdsel_lit = HIWORD_UPDATE(RK3399_EDP_LCDC_SEL, RK3399_EDP_LCDC_SEL),
+	.chip_type = RK3399_EDP,
+};
+
 static const struct rockchip_dp_chip_data rk3288_dp = {
 	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
 	.lcdsel_big = HIWORD_UPDATE(0, RK3288_EDP_LCDC_SEL),
@@ -387,6 +409,7 @@ static const struct rockchip_dp_chip_data rk3288_dp = {
 
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
+	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 790ab5d..fc4aea3 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -16,11 +16,12 @@
 enum analogix_dp_devtype {
 	EXYNOS_DP,
 	RK3288_DP,
+	RK3399_EDP,
 };
 
 static inline bool is_rockchip(enum analogix_dp_devtype type)
 {
-	return type == RK3288_DP;
+	return type == RK3288_DP || type == RK3399_EDP;
 }
 
 struct analogix_dp_plat_data {
-- 
1.9.1
