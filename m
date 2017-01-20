From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 1/3] drm/exynos: Remove Kconfig deps for FIMD and DECON7
Date: Fri, 20 Jan 2017 17:02:50 +0100
Message-ID: <1484928172-16784-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47204 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752422AbdATQDN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 11:03:13 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

While the Kconfig entries of FIMD and DECON7 both select
FB_MODE_HELPERS, the code doesn't use any of the functionality.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index d706ca4..1d18534 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -19,7 +19,6 @@ comment "CRTCs"
 config DRM_EXYNOS_FIMD
 	bool "FIMD"
 	depends on !FB_S3C
-	select FB_MODE_HELPERS
 	select MFD_SYSCON
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
@@ -32,7 +31,6 @@ config DRM_EXYNOS5433_DECON
 config DRM_EXYNOS7_DECON
 	bool "DECON on Exynos7"
 	depends on !FB_S3C
-	select FB_MODE_HELPERS
 	help
 	  Choose this option if you want to use Exynos DECON for DRM.
 
-- 
2.7.3
