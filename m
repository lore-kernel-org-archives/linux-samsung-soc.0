From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos/fimd: allow multiplatform configuration
Date: Fri, 23 May 2014 12:58:36 +0200
Message-ID: <1400842716-20560-1-git-send-email-a.hajda@samsung.com>
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

The patch removes dependency on !ARCH_MULTIPLATFORM.
This dependency seems to be not longer valid.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index c8c9510..e0d73fb 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -26,7 +26,7 @@ config DRM_EXYNOS_DMABUF
 
 config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
-	depends on DRM_EXYNOS && !FB_S3C && !ARCH_MULTIPLATFORM
+	depends on DRM_EXYNOS && !FB_S3C
 	select FB_MODE_HELPERS
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
-- 
1.9.1
