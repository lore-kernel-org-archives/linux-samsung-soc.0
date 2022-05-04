Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8173C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241790AbiEDLoc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348918AbiEDLob (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:44:31 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A65813D45
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:40:56 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id p6so1010035pjm.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zu930wcvNkHW2egdF99M+1+iY48wbvmQImq1ebHjMJc=;
        b=MOOp84GT+U6MHbi8bO+i03+twHj881W/FMDPFJg3qZouHPREOZsx6lNd4ew6ZVrRrV
         UFgPtZVPhmMfHtMgHd3udbCRqbo9bMYteNhCSPsg6VUAD+KTwOwWE8lpQkZuWvtNl10T
         mETQZOMe8eO3vD8bn14pUR8YLzs/45QXU3L1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zu930wcvNkHW2egdF99M+1+iY48wbvmQImq1ebHjMJc=;
        b=yL7gM96s6NogidMyDweLNP8kA2/PgXE4s/xAQxTzTDLJ1zz9q5sp9AFgZABT4rVeD4
         qReKtEILWEa04mVadFMhdzjqyb0eNuX5SaOuap84PVAT4CbqJe/rKvGGDTcFjWSbOUm2
         MOREABKRC2n3jf68kaO6g5iNPaWSvzi6XYDHtfKiPzHRfYDB6d2lfgqcVjWYAqgnGNGc
         K/LvDXBZEM0hmnBaNKpD3W41lCjLL6wiRf2089jlhKAm+r6dcl4hMkl3GQ2vzn9a7O/n
         jaAYkzwVodWB7tRn7wTxsSaLYAnrtZ7QPDurILAoC5AM1fdIyLTOZca71MBwabyKEXW4
         t8xA==
X-Gm-Message-State: AOAM5327RhF4D60MThizS5x14OqVP6u0ImpuCYzkXYnOd/+pK2D3SSp8
        m31H4JRFbswLdeuSSaI/EDLYBA==
X-Google-Smtp-Source: ABdhPJxn7Iu43eDnhes30oL2XHDjtxMV5NPtHkjvgUKXH8wwmFtE4q6OVBBJ+9bOfPfSHtcELRKxHg==
X-Received: by 2002:a17:90b:380d:b0:1dc:8dc2:bb2c with SMTP id mq13-20020a17090b380d00b001dc8dc2bb2cmr6215480pjb.236.1651664455662;
        Wed, 04 May 2022 04:40:55 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:40:55 -0700 (PDT)
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 02/12] drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
Date:   Wed,  4 May 2022 17:10:11 +0530
Message-Id: <20220504114021.33265-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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

v2:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 38 +++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 7745902f3f1e..f23f06d55158 100644
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

