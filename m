Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2B0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiGTPwi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiGTPwh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:52:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B184BD19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id w7so15333721ply.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2R5fsiZtZGlt+FobiR6W0jXlK1PNk4NpdanB+YrtTj4=;
        b=AR1YQry57YWBTW9l3DTgkGErpP13QbkNF2JOlwbPEBU7/rS03udEpZZVR5AMazoh6G
         pemS6qjSpURfm6lO813a9hWh2itiOrPeJxp9hAIalG1qkwxG1XEMca3JPT75WoHqLgCK
         LSSslsVB61hJY4ageZmSvMirSj7fhG1NAjv5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2R5fsiZtZGlt+FobiR6W0jXlK1PNk4NpdanB+YrtTj4=;
        b=uTUu533AAhsAel6tAgyFHjCo/h30CexfSdRK0oLcJJJV2r0b730rMUFgZadTypY7WJ
         qTbkWd2rD66kpZ+SaZVdE400tMC0aVr9cuZjgw8C0bLfvLBGR78j9zoU9tCqchLjaqDU
         A5wFyqxazEwardlD9Yh59Ezxi4fULROlxtjCjb8BhUqT6stWSuUBrXvMiKM236OO5fbJ
         fnMi6/ID+oKnG2IOKP8L9Iq3VcIJH5cMMh8VJjz2yJuYp7Wsu9Upq3L0wTVWqYtFzoVY
         hPkc1VPX4nc3wASayYuTvdV0d9Fn4FKN/Lgyxcwj/glv+dQ1G3tP3mkUjjN27fW0k4Qu
         kx1w==
X-Gm-Message-State: AJIora8IrWNNdfcIQRDX0+4xuAlimtOrtfA1jI5xoGAaO+rBr+JtTd2F
        kUc3bEHrk2dj21nU6yPX5nBi9Q==
X-Google-Smtp-Source: AGRyM1uJchxuQnN136/OorRRTcNQCp33W035zpvqDdbfw4L0q7XpSJGz1cssPXyqkqJZocUt6AJHnw==
X-Received: by 2002:a17:902:7d92:b0:16c:54a4:bb2f with SMTP id a18-20020a1709027d9200b0016c54a4bb2fmr39962044plm.158.1658332356419;
        Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 01/13] drm: exynos: dsi: Restore proper bridge chain order
Date:   Wed, 20 Jul 2022 21:21:58 +0530
Message-Id: <20220720155210.365977-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

v3:
* new patch

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..e5b1540c4ae4 100644
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
-- 
2.25.1

