From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 07/10] drm/exynos: add mode_valid callback to exynos_drm
Date: Thu, 24 Aug 2017 15:33:56 +0200
Message-ID: <1503581639-580-8-git-send-email-a.hajda@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133411eucas1p2cedf32dfa953896267b2db58f1af30b7@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1503581639-580-1-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

crtc::mode_valid callback is required to implement proper pipeline
validation for command/video modes. Since Exynos uses private
framework such callback should be added to it.

Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 12 ++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index ac544de..6ce0821 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -84,7 +84,19 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
 		exynos_crtc->ops->atomic_flush(exynos_crtc);
 }
 
+static enum drm_mode_status exynos_crtc_mode_valid(struct drm_crtc *crtc,
+	const struct drm_display_mode *mode)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+
+	if (exynos_crtc->ops->mode_valid)
+		return exynos_crtc->ops->mode_valid(exynos_crtc, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
+	.mode_valid	= exynos_crtc_mode_valid,
 	.atomic_check	= exynos_crtc_atomic_check,
 	.atomic_begin	= exynos_crtc_atomic_begin,
 	.atomic_flush	= exynos_crtc_atomic_flush,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 9e77809..d53435b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -117,6 +117,7 @@ struct exynos_drm_plane_config {
  * @disable: disable the device
  * @enable_vblank: specific driver callback for enabling vblank interrupt.
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
+ * @mode_valid: specific driver callback for mode validation
  * @atomic_check: validate state
  * @atomic_begin: prepare device to receive an update
  * @atomic_flush: mark the end of device update
@@ -132,6 +133,8 @@ struct exynos_drm_crtc_ops {
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	u32 (*get_vblank_counter)(struct exynos_drm_crtc *crtc);
+	enum drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
+		const struct drm_display_mode *mode);
 	int (*atomic_check)(struct exynos_drm_crtc *crtc,
 			    struct drm_crtc_state *state);
 	void (*atomic_begin)(struct exynos_drm_crtc *crtc);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
