From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 17/17] drm/exynos/ipp: add file checks for ioctls
Date: Thu, 28 Aug 2014 11:07:41 +0200
Message-ID: <1409216861-12452-18-git-send-email-a.hajda@samsung.com>
References: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1409216861-12452-1-git-send-email-a.hajda@samsung.com>
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

Process should not have access to ipp nodes created by another
process. The patch adds necessary checks.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index fc8bb67..d233cfc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -318,7 +318,8 @@ static void ipp_print_property(struct drm_exynos_ipp_property *property,
 		sz->hsize, sz->vsize, config->flip, config->degree);
 }
 
-static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property)
+static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property,
+		struct drm_file *file)
 {
 	struct exynos_drm_ippdrv *ippdrv;
 	struct drm_exynos_ipp_cmd_node *c_node;
@@ -339,8 +340,12 @@ static int ipp_find_and_set_property(struct drm_exynos_ipp_property *property)
 	 */
 	mutex_lock(&ippdrv->cmd_lock);
 	list_for_each_entry(c_node, &ippdrv->cmd_list, list) {
-		if ((c_node->property.prop_id == prop_id) &&
-		    (c_node->state == IPP_STATE_STOP)) {
+		if (c_node->property.prop_id == prop_id) {
+			if (c_node->filp != file)
+				break;
+			if (c_node->state != IPP_STATE_STOP)
+				break;
+
 			mutex_unlock(&ippdrv->cmd_lock);
 			DRM_DEBUG_KMS("found cmd[%d]ippdrv[0x%x]\n",
 				property->cmd, (int)ippdrv);
@@ -418,7 +423,7 @@ int exynos_drm_ipp_set_property(struct drm_device *drm_dev, void *data,
 	 */
 	if (property->prop_id) {
 		DRM_DEBUG_KMS("prop_id[%d]\n", property->prop_id);
-		return ipp_find_and_set_property(property);
+		return ipp_find_and_set_property(property, file);
 	}
 
 	/* find ipp driver using ipp id */
@@ -1032,7 +1037,7 @@ int exynos_drm_ipp_cmd_ctrl(struct drm_device *drm_dev, void *data,
 
 	c_node = ipp_find_obj(&ctx->prop_idr, &ctx->prop_lock,
 		cmd_ctrl->prop_id);
-	if (!c_node) {
+	if (!c_node || c_node->filp != file) {
 		DRM_ERROR("invalid command node list.\n");
 		return -ENODEV;
 	}
-- 
1.9.1
