From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 2/2] drm/exynos: cleanup exynos_drm_plane
Date: Sat, 25 Apr 2015 20:06:54 +0200
Message-ID: <1429985214-4651-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429985214-4651-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45719 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756594AbbDYSHH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 25 Apr 2015 14:07:07 -0400
In-Reply-To: <1429985214-4651-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Remove the unused fields of struct exynos_drm_plane.

v2: Remove index_color as well, also unused (thanks Joonyoung).

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index e12ecb5..b1014c6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -71,13 +71,6 @@ enum exynos_drm_output_type {
  * @dma_addr: array of bus(accessed by dma) address to the memory region
  *	      allocated for a overlay.
  * @zpos: order of overlay layer(z position).
- * @index_color: if using color key feature then this value would be used
- *			as index color.
- * @default_win: a window to be enabled.
- * @color_key: color key on or off.
- * @local_path: in case of lcd type, local path mode on or off.
- * @transparency: transparency on or off.
- * @activated: activated or not.
  * @enabled: enabled or not.
  * @resume: to resume or not.
  *
@@ -108,13 +101,7 @@ struct exynos_drm_plane {
 	uint32_t pixel_format;
 	dma_addr_t dma_addr[MAX_FB_BUFFER];
 	unsigned int zpos;
-	unsigned int index_color;
 
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
