From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/4] drm/exynos: correct connector->dpms field before resuming
Date: Fri, 10 Oct 2014 14:31:56 +0200
Message-ID: <1412944316-27737-5-git-send-email-a.hajda@samsung.com>
References: <1412944316-27737-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412944316-27737-1-git-send-email-a.hajda@samsung.com>
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

During system suspend after connector switch off its dpms field
is set to connector previous dpms state. To properly resume dpms field
should be set to its actual state (off) before resuming to previous dpms state.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index ce6c14c..fe250e4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -194,8 +194,12 @@ static int exynos_drm_resume(struct drm_device *dev)
 
 	drm_modeset_lock_all(dev);
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if (connector->funcs->dpms)
-			connector->funcs->dpms(connector, connector->dpms);
+		if (connector->funcs->dpms) {
+			int dpms = connector->dpms;
+
+			connector->dpms = DRM_MODE_DPMS_OFF;
+			connector->funcs->dpms(connector, dpms);
+		}
 	}
 	drm_modeset_unlock_all(dev);
 
-- 
1.9.1
