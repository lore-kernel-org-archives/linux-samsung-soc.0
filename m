Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E371C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjAWMXw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjAWMXw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:23:52 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4944B7ED5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:23:51 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so14253371pjq.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSTOOV1UI3u7LdjXOPnQjVzALAHz+1al5IvaQmAe3co=;
        b=PqkuNaJe4zLZt1pXyU4BNE6Jz70WIXmx17Xg247P03dtv3rGQieAw66ERZnGN0Uam3
         uKTRl6/QK1I+LoR0GZrl1FXDZRX9q5UUvFZxyGknXXIoxsd4vRQCJfk7WG0Ic2fbndiR
         CFA/pE6QxCSoLVzqP+m6lUKK3Q1YggVQajVHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSTOOV1UI3u7LdjXOPnQjVzALAHz+1al5IvaQmAe3co=;
        b=d/NlEfO1p8YVBjFEl5dFMqNnd5WS9jGsXHEwFk2aK+VvEbVFqNmXBHWDldV8F8yVQ7
         E2DuqUMYda3nsqK+bWBpHxQlgYblNJDnt4ACJwMWDVeA4NiqhcnwP27HtgATmIfaPR4v
         MfG/fjyekRBu/ZIWg4dMEkwLJgq1xUG76BQp90o8xmUm7bpb0ocJAC8Rto3EcgeqS4Em
         lHHw+04+FtNDUrYx1FksERgHVzpBsuSzPd0+yD8yKntDCEd2E4+9IK8q1ZhUIutGD7Eq
         Hf8j0+YJAuBMSViJ/h6VVQt79R9ppihDYfhJzSWCQLa0hiNIP6WLahBqgTycsOJBqJHP
         yQGg==
X-Gm-Message-State: AFqh2kp2nR6hCq7AlI8eIZIJSDDVniY7ALmK9rGURbZtjkMfU/DYDJpl
        Hj3jTL+KIhzHexS80RipI2tnoA==
X-Google-Smtp-Source: AMrXdXvxlewUoEsD2upxdZ46fwJAyn45DncUsNs/p6MoOGSxwrizUfEebqbwf4DTe/e1HAcaGTKVVA==
X-Received: by 2002:a17:902:da90:b0:194:43e2:dcd9 with SMTP id j16-20020a170902da9000b0019443e2dcd9mr34549302plx.2.1674476630792;
        Mon, 23 Jan 2023 04:23:50 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:23:50 -0800 (PST)
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
Subject: [PATCH v11 02/18] drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
Date:   Mon, 23 Jan 2023 17:53:03 +0530
Message-Id: <20230123122319.261341-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

