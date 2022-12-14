Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7064C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 12:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238218AbiLNM7u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 07:59:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238258AbiLNM7q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 07:59:46 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1AB167F3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:45 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id m4so3251772pls.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5Cg+w7Af9e5w0oCEb7RkXl27zloxkjJ1KXCIn5jcp0=;
        b=Gl9PUd97r12bghPzuO3DwOVtoeR//cS3eYfPq5zukWnHrnm9pdqGbEveENQeP6nm/L
         ywcxgX/UOUkZ0qcExi+xs9doH/iHhA51l4/o++XvR+N7yNbzogJp844lz94cwsx6hLka
         aI3xeMQvgHeU2Ej/KL6zXSyNbGxIv9Kb9KgGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5Cg+w7Af9e5w0oCEb7RkXl27zloxkjJ1KXCIn5jcp0=;
        b=oUT0t43e8m21uAMj5+OsKqdMGF6JYEsRTF8tQ3GXwqr2z7WNOijop6wNSCTBCKTXAv
         zfrIkvyFxBE3+zMuNLR9o0IMH8XaTJSCnaCn0ngSgOfYSznf5t8n83uGaDweTAPIj5LL
         Fb7GF3h93M5FJrtv/JJeiVkgGqGMMQYpOE9Nns+Q3r09UVpeBiZlGS8L5boVnen+kbxM
         FVmnbZu61JeKHujRdzHFilmy3fenB7Xg97RYzk/guOQLT0ICI1AHHCH9Th8J0jYDGaD0
         BPo6uac2C1OmThU823LcT0h9CVCu+q4Oa5Cq/jCAkEOsqdQVNvIj9kQUYxi3aEfIIOLe
         WRIA==
X-Gm-Message-State: ANoB5pmFB9iqhii9MEm5vYyv05zACzW65FXn8NROw1Kl/9b/WMBhfoE2
        s2YaYhw5NQUyi4ZVYRN8EyxCiw==
X-Google-Smtp-Source: AA0mqf5M/fyXSrpL3RXH+H4YrpKX5HwB/Q3ekd51lJbt+qbKK+cXgsesXWRHUXC9gMA/8bFy2PTdbw==
X-Received: by 2002:a17:903:189:b0:18c:1bc5:bd58 with SMTP id z9-20020a170903018900b0018c1bc5bd58mr39744815plg.9.1671022784870;
        Wed, 14 Dec 2022 04:59:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 04:59:43 -0800 (PST)
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
Subject: [PATCH v10 02/18] drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
Date:   Wed, 14 Dec 2022 18:28:51 +0530
Message-Id: <20221214125907.376148-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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
Changes for v10:
- new patch

 drivers/gpu/drm/bridge/panel.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 03c3274dc3d9..50ea5de45197 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -496,4 +496,38 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
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

