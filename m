From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 12/12] drm/exynos/ipp: simplify ipp_find_driver
Date: Thu, 03 Jul 2014 15:10:37 +0200
Message-ID: <1404393037-17299-13-git-send-email-a.hajda@samsung.com>
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

The patch puts repeated code sequence into one function, removes verbose
comments and decreases log verbosity.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 74 ++++++++++-----------------------
 1 file changed, 21 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index ae75a1d..c411399 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -174,18 +174,18 @@ static void *ipp_find_obj(struct idr *id_idr, struct mutex *lock, u32 id)
 	return obj;
 }
 
-static inline bool ipp_check_dedicated(struct exynos_drm_ippdrv *ippdrv,
-		enum drm_exynos_ipp_cmd	cmd)
+static int ipp_check_driver(struct exynos_drm_ippdrv *ippdrv,
+			    struct drm_exynos_ipp_property *property)
 {
-	/*
-	 * check dedicated flag and WB, OUTPUT operation with
-	 * power on state.
-	 */
-	if (ippdrv->dedicated || (!ipp_is_m2m_cmd(cmd) &&
-	    !pm_runtime_suspended(ippdrv->dev)))
-		return true;
+	if (ippdrv->dedicated || (!ipp_is_m2m_cmd(property->cmd) &&
+				  !pm_runtime_suspended(ippdrv->dev)))
+		return -EBUSY;
 
-	return false;
+	if (ippdrv->check_property &&
+	    ippdrv->check_property(ippdrv->dev, property))
+		return -EINVAL;
+
+	return 0;
 }
 
 static struct exynos_drm_ippdrv *ipp_find_driver(struct ipp_context *ctx,
@@ -193,62 +193,30 @@ static struct exynos_drm_ippdrv *ipp_find_driver(struct ipp_context *ctx,
 {
 	struct exynos_drm_ippdrv *ippdrv;
 	u32 ipp_id = property->ipp_id;
-
-	DRM_DEBUG_KMS("ipp_id[%d]\n", ipp_id);
+	int ret;
 
 	if (ipp_id) {
-		/* find ipp driver using idr */
-		ippdrv = ipp_find_obj(&ctx->ipp_idr, &ctx->ipp_lock,
-			ipp_id);
+		ippdrv = ipp_find_obj(&ctx->ipp_idr, &ctx->ipp_lock, ipp_id);
 		if (!ippdrv) {
-			DRM_ERROR("not found ipp%d driver.\n", ipp_id);
+			DRM_DEBUG("ipp%d driver not found\n", ipp_id);
 			return ERR_PTR(-ENODEV);
 		}
 
-		/*
-		 * WB, OUTPUT opertion not supported multi-operation.
-		 * so, make dedicated state at set property ioctl.
-		 * when ipp driver finished operations, clear dedicated flags.
-		 */
-		if (ipp_check_dedicated(ippdrv, property->cmd)) {
-			DRM_ERROR("already used choose device.\n");
-			return ERR_PTR(-EBUSY);
-		}
-
-		/*
-		 * This is necessary to find correct device in ipp drivers.
-		 * ipp drivers have different abilities,
-		 * so need to check property.
-		 */
-		if (ippdrv->check_property &&
-		    ippdrv->check_property(ippdrv->dev, property)) {
-			DRM_ERROR("not support property.\n");
-			return ERR_PTR(-EINVAL);
+		ret = ipp_check_driver(ippdrv, property);
+		if (ret < 0) {
+			DRM_DEBUG("ipp%d driver check error %d\n", ipp_id, ret);
+			return ERR_PTR(ret);
 		}
 
 		return ippdrv;
 	} else {
-		/*
-		 * This case is search all ipp driver for finding.
-		 * user application don't set ipp_id in this case,
-		 * so ipp subsystem search correct driver in driver list.
-		 */
 		list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
-			if (ipp_check_dedicated(ippdrv, property->cmd)) {
-				DRM_DEBUG_KMS("used device.\n");
-				continue;
-			}
-
-			if (ippdrv->check_property &&
-			    ippdrv->check_property(ippdrv->dev, property)) {
-				DRM_DEBUG_KMS("not support property.\n");
-				continue;
-			}
-
-			return ippdrv;
+			ret = ipp_check_driver(ippdrv, property);
+			if (ret == 0)
+				return ippdrv;
 		}
 
-		DRM_ERROR("not support ipp driver operations.\n");
+		DRM_DEBUG("cannot find driver suitable for given property.\n");
 	}
 
 	return ERR_PTR(-ENODEV);
-- 
1.9.1
