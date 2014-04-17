From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 3/5] drm/exynos: dpi: fix hotplug fail issue
Date: Thu, 17 Apr 2014 14:50:27 +0900
Message-ID: <1397713829-25776-4-git-send-email-inki.dae@samsung.com>
References: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397713829-25776-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

When connector is created, if connector->polled is
DRM_CONNECTOR_POLL_CONNECT then drm_kms_helper_hotplug_event
function isn't called at drm_helper_hpd_irq_event because the
function will be called only in case of DRM_CONNECTOR_POLL_HPD.

So this patch sets always DRM_CONNECTOR_POLL_HPD flag to
connector->polled of parallel panel driver at connector creation.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index c1f4b35..ac206e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -123,10 +123,7 @@ static int exynos_dpi_create_connector(struct exynos_drm_display *display,
 
 	ctx->encoder = encoder;
 
-	if (ctx->panel_node)
-		connector->polled = DRM_CONNECTOR_POLL_CONNECT;
-	else
-		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
 	ret = drm_connector_init(encoder->dev, connector,
 				 &exynos_dpi_connector_funcs,
-- 
1.7.9.5
