From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 2/2] drm/exynos: remove unused 'activated' field from exynos_drm_plane
Date: Wed, 15 Apr 2015 21:54:52 +0200
Message-ID: <1429127692-5772-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1429127692-5772-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:58438 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754596AbbDPO0K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 10:26:10 -0400
In-Reply-To: <1429127692-5772-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

No component of Exynos DRM uses this field. Perhaps it was
once meant to provide more fine-grained information in
addition to the status stored in the 'enabled' field.

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
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
