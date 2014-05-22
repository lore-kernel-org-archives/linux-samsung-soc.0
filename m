From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2] drm:exynos: allocate non-contigous buffer when iommu is
 enabled
Date: Thu, 22 May 2014 12:01:15 +0530
Message-ID: <1400740275-11663-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62700 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751056AbaEVGcR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 02:32:17 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Y007ROQ5RGM80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 15:32:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Allow to allocate non-contigous buffers when iommu is enabled.
Currently, it tries to allocates contigous buffer which consistently
fail for large buffers and then fall back to non contigous. Apart
from being slow, this implementation is also very noisy and fills
the screen with alloc fail logs.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Reviewed-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c |   25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 42d2904..f323b32 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -612,22 +612,25 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	args->pitch = args->width * ((args->bpp + 7) / 8);
 	args->size = args->pitch * args->height;
 
-	exynos_gem_obj = exynos_drm_gem_create(dev, EXYNOS_BO_CONTIG |
-						EXYNOS_BO_WC, args->size);
 	/*
-	 * If physically contiguous memory allocation fails and if IOMMU is
-	 * supported then try to get buffer from non physically contiguous
-	 * memory area.
-	 */
-	if (IS_ERR(exynos_gem_obj) && is_drm_iommu_supported(dev)) {
-		dev_warn(dev->dev, "contiguous FB allocation failed, falling back to non-contiguous\n");
+	* If iommu is supported, allocate non-contigous buffer else
+	* allocate physically contiguous memory.
+	*/
+
+	if (is_drm_iommu_supported(dev)) {
+		exynos_gem_obj = exynos_drm_gem_create(dev,
+			EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC,
+			args->size);
+	} else {
 		exynos_gem_obj = exynos_drm_gem_create(dev,
-					EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC,
-					args->size);
+			EXYNOS_BO_CONTIG | EXYNOS_BO_WC,
+			args->size);
 	}
 
-	if (IS_ERR(exynos_gem_obj))
+	if (IS_ERR(exynos_gem_obj)) {
+		dev_warn(dev->dev, "FB allocation failed.\n");
 		return PTR_ERR(exynos_gem_obj);
+	}
 
 	ret = exynos_drm_gem_handle_create(&exynos_gem_obj->base, file_priv,
 			&args->handle);
-- 
1.7.9.5
