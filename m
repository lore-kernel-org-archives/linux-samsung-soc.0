From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/9] drm/exynos: remove extra declaration of struct exynos_drm_manager
Date: Fri, 31 Oct 2014 14:17:36 +0000
Message-ID: <1414765063-30598-2-git-send-email-gustavo@padovan.org>
References: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:35186 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759483AbaJaORq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 10:17:46 -0400
Received: by mail-wg0-f43.google.com with SMTP id y10so3657289wgg.30
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2014 07:17:45 -0700 (PDT)
In-Reply-To: <1414765063-30598-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

The struct is defined in the same file, declare it here is just
unnecessary.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_encoder.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_encoder.h b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
index b7a1620..26305d8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_encoder.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_encoder.h
@@ -14,8 +14,6 @@
 #ifndef _EXYNOS_DRM_ENCODER_H_
 #define _EXYNOS_DRM_ENCODER_H_
 
-struct exynos_drm_manager;
-
 void exynos_drm_encoder_setup(struct drm_device *dev);
 struct drm_encoder *exynos_drm_encoder_create(struct drm_device *dev,
 			struct exynos_drm_display *mgr,
-- 
1.9.3
