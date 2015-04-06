From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 2/3] drm/exynos: remove superfluous error messages
Date: Tue,  7 Apr 2015 01:14:51 +0200
Message-ID: <1428362092-29826-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1428362092-29826-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:57500 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751130AbbDFXOT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Apr 2015 19:14:19 -0400
In-Reply-To: <1428362092-29826-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo@padovan.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The messages are redundant since 'check_fb_gem_memory_type'
already prints out exactly the same string when it fails.

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index d346d1e..929cb03 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -151,10 +151,8 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 	exynos_gem_obj = to_exynos_gem_obj(obj);
 
 	ret = check_fb_gem_memory_type(dev, exynos_gem_obj);
-	if (ret < 0) {
-		DRM_ERROR("cannot use this gem memory type for fb.\n");
-		return ERR_PTR(-EINVAL);
-	}
+	if (ret < 0)
+		return ERR_PTR(ret);
 
 	exynos_fb = kzalloc(sizeof(*exynos_fb), GFP_KERNEL);
 	if (!exynos_fb)
@@ -250,10 +248,8 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		exynos_fb->exynos_gem_obj[i] = exynos_gem_obj;
 
 		ret = check_fb_gem_memory_type(dev, exynos_gem_obj);
-		if (ret < 0) {
-			DRM_ERROR("cannot use this gem memory type for fb.\n");
+		if (ret < 0)
 			goto err_unreference;
-		}
 	}
 
 	ret = drm_framebuffer_init(dev, &exynos_fb->fb, &exynos_drm_fb_funcs);
-- 
2.0.5
