From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v6 10/12] drm/exynos: don't disable unused functions at init
Date: Thu, 21 May 2015 17:02:49 -0300
Message-ID: <1432238571-31621-11-git-send-email-gustavo@padovan.org>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:34958 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756554AbbEUUDb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 16:03:31 -0400
Received: by qgew3 with SMTP id w3so47707009qge.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 May 2015 13:03:31 -0700 (PDT)
In-Reply-To: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Everything starts disabled so we don't really need to disable anything.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
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
