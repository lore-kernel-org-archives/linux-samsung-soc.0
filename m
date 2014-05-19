From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/8] drm/exynos/ipp: correct ipp_id field initialization
Date: Mon, 19 May 2014 12:54:04 +0200
Message-ID: <1400496850-23860-3-git-send-email-a.hajda@samsung.com>
References: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1400496850-23860-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: open list <linux-kernel@vger.kernel.org>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

prop_list.ipp_id field is not initialized properly.
The patch fixes it, additionally it removes redundant field from ippdrv.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 14 ++++++--------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |  1 -
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 5aaf21f..e6ef415 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1699,23 +1699,21 @@ static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 
 	/* get ipp driver entry */
 	list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
+		u32 ipp_id;
+
 		ippdrv->drm_dev = drm_dev;
 
 		ret = ipp_create_id(&ctx->ipp_idr, &ctx->ipp_lock, ippdrv,
-			&ippdrv->ipp_id);
-		if (ret) {
+				    &ipp_id);
+		if (ret || ipp_id == 0) {
 			DRM_ERROR("failed to create id.\n");
 			goto err_idr;
 		}
 
 		DRM_DEBUG_KMS("count[%d]ippdrv[0x%x]ipp_id[%d]\n",
-			count++, (int)ippdrv, ippdrv->ipp_id);
+			count++, (int)ippdrv, ipp_id);
 
-		if (ippdrv->ipp_id == 0) {
-			DRM_ERROR("failed to get ipp_id[%d]\n",
-				ippdrv->ipp_id);
-			goto err_idr;
-		}
+		ippdrv->prop_list->ipp_id = ipp_id;
 
 		/* store parent device for node */
 		ippdrv->parent_dev = dev;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index ab1634b..4aa71b2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -160,7 +160,6 @@ struct exynos_drm_ippdrv {
 	struct device	*parent_dev;
 	struct device	*dev;
 	struct drm_device	*drm_dev;
-	u32	ipp_id;
 	bool	dedicated;
 	struct exynos_drm_ipp_ops	*ops[EXYNOS_DRM_OPS_MAX];
 	struct workqueue_struct	*event_workq;
-- 
1.9.1
