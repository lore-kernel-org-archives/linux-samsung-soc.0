From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 3/3] drm/exynos: Make DRM_EXYNOS_FIMC depend on VIDEO_S5P_FIMC=n
Date: Mon, 28 Mar 2016 21:28:57 -0400
Message-ID: <1459214937-18686-4-git-send-email-javier@osg.samsung.com>
References: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Exynos DRM driver components are only enabled if other drivers that make
use of the same HW IP block are not enabled. That's the case for the G2D,
GSC, Mixer and HDMI drivers.

The FIMC is also shared by the DRM and a V4L2 driver, so the same has to
be added as a dependency for the Exynos FIMC DRM driver.

Suggested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 8c27037787fc..f9b92c3825ea 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -106,7 +106,7 @@ config DRM_EXYNOS_IPP
 
 config DRM_EXYNOS_FIMC
 	bool "FIMC"
-	depends on DRM_EXYNOS_IPP && MFD_SYSCON
+	depends on DRM_EXYNOS_IPP && MFD_SYSCON && VIDEO_S5P_FIMC=n
 	help
 	  Choose this option if you want to use Exynos FIMC for DRM.
 
-- 
2.5.0
