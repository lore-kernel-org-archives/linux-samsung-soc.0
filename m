From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 2/9] drm/exynos: dpi: fix hotplug fail issue
Date: Mon, 14 Apr 2014 15:09:47 +0900
Message-ID: <1397455794-7759-3-git-send-email-inki.dae@samsung.com>
References: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48848 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751356AbaDNGJ5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Apr 2014 02:09:57 -0400
In-reply-to: <1397455794-7759-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

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
