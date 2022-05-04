Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7557FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348928AbiEDLpb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLpa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:45:30 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABD0E0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:55 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d22so1162743plr.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6x3uhd4n6O5D7pALxGc91aHeDNwJaEEVtXUZiIW64UA=;
        b=aBFpZcFXIbVT3OsRu1NUdY7fkQxGxL2Lb22zKsZQs3fnuyVvpxi7YYwBV9FX24QqX3
         r0mXe7PmpQdgkwL4ePr92WpXPVkRLD+xUBuPIBN7jLZDNAiCS6sux1lSvbqfs2Dops4C
         2Y3Y7x8AXAr6oAbEsgSKB+Rv1HZu/McoWwFp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6x3uhd4n6O5D7pALxGc91aHeDNwJaEEVtXUZiIW64UA=;
        b=QLKQ3R2ZR/HUqL8Q0gjNsOaXIhAcvEBvwtsd8oDejlahDJiTRn0q+X1l56OBBS2+q1
         fHaOPCMgPHzqBjHkYPkDRM2csBAUb92lWo9N1CcAx4KNYuWIKMYx9cnlIOx9PeRj86IR
         GORP+fgiYPoIQuRHMqCRuCVFv9M/JAdd7ljE0QLV3mGx4iJ1igWYeLBfSCNmE8DaEtXG
         SK8Qt0NxsNsK1YfPcTLQNWjzFX21kZK2UYXkvaoy12qhTMhwbWsurVrB9Ap4f4plk+5y
         VCTPHioo4UIhZKeITw27QL5XT8WcXyTyBBA3Xnl58/PvQepZ78CQX55pes1T1h2OUMhZ
         +qSA==
X-Gm-Message-State: AOAM531OhkSDk5MyBqndr9C0RLIOdvsBz0h8gk8H5AEdAI4niNtMe6h0
        XjPLeBUtiqW/uqQ92hkz9LN86g==
X-Google-Smtp-Source: ABdhPJxMlVVAIBPMiL4PWtvlE1XR6X5dinptt8otsTu2e9OjgZztK0oOnkzntRbi5WClZV1gDUY9QA==
X-Received: by 2002:a17:90b:1c04:b0:1dc:4dfd:5a43 with SMTP id oc4-20020a17090b1c0400b001dc4dfd5a43mr10047143pjb.160.1651664514764;
        Wed, 04 May 2022 04:41:54 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:54 -0700 (PDT)
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
Subject: [PATCH v2 10/12] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Wed,  4 May 2022 17:10:19 +0530
Message-Id: <20220504114021.33265-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v2:
* none

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 407abd488005..28ed6b096fd0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1587,6 +1587,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1666,6 +1670,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->platform_init) {
-- 
2.25.1

