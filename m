From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 07/12] drm/exynos/ipp: simplify memory check function
Date: Thu, 03 Jul 2014 15:10:32 +0200
Message-ID: <1404393037-17299-8-git-send-email-a.hajda@samsung.com>
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

The only thing function should check is if there are buffers in respective
queues.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 44 ++++++++-------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 89ff7e3..b7ce14e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -574,42 +574,18 @@ static void ipp_clean_cmd_node(struct ipp_context *ctx,
 	kfree(c_node);
 }
 
-static int ipp_check_mem_list(struct drm_exynos_ipp_cmd_node *c_node)
+static bool ipp_check_mem_list(struct drm_exynos_ipp_cmd_node *c_node)
 {
-	struct drm_exynos_ipp_property *property = &c_node->property;
-	struct drm_exynos_ipp_mem_node *m_node;
-	struct list_head *head;
-	int ret, i, count[EXYNOS_DRM_OPS_MAX] = { 0, };
-
-	for_each_ipp_ops(i) {
-		/* source/destination memory list */
-		head = &c_node->mem_list[i];
-
-		/* find memory node entry */
-		list_for_each_entry(m_node, head, list) {
-			DRM_DEBUG_KMS("%s,count[%d]m_node[0x%x]\n",
-				i ? "dst" : "src", count[i], (int)m_node);
-			count[i]++;
-		}
+	switch (c_node->property.cmd) {
+	case IPP_CMD_WB:
+		return !list_empty(&c_node->mem_list[EXYNOS_DRM_OPS_DST]);
+	case IPP_CMD_OUTPUT:
+		return !list_empty(&c_node->mem_list[EXYNOS_DRM_OPS_SRC]);
+	case IPP_CMD_M2M:
+	default:
+		return !list_empty(&c_node->mem_list[EXYNOS_DRM_OPS_SRC]) &&
+		       !list_empty(&c_node->mem_list[EXYNOS_DRM_OPS_DST]);
 	}
-
-	DRM_DEBUG_KMS("min[%d]max[%d]\n",
-		min(count[EXYNOS_DRM_OPS_SRC], count[EXYNOS_DRM_OPS_DST]),
-		max(count[EXYNOS_DRM_OPS_SRC], count[EXYNOS_DRM_OPS_DST]));
-
-	/*
-	 * M2M operations should be need paired memory address.
-	 * so, need to check minimum count about src, dst.
-	 * other case not use paired memory, so use maximum count
-	 */
-	if (ipp_is_m2m_cmd(property->cmd))
-		ret = min(count[EXYNOS_DRM_OPS_SRC],
-			count[EXYNOS_DRM_OPS_DST]);
-	else
-		ret = max(count[EXYNOS_DRM_OPS_SRC],
-			count[EXYNOS_DRM_OPS_DST]);
-
-	return ret;
 }
 
 static struct drm_exynos_ipp_mem_node
-- 
1.9.1
