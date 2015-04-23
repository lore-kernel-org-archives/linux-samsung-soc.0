From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 2/2] drm/exynos: cleanup exynos_drm_plane
Date: Thu, 23 Apr 2015 14:12:26 +0200
Message-ID: <1429791146-4410-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:42211 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965542AbbDWMM1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Apr 2015 08:12:27 -0400
In-Reply-To: <1429791146-4410-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Remove the unused fields of struct exynos_drm_plane.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index e12ecb5..c80331b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -73,11 +73,6 @@ enum exynos_drm_output_type {
  * @zpos: order of overlay layer(z position).
  * @index_color: if using color key feature then this value would be used
  *			as index color.
- * @default_win: a window to be enabled.
- * @color_key: color key on or off.
- * @local_path: in case of lcd type, local path mode on or off.
- * @transparency: transparency on or off.
- * @activated: activated or not.
  * @enabled: enabled or not.
  * @resume: to resume or not.
  *
@@ -110,11 +105,6 @@ struct exynos_drm_plane {
 	unsigned int zpos;
 	unsigned int index_color;
 
-	bool default_win:1;
-	bool color_key:1;
-	bool local_path:1;
-	bool transparency:1;
-	bool activated:1;
 	bool enabled:1;
 	bool resume:1;
 };
-- 
2.0.5
