From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
Subject: [RFC PATCH v2 11/11] drm: exynos: mixer: Add interconnect support
Date: Thu, 19 Sep 2019 16:22:36 +0200
Message-ID: <20190919142236.4071-12-a.swigon@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142331eucas1p2107a7cb9ce8b3817ed171c21a8ad5b00@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919142236.4071-1-a.swigon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, cw00.choi@samsung.com, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, b.zolnierkie@samsung.com, krzk@kernel.org, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds interconnect support to exynos-mixer. Please note that the
mixer works the same as before when CONFIG_INTERCONNECT is 'n'.

Co-developed-by: Artur Świgoń <a.swigon@partner.samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 71 +++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 7b24338fad3c..a44f3284b071 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -13,6 +13,7 @@
 #include <linux/component.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
@@ -97,6 +98,7 @@ struct mixer_context {
 	struct exynos_drm_crtc	*crtc;
 	struct exynos_drm_plane	planes[MIXER_WIN_NR];
 	unsigned long		flags;
+	struct icc_path		*soc_path;
 
 	int			irq;
 	void __iomem		*mixer_regs;
@@ -931,6 +933,40 @@ static void mixer_disable_vblank(struct exynos_drm_crtc *crtc)
 	mixer_reg_writemask(mixer_ctx, MXR_INT_EN, 0, MXR_INT_EN_VSYNC);
 }
 
+static void mixer_set_memory_bandwidth(struct exynos_drm_crtc *crtc)
+{
+	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
+	struct mixer_context *ctx = crtc->ctx;
+	unsigned long bw, bandwidth = 0;
+	int i, j, sub;
+
+	if (!ctx->soc_path)
+		return;
+
+	for (i = 0; i < MIXER_WIN_NR; i++) {
+		struct drm_plane *plane = &ctx->planes[i].base;
+		const struct drm_format_info *format;
+
+		if (plane->state && plane->state->crtc && plane->state->fb) {
+			format = plane->state->fb->format;
+			bw = mode->hdisplay * mode->vdisplay *
+							drm_mode_vrefresh(mode);
+			if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+				bw /= 2;
+			for (j = 0; j < format->num_planes; j++) {
+				sub = j ? (format->vsub * format->hsub) : 1;
+				bandwidth += format->cpp[j] * bw / sub;
+			}
+		}
+	}
+
+	/* add 20% safety margin */
+	bandwidth = bandwidth / 4 * 5;
+
+	dev_dbg(ctx->dev, "exynos-mixer: safe bandwidth %ld Bps\n", bandwidth);
+	icc_set_bw(ctx->soc_path, Bps_to_icc(bandwidth), 0);
+}
+
 static void mixer_atomic_begin(struct exynos_drm_crtc *crtc)
 {
 	struct mixer_context *ctx = crtc->ctx;
@@ -982,6 +1018,7 @@ static void mixer_atomic_flush(struct exynos_drm_crtc *crtc)
 	if (!test_bit(MXR_BIT_POWERED, &mixer_ctx->flags))
 		return;
 
+	mixer_set_memory_bandwidth(crtc);
 	mixer_enable_sync(mixer_ctx);
 	exynos_crtc_handle_event(crtc);
 }
@@ -1029,6 +1066,7 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < MIXER_WIN_NR; i++)
 		mixer_disable_plane(crtc, &ctx->planes[i]);
 
+	mixer_set_memory_bandwidth(crtc);
 	exynos_drm_pipe_clk_enable(crtc, false);
 
 	pm_runtime_put(ctx->dev);
@@ -1220,12 +1258,22 @@ static int mixer_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct mixer_drv_data *drv;
 	struct mixer_context *ctx;
+	struct icc_path *path;
 	int ret;
 
+	/*
+	 * Returns NULL if CONFIG_INTERCONNECT is disabled.
+	 * May return ERR_PTR(-EPROBE_DEFER).
+	 */
+	path = of_icc_get(dev, NULL);
+	if (IS_ERR(path))
+		return PTR_ERR(path);
+
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx) {
 		DRM_DEV_ERROR(dev, "failed to alloc mixer context.\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err;
 	}
 
 	drv = of_device_get_match_data(dev);
@@ -1233,6 +1281,7 @@ static int mixer_probe(struct platform_device *pdev)
 	ctx->pdev = pdev;
 	ctx->dev = dev;
 	ctx->mxr_ver = drv->version;
+	ctx->soc_path = path;
 
 	if (drv->is_vp_enabled)
 		__set_bit(MXR_BIT_VP_ENABLED, &ctx->flags);
@@ -1242,17 +1291,29 @@ static int mixer_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ctx);
 
 	ret = component_add(&pdev->dev, &mixer_component_ops);
-	if (!ret)
-		pm_runtime_enable(dev);
+	if (ret < 0)
+		goto err;
+
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err:
+	icc_put(path);
 
 	return ret;
 }
 
 static int mixer_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
+	struct device *dev = &pdev->dev;
+	struct mixer_context *ctx = dev_get_drvdata(dev);
 
-	component_del(&pdev->dev, &mixer_component_ops);
+	pm_runtime_disable(dev);
+
+	component_del(dev, &mixer_component_ops);
+
+	icc_put(ctx->soc_path);
 
 	return 0;
 }
-- 
2.17.1
