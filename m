From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 06/12] drm/exynos/ipp: remove incorrect checks of
 list_first_entry result
Date: Thu, 03 Jul 2014 15:10:31 +0200
Message-ID: <1404393037-17299-7-git-send-email-a.hajda@samsung.com>
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

list_first_entry does not return NULL on empty list so this check
does not make sense. Moreover there is already code which prevents calling
list_first_entry on empty lists.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index f84ef8a..89ff7e3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1277,11 +1277,6 @@ static int ipp_start_property(struct exynos_drm_ippdrv *ippdrv,
 
 			m_node = list_first_entry(head,
 				struct drm_exynos_ipp_mem_node, list);
-			if (!m_node) {
-				DRM_ERROR("failed to get node.\n");
-				ret = -EFAULT;
-				goto err_unlock;
-			}
 
 			DRM_DEBUG_KMS("m_node[0x%x]\n", (int)m_node);
 
@@ -1539,11 +1534,6 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 
 			m_node = list_first_entry(head,
 				struct drm_exynos_ipp_mem_node, list);
-			if (!m_node) {
-				DRM_ERROR("empty memory node.\n");
-				ret = -ENOMEM;
-				goto err_mem_unlock;
-			}
 
 			tbuf_id[i] = m_node->buf_id;
 			DRM_DEBUG_KMS("%s buf_id[%d]\n",
@@ -1580,11 +1570,6 @@ static int ipp_send_event(struct exynos_drm_ippdrv *ippdrv,
 
 		m_node = list_first_entry(head,
 			struct drm_exynos_ipp_mem_node, list);
-		if (!m_node) {
-			DRM_ERROR("empty memory node.\n");
-			ret = -ENOMEM;
-			goto err_mem_unlock;
-		}
 
 		tbuf_id[EXYNOS_DRM_OPS_SRC] = m_node->buf_id;
 
-- 
1.9.1
