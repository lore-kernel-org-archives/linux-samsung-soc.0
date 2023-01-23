Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C34C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbjAWPMs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjAWPMr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:12:47 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84B313D4A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:12:45 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id k13so11738197plg.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSTOOV1UI3u7LdjXOPnQjVzALAHz+1al5IvaQmAe3co=;
        b=kjwzEN1JdLw9FT/WzrdLavYKdcbS/qhHRiuwUSjLE5TmfVie2XXNlke4Gqn89axRuN
         N1h2aZUXkXk7Ehj0v8Pbjzbyl6Y8N8omZX4G/X6K7YEJ0ib6hQ5WnOCqhy+YdxUe6W7Q
         HAv0R/AgmE6u0wEF0U6LzM0isq9NRQAc+wFeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSTOOV1UI3u7LdjXOPnQjVzALAHz+1al5IvaQmAe3co=;
        b=VrCEcezzTFSoaRUXcguXS7RBpjNTfKz2QxY8r9sYceuEgAWfScS/WZvJF0SgD/ZZW4
         0w95DxRLbaMbLmKel5hj4o8CmG6t2+xkC0FjYTEEMMBibWBjj+0jruOvphW2jStX3Xwj
         eNFoIJU2w2VQltdjTpZ5OLcHCcad9RjGTTEeHcXKL2Oi/88wcohMNbmE/tHCD1BrpzPh
         QRN55AzLDeLgYC0YQ5Xfg1uk6KVieaFAPhEC0T1qwIgkh0SAkE2tcKRPMfRlGV/As7VJ
         iu/48UtBfpL0EB2bTIpZ6kkoqMyEv5ecqkrpM5ycCW9OTsm7t/3TSWh+U9tB9NeNR/O1
         QTUA==
X-Gm-Message-State: AFqh2kpLO5O9AMCCDqjQPFUH+48pDy5FOrkWsahr67j3P0OUayGmuSli
        c8ErCREBDL6qJHn3UwW9Q7WBsQ==
X-Google-Smtp-Source: AMrXdXtJFJ34oWV4ymQGObCZXWNYSylfAkXVvaTtK68d+l8A43bGplGb8uu4fLoD7SJ49drtIUu+rA==
X-Received: by 2002:a17:902:c24c:b0:194:7696:b0f9 with SMTP id 12-20020a170902c24c00b001947696b0f9mr38420938plg.66.1674486765410;
        Mon, 23 Jan 2023 07:12:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:12:44 -0800 (PST)
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
Subject: [RESEND PATCH v11 02/18] drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
Date:   Mon, 23 Jan 2023 20:41:56 +0530
Message-Id: <20230123151212.269082-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add devm OF helper to return the next DSI bridge in the chain.

Unlike general bridge return helper devm_drm_of_get_bridge, this
helper uses the dsi specific panel_or_bridge helper to find the
next DSI device in the pipeline.

Helper lookup a given child DSI node or a DT node's port and
endpoint number, find the connected node and return either
the associated struct drm_panel or drm_bridge device.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/bridge/panel.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e8aae3cdc73d..be281eb26356 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -499,4 +499,38 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 EXPORT_SYMBOL(drmm_of_get_bridge);
 
+/**
+ * devm_drm_of_dsi_get_bridge - Return next DSI bridge in the chain
+ * @dev: device to tie the bridge lifetime to
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ *
+ * Lookup a given child DSI node or a DT node's port and endpoint number,
+ * find the connected node and return either the associated struct drm_panel
+ * or drm_bridge device. Either @panel or @bridge must not be NULL.
+ *
+ * Returns a pointer to the bridge if successful, or an error pointer
+ * otherwise.
+ */
+struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev,
+					      struct device_node *np,
+					      u32 port, u32 endpoint)
+{
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
+	int ret;
+
+	ret = drm_of_dsi_find_panel_or_bridge(np, port, endpoint,
+					      &panel, &bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (panel)
+		bridge = devm_drm_panel_bridge_add(dev, panel);
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_dsi_get_bridge);
+
 #endif
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 42f86327b40a..ccb14e361d3f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -931,6 +931,8 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node
 					  u32 port, u32 endpoint);
 struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm, struct device_node *node,
 					  u32 port, u32 endpoint);
+struct drm_bridge *devm_drm_of_dsi_get_bridge(struct device *dev, struct device_node *node,
+					      u32 port, u32 endpoint);
 #else
 static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 							struct device_node *node,
-- 
2.25.1

