From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 06/10] drm/rockchip: analogix_dp: make panel detect to an
 optional action
Date: Tue, 14 Jun 2016 19:46:24 +0800
Message-ID: <1465904784-978-1-git-send-email-ykk@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1465904718-663-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tomasz Figa <tomasz.figa-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Some boards don't need to declare a panel device node, like the
display interface is DP monitors, so it's necessary to make the
panel detect to an optional action.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
Changes in v3:
- Add the acked flag from Mark.

Changes in v2: None

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 48 ++++++++++++-------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index bcd9ecc..da2e844 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -332,38 +332,34 @@ static int rockchip_dp_probe(struct platform_device *pdev)
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
