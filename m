Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B2EC43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiGTPwy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPwx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:52:53 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F474BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:52 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c3so15928279pfb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLxDXrnWztCpLdw3kYeARw1Pm9i++dE2YdXdMibsoFo=;
        b=PaszaOkYJY2VE8wDTHuC41WxzfuIzViy7vxpymrOxX5qs1oOeg2km5vr1LjAsFMZhQ
         uUX9mz9de27WM/nmkjTVMCSKAoQtHBIplBraPHazO3+WrZYhkO7+DF4LoGqWR4XyXVnU
         QqQBr2ocwiKcKR7L6kEptahnzJucpF6cYoHOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLxDXrnWztCpLdw3kYeARw1Pm9i++dE2YdXdMibsoFo=;
        b=EBxlDHA+9DalhZoGeFZMvNYq4ZBbyjy2VMvLiaiTM04Qoef00ipZGh8sjS24ZSBVcK
         RHCXv4EvWlQUIqES5UpCAEtYkQYxhI3ot39Sjfc/2cq23lLICoiwYP5xuy4j2yF+QZM5
         JkECOf3gnzP9yuHhqSGA7ZN1lpWJ00kbXvxMe0EHSK3peuWuhHoPNQhLTWD2enjw7iZ8
         rg3fkWGtjRZWkvkDC6rrY8+g4L5mr5milo/rCyM0qL6LYKkGEgW6y+WjlUPoi9usDoz0
         yFqnvv/qW4hJpzANOZFlExjw4w2SKhwO0n6o2WRxZXIgLGbe/m79rylwTUfPvCLwgwcf
         nQ8A==
X-Gm-Message-State: AJIora+mT0au9COdcU8ZBfopvdhwqcJ+wev0E5rGl4tY3j4mWZyZWJc2
        6fo8XGZwsksBqIC3+i79TD5COA==
X-Google-Smtp-Source: AGRyM1uNAIpZRc81rmpXpMq/eT86B354GywhhPmppJYXQAqiCpFr4SAfCAr2HROsR5Et4FZ52w7r5A==
X-Received: by 2002:a63:8841:0:b0:412:b40b:cfb5 with SMTP id l62-20020a638841000000b00412b40bcfb5mr35384538pgd.197.1658332371457;
        Wed, 20 Jul 2022 08:52:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:52:51 -0700 (PDT)
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 03/13] drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
Date:   Wed, 20 Jul 2022 21:22:00 +0530
Message-Id: <20220720155210.365977-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The child devices in MIPI DSI can be binding with OF-graph
and also via child nodes.

The OF-graph interface represents the child devices via
remote and associated endpoint numbers like

dsi {
   compatible = "fsl,imx8mm-mipi-dsim";

   ports {
	port@0 {
	     reg = <0>;

	     dsi_in_lcdif: endpoint@0 {
		  reg = <0>;
		  remote-endpoint = <&lcdif_out_dsi>;
	     };
	};

	port@1 {
	     reg = <1>;

	     dsi_out_bridge: endpoint {
		  remote-endpoint = <&bridge_in_dsi>;
	     };
	};
};

The child node interface represents the child devices via
conventional child nodes on given DSI parent like

dsi {
   compatible = "samsung,exynos5433-mipi-dsi";

   ports {
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

As Samsung DSIM bridge is common DSI IP across all Exynos DSI
and NXP i.MX8M host controllers, this patch adds support to
lookup the child devices whether its bindings on the associated
host represent OF-graph or child node interfaces.

v3:
* none

v2:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 38 +++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 21975ed513bd..20db345abf8b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1357,18 +1357,52 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote;
 	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
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
+	}
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+
+of_find_panel_or_bridge:
+	if (!remote)
+		return -ENODEV;
+
+	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
+		dsi->out_bridge = of_drm_find_bridge(remote);
 		if (!dsi->out_bridge)
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	of_node_put(remote);
+
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-- 
2.25.1

