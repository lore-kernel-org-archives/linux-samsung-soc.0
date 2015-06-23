From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 05/23] drm/exynos: Kconfig: select DP if FIMD or DECON are selected
Date: Tue, 23 Jun 2015 18:35:18 -0300
Message-ID: <1435095336-6196-6-git-send-email-gustavo@padovan.org>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:34430 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932116AbbFWVf6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jun 2015 17:35:58 -0400
Received: by qcji3 with SMTP id i3so7085879qcj.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2015 14:35:58 -0700 (PDT)
In-Reply-To: <1435095336-6196-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

DP is required if either FIMD or DECON are selected so select it
automatically.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 8203283..2d86304 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -20,6 +20,7 @@ config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
 	depends on DRM_EXYNOS && !FB_S3C
 	select FB_MODE_HELPERS
+	select DRM_EXYNOS_DP
 	select MFD_SYSCON
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
@@ -28,6 +29,7 @@ config DRM_EXYNOS7_DECON
 	bool "Exynos DRM DECON"
 	depends on DRM_EXYNOS && !FB_S3C
 	select FB_MODE_HELPERS
+	select DRM_EXYNOS_DP
 	help
 	  Choose this option if you want to use Exynos DECON for DRM.
 
@@ -50,7 +52,7 @@ config DRM_EXYNOS_DSI
 
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON) && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	depends on ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
-- 
2.1.0
