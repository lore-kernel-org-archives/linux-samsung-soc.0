Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9726DC07E95
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB8F608FC
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhGDJHK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJHJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:07:09 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD80C061764
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:04:35 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y17so15026617pgf.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9Aly6nJLJSN3b2bUvikDgpkvqF9hImc8XWMkPBqpXI=;
        b=TdmLonvKL3YQ4lTciPW2d5BOkfnDv1G7HGporYX1pWNlZ1aGEL+Eq8M7tmO8uBv+mf
         S7ULb87R3+34zvp3osimpLFs7hdpiemCCUQQLsKO4xiLBT2mPUks1MQ/LMUKarkFnES2
         I24uenpZy8PqVrpzNQlkvafBaBR5l0ByYLzRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9Aly6nJLJSN3b2bUvikDgpkvqF9hImc8XWMkPBqpXI=;
        b=jZS0ooEPCcgZsTSgC1QLuf2KVmv/br+SN9BuCVxdBbD92R9nbkREFYUHyE/2IJTlq7
         kImA/bI1dOv7++efCHdvPoa99fIAEU6mfyWdm2cIECY4e5LH88i4l8EkxwxJ0pC9zo2K
         LksreynPzRRiHERm773w+v33nt0UNX5WLpQLqob52uRpO3mxL0e4syBZfptDtcO8axgV
         ALXIR1e1krcvUyIEzR/2WBtX/xE+vcq6TxPubqIfgdMdNn18jSbSTFvzu6a3unh/64ZY
         bhfx7ic0/r0ipS+ChPujwdjPt/napZvEmZDnNmnTc0Rfs1VVHrLIsoVXIWR3hgOafysl
         lgMA==
X-Gm-Message-State: AOAM530Oscvaqnf5LkZ7tHMkEEM/cPQEg9Ei0kfG2jPH9kl511/884O4
        HFhFgIr1wk88vDjpxkxR3JgTcA==
X-Google-Smtp-Source: ABdhPJweFhSs5QChPSwb0B5wADBPo78G77JyeMZ39XaIlV7lSuuZY45FOdIQsUxegraD1I9JmgaImQ==
X-Received: by 2002:aa7:8003:0:b029:2eb:2f8f:a320 with SMTP id j3-20020aa780030000b02902eb2f8fa320mr9221995pfi.70.1625389474612;
        Sun, 04 Jul 2021 02:04:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:04:34 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [RFC PATCH 04/17] drm/exynos: dsi: Create bridge connector for encoder
Date:   Sun,  4 Jul 2021 14:32:17 +0530
Message-Id: <20210704090230.26489-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use drm_bridge_connector_init to create a connector
for display pipelines that use drm_bridge for encoder
implementation.

This allows splitting connector operations across
multiple bridges when necessary, instead of having
the last bridge in the chain creating the connector
and handling all connector operations internally.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 24f0b082ac6d..d828be07c325 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -24,6 +24,7 @@
 #include <video/videomode.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_mipi_dsi.h>
@@ -1591,6 +1592,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
 	struct drm_bridge *in_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
@@ -1599,12 +1601,22 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return ret;
 
-	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		drm_encoder_cleanup(&dsi->encoder);
 		return ret;
 	}
 
+	connector = drm_bridge_connector_init(drm_dev, &dsi->encoder);
+	if (IS_ERR(connector)) {
+		DRM_DEV_ERROR(dsi->dev, "Unable to create bridge connector\n");
+		drm_encoder_cleanup(&dsi->encoder);
+		return PTR_ERR(connector);
+	}
+
+	drm_connector_attach_encoder(connector, &dsi->encoder);
+
 	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
 	if (in_bridge_node) {
 		in_bridge = of_drm_find_bridge(in_bridge_node);
-- 
2.25.1

