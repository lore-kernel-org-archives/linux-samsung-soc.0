From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/8] drm/exynos/ipp: simplify property list allocation
Date: Mon, 19 May 2014 12:54:05 +0200
Message-ID: <1400496850-23860-4-git-send-email-a.hajda@samsung.com>
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

prop_list is always allocated, so instead of allocating it dynamically
the pointer can be replaced by the structure itself.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 10 ++--------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 10 ++--------
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_ipp.h     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |  8 +-------
 5 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 30d76b2..5060f8a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1342,11 +1342,7 @@ static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
 
 static int fimc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 {
-	struct drm_exynos_ipp_prop_list *prop_list;
-
-	prop_list = devm_kzalloc(ippdrv->dev, sizeof(*prop_list), GFP_KERNEL);
-	if (!prop_list)
-		return -ENOMEM;
+	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
 
 	prop_list->version = 1;
 	prop_list->writeback = 1;
@@ -1371,8 +1367,6 @@ static int fimc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 	prop_list->scale_min.hsize = FIMC_SCALE_MIN;
 	prop_list->scale_min.vsize = FIMC_SCALE_MIN;
 
-	ippdrv->prop_list = prop_list;
-
 	return 0;
 }
 
@@ -1395,7 +1389,7 @@ static int fimc_ippdrv_check_property(struct device *dev,
 {
 	struct fimc_context *ctx = get_fimc_context(dev);
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_prop_list *pp = ippdrv->prop_list;
+	struct drm_exynos_ipp_prop_list *pp = &ippdrv->prop_list;
 	struct drm_exynos_ipp_config *config;
 	struct drm_exynos_pos *pos;
 	struct drm_exynos_sz *sz;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index fa75059..9e3ff16 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -1335,11 +1335,7 @@ static irqreturn_t gsc_irq_handler(int irq, void *dev_id)
 
 static int gsc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 {
-	struct drm_exynos_ipp_prop_list *prop_list;
-
-	prop_list = devm_kzalloc(ippdrv->dev, sizeof(*prop_list), GFP_KERNEL);
-	if (!prop_list)
-		return -ENOMEM;
+	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
 
 	prop_list->version = 1;
 	prop_list->writeback = 1;
@@ -1363,8 +1359,6 @@ static int gsc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 	prop_list->scale_min.hsize = GSC_SCALE_MIN;
 	prop_list->scale_min.vsize = GSC_SCALE_MIN;
 
-	ippdrv->prop_list = prop_list;
-
 	return 0;
 }
 
@@ -1387,7 +1381,7 @@ static int gsc_ippdrv_check_property(struct device *dev,
 {
 	struct gsc_context *ctx = get_gsc_context(dev);
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
-	struct drm_exynos_ipp_prop_list *pp = ippdrv->prop_list;
+	struct drm_exynos_ipp_prop_list *pp = &ippdrv->prop_list;
 	struct drm_exynos_ipp_config *config;
 	struct drm_exynos_pos *pos;
 	struct drm_exynos_sz *sz;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index e6ef415..bf71d97 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -346,7 +346,7 @@ int exynos_drm_ipp_get_property(struct drm_device *drm_dev, void *data,
 			return PTR_ERR(ippdrv);
 		}
 
-		*prop_list = *ippdrv->prop_list;
+		*prop_list = ippdrv->prop_list;
 	}
 
 	return 0;
@@ -1713,7 +1713,7 @@ static int ipp_subdrv_probe(struct drm_device *drm_dev, struct device *dev)
 		DRM_DEBUG_KMS("count[%d]ippdrv[0x%x]ipp_id[%d]\n",
 			count++, (int)ippdrv, ipp_id);
 
-		ippdrv->prop_list->ipp_id = ipp_id;
+		ippdrv->prop_list.ipp_id = ipp_id;
 
 		/* store parent device for node */
 		ippdrv->parent_dev = dev;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 4aa71b2..eea4db3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -165,7 +165,7 @@ struct exynos_drm_ippdrv {
 	struct workqueue_struct	*event_workq;
 	struct drm_exynos_ipp_cmd_node *c_node;
 	struct list_head	cmd_list;
-	struct drm_exynos_ipp_prop_list *prop_list;
+	struct drm_exynos_ipp_prop_list prop_list;
 
 	int (*check_property)(struct device *dev,
 		struct drm_exynos_ipp_property *property);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index c675427..f01fbb6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -470,11 +470,7 @@ static struct exynos_drm_ipp_ops rot_dst_ops = {
 
 static int rotator_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 {
-	struct drm_exynos_ipp_prop_list *prop_list;
-
-	prop_list = devm_kzalloc(ippdrv->dev, sizeof(*prop_list), GFP_KERNEL);
-	if (!prop_list)
-		return -ENOMEM;
+	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
 
 	prop_list->version = 1;
 	prop_list->flip = (1 << EXYNOS_DRM_FLIP_VERTICAL) |
@@ -487,8 +483,6 @@ static int rotator_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
 	prop_list->crop = 0;
 	prop_list->scale = 0;
 
-	ippdrv->prop_list = prop_list;
-
 	return 0;
 }
 
-- 
1.9.1
