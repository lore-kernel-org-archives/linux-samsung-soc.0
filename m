Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D338C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjAZOpJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjAZOpJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:45:09 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B1740D9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id g23so1972278plq.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK+2n5leeCN1ZUwhUDdriDW81kYnEsZfkVBz+dLgw2o=;
        b=InagqSKu9q+zYUh5/aSsIvy4NOiifEqAWyKy1cNmKJODY4AiKrDncx5F+ZoQSbUxmG
         rIWrKRdJCrUXBMc8ptNwgMTsSdpWM4pOYGO00TdtuCjLfGKdVbmv3bmEXxf7dPNMZhZO
         Cc1yIbIFsLM7wVitZN/uzb/mL+vxuK+IEqs8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WK+2n5leeCN1ZUwhUDdriDW81kYnEsZfkVBz+dLgw2o=;
        b=MNHjmP5tIZ9/mSSOOg4IZ/Pi7mbgXmfyQfqxKW506Aw3fJw3W9MFOKhU3tUr862xCL
         qwjM3Z0La6/64NWvFf9kFmGNXoGpcTOEtnvpFILXBS6hLnGWkZ6i5hGsu4hFbX5lZYO/
         1OkzGXGUBTiTth3l9METPjWcY+u1S7ZETC88QHtB4zsf2OkQZ2s1tQ2dUOuahKGu7vUX
         uDdCVmgF0KzBytKNRBbFD3+VFPjVutZCznYdyvI/qhIvnlR6TlOJcuTNeC1olyjpZK9q
         kEp8/aphEsaabVaXdkPGK/VrN7bvIjmDaK9SZWvou57fSaAfMymy3DbcE9/JU+c/VTGC
         M5Yw==
X-Gm-Message-State: AFqh2kqGjVd2JKMbRPXibYXTEHmBA9B9kx2CeaGbT9SZNF+tUAg0TZv7
        5s0egsHzLaFHllqaiuUO4S41yA==
X-Google-Smtp-Source: AMrXdXsyu6H4pTL9FyvrFWGqrqMWD2nvcoHbwqHils/x5P/YrkbiA+2vFMpeCy8vt05H4yQhmWiU9w==
X-Received: by 2002:a17:90b:17cb:b0:22b:b9f4:4ad1 with SMTP id me11-20020a17090b17cb00b0022bb9f44ad1mr22793352pjb.34.1674744306993;
        Thu, 26 Jan 2023 06:45:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:45:06 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Maxime Ripard <mripard@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v12 01/18] drm: of: Lookup if child node has DSI panel or bridge
Date:   Thu, 26 Jan 2023 20:14:10 +0530
Message-Id: <20230126144427.607098-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Devices can also be child nodes when we also control that device
through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).

Unlike the drm_of_find_panel_or_bridge helper it requires a special
case to lookup a child node of the given parent that isn't either
port or ports.

Lookup for a child DSI node of the given parent that isn't either
port or ports. If it is found then it will directly find the panel
or bridge otherwise lookup for the child node with a given port and
endpoint number as drm_of_find_panel_or_bridge does.

Supporting this feature via existing drm_of_find_panel_or_bridge
found several issues while handling usecases.

Here is the previously failed attempt of similar and the same has
been reverted later.

commit <80253168dbfd> ("drm: of: Lookup if child node has panel or bridge")

So, add a separate helper to handle this DSI use case.

Example OF graph representation of DSI host, which has port but
not has ports and has child panel node.

dsi {
	compatible = "allwinner,sun6i-a31-mipi-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	port {
		dsi_in_tcon0: endpoint {
			remote-endpoint = <tcon0_out_dsi>;
	};

	panel@0 {
		reg = <0>;
	};
};

Example OF graph representation of DSI host, which has ports but
not has port and has child panel node.

dsi {
        compatible = "samsung,exynos5433-mipi-dsi";
        #address-cells = <1>;
        #size-cells = <0>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;

                	dsi_to_mic: endpoint {
                        	remote-endpoint = <&mic_to_dsi>;
                	};
                };
        };

        panel@0 {
                reg = <0>;
        };
};

Example OF graph representation of DSI host, which has neither a port
nor a ports but has child panel node.

dsi0 {
	compatible = "ste,mcde-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	panel@0 {
		reg = <0>;
	};
};

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- none
Changes for v11:
- drop extra line
Changes for v10:
- new patch

 drivers/gpu/drm/drm_of.c | 112 ++++++++++++++++++++++++++++++++-------
 include/drm/drm_of.h     |  12 +++++
 2 files changed, 104 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..e165951e3545 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -216,6 +216,35 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
+static int of_drm_find_panel_or_bridge(struct device_node *remote,
+				       struct drm_panel **panel,
+				       struct drm_bridge **bridge)
+{
+	int ret = -EPROBE_DEFER;
+
+	if (panel) {
+		*panel = of_drm_find_panel(remote);
+		if (!IS_ERR(*panel))
+			ret = 0;
+		else
+			*panel = NULL;
+	}
+
+	/* No panel found yet, check for a bridge next. */
+	if (bridge) {
+		if (ret) {
+			*bridge = of_drm_find_bridge(remote);
+			if (*bridge)
+				ret = 0;
+		} else {
+			*bridge = NULL;
+		}
+	}
+
+	of_node_put(remote);
+	return ret;
+}
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
@@ -238,7 +267,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
-	int ret = -EPROBE_DEFER;
 	struct device_node *remote;
 
 	if (!panel && !bridge)
@@ -259,30 +287,74 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (!remote)
 		return -ENODEV;
 
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
+	return of_drm_find_panel_or_bridge(remote, panel, bridge);
+}
+EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
-	/* No panel found yet, check for a bridge next. */
-	if (bridge) {
-		if (ret) {
-			*bridge = of_drm_find_bridge(remote);
-			if (*bridge)
-				ret = 0;
-		} else {
-			*bridge = NULL;
-		}
+/**
+ * drm_of_dsi_find_panel_or_bridge - return connected DSI panel or bridge device
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ * @panel: pointer to hold returned drm_panel
+ * @bridge: pointer to hold returned drm_bridge
+ *
+ * Lookup for a child DSI node of the given parent that isn't either port
+ * or ports. If it is found then it will directly find the panel or bridge
+ * otherwise lookup for the child node with a given port and endpoint number
+ * as drm_of_find_panel_or_bridge does.
+ *
+ * Lookup a given child DSI node or a DT node's port and endpoint number,
+ * find the connected node and return either the associated struct drm_panel
+ * or drm_bridge device. Either @panel or @bridge must not be NULL.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_dsi_find_panel_or_bridge(const struct device_node *np,
+				    int port, int endpoint,
+				    struct drm_panel **panel,
+				    struct drm_bridge **bridge)
+{
+	struct device_node *remote;
+
+	if (!panel && !bridge)
+		return -EINVAL;
+	if (panel)
+		*panel = NULL;
 
+	/**
+	 * Devices can also be child nodes when we also control that device
+	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
+	 *
+	 * Lookup for a child node of the given parent that isn't either port
+	 * or ports.
+	 */
+	for_each_available_child_of_node(np, remote) {
+		if (of_node_name_eq(remote, "port") ||
+		    of_node_name_eq(remote, "ports"))
+			continue;
+
+		goto of_find_panel_or_bridge;
 	}
 
-	of_node_put(remote);
-	return ret;
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+
+of_find_panel_or_bridge:
+	if (!remote)
+		return -ENODEV;
+
+	return of_drm_find_panel_or_bridge(remote, panel, bridge);
 }
-EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
+EXPORT_SYMBOL_GPL(drm_of_dsi_find_panel_or_bridge);
 
 enum drm_of_lvds_pixels {
 	DRM_OF_LVDS_EVEN = BIT(0),
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..7a97157c1fa0 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -47,6 +47,10 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				int port, int endpoint,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
+int drm_of_dsi_find_panel_or_bridge(const struct device_node *np,
+				    int port, int endpoint,
+				    struct drm_panel **panel,
+				    struct drm_bridge **bridge);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
 int drm_of_lvds_get_data_mapping(const struct device_node *port);
@@ -99,6 +103,14 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return -EINVAL;
 }
 
+static inline int drm_of_dsi_find_panel_or_bridge(const struct device_node *np,
+						  int port, int endpoint,
+						  struct drm_panel **panel,
+						  struct drm_bridge **bridge)
+{
+	return -EINVAL;
+}
+
 static inline int
 drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 				      const struct device_node *port2)
-- 
2.25.1

