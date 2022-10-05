Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F71FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiJEPN0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiJEPNZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:13:25 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE326E2E6
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Oct 2022 08:13:23 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id y189so11203495iof.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2022 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZKBZ/Poq4qIDgukJ06pdFkyQHbBE5/VJ3pRiELlmgY=;
        b=CycY5tvqQX7XlhnNAyQclQ9wN9sBRLKSHjUaZ+2ZIdR47bIf/4sh6oAm0Boem+mxED
         NwOLrgJEPJ40HVe7uRW5mKdquNOOzm6RBT8u/zYY475ZvWdtNgCp9qIcl0pRk9AJCSEd
         ZPNC8GOeWscs9RfZyYlOKWnYRfkd4iN779dKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZKBZ/Poq4qIDgukJ06pdFkyQHbBE5/VJ3pRiELlmgY=;
        b=a8pWy6MRlgDg5+/bSBYiE54noXToe5ibE8LKmqOsi3c6FK20ekaJyjuh6ImqqTEJV+
         zkXBOZp6j3BMYoCEXQtIo/IHITtyom2QlM044zrgnZ3G6s42RmhrSNNmbEaMYP3D3e+G
         K86wSDxApjnk9w5+y31TKUUZHGOZ8o6xVLPWWtWHoxoP7RzKAYwa1a3oOLSYjHSsBbsd
         2yiMVaEAgXCXwL+25kgmqYBxrDGlv3E0dkZa+YULtMs7vpfkebn2A+naP7SFw2y/ZB6c
         gxwpzOjfdG3TArzRxieVcKd96awt7MIm+MqatyoF0AXNcPOZrV0FLB3Iq7xQhOuL9g1W
         uwCQ==
X-Gm-Message-State: ACrzQf06qn7R4FdNTpP6lD905EWjeyTY3Bu2UQq4k1ZCl/Xp1CIMJ6ve
        doWpOaY2wIrXT2qaNJHv7Sfw1g==
X-Google-Smtp-Source: AMsMyM7+6E9CcbOMePBdcd4NW1DHDNKXHeuu0sWSYmYK93I3b4G0DhEsd2CVNuB3ZL4DZZuGofKtpg==
X-Received: by 2002:a02:9f88:0:b0:362:74f6:6215 with SMTP id a8-20020a029f88000000b0036274f66215mr67503jam.2.1664982803307;
        Wed, 05 Oct 2022 08:13:23 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:13:22 -0700 (PDT)
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
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v7 02/10] drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
Date:   Wed,  5 Oct 2022 20:43:01 +0530
Message-Id: <20221005151309.7278-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

v7, v6, v5, v4, v3:
* none

v2:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 38 +++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 07563d00a420..c34c6abac815 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1356,18 +1356,52 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
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

