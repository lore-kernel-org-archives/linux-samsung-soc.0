From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 07/10] drm/exynos: add mode_fixup callback to
 exynos_drm_crtc_ops
Date: Wed, 06 Sep 2017 12:36:57 +0200
Message-ID: <1504694220-15818-8-git-send-email-a.hajda@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103730eucas1p182c799cf23b889626dde869bbad3250c@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35951 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753085AbdIFKhe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 06:37:34 -0400
In-reply-to: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Daniel Drake <drake@endlessm.com>

crtc::mode_fixup callback is required by crtcs which use internally
different mode than requested by user - case of Exynos Mixer.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 6ce0821..dc01342 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -95,8 +95,23 @@ static enum drm_mode_status exynos_crtc_mode_valid(struct drm_crtc *crtc,
 	return MODE_OK;
 }
 
+static bool exynos_crtc_mode_fixup(struct drm_crtc *crtc,
+		const struct drm_display_mode *mode,
+		struct drm_display_mode *adjusted_mode)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+
+	if (exynos_crtc->ops->mode_fixup)
+		return exynos_crtc->ops->mode_fixup(exynos_crtc, mode,
+				adjusted_mode);
+
+	return true;
+}
+
+
 static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.mode_valid	= exynos_crtc_mode_valid,
+	.mode_fixup	= exynos_crtc_mode_fixup,
 	.atomic_check	= exynos_crtc_atomic_check,
 	.atomic_begin	= exynos_crtc_atomic_begin,
 	.atomic_flush	= exynos_crtc_atomic_flush,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index cf131c2..e8bcc72 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -136,6 +136,9 @@ struct exynos_drm_crtc_ops {
 	u32 (*get_vblank_counter)(struct exynos_drm_crtc *crtc);
 	enum drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
 		const struct drm_display_mode *mode);
+	bool (*mode_fixup)(struct exynos_drm_crtc *crtc,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
 	int (*atomic_check)(struct exynos_drm_crtc *crtc,
 			    struct drm_crtc_state *state);
 	void (*atomic_begin)(struct exynos_drm_crtc *crtc);
-- 
2.7.4
