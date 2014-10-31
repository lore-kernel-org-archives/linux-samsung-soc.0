From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 5/9] drm/exynos: Replace repeated declarations by #include "exynos_drm_drv.h"
Date: Fri, 31 Oct 2014 14:17:39 +0000
Message-ID: <1414765063-30598-5-git-send-email-gustavo@padovan.org>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:33986 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759884AbaJaORs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 10:17:48 -0400
Received: by mail-wg0-f41.google.com with SMTP id k14so8074500wgh.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 07:17:47 -0700 (PDT)
In-Reply-To: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Re-declare struct is not a good practice, let's use the original
drm and exynos declarations.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 690dcdd..e353d35 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -15,10 +15,7 @@
 #ifndef _EXYNOS_DRM_CRTC_H_
 #define _EXYNOS_DRM_CRTC_H_
 
-struct drm_device;
-struct drm_crtc;
-struct exynos_drm_manager;
-struct exynos_drm_overlay;
+#include "exynos_drm_drv.h"
 
 int exynos_drm_crtc_create(struct exynos_drm_manager *manager);
 int exynos_drm_crtc_enable_vblank(struct drm_device *dev, int pipe);
-- 
1.9.3
