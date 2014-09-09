From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/9] drm/exynos/ipp: traverse ipp drivers list safely
Date: Tue, 09 Sep 2014 15:16:05 +0200
Message-ID: <1410268573-2297-2-git-send-email-a.hajda@samsung.com>
References: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1410268573-2297-1-git-send-email-a.hajda@samsung.com>
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

On ipp subsystem removal list of ipp drivers is traversed
and their members are deleted. To do it properly safe version
of list_for_each* should be used.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 4f36a9d..00d74b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -1605,11 +1605,11 @@ err:
 
 static void ipp_subdrv_remove(struct drm_device *drm_dev, struct device *dev)
 {
-	struct exynos_drm_ippdrv *ippdrv;
+	struct exynos_drm_ippdrv *ippdrv, *t;
 	struct ipp_context *ctx = get_ipp_context(dev);
 
 	/* get ipp driver entry */
-	list_for_each_entry(ippdrv, &exynos_drm_ippdrv_list, drv_list) {
+	list_for_each_entry_safe(ippdrv, t, &exynos_drm_ippdrv_list, drv_list) {
 		if (is_drm_iommu_supported(drm_dev))
 			drm_iommu_detach_device(drm_dev, ippdrv->dev);
 
-- 
1.9.1
