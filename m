From: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/5] drm/exynos: dsi: Fix the parse_dt function
Date: Thu, 09 Feb 2017 10:26:37 +0900
Message-ID: <1486603601-26826-2-git-send-email-hoegeun.kwon@samsung.com>
References: <1486603601-26826-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170209012716epcas1p33915757c95d5defb88c7d2c54cee3582@epcas1p3.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1486603601-26826-1-git-send-email-hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

The dsi + panel is a parental relationship, so OF grpah is not needed.
Therefore, the current dsi_parse_dt function will throw an error,
because there is no linked OF graph for case such as fimd + dsi +
panel. So this patch parse the Pll, burst and esc clock frequency
properties in dsi_parse_dt and modified to create a bridge_node only
if there is an OF graph associated with dsi.
So I think the ABI breakage is needed.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e07cb1f..214d486 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1652,39 +1652,23 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	if (ret < 0)
 		return ret;
 
-	ep = of_graph_get_endpoint_by_regs(node, DSI_PORT_OUT, 0);
-	if (!ep) {
-		dev_err(dev, "no output port with endpoint specified\n");
-		return -EINVAL;
-	}
-
-	ret = exynos_dsi_of_read_u32(ep, "samsung,burst-clock-frequency",
+	ret = exynos_dsi_of_read_u32(node, "samsung,burst-clock-frequency",
 				     &dsi->burst_clk_rate);
 	if (ret < 0)
-		goto end;
+		return ret;
 
-	ret = exynos_dsi_of_read_u32(ep, "samsung,esc-clock-frequency",
+	ret = exynos_dsi_of_read_u32(node, "samsung,esc-clock-frequency",
 				     &dsi->esc_clk_rate);
 	if (ret < 0)
-		goto end;
-
-	of_node_put(ep);
+		return ret;
 
 	ep = of_graph_get_next_endpoint(node, NULL);
-	if (!ep) {
-		ret = -EINVAL;
-		goto end;
-	}
-
-	dsi->bridge_node = of_graph_get_remote_port_parent(ep);
-	if (!dsi->bridge_node) {
-		ret = -EINVAL;
-		goto end;
+	if (ep) {
+		dsi->bridge_node = of_graph_get_remote_port_parent(ep);
+		of_node_put(ep);
 	}
-end:
-	of_node_put(ep);
 
-	return ret;
+	return 0;
 }
 
 static int exynos_dsi_bind(struct device *dev, struct device *master,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
