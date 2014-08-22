From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 10/15] drm/exynos/ipp: stop hardware before freeing memory
Date: Fri, 22 Aug 2014 09:52:21 +0200
Message-ID: <1408693946-15456-11-git-send-email-a.hajda@samsung.com>
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

Memory shouldn't be freed when hardware is still running.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index c72d8d1..6de75aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1283,12 +1283,15 @@ static int ipp_stop_property(struct drm_device *drm_dev,
 		struct drm_exynos_ipp_cmd_node *c_node)
 {
 	struct drm_exynos_ipp_property *property = &c_node->property;
-	int ret = 0, i;
+	int i;
 
 	DRM_DEBUG_KMS("prop_id[%d]\n", property->prop_id);
 
 	/* put event */
 	ipp_put_event(c_node, NULL);
+	/* stop operations */
+	if (ippdrv->stop)
+		ippdrv->stop(ippdrv->dev, property->cmd);
 
 	/* check command */
 	switch (property->cmd) {
@@ -1304,16 +1307,10 @@ static int ipp_stop_property(struct drm_device *drm_dev,
 		break;
 	default:
 		DRM_ERROR("invalid operations.\n");
-		ret = -EINVAL;
-		goto err_clear;
+		return -EINVAL;
 	}
 
-err_clear:
-	/* stop operations */
-	if (ippdrv->stop)
-		ippdrv->stop(ippdrv->dev, property->cmd);
-
-	return ret;
+	return 0;
 }
 
 void ipp_sched_cmd(struct work_struct *work)
-- 
1.9.1
