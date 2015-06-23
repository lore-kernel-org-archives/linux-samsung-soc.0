From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 02/23] drm/exynos: calculate vrefresh instead of use a fixed value
Date: Tue, 23 Jun 2015 18:35:15 -0300
Message-ID: <1435095336-6196-3-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:34255 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932502AbbFWVfu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:35:50 -0400
Received: by qkeo142 with SMTP id o142so12224721qke.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:35:49 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
for us so we can get the correct value instead of relying on fixed value
defined in a macro. But if vrefresh is still zero we should fail the
update.

Suggested-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 1e3bb72..7ba348e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -41,7 +41,6 @@
  * CPU Interface.
  */
 
-#define FIMD_DEFAULT_FRAMERATE 60
 #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
 
 /* position control register for hardware window 0, 2 ~ 4.*/
@@ -403,7 +402,9 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
 		struct drm_display_mode *adjusted_mode)
 {
 	if (adjusted_mode->vrefresh == 0)
-		adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
+		adjusted_mode->vrefresh = drm_mode_vrefresh(mode);
+	if (adjusted_mode->vrefresh == 0)
+		return false;
 
 	return true;
 }
-- 
2.1.0
