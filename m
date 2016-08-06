From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] exynos-drm: Fix unsupported GEM memory type error message to
 be clear
Date: Fri,  5 Aug 2016 19:50:06 -0600
Message-ID: <1470448206-16538-1-git-send-email-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix unsupported GEM memory type error message to include the memory type
information.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index e016640..c9315df 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -55,11 +55,11 @@ static int check_fb_gem_memory_type(struct drm_device *drm_dev,
 	flags = exynos_gem->flags;
 
 	/*
-	 * without iommu support, not support physically non-continuous memory
+	 * without iommu support, not support physically non-contiguous memory
 	 * for framebuffer.
 	 */
 	if (IS_NONCONTIG_BUFFER(flags)) {
-		DRM_ERROR("cannot use this gem memory type for fb.\n");
+		DRM_ERROR("Non-continguous GEM memory is not supported.\n");
 		return -EINVAL;
 	}
 
-- 
2.7.4
