From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 03/12] drm/exynos: disallow fbdev initialization if no
 device is connected
Date: Fri, 28 Mar 2014 12:52:38 +0100
Message-ID: <1396007567-4015-4-git-send-email-a.hajda@samsung.com>
References: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1396007567-4015-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds explicit check if there is a connector with
connected status before fbdev initialization. It prevents creation
of default fbdev 1024x768 which is unusable on panels with bigger resolutions.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index e7c2f2d..e09449a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -237,6 +237,24 @@ static struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
 	.fb_probe =	exynos_drm_fbdev_create,
 };
 
+bool exynos_drm_fbdev_is_anything_connected(struct drm_device *dev)
+{
+	struct drm_connector *connector;
+	bool ret = false;
+
+	mutex_lock(&dev->mode_config.mutex);
+	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+		if (connector->status != connector_status_connected)
+			continue;
+
+		ret = true;
+		break;
+	}
+	mutex_unlock(&dev->mode_config.mutex);
+
+	return ret;
+}
+
 int exynos_drm_fbdev_init(struct drm_device *dev)
 {
 	struct exynos_drm_fbdev *fbdev;
@@ -248,6 +266,9 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 	if (!dev->mode_config.num_crtc || !dev->mode_config.num_connector)
 		return 0;
 
+	if (!exynos_drm_fbdev_is_anything_connected(dev))
+		return 0;
+
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
 	if (!fbdev)
 		return -ENOMEM;
-- 
1.8.3.2
