From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 05/12] drm/exynos/ipp: remove temporary variable
Date: Thu, 03 Jul 2014 15:10:30 +0200
Message-ID: <1404393037-17299-6-git-send-email-a.hajda@samsung.com>
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

There is no reason to allocate intermediate variable.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index f3d8b5c..f84ef8a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -680,15 +680,14 @@ static struct drm_exynos_ipp_mem_node
 		struct drm_exynos_ipp_queue_buf *qbuf)
 {
 	struct drm_exynos_ipp_mem_node *m_node;
-	struct drm_exynos_ipp_buf_info buf_info;
+	struct drm_exynos_ipp_buf_info *buf_info;
 	int i;
 
 	m_node = kzalloc(sizeof(*m_node), GFP_KERNEL);
 	if (!m_node)
 		return ERR_PTR(-ENOMEM);
 
-	/* clear base address for error handling */
-	memset(&buf_info, 0x0, sizeof(buf_info));
+	buf_info = &m_node->buf_info;
 
 	/* operations, buffer id */
 	m_node->ops_id = qbuf->ops_id;
@@ -712,15 +711,14 @@ static struct drm_exynos_ipp_mem_node
 				goto err_clear;
 			}
 
-			buf_info.handles[i] = qbuf->handle[i];
-			buf_info.base[i] = *addr;
-			DRM_DEBUG_KMS("i[%d]base[0x%x]hd[0x%x]\n",
-				i, buf_info.base[i], (int)buf_info.handles[i]);
+			buf_info->handles[i] = qbuf->handle[i];
+			buf_info->base[i] = *addr;
+			DRM_DEBUG_KMS("i[%d]base[0x%x]hd[0x%lx]\n", i,
+				      buf_info->base[i], buf_info->handles[i]);
 		}
 	}
 
 	m_node->filp = file;
-	m_node->buf_info = buf_info;
 	mutex_lock(&c_node->mem_lock);
 	list_add_tail(&m_node->list, &c_node->mem_list[qbuf->ops_id]);
 	mutex_unlock(&c_node->mem_lock);
-- 
1.9.1
