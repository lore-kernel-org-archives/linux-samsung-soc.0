From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH] drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=n as GSC Kconfig dependency
Date: Tue, 29 Nov 2016 11:40:51 -0300
Message-ID: <1480430451-26957-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:45729
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1757231AbcK2OlG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 09:41:06 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

Commit aeefb36832e5 ("drm/exynos: gsc: add device tree support and remove
usage of static mappings") made the DRM_EXYNOS_GSC Kconfig symbol to only
be selectable if the exynos-gsc V4L2 driver isn't enabled, since both use
the same HW IP block.

But added the dependency as depends on !VIDEO_SAMSUNG_EXYNOS_GSC which is
not correct since Kconfig expressions are not boolean but tristate. So it
will only evaluate to 'n' if VIDEO_SAMSUNG_EXYNOS_GSC=y but will evaluate
to 'm' if VIDEO_SAMSUNG_EXYNOS_GSC=m.

This means that both the V4L2 and DRM drivers can be enabled if the former
is enabled as a module, which isn't what we want since otherwise 2 drivers
could attempt to use the hardware at the same time.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 465d344f3391..d706ca4e2f02 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -114,7 +114,7 @@ config DRM_EXYNOS_ROTATOR
 
 config DRM_EXYNOS_GSC
 	bool "GScaler"
-	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !VIDEO_SAMSUNG_EXYNOS_GSC
+	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && VIDEO_SAMSUNG_EXYNOS_GSC=n
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
 
-- 
2.7.4
