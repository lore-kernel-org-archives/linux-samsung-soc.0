From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 02/12] drm/exynos/ipp: remove unused field from
 exynos_drm_ipp_private
Date: Thu, 03 Jul 2014 15:10:27 +0200
Message-ID: <1404393037-17299-3-git-send-email-a.hajda@samsung.com>
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

The patch removes unused event_list field from struct exynos_drm_ipp_private.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 1 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 06cde45..651f37a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -238,7 +238,6 @@ struct exynos_drm_g2d_private {
 
 struct exynos_drm_ipp_private {
 	struct device	*dev;
-	struct list_head	event_list;
 };
 
 struct drm_exynos_file_private {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index f3f114c..5fb89c02 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -534,7 +534,6 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		INIT_LIST_HEAD(&c_node->mem_list[i]);
 
 	INIT_LIST_HEAD(&c_node->event_list);
-	list_splice_init(&priv->event_list, &c_node->event_list);
 	mutex_lock(&ippdrv->cmd_lock);
 	list_add_tail(&c_node->list, &ippdrv->cmd_list);
 	mutex_unlock(&ippdrv->cmd_lock);
@@ -1784,7 +1783,6 @@ static int ipp_subdrv_open(struct drm_device *drm_dev, struct device *dev,
 	priv->dev = dev;
 	file_priv->ipp_priv = priv;
 
-	INIT_LIST_HEAD(&priv->event_list);
 
 	DRM_DEBUG_KMS("done priv[0x%x]\n", (int)priv);
 
-- 
1.9.1
