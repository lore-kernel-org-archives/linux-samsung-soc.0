From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/4] ARM: exynos: Remove PTN3460 dependency
Date: Fri,  7 Aug 2015 18:27:32 +0200
Message-ID: <1438964855-16989-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34979 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753668AbbHGQ2V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Aug 2015 12:28:21 -0400
Received: by wibxm9 with SMTP id xm9so67881800wib.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Aug 2015 09:28:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Now that the PTN3460 driver has been rewritten as a proper I2C driver
and there is infrastructure to hook up the bridge with a DRM device, it
is no longer necessary to have this dependency to ensure the correct
build mode.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 43003c4ad80b..df0b61a60501 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -56,7 +56,7 @@ config DRM_EXYNOS_DSI
 
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON) && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	depends on DRM_EXYNOS && (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON)
 	default DRM_EXYNOS
 	select DRM_PANEL
 	help
-- 
2.4.5
