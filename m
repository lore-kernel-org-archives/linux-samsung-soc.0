From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 09/29] drm/exynos: don't do any DPMS operation while updating planes
Date: Thu, 18 Dec 2014 11:58:35 -0200
Message-ID: <1418911135-5207-10-git-send-email-gustavo@padovan.org>
References: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:43674 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752491AbaLRN7h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Dec 2014 08:59:37 -0500
Received: by mail-qc0-f179.google.com with SMTP id c9so892437qcz.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Dec 2014 05:59:36 -0800 (PST)
In-Reply-To: <1418911135-5207-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

DPMS only makes sense when the mode changes, for plane update changes do
not perform any dpms operation.

This move places the win_commit() and commit() calls directly in the code
instead of calling exynos_drm_crtc_commit() thus avoiding DPMS operations.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 13c7ba5..e946b5f5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -115,6 +115,8 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
 					  struct drm_framebuffer *old_fb)
 {
 	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
+	struct exynos_drm_manager *manager = exynos_crtc->manager;
+	struct exynos_drm_plane *exynos_plane = to_exynos_plane(crtc->primary);
 	struct drm_framebuffer *fb = crtc->primary->fb;
 	unsigned int crtc_w;
 	unsigned int crtc_h;
@@ -134,7 +136,11 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
 	if (ret)
 		return ret;
 
-	exynos_drm_crtc_commit(crtc);
+	if (manager->ops->win_commit)
+		manager->ops->win_commit(manager, exynos_plane->zpos);
+
+	if (manager->ops->commit)
+		manager->ops->commit(manager);
 
 	return 0;
 }
-- 
1.9.3
