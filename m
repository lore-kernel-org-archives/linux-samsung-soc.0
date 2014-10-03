From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 1/4] drm/i915: set PM callbacks only if modeset is turned
 off
Date: Fri, 03 Oct 2014 10:24:10 +0200
Message-ID: <1412324653-30677-2-git-send-email-a.hajda@samsung.com>
References: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412324653-30677-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "open list:INTEL DRM DRIVERS..." <intel-gfx@lists.freedesktop.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Currently suspend and resume callbacks are called only if driver have
modeset feature disabled.
This patch moves the check directly to i915 driver, it will allow to
remove the check from the core in the future.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 3870c73..481f62f 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1617,10 +1617,6 @@ static struct drm_driver driver = {
 	.postclose = i915_driver_postclose,
 	.set_busid = drm_pci_set_busid,
 
-	/* Used in place of i915_pm_ops for non-DRIVER_MODESET */
-	.suspend = i915_suspend,
-	.resume = i915_resume_legacy,
-
 	.device_is_agp = i915_driver_device_is_agp,
 	.master_create = i915_master_create,
 	.master_destroy = i915_master_destroy,
@@ -1684,6 +1680,8 @@ static int __init i915_init(void)
 
 	if (!(driver.driver_features & DRIVER_MODESET)) {
 		driver.get_vblank_timestamp = NULL;
+		driver.suspend = i915_suspend;
+		driver.resume = i915_resume_legacy;
 #ifndef CONFIG_DRM_I915_UMS
 		/* Silently fail loading to not upset userspace. */
 		DRM_DEBUG_DRIVER("KMS and UMS disabled.\n");
-- 
1.9.1
