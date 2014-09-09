From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/9] drm/exynos/fbdev: fix fbdev gem object cleanup
Date: Tue, 09 Sep 2014 15:16:07 +0200
Message-ID: <1410268573-2297-4-git-send-email-a.hajda@samsung.com>
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

exynos_gem_obj is used by exynos_drm_fbdev_destroy so it cannot be destroyed
before calling the latter. exynos_gem_obj will be destroyed anyway by
exynos_drm_fbdev_destroy->...->exynos_drm_fb_destroy.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 32e63f6..586e40d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -353,9 +353,6 @@ void exynos_drm_fbdev_fini(struct drm_device *dev)
 
 	fbdev = to_exynos_fbdev(private->fb_helper);
 
-	if (fbdev->exynos_gem_obj)
-		exynos_drm_gem_destroy(fbdev->exynos_gem_obj);
-
 	exynos_drm_fbdev_destroy(dev, private->fb_helper);
 	kfree(fbdev);
 	private->fb_helper = NULL;
-- 
1.9.1
