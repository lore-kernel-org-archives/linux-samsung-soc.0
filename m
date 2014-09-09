From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/9] drm/exynos: fix drm driver de-initialization order
Date: Tue, 09 Sep 2014 15:16:06 +0200
Message-ID: <1410268573-2297-3-git-send-email-a.hajda@samsung.com>
References: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Since components have their own cleanup routines calling
drm_mode_config_cleanup before component_unbind_all causes errors
due to double free of KMS objects. The patch fixes it by changing
de-initialization order. Now it is exactly opposite to init order.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index e11c4d6..b2c710a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -136,14 +136,14 @@ static int exynos_drm_unload(struct drm_device *dev)
 	exynos_drm_device_subdrv_remove(dev);
 
 	exynos_drm_fbdev_fini(dev);
-	drm_vblank_cleanup(dev);
 	drm_kms_helper_poll_fini(dev);
-	drm_mode_config_cleanup(dev);
 
+	component_unbind_all(dev->dev, dev);
+	drm_vblank_cleanup(dev);
+	drm_mode_config_cleanup(dev);
 	drm_release_iommu_mapping(dev);
-	kfree(dev->dev_private);
 
-	component_unbind_all(dev->dev, dev);
+	kfree(dev->dev_private);
 	dev->dev_private = NULL;
 
 	return 0;
-- 
1.9.1
