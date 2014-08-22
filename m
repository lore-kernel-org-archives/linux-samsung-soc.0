From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 05/15] drm/exynos/ipp: remove unused field in command node
Date: Fri, 22 Aug 2014 09:52:16 +0200
Message-ID: <1408693946-15456-6-git-send-email-a.hajda@samsung.com>
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

Since command node have file pointer dev field became useless.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 1 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 81f780e..060a198 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -444,7 +444,6 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 		property->prop_id, property->cmd, (int)ippdrv);
 
 	/* stored property information and ippdrv in private data */
-	c_node->dev = dev;
 	c_node->property = *property;
 	c_node->state = IPP_STATE_IDLE;
 	c_node->filp = file;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 0311035..2a61547 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -48,7 +48,6 @@ struct drm_exynos_ipp_cmd_work {
 /*
  * A structure of command node.
  *
- * @dev: IPP device.
  * @list: list head to command queue information.
  * @event_list: list head of event.
  * @mem_list: list head to source,destination memory queue information.
@@ -65,7 +64,6 @@ struct drm_exynos_ipp_cmd_work {
  * @filp: associated file pointer.
  */
 struct drm_exynos_ipp_cmd_node {
-	struct device		*dev;
 	struct list_head	list;
 	struct list_head	event_list;
 	struct list_head	mem_list[EXYNOS_DRM_OPS_MAX];
-- 
1.9.1
