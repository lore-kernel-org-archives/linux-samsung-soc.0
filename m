From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 6/6] drm/exynos: do not copy adjusted mode into mode during crtc mode_set
Date: Fri, 23 Jan 2015 10:43:00 -0200
Message-ID: <1422016980-23806-6-git-send-email-gustavo@padovan.org>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:63542 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753929AbbAWMnU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 07:43:20 -0500
Received: by mail-qc0-f180.google.com with SMTP id r5so5988457qcx.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 04:43:19 -0800 (PST)
In-Reply-To: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Daniel Kurtz <djkurtz@chromium.org>

From: Daniel Kurtz <djkurtz@chromium.org>

The 'mode' is the modeline information which specifies the ideal mode
requested by the mode set initiator (usually userspace).
The 'adjusted_mode' is the actual hardware mode after all the crtcs
and encoders have had a chance to "fix it up".

The adjusted_mode starts as a duplicate of the mode in
drm_crtc_helper_set_mode(), and gets modified as required.  There is no
reason to touch the original requested mode.

In fact, doing so will cause us to think a new mode is being requested
whenever userspace tries to establish a new framebuffer with
drmModeSetCrtc(), since userspace will still be using the ideal mode, but
the crtc will be incorrectly comparing it against the adjusted_mode.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 5cd6c1a..7fd6426 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -91,12 +91,6 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	unsigned int crtc_h;
 	int ret;
 
-	/*
-	 * copy the mode data adjusted by mode_fixup() into crtc->mode
-	 * so that hardware can be seet to proper mode.
-	 */
-	memcpy(&crtc->mode, adjusted_mode, sizeof(*adjusted_mode));
-
 	ret = exynos_check_plane(crtc->primary, fb);
 	if (ret < 0)
 		return ret;
-- 
1.9.3
