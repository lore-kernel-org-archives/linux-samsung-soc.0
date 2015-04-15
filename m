From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC 2/6] drm/exynos: remove used 'activated' field from exynos_drm_plane
Date: Wed, 15 Apr 2015 17:01:56 +0200
Message-ID: <1429110120-7043-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:56657 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754047AbbDOPCk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Apr 2015 11:02:40 -0400
In-Reply-To: <1429110120-7043-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6a849cf..4c14a89 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -77,7 +77,6 @@ extern void exynos4412_qos(u8 tm, u8 ac);
  * @color_key: color key on or off.
  * @local_path: in case of lcd type, local path mode on or off.
  * @transparency: transparency on or off.
- * @activated: activated or not.
  * @enabled: enabled or not.
  * @resume: to resume or not.
  *
@@ -112,7 +111,6 @@ struct exynos_drm_plane {
 	bool color_key:1;
 	bool local_path:1;
 	bool transparency:1;
-	bool activated:1;
 	bool enabled:1;
 	bool resume:1;
 };
-- 
2.0.5
