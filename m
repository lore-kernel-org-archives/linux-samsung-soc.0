From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH v7 08/13] drm/exynos: atomic phase 3: use atomic .set_config helper
Date: Fri, 22 May 2015 12:40:48 -0300
Message-ID: <1432309253-18572-9-git-send-email-gustavo@padovan.org>
References: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:34802 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757418AbbEVPlW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 11:41:22 -0400
Received: by qkgx75 with SMTP id x75so14297221qkg.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2015 08:41:21 -0700 (PDT)
In-Reply-To: <1432309253-18572-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Now that phase 1 and 2 are complete switch .set_config helper to
use the atomic one.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index fe77516..9e14ba3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -193,7 +193,7 @@ static void exynos_drm_crtc_destroy(struct drm_crtc *crtc)
 }
 
 static struct drm_crtc_funcs exynos_crtc_funcs = {
-	.set_config	= drm_crtc_helper_set_config,
+	.set_config	= drm_atomic_helper_set_config,
 	.page_flip	= exynos_drm_crtc_page_flip,
 	.destroy	= exynos_drm_crtc_destroy,
 	.reset = drm_atomic_helper_crtc_reset,
-- 
2.1.0
