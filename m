From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v10 12/17] drm/exynos: don't disable unused functions at init
Date: Mon,  1 Jun 2015 12:04:50 -0300
Message-ID: <1433171095-23773-13-git-send-email-gustavo@padovan.org>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f47.google.com ([209.85.216.47]:40700 "EHLO
	mail-vn0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429AbbFAPFf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jun 2015 11:05:35 -0400
Received: by vnbf62 with SMTP id f62so16475988vnb.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jun 2015 08:05:34 -0700 (PDT)
In-Reply-To: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Everything starts disabled so we don't really need to disable anything.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e71e331..e0b085b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -275,9 +275,6 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 
 	}
 
-	/* disable all the possible outputs/crtcs before entering KMS mode */
-	drm_helper_disable_unused_functions(dev);
-
 	ret = drm_fb_helper_initial_config(helper, PREFERRED_BPP);
 	if (ret < 0) {
 		DRM_ERROR("failed to set up hw configuration.\n");
-- 
2.1.0
