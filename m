Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F76C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiLLO6F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 09:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiLLO6E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:58:04 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817A36563
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:58:03 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso46677pjh.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUyCC6RYtxHODb9m9nhr582aHeYxw+TkFHRNIQ4fYGY=;
        b=FRVZOA5MW6CEmDntWnCEkkMV0/nmcHBS9nzSghIBzCbtZth7qEG2WidZWhS7Z/+hDZ
         2B2IWZ9RadwPRvrIEeh/1wHGsYeh3QAbacffId1hHt0EOGD1hUuC6QG5rjg7zHjW1paU
         BoxkAW/Pgz2b4R4NVO7dj/xROwxfPsuN0IAC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUyCC6RYtxHODb9m9nhr582aHeYxw+TkFHRNIQ4fYGY=;
        b=k0o7ut+7oav5CloNNLEt7FQ8Pc1FyG/9fClTNZVY0kws4BD7gpdJP7TyMN1PAfsfYr
         C4y71YlI0sQZoAWyvZg4uWFhmuYbSFWbs1K3Qh0H98DqP5AOCwo3hvOQzaqKYF7Dzdj+
         xNYETFugvoBWSEpbEZZUqzhdtF3SG3xxK3EDPcTRjocOABNGC3+sIYvA5vHBMG3KJExX
         tYog5DLBIzxU/v55J+eMQ6yGA7awrsl+5t0UEdr+HKeekowJfS9//lMybgOx1jOnI6uO
         oUg/P0xORtpKZfp3tSFlE4uSJI7IsY2JcSEZKljqdc680R/kR27bQxAIZcZjLl6fveHZ
         ORzw==
X-Gm-Message-State: ANoB5pkAKlyXYfUF+ce9ArLBuU31MmxNAyjbe+eYheD51X6kerI6u/0f
        kDZLEgG7Oup7GjtgIZxrl8KSJA==
X-Google-Smtp-Source: AA0mqf5l7kgawrSwx50+NFxP7tz2UIGYjj9HRi3aDbU4bNlstev98UtEuASCDGSFMqwpaopMqAi3dg==
X-Received: by 2002:a05:6a21:1505:b0:a3:ef0f:ce6d with SMTP id nq5-20020a056a21150500b000a3ef0fce6dmr20788413pzb.58.1670857083010;
        Mon, 12 Dec 2022 06:58:03 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id h6-20020aa796c6000000b005769ccca18csm5868129pfq.85.2022.12.12.06.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 06:58:02 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH v10 1/2] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Date:   Mon, 12 Dec 2022 20:27:44 +0530
Message-Id: <20221212145745.15387-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
0 = Enable and 1 = Disable.

The logic for checking these mode flags was correct before
the MIPI_DSI*_NO_* mode flag conversion.

This patch is trying to fix this MIPI_DSI*_NO_* mode flags handling
Exynos DSI host and update the mode_flags in relevant panel drivers.

Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
features")
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- add Marek V review tag
- add panel driver fixes
Changes for v9:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c          | 8 ++++----
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 4 +++-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 3 ++-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 2 --
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e5b1540c4ae4..50a2a9ca88a9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
 			reg |= DSIM_HSE_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
 			reg |= DSIM_HFP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
 			reg |= DSIM_HBP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
 			reg |= DSIM_HSA_MODE;
 	}
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		reg |= DSIM_EOT_DISABLE;
 
 	switch (dsi->format) {
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 1355b2c27932..39eef3dce7c9 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -692,7 +692,9 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	dsi->mode_flags = MIPI_DSI_CLOCK_NON_CONTINUOUS |
+		MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
+		MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
 
 	ctx->supplies[0].supply = "vdd3";
 	ctx->supplies[1].supply = "vci";
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index 3223a9d06a50..46d6f4a87bf7 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -446,7 +446,8 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_NO_HFP |
+		MIPI_DSI_MODE_VIDEO_NO_HBP | MIPI_DSI_MODE_VIDEO_NO_HSA;
 
 	ctx->supplies[0].supply = "vdd3";
 	ctx->supplies[1].supply = "vci";
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index 362eb10f10ce..c51d07ec1529 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -990,8 +990,6 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
-		| MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP
-		| MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET
 		| MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
 
 	ret = s6e8aa0_parse_dt(ctx);
-- 
2.25.1

