From: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V9 05/14] drm/exynos: dp: support drm_bridge
Date: Tue, 20 Jan 2015 22:08:46 +0530
Message-ID: <1421771935-31618-6-git-send-email-ajaykumar.rs@samsung.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1421771935-31618-1-git-send-email-ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, bhushan.r-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Modify driver to support drm_bridge.

Signed-off-by: Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Tested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Tested-by: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Tested-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 .../devicetree/bindings/video/exynos_dp.txt        |   12 +++++++
 drivers/gpu/drm/exynos/exynos_dp_core.c            |   37 ++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    1 +
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dp.txt b/Documentation/devicetree/bindings/video/exynos_dp.txt
index 53dbccf..7a3a9cd 100644
--- a/Documentation/devicetree/bindings/video/exynos_dp.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dp.txt
@@ -66,6 +66,10 @@ Optional properties for dp-controller:
 		Hotplug detect GPIO.
 			Indicates which GPIO should be used for hotplug
 			detection
+	-video interfaces: Device node can contain video interface port
+			    nodes according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
 Example:
 
@@ -105,4 +109,12 @@ Board Specific portion:
 				vsync-len = <6>;
 			};
 		};
+
+		ports {
+			port@0 {
+				dp_out: endpoint {
+					remote-endpoint = <&bridge_in>;
+				};
+			};
+		};
 	};
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 27e3d27..46f1497 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -18,6 +18,7 @@
 #include <linux/interrupt.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/of_graph.h>
 #include <linux/gpio.h>
 #include <linux/component.h>
 #include <linux/phy/phy.h>
@@ -994,9 +995,19 @@ static struct drm_connector_helper_funcs exynos_dp_connector_helper_funcs = {
 };
 
 /* returns the number of bridges attached */
-static int exynos_drm_attach_lcd_bridge(struct drm_device *dev,
+static int exynos_drm_attach_lcd_bridge(struct exynos_dp_device *dp,
 		struct drm_encoder *encoder)
 {
+	int ret;
+
+	encoder->bridge = dp->bridge;
+	dp->bridge->encoder = encoder;
+	ret = drm_bridge_attach(encoder->dev, dp->bridge);
+	if (ret) {
+		DRM_ERROR("Failed to attach bridge to drm\n");
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -1010,9 +1021,11 @@ static int exynos_dp_create_connector(struct exynos_drm_display *display,
 	dp->encoder = encoder;
 
 	/* Pre-empt DP connector creation if there's a bridge */
-	ret = exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
-	if (ret)
-		return 0;
+	if (dp->bridge) {
+		ret = exynos_drm_attach_lcd_bridge(dp, encoder);
+		if (!ret)
+			return 0;
+	}
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 
@@ -1219,7 +1232,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 		}
 	}
 
-	if (!dp->panel) {
+	if (!dp->panel && !dp->bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
@@ -1303,7 +1316,7 @@ static const struct component_ops exynos_dp_ops = {
 static int exynos_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *panel_node;
+	struct device_node *panel_node, *bridge_node, *endpoint;
 	struct exynos_dp_device *dp;
 	int ret;
 
@@ -1329,6 +1342,18 @@ static int exynos_dp_probe(struct platform_device *pdev)
 			return -EPROBE_DEFER;
 	}
 
+	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
+	if (endpoint) {
+		bridge_node = of_graph_get_remote_port_parent(endpoint);
+		if (bridge_node) {
+			dp->bridge = of_drm_find_bridge(bridge_node);
+			of_node_put(bridge_node);
+			if (!dp->bridge)
+				return -EPROBE_DEFER;
+		} else
+			return -EPROBE_DEFER;
+	}
+
 	ret = component_add(&pdev->dev, &exynos_dp_ops);
 	if (ret)
 		exynos_drm_component_del(&pdev->dev,
diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.h b/drivers/gpu/drm/exynos/exynos_dp_core.h
index 164f171..a4e7996 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.h
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.h
@@ -153,6 +153,7 @@ struct exynos_dp_device {
 	struct drm_connector	connector;
 	struct drm_encoder	*encoder;
 	struct drm_panel	*panel;
+	struct drm_bridge	*bridge;
 	struct clk		*clock;
 	unsigned int		irq;
 	void __iomem		*reg_base;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
