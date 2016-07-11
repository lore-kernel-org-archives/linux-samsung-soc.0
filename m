From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH] drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=n as GSC Kconfig dependency
Date: Mon, 11 Jul 2016 12:11:40 -0400
Message-ID: <1468253500-27335-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:46287
	"EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755286AbcGKQMD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 12:12:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

Commit aeefb36832e5 ("drm/exynos: gsc: add device tree support and remove
usage of static mappings") made the DRM_EXYNOS_GSC Kconfig symbol to only
be selectable if the exynos-gsc V4L2 driver isn't enabled, since both use
the same HW IP block.

But added the dependency as depends on !VIDEO_SAMSUNG_EXYNOS_GSC which is
not correct since Kconfig expressions are not boolean but tristate. So it
will only evaluate to 'n' if VIDEO_SAMSUNG_EXYNOS_GSC=y but will evaluate
to 'm' if VIDEO_SAMSUNG_S5P_G2D=m.

This means that both the V4L2 and DRM drivers can be enabled if the former
is enabled as a module, which is not what we want.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index d814b3048ee5..ec2dcc5e4962 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -119,7 +119,7 @@ config DRM_EXYNOS_ROTATOR
 
 config DRM_EXYNOS_GSC
 	bool "GScaler"
-	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !VIDEO_SAMSUNG_EXYNOS_GSC
+	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && VIDEO_SAMSUNG_EXYNOS_GSC=n
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
 
-- 
2.5.5
