From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 5/8] drm/rockchip: analogix_dp: make panel detect to an optional action
Date: Mon, 25 Apr 2016 19:34:26 +0800
Message-ID: <1461584066-6205-1-git-send-email-ykk@rock-chips.com>
References: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:45419 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754302AbcDYLgf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 07:36:35 -0400
In-Reply-To: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Mark Yao <yzq@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

Some boards don't need to declare a panel device node, like the
display interface is DP monitors, so it's necessary to make the
panel detect to an optional action.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 48 ++++++++++++-------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index f559b5c..adb38b2 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -319,38 +319,34 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node, *port, *endpoint;
+	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
-	struct drm_panel *panel;
 
 	port = of_graph_get_port_by_id(dev->of_node, 1);
-	if (!port) {
-		dev_err(dev, "can't find output port\n");
-		return -EINVAL;
-	}
-
-	endpoint = of_get_child_by_name(port, "endpoint");
-	of_node_put(port);
-	if (!endpoint) {
-		dev_err(dev, "no output endpoint found\n");
-		return -EINVAL;
-	}
-
-	panel_node = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-	if (!panel_node) {
-		dev_err(dev, "no output node found\n");
-		return -EINVAL;
-	}
-
-	panel = of_drm_find_panel(panel_node);
-	if (!panel) {
-		DRM_ERROR("failed to find panel\n");
+	if (port) {
+		endpoint = of_get_child_by_name(port, "endpoint");
+		of_node_put(port);
+		if (!endpoint) {
+			dev_err(dev, "no output endpoint found\n");
+			return -EINVAL;
+		}
+
+		panel_node = of_graph_get_remote_port_parent(endpoint);
+		of_node_put(endpoint);
+		if (!panel_node) {
+			dev_err(dev, "no output node found\n");
+			return -EINVAL;
+		}
+
+		panel = of_drm_find_panel(panel_node);
+		if (!panel) {
+			DRM_ERROR("failed to find panel\n");
+			of_node_put(panel_node);
+			return -EPROBE_DEFER;
+		}
 		of_node_put(panel_node);
-		return -EPROBE_DEFER;
 	}
 
-	of_node_put(panel_node);
-
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
-- 
1.9.1
