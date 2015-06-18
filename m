From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/2] drm/exynos: calculate vrefresh instead of use a fixed value
Date: Thu, 18 Jun 2015 17:50:51 -0300
Message-ID: <1434660652-20367-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f173.google.com ([209.85.216.173]:35015 "EHLO
	mail-qc0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750752AbbFRUvA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Jun 2015 16:51:00 -0400
Received: by qcsf5 with SMTP id f5so27812080qcs.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 18 Jun 2015 13:51:00 -0700 (PDT)
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
