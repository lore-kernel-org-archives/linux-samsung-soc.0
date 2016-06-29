From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v4 05/11] drm/rockchip: analogix_dp: make panel detect to an optional action
Date: Wed, 29 Jun 2016 17:15:30 +0800
Message-ID: <1467191730-17308-1-git-send-email-ykk@rock-chips.com>
References: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467191657-16941-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Some boards don't need to declare a panel device node, like the
display interface is DP monitors, so it's necessary to make the
panel detect to an optional action.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Acked-by: Mark Yao <mark.yao@rock-chips.com>
Reviewed-by: Tomasz Figa <tomasz.figa@chromium.com>
---
Changes in v4:
- Move of_node_put(panel_node) directly below of_drm_find_panel (Sean)
- Add reviewed flag from Tomasz

Changes in v3:
- Add the acked flag from Mark.

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 47 +++++++++++--------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8557a08..0755573 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -329,38 +329,33 @@ static int rockchip_dp_probe(struct platform_device *pdev)
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
 		of_node_put(panel_node);
-		return -EPROBE_DEFER;
+		if (!panel) {
+			DRM_ERROR("failed to find panel\n");
+			return -EPROBE_DEFER;
+		}
 	}
 
-	of_node_put(panel_node);
-
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
-- 
1.9.1
