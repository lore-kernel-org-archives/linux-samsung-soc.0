Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30D8C07E9B
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E0D561941
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhGDJIN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJIM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:08:12 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEE7C061764
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:36 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id o4so5365897plg.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A427+AfnA1Ioz/bXS+gNjyx5ot8Nzh0o3fQKGaVpLAE=;
        b=KaxmMRYPEmdg54XavvkHjZ8mq4QksxD0N/CQJqpLUYFA+3J4uv90DR4ptLg++WDirj
         L51kBA2kO+b20UX1/tQZGklUb5FbtcJOmoNn52QBOJ+phq9sKEhp2AoZexc116ZUJlFO
         5bEUXUhGnvVypx5REzbRYtOaMT2a/sTa7L7Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A427+AfnA1Ioz/bXS+gNjyx5ot8Nzh0o3fQKGaVpLAE=;
        b=ix+d6cVUS0EJKzVCY1AZezsN3ZuAepiJT+fselLMeDU1slNp0sMtXufQ3F2kz0Y6Kn
         s+mItZOhXzj8nZXS5B2ecne5mPr/rIaWwAhsxQP2vvGdwfo4X2DVQDIJSRcTSrm0wj2v
         I0r5SJHBH6LiypY7L0KQdqE04f45ADPu1RIjhLDGrWAEnOE8AzGG3a2xzwbFY/u20MOV
         F40WSC4iaOy5h8R4ItzVtK1oogmx7X80Nl4Tk+cdDPRJbWTVposH1pNFf9toebOvDWlV
         z0+8+/Y7Q5ndFEdFx/gnW72ZX9OEeAFAeCwqJv+J3cAhG97xa2yFDn4v571YYZVZK9lX
         W/XA==
X-Gm-Message-State: AOAM530JjrKMsTKGBHilODi2L7M4fxgzIZTmG6SaKs7xY8ZVWYyTj2Qa
        0WMq5b3WQF+trhM4EwV8eGH1/w==
X-Google-Smtp-Source: ABdhPJzF0gwFjaSFBGpjxUR1GLBewbvTOx45N662kaGKe4lbYN/xyidAjUEaurcx8R0MQht34Y4E7Q==
X-Received: by 2002:a17:90a:ae0c:: with SMTP id t12mr8483517pjq.149.1625389536434;
        Sun, 04 Jul 2021 02:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:36 -0700 (PDT)
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
Subject: [RFC PATCH 14/17] drm: bridge: samsung-dsim: Add input_bus_flags
Date:   Sun,  4 Jul 2021 14:32:27 +0530
Message-Id: <20210704090230.26489-15-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

eLCDIF is expecting to have input_bus_flags as DE_LOW
in order to set active low during valid data transfer
on each horizontal line.

Add DE_LOW flag via drm bridge timings.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ea379cb0cc32..bc845ae100d4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1723,6 +1723,10 @@ static const struct component_ops samsung_dsim_component_ops = {
 	.unbind	= samsung_dsim_unbind,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1819,6 +1823,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	drm_bridge_add(&dsi->bridge);
-- 
2.25.1

