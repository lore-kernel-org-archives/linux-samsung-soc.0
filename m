From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RFC 2/4] drm/core: re-enable suspend/resume callbacks for KMS
 drivers
Date: Fri, 03 Oct 2014 10:24:11 +0200
Message-ID: <1412324653-30677-3-git-send-email-a.hajda@samsung.com>
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

Implementing suspend/resume functionality in componentized drm drivers using
master component PM callbacks is problematic because those callbacks can be
called asynchronously regardless of existence/state of drm device.
The patch re-enables suspend/resume drm driver callbacks in drivers with
modeset feature enabled. These callback can be used to implement suspend/resume
functionality in more convenient way.

The patch should not affect behavior of existing drm drivers.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/drm_sysfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index cc3d6d6..206afc4 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -45,7 +45,6 @@ static int __drm_class_suspend(struct device *dev, pm_message_t state)
 		struct drm_device *drm_dev = drm_minor->dev;
 
 		if (drm_minor->type == DRM_MINOR_LEGACY &&
-		    !drm_core_check_feature(drm_dev, DRIVER_MODESET) &&
 		    drm_dev->driver->suspend)
 			return drm_dev->driver->suspend(drm_dev, state);
 	}
@@ -86,7 +85,6 @@ static int drm_class_resume(struct device *dev)
 		struct drm_device *drm_dev = drm_minor->dev;
 
 		if (drm_minor->type == DRM_MINOR_LEGACY &&
-		    !drm_core_check_feature(drm_dev, DRIVER_MODESET) &&
 		    drm_dev->driver->resume)
 			return drm_dev->driver->resume(drm_dev);
 	}
-- 
1.9.1
