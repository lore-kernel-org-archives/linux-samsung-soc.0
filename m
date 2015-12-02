From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 1/2] drm/exynos: dp: add of_graph dt binding support for
 panel
Date: Wed, 02 Dec 2015 20:57:51 +0900
Message-ID: <1449057472-4389-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55411 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757996AbbLBL54 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 06:57:56 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYQ031VFBWIZGC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 02 Dec 2015 20:57:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, Inki Dae <inki.dae@samsung.com>

This patch adds of_graph dt binding support for panel device
and also keeps the backward compatibility.

i.e.,
The dts file for Exynos5800 based peach pi board
has a panel property so we need to keep the backward compatibility.

Changelog v2:
- return -EINVAL if getting a port node failed.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 94f02a0..0b53045 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -1392,7 +1392,7 @@ static const struct component_ops exynos_dp_ops = {
 static int exynos_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node, *bridge_node, *endpoint;
+	struct device_node *panel_node = NULL, *bridge_node, *endpoint = NULL;
 	struct exynos_dp_device *dp;
 	int ret;
 
@@ -1403,15 +1403,32 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dp);
 
+	/* This is for the backward compatibility. */
 	panel_node = of_parse_phandle(dev->of_node, "panel", 0);
 	if (panel_node) {
 		dp->panel = of_drm_find_panel(panel_node);
 		of_node_put(panel_node);
 		if (!dp->panel)
 			return -EPROBE_DEFER;
+	} else {
+		endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+		if (endpoint) {
+			panel_node = of_graph_get_remote_port_parent(endpoint);
+			if (panel_node) {
+				dp->panel = of_drm_find_panel(panel_node);
+				of_node_put(panel_node);
+				if (!dp->panel)
+					return -EPROBE_DEFER;
+			} else {
+				DRM_ERROR("no port node for panel device.\n");
+				return -EINVAL;
+			}
+		}
 	}
 
-	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	panel_node = !endpoint ? NULL : panel_node;
+
+	endpoint = of_graph_get_next_endpoint(dev->of_node, panel_node);
 	if (endpoint) {
 		bridge_node = of_graph_get_remote_port_parent(endpoint);
 		if (bridge_node) {
-- 
1.9.1
