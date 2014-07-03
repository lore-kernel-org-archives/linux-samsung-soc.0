From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 10/12] drm/exynos/ipp: remove redundant messages
Date: Thu, 03 Jul 2014 15:10:35 +0200
Message-ID: <1404393037-17299-11-git-send-email-a.hajda@samsung.com>
References: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1404393037-17299-1-git-send-email-a.hajda@samsung.com>
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

In case of error callback prints already corresponding message.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index c7ea047..0552f62 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1152,7 +1152,6 @@ static int ipp_set_property(struct exynos_drm_ippdrv *ippdrv,
 	/* reset h/w block */
 	if (ippdrv->reset &&
 	    ippdrv->reset(ippdrv->dev)) {
-		DRM_ERROR("failed to reset.\n");
 		return -EINVAL;
 	}
 
@@ -1170,30 +1169,24 @@ static int ipp_set_property(struct exynos_drm_ippdrv *ippdrv,
 		/* set format */
 		if (ops->set_fmt) {
 			ret = ops->set_fmt(ippdrv->dev, config->fmt);
-			if (ret) {
-				DRM_ERROR("not support format.\n");
+			if (ret)
 				return ret;
-			}
 		}
 
 		/* set transform for rotation, flip */
 		if (ops->set_transf) {
 			ret = ops->set_transf(ippdrv->dev, config->degree,
 				config->flip, &swap);
-			if (ret) {
-				DRM_ERROR("not support tranf.\n");
-				return -EINVAL;
-			}
+			if (ret)
+				return ret;
 		}
 
 		/* set size */
 		if (ops->set_size) {
 			ret = ops->set_size(ippdrv->dev, swap, &config->pos,
 				&config->sz);
-			if (ret) {
-				DRM_ERROR("not support size.\n");
+			if (ret)
 				return ret;
-			}
 		}
 	}
 
-- 
1.9.1
