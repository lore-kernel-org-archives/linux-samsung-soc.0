From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 2/2] drm/exynos: Allow DRM_EXYNOS on s5pv210.
Date: Sat, 21 Apr 2018 19:26:11 +0200
Message-ID: <1524331571-7420-3-git-send-email-pawel.mikolaj.chmiel@gmail.com>
References: <1524331571-7420-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524331571-7420-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com
Cc: airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch brings back possibility to use drivers depending on
DRM_EXYNOS, on Samsung S5PV210/S5PC110 series based systems.

Fixes: dbbc925bb83a ("drm/exynos: depend on ARCH_EXYNOS for DRM_EXYNOS")
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 735ce47688f9..1548a784ef71 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -1,6 +1,6 @@
 config DRM_EXYNOS
 	tristate "DRM Support for Samsung SoC EXYNOS Series"
-	depends on OF && DRM && (ARCH_S3C64XX || ARCH_EXYNOS || ARCH_MULTIPLATFORM)
+	depends on OF && DRM && (ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM)
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select SND_SOC_HDMI_CODEC if SND_SOC
-- 
2.7.4
