Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749ABC4708D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbiLLScG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 13:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233973AbiLLSbj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 13:31:39 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D2E186E7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:47 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d7so12944887pll.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3thu+TFV75UQnUKi5H5iMkprh+mVb/ueAKw6cINH6Y=;
        b=Gh4sGxHl66CkePx1uPOJ9+QfVzVDgI4LtnOjg6S3enaAA8amtaSKxIc/AxDLV1zq9A
         G1R37KCSbqBH6KzjCaqAdxMJVO/MzdncBEqy4ILe3rt5FJizcEaXuswSKND97NTFSUCa
         oonxwo7+nQS6+1kiVnJHvW6chzKruYpkqdr7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3thu+TFV75UQnUKi5H5iMkprh+mVb/ueAKw6cINH6Y=;
        b=YNDSbMmscIiS36V027ET7nePXsyrrL03mLRP/y1kZV9L5j0U1a/8ASqV0L+GXHHiE0
         0LvgpcJUDV3mzhPQcTXoOcU6C0pcJFXqnDA2k8Gwgnv5cHOiWOQzeHs2xfhDDTZhEJPh
         5U+LE4xhpKL8KPw2DRwtG4/uZzvIC9Ibr9hvmN4XBj6GSworLXr6Z8P+1EJgxw9l4TKa
         3CZNGrPHtiKsGQJn0W+Yd6Bwx4neea9diing2KOPg9UHId3e674NhRTe3W4AhCSEJyCD
         WXjY9RQ0xi3Tcf1ASjlspul4LUcwRDXxHyQyVWZbj25dj1BkAHvfxld57qP/GjoVrME4
         RWvA==
X-Gm-Message-State: ANoB5pmatdje0k5NtEnffkMobFviUvZpe/3wNQCDfGaU1GaLa+meZi0E
        DgNcuQLQM+QgrxdIpH78Qsxxqg==
X-Google-Smtp-Source: AA0mqf59dINh/5fm38yRqrF5Y6rB+ErCZKmj7qHXjh5d283hE7csggHWbwm7onwdkzkqk9T/WefmpA==
X-Received: by 2002:a05:6a21:3996:b0:a7:345a:1024 with SMTP id ad22-20020a056a21399600b000a7345a1024mr22612382pzc.50.1670869787169;
        Mon, 12 Dec 2022 10:29:47 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:29:46 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain order
Date:   Mon, 12 Dec 2022 23:59:23 +0530
Message-Id: <20221212182923.29155-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- add bridge.pre_enable_prev_first
Changes for v10:
- collect Marek review tag

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..9d10a89d28f1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
@@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	dsi->bridge.pre_enable_prev_first = true;
 
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
-- 
2.25.1

