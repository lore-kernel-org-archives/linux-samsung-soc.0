From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: add a dependency on FB_S3C to DECON driver
Date: Wed, 03 Jun 2015 11:41:20 +0900
Message-ID: <1433299280-7843-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34452 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751493AbbFCClX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 22:41:23 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPC0312XKSX1U00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 03 Jun 2015 11:41:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch makes one of Linux framebuffer and DRM CRTC drivers
to be enabled.

Display controllers, FIMD and DECON, can be controlled by Linux
framebuffer or DRM CRTC drivers so only one of them should be
enabled.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 0a67803..8203283 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -26,7 +26,7 @@ config DRM_EXYNOS_FIMD
 
 config DRM_EXYNOS7_DECON
 	bool "Exynos DRM DECON"
-	depends on DRM_EXYNOS
+	depends on DRM_EXYNOS && !FB_S3C
 	select FB_MODE_HELPERS
 	help
 	  Choose this option if you want to use Exynos DECON for DRM.
-- 
1.7.9.5
