Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8186C001B2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 12:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238360AbiLNM7j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 07:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238218AbiLNM7i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 07:59:38 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22E9B98
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:37 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id g10so3211017plo.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ndEKJEU9XRDwvy5hojvuVFbU65Mj9YqYATSCh2JuDY=;
        b=XF6NiO27VTe98ARLVxOQgk8QEDjF7M7wOtOKRHnFtcCwRRosi6RMy/1Jx+MTKJ1pji
         K21zKuBWO7t7t70obz5kfbdlyXFGgsHkBe7U4hImV8LtBcwyLlXxCf5+SNbyFQQHeQTE
         rb3UcCJEsDvkXJFu/f/0NUEIpDs1cIA1MfW48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ndEKJEU9XRDwvy5hojvuVFbU65Mj9YqYATSCh2JuDY=;
        b=pecAOnw1b0FpztBXotdEpZC6txk4ItNph6SVwswqnOZr/Zgodlb7nAHvZPqVTbq0nI
         7q8CzsMPJ4VYQgxdvIYZ93XJ82iif3IcajmNwbFjd5U1aiVCh9LWBOMJT7FN2nOYH0rm
         M2M70319fYlOyPCyInNqZnHBVIQuTim54kYLe3BJajPx8FuFnme2bO2DG9UMy4Khrhrq
         3uPMWMufo8JJdyGyew4kOV2TfP648UKxWBhXFAyhZG3Er/Z1nF9O+DXBrnrXpcR+Z7DS
         4SaXf/LxB6G++BOePudJ/2f/EMVXSISWpWrnaZAbR3PcEtOd8zCkmbA4dPS+qbiZE/Tj
         qRHg==
X-Gm-Message-State: ANoB5pkU1R+AeP0aAkIuWBKY9HNS903qH6nT/9M2p29FSJbhRrvTE6/z
        hjCjmjL/lw9s95IAmsvxOEvfhhIdiRFwjEBFIUY=
X-Google-Smtp-Source: AA0mqf7Va4mhin8Kar0LMef2gg8BUyRKwI3PdT0QMBHpd7SdwcK0fC8RxZE8gePEzCW5lBJhLUQZ+Q==
X-Received: by 2002:a17:902:bf49:b0:189:e360:ce5 with SMTP id u9-20020a170902bf4900b00189e3600ce5mr24920364pls.12.1671022777128;
        Wed, 14 Dec 2022 04:59:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 04:59:36 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
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
Subject: [PATCH v10 01/18] drm: of: Lookup if child node has DSI panel or bridge
Date:   Wed, 14 Dec 2022 18:28:50 +0530
Message-Id: <20221214125907.376148-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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
Changes for v10:
- new patch

 drivers/gpu/drm/drm_of.c | 113 ++++++++++++++++++++++++++++++++-------
 include/drm/drm_of.h     |  12 +++++
 2 files changed, 105 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..020457444dfe 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -216,6 +216,36 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
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
+
+	}
+
+	of_node_put(remote);
+	return ret;
+}
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
@@ -238,7 +268,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
-	int ret = -EPROBE_DEFER;
 	struct device_node *remote;
 
 	if (!panel && !bridge)
@@ -259,30 +288,74 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
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
+
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

