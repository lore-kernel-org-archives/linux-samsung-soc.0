From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 9/9] drm/exynos/hdmi: unregister connector on removal
Date: Tue, 09 Sep 2014 15:16:13 +0200
Message-ID: <1410268573-2297-10-git-send-email-a.hajda@samsung.com>
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

During component removal driver should unregister connector.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 562966d..7910fb3 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1040,6 +1040,8 @@ static enum drm_connector_status hdmi_detect(struct drm_connector *connector,
 
 static void hdmi_connector_destroy(struct drm_connector *connector)
 {
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
 }
 
 static struct drm_connector_funcs hdmi_connector_funcs = {
@@ -2314,8 +2316,8 @@ static void hdmi_unbind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder = display->encoder;
 	struct hdmi_context *hdata = display->ctx;
 
+	hdmi_connector_destroy(&hdata->connector);
 	encoder->funcs->destroy(encoder);
-	drm_connector_cleanup(&hdata->connector);
 }
 
 static const struct component_ops hdmi_component_ops = {
-- 
1.9.1
