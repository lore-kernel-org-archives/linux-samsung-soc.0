Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0B0C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjAZOpR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:45:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjAZOpQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:45:16 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BB53AB6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:15 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id a18so2023087plm.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbuFui50T2yH9lXHDgl2DPCW0nuBgP82n9Kixz8u2B4=;
        b=NjLrpZiH1F8NfMSVlPGCbh2EXunTVmLORQW5P/C5teDrIczUd3nWuuN6Mi3mZ/1XOR
         k/jCFOhNFtwUOH8qTRtktsPukWie3yr7fX2KOQV7u5GsHUefv64ViQf0ioPooTyp/Pwu
         Yoc8wNKq8vOZgEh5zBCYvebG0jowdv3ORf2ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbuFui50T2yH9lXHDgl2DPCW0nuBgP82n9Kixz8u2B4=;
        b=dWCatW35EZsJepFuezlLvYP3Hso6ecvwVQ27z7D/xC66gjxMw4QqDrgJTThsUhpA8K
         yT1pMcktLCXDvNWoNz1r16MH0zuZroRq9hB2ozbosPzHnXAgwH/7hBa3d8wgkNeFODB4
         XTtPutIbME8amtiSyNZ+U7PaMCh7Zsf68TnGR4tuFTAVt1RX+pFWFLkH+vfQiuj2V9F6
         r6CqVKkcVw5Owt0MahvXgUGht/ORdxSbxoEMM3wslaLx90MuiHxMul4a+U2n0r4aAgli
         0qggwpjAFN9YUhbOVkAMUMiCr0zfwIF/aLXsjBqK66eWCGD5IchGatsmUYPRH5gBQhGQ
         DP4Q==
X-Gm-Message-State: AFqh2krYnoOn0FD8qXJm4Krh+xxD8NRBT5FiQflFM1xpYuLRo9yrQXq9
        xOShFOfgJLeJDM9yvw/7V/ms+g==
X-Google-Smtp-Source: AMrXdXt1zDNXhAfKJemBXBmmAcO4SK8gFBozDTPfPU1zLylCQgg6AqhLhORHuZpVHNZ94YcpMf6kEg==
X-Received: by 2002:a05:6a20:1611:b0:b4:6f9:ef7d with SMTP id l17-20020a056a20161100b000b406f9ef7dmr46784387pzj.35.1674744314855;
        Thu, 26 Jan 2023 06:45:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:45:14 -0800 (PST)
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
Subject: [PATCH v12 02/18] drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
Date:   Thu, 26 Jan 2023 20:14:11 +0530
Message-Id: <20230126144427.607098-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
Changes for v12, v11:
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

