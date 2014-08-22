From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 04/15] drm/exynos/ipp: remove only related commands on file
 close
Date: Fri, 22 Aug 2014 09:52:15 +0200
Message-ID: <1408693946-15456-5-git-send-email-a.hajda@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
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

On file close driver should remove only command nodes created
via this file.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index bbe9968..81f780e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1681,14 +1681,11 @@ static int ipp_subdrv_open(struct drm_device *drm_dev, struct device *dev,
 static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 		struct drm_file *file)
 {
-	struct drm_exynos_file_private *file_priv = file->driver_priv;
 	struct exynos_drm_ippdrv *ippdrv = NULL;
 	struct ipp_context *ctx = get_ipp_context(dev);
 	struct drm_exynos_ipp_cmd_node *c_node, *tc_node;
 	int count = 0;
 
-	DRM_DEBUG_KMS("for priv[0x%x]\n", (int)file_priv->ipp_dev);
-
 	list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
 		mutex_lock(&ippdrv->cmd_lock);
 		list_for_each_entry_safe(c_node, tc_node,
@@ -1696,7 +1693,7 @@ static void ipp_subdrv_close(struct drm_device *drm_dev, struct device *dev,
 			DRM_DEBUG_KMS("count[%d]ippdrv[0x%x]\n",
 				count++, (int)ippdrv);
 
-			if (c_node->dev == file_priv->ipp_dev) {
+			if (c_node->filp == file) {
 				/*
 				 * userland goto unnormal state. process killed.
 				 * and close the file.
-- 
1.9.1
