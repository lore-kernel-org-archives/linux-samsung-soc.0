From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] exynos-drm: Fix unsupported GEM memory type error message to be clear
Date: Mon,  8 Aug 2016 17:48:20 -0600
Message-ID: <1470700100-13306-1-git-send-email-shuahkh@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix unsupported GEM memory type error message to include the memory type
information.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
Changes since v1:
-- Comment changed to read clearly

 drivers/gpu/drm/exynos/exynos_drm_fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index e016640..40ce841 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -55,11 +55,11 @@ static int check_fb_gem_memory_type(struct drm_device *drm_dev,
 	flags = exynos_gem->flags;
 
 	/*
-	 * without iommu support, not support physically non-continuous memory
-	 * for framebuffer.
+	 * Physically non-contiguous memory type for framebuffer is not
+	 * supported without IOMMU.
 	 */
 	if (IS_NONCONTIG_BUFFER(flags)) {
-		DRM_ERROR("cannot use this gem memory type for fb.\n");
+		DRM_ERROR("Non-contiguous GEM memory is not supported.\n");
 		return -EINVAL;
 	}
 
-- 
2.7.4
