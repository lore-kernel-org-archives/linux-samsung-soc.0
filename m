From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] drm/exynos: add CONFIG_MMU dependency
Date: Mon,  8 Jul 2019 15:46:51 +0200
Message-ID: <20190708134707.538501-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, Jingoo Han <jingoohan1@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Compile-testing this driver on a NOMMU configuration shows a link failure:

drivers/gpu/drm/exynos/exynos_drm_gem.o: In function `exynos_drm_gem_fault':
exynos_drm_gem.c:(.text+0x484): undefined reference to `vmf_insert_mixed'

Add a CONFIG_MMU dependency to ensure we only enable this in configurations
that build correctly.

Many other drm drivers have the same dependency. It would be nice to
make this work in MMU-less configurations, but evidently nobody has
ever needed this so far.

Fixes: 156bdac99061 ("drm/exynos: trigger build of all modules")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/exynos/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 60ce4a8ad9e1..6f7d3b3b3628 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -2,6 +2,7 @@
 config DRM_EXYNOS
 	tristate "DRM Support for Samsung SoC EXYNOS Series"
 	depends on OF && DRM && (ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST)
+	depends on MMU
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select SND_SOC_HDMI_CODEC if SND_SOC
-- 
2.20.0
