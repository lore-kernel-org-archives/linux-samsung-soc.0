From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH] drm/exynos: Fix build breakage on !DRM_EXYNOS_FIMD
Date: Sat,  2 May 2015 13:08:26 +0900
Message-ID: <1430539706-2945-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:35178 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751128AbbEBEIj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 May 2015 00:08:39 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Selecting CONFIG_FB_S3C disables CONFIG_DRM_EXYNOS_FIMD leading to build
error:

drivers/built-in.o: In function `exynos_dp_dpms':
binder.c:(.text+0xd6a840): undefined reference to `fimd_dp_clock_enable'
binder.c:(.text+0xd6ab54): undefined reference to `fimd_dp_clock_enable'

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.h b/drivers/gpu/drm/exynos/exynos_drm_fimd.h
index b4fcaa568456..db67f3d9786d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.h
@@ -10,6 +10,10 @@
 #ifndef _EXYNOS_DRM_FIMD_H_
 #define _EXYNOS_DRM_FIMD_H_
 
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 extern void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable);
+#else
+static inline void fimd_dp_clock_enable(struct exynos_drm_crtc *crtc, bool enable) {};
+#endif
 
 #endif /* _EXYNOS_DRM_FIMD_H_ */
-- 
2.1.4
