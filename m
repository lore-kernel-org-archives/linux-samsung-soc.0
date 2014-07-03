From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 04/12] drm/exynos/ipp: correct address type
Date: Thu, 03 Jul 2014 15:10:29 +0200
Message-ID: <1404393037-17299-5-git-send-email-a.hajda@samsung.com>
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

exynos_drm_gem_get_dma_addr returns dma_addr_t, type casting to void* and
back is not necessary.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 34d185c..f3d8b5c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -681,7 +681,6 @@ static struct drm_exynos_ipp_mem_node
 {
 	struct drm_exynos_ipp_mem_node *m_node;
 	struct drm_exynos_ipp_buf_info buf_info;
-	void *addr;
 	int i;
 
 	m_node = kzalloc(sizeof(*m_node), GFP_KERNEL);
@@ -704,6 +703,8 @@ static struct drm_exynos_ipp_mem_node
 
 		/* get dma address by handle */
 		if (qbuf->handle[i]) {
+			dma_addr_t *addr;
+
 			addr = exynos_drm_gem_get_dma_addr(drm_dev,
 					qbuf->handle[i], file);
 			if (IS_ERR(addr)) {
@@ -712,7 +713,7 @@ static struct drm_exynos_ipp_mem_node
 			}
 
 			buf_info.handles[i] = qbuf->handle[i];
-			buf_info.base[i] = *(dma_addr_t *) addr;
+			buf_info.base[i] = *addr;
 			DRM_DEBUG_KMS("i[%d]base[0x%x]hd[0x%x]\n",
 				i, buf_info.base[i], (int)buf_info.handles[i]);
 		}
-- 
1.9.1
