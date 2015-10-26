From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/7] drm/exynos: add atomic_check callback to exynos_crtc
Date: Mon, 26 Oct 2015 13:03:39 +0100
Message-ID: <1445861025-23266-2-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40362 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753488AbbJZMEC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:02 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT00D7VTIMZM20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:03:58 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Some CRTCs needs mode validation, this patch adds neccessary
callback to Exynos DRM framework. It is called from DRM core
via atomic_check helper for drm_crtc.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 12 ++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 50dec0d..b3ba27f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -50,6 +50,17 @@ exynos_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		exynos_crtc->ops->commit(exynos_crtc);
 }
 
+static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_crtc_state *state)
+{
+	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+
+	if (exynos_crtc->ops->atomic_check)
+		return exynos_crtc->ops->atomic_check(exynos_crtc, state);
+
+	return 0;
+}
+
 static void exynos_crtc_atomic_begin(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_crtc_state)
 {
@@ -86,6 +97,7 @@ static struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
 	.enable		= exynos_drm_crtc_enable,
 	.disable	= exynos_drm_crtc_disable,
 	.mode_set_nofb	= exynos_drm_crtc_mode_set_nofb,
+	.atomic_check	= exynos_crtc_atomic_check,
 	.atomic_begin	= exynos_crtc_atomic_begin,
 	.atomic_flush	= exynos_crtc_atomic_flush,
 };
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 638fc43..f1eda7f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -89,6 +89,7 @@ struct exynos_drm_plane {
  * @disable_vblank: specific driver callback for disabling vblank interrupt.
  * @wait_for_vblank: wait for vblank interrupt to make sure that
  *	hardware overlay is updated.
+ * @atomic_check: validate state
  * @atomic_begin: prepare a window to receive a update
  * @atomic_flush: mark the end of a window update
  * @update_plane: apply hardware specific overlay data to registers.
@@ -108,6 +109,8 @@ struct exynos_drm_crtc_ops {
 	int (*enable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*disable_vblank)(struct exynos_drm_crtc *crtc);
 	void (*wait_for_vblank)(struct exynos_drm_crtc *crtc);
+	int (*atomic_check)(struct exynos_drm_crtc *crtc,
+			    struct drm_crtc_state *state);
 	void (*atomic_begin)(struct exynos_drm_crtc *crtc,
 			      struct exynos_drm_plane *plane);
 	void (*update_plane)(struct exynos_drm_crtc *crtc,
-- 
1.9.1
