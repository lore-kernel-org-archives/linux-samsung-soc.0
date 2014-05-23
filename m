From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: add fimd dependency to fimd related encoders
Date: Fri, 23 May 2014 12:59:28 +0200
Message-ID: <1400842768-20622-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

DPI, DSI and DP drivers will not work without FIMD.
The patch adds appropriate dependencies in Kconfig.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index e0d73fb..178d2a9 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -33,7 +33,7 @@ config DRM_EXYNOS_FIMD
 
 config DRM_EXYNOS_DPI
 	bool "EXYNOS DRM parallel output support"
-	depends on DRM_EXYNOS
+	depends on DRM_EXYNOS_FIMD
 	select DRM_PANEL
 	default n
 	help
@@ -41,7 +41,7 @@ config DRM_EXYNOS_DPI
 
 config DRM_EXYNOS_DSI
 	bool "EXYNOS DRM MIPI-DSI driver support"
-	depends on DRM_EXYNOS
+	depends on DRM_EXYNOS_FIMD
 	select DRM_MIPI_DSI
 	select DRM_PANEL
 	default n
@@ -50,7 +50,7 @@ config DRM_EXYNOS_DSI
 
 config DRM_EXYNOS_DP
 	bool "EXYNOS DRM DP driver support"
-	depends on DRM_EXYNOS && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
+	depends on DRM_EXYNOS_FIMD && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
 	default DRM_EXYNOS
 	help
 	  This enables support for DP device.
-- 
1.9.1
