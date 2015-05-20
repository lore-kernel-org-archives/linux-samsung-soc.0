From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 1/2] drm/exynos: calculate vrefresh instead of use a fixed value
Date: Wed, 20 May 2015 11:33:47 -0300
Message-ID: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:34413 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbbETOd6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 10:33:58 -0400
Received: by qkgx75 with SMTP id x75so32854342qkg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2015 07:33:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, daniel@fooishbar.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

When mode's vrefresh is zero we should ask DRM core to calculate vrefresh
for us so we can get the correct value instead of relying on fixed value
defined in a macro.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9819fa6..08f7197 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -42,7 +42,6 @@
  * CPU Interface.
  */
 
-#define FIMD_DEFAULT_FRAMERATE 60
 #define MIN_FB_WIDTH_FOR_16WORD_BURST 128
 
 /* position control register for hardware window 0, 2 ~ 4.*/
@@ -329,7 +328,7 @@ static bool fimd_mode_fixup(struct exynos_drm_crtc *crtc,
 		struct drm_display_mode *adjusted_mode)
 {
 	if (adjusted_mode->vrefresh == 0)
-		adjusted_mode->vrefresh = FIMD_DEFAULT_FRAMERATE;
+		adjusted_mode->vrefresh = drm_mode_vrefresh(mode);
 
 	return true;
 }
-- 
2.1.0
