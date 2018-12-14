From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 6/6] drm/exynos: mixer: Make input buffer color range
 configurable
Date: Fri, 14 Dec 2018 13:10:21 +0100
Message-ID: <1544789421-5265-7-git-send-email-c.manszewski@samsung.com>
References: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
 <CGME20181214121038eucas1p20a2aec53761cacb8e4ee57f9f2aa1167@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Christoph Manszewski <c.manszewski@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Mixer hardware supports RGB input buffers with full and limited range.
Set the csc matrix accordingly to chosen range. Note that range setting
has to be equal for both graphic layers.

Signed-off-by: Christoph Manszewski <c.manszewski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 57 ++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/exynos/regs-mixer.h   |  2 ++
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 895c6268025d..035d635188d7 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -35,6 +35,8 @@
 #include <linux/component.h>
 
 #include <drm/exynos_drm.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "exynos_drm_drv.h"
 #include "exynos_drm_crtc.h"
@@ -133,7 +135,9 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE |
 				EXYNOS_DRM_PLANE_CAP_ZPOS |
 				EXYNOS_DRM_PLANE_CAP_PIX_BLEND |
-				EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
+				EXYNOS_DRM_PLANE_CAP_WIN_BLEND |
+				EXYNOS_DRM_PLANE_CAP_RANGE,
+		.range = DRM_COLOR_FULL_RANGE,
 	}, {
 		.zpos = 1,
 		.type = DRM_PLANE_TYPE_CURSOR,
@@ -142,7 +146,9 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.capabilities = EXYNOS_DRM_PLANE_CAP_DOUBLE |
 				EXYNOS_DRM_PLANE_CAP_ZPOS |
 				EXYNOS_DRM_PLANE_CAP_PIX_BLEND |
-				EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
+				EXYNOS_DRM_PLANE_CAP_WIN_BLEND |
+				EXYNOS_DRM_PLANE_CAP_RANGE,
+		.range = DRM_COLOR_FULL_RANGE,
 	}, {
 		.zpos = 2,
 		.type = DRM_PLANE_TYPE_OVERLAY,
@@ -389,13 +395,19 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, struct drm_display_mode
 
 	if (format == HDMI_COLORIMETRY_ITU_601) {
 		val = MXR_CFG_RGB601;
+
+		mixer_reg_write(ctx, MXR_CM_COEFF_Y,
+			MXR_CSC_CT( 0.257,  0.504,  0.098));
+		mixer_reg_write(ctx, MXR_CM_COEFF_CB,
+			MXR_CSC_CT(-0.148, -0.291,  0.439));
+		mixer_reg_write(ctx, MXR_CM_COEFF_CR,
+			MXR_CSC_CT( 0.439, -0.368, -0.071));
 	} else {
 		val = MXR_CFG_RGB709;
 
 		/* Configure the BT.709 CSC matrix for full range RGB. */
 		mixer_reg_write(ctx, MXR_CM_COEFF_Y,
-			MXR_CSC_CT( 0.184,  0.614,  0.063) |
-			MXR_CM_COEFF_RGB_FULL);
+			MXR_CSC_CT( 0.184,  0.614,  0.063));
 		mixer_reg_write(ctx, MXR_CM_COEFF_CB,
 			MXR_CSC_CT(-0.102, -0.338,  0.440));
 		mixer_reg_write(ctx, MXR_CM_COEFF_CR,
@@ -560,6 +572,20 @@ static void mixer_layer_update(struct mixer_context *ctx)
 	mixer_reg_writemask(ctx, MXR_CFG, ~0, MXR_CFG_LAYER_UPDATE);
 }
 
+static void mixer_set_input_buffer_range(struct mixer_context *ctx,
+					 struct exynos_drm_plane *plane)
+{
+	u32 cm_coeff;
+
+	if (plane->base.state->color_range == DRM_COLOR_LIMITED_RANGE)
+		cm_coeff = MXR_CM_COEFF_RGB_LIMITED;
+	else
+		cm_coeff = MXR_CM_COEFF_RGB_FULL;
+
+	mixer_reg_writemask(ctx, MXR_CM_COEFF_Y, cm_coeff,
+			    MXR_CM_COEFF_RGB_RANGE_MASK);
+}
+
 static void mixer_graph_buffer(struct mixer_context *ctx,
 			       struct exynos_drm_plane *plane)
 {
@@ -647,6 +673,9 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
 		ctx->mxr_ver == MXR_VER_128_0_0_184)
 		mixer_layer_update(ctx);
 
+	/* set the input buffer rgb range */
+	mixer_set_input_buffer_range(ctx, plane);
+
 	spin_unlock_irqrestore(&ctx->reg_slock, flags);
 
 	mixer_regs_dump(ctx);
@@ -917,6 +946,25 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(mixer_ctx, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
+static int mixer_atomic_check(struct exynos_drm_crtc *crtc,
+			      struct drm_crtc_state *state)
+{
+	const struct drm_plane_state *pstate;
+	enum drm_color_range range_val[2];
+	struct drm_plane *plane;
+	unsigned int cnt = 0;
+
+	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
+		if (plane->color_range_property && cnt < 2) {
+			range_val[cnt] = pstate->color_range;
+			++cnt;
+		}
+	}
+	if (cnt == 2 && range_val[0] != range_val[1])
+		return -EINVAL;
+	return 0;
+}
+
 static void mixer_atomic_begin(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *mixer_ctx = crtc->ctx;
@@ -1096,6 +1144,7 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
 	.disable		= mixer_disable,
 	.enable_vblank		= mixer_enable_vblank,
 	.disable_vblank		= mixer_disable_vblank,
+	.atomic_check		= mixer_atomic_check,
 	.atomic_begin		= mixer_atomic_begin,
 	.update_plane		= mixer_update_plane,
 	.disable_plane		= mixer_disable_plane,
diff --git a/drivers/gpu/drm/exynos/regs-mixer.h b/drivers/gpu/drm/exynos/regs-mixer.h
index 5ff095b0c1b3..7d558e3dd46c 100644
--- a/drivers/gpu/drm/exynos/regs-mixer.h
+++ b/drivers/gpu/drm/exynos/regs-mixer.h
@@ -158,7 +158,9 @@
 #define MXR_LAYER_CFG_VP_MASK		MXR_LAYER_CFG_VP_VAL(~0)
 
 /* bits for MXR_CM_COEFF_Y */
+#define MXR_CM_COEFF_RGB_LIMITED	(0 << 30)
 #define MXR_CM_COEFF_RGB_FULL		(1 << 30)
+#define MXR_CM_COEFF_RGB_RANGE_MASK	(1 << 30)
 
 #endif /* SAMSUNG_REGS_MIXER_H */
 
-- 
2.7.4
