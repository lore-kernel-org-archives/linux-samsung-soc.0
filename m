From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 08/12] drm/exynos/ipp: remove useless registration checks
Date: Thu, 03 Jul 2014 15:10:33 +0200
Message-ID: <1404393037-17299-9-git-send-email-a.hajda@samsung.com>
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

Argument checks are redundant, clients always check ippdrv before calling
these functions.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index b7ce14e..26c8a2c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -129,9 +129,6 @@ void exynos_platform_device_ipp_unregister(void)
 
 int exynos_drm_ippdrv_register(struct exynos_drm_ippdrv *ippdrv)
 {
-	if (!ippdrv)
-		return -EINVAL;
-
 	mutex_lock(&exynos_drm_ippdrv_lock);
 	list_add_tail(&ippdrv->drv_list, &exynos_drm_ippdrv_list);
 	mutex_unlock(&exynos_drm_ippdrv_lock);
@@ -141,9 +138,6 @@ int exynos_drm_ippdrv_register(struct exynos_drm_ippdrv *ippdrv)
 
 int exynos_drm_ippdrv_unregister(struct exynos_drm_ippdrv *ippdrv)
 {
-	if (!ippdrv)
-		return -EINVAL;
-
 	mutex_lock(&exynos_drm_ippdrv_lock);
 	list_del(&ippdrv->drv_list);
 	mutex_unlock(&exynos_drm_ippdrv_lock);
-- 
1.9.1
