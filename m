From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] exynos-drm: Fix error messages to print flags and size
Date: Wed, 10 Aug 2016 11:30:36 -0600
Message-ID: <1470850236-9101-1-git-send-email-shuahkh@osg.samsung.com>
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

Fix exynos_drm_gem_create() error messages to include flags and size when
flags and size are invalid.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index cdf9f1a..4c4cb0e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -231,12 +231,12 @@ struct exynos_drm_gem *exynos_drm_gem_create(struct drm_device *dev,
 	int ret;
 
 	if (flags & ~(EXYNOS_BO_MASK)) {
-		DRM_ERROR("invalid flags.\n");
+		DRM_ERROR("invalid GEM buffer flags: %u\n", flags);
 		return ERR_PTR(-EINVAL);
 	}
 
 	if (!size) {
-		DRM_ERROR("invalid size.\n");
+		DRM_ERROR("invalid GEM buffer size: %lu\n", size);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.7.4
