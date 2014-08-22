From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 1/2] drivers/gpu/drm/exynos/exynos_drm_fb.h: Fix typo in include guard
Date: Fri, 22 Aug 2014 14:04:35 +0200
Message-ID: <1408709076-13260-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:54488 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751947AbaHVMEs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 08:04:48 -0400
Received: by mail-la0-f43.google.com with SMTP id gi9so7445098lab.30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2014 05:04:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index 517471b..09ce2bc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -12,7 +12,7 @@
  */
 
 #ifndef _EXYNOS_DRM_FB_H_
-#define _EXYNOS_DRM_FB_H
+#define _EXYNOS_DRM_FB_H_
 
 struct drm_framebuffer *
 exynos_drm_framebuffer_init(struct drm_device *dev,
-- 
1.9.2
