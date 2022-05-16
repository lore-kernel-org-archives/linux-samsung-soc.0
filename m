Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A544C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 May 2022 19:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345698AbiEPTji (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 May 2022 15:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345692AbiEPTj1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 May 2022 15:39:27 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2023EF1D;
        Mon, 16 May 2022 12:38:56 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id tk15so7128786ejc.6;
        Mon, 16 May 2022 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4MqTQsyrPlGAY3ZVzPHFppwBaFcUmVAxjZ/gLZ8oCIM=;
        b=DR4HwFyZjcgNl9bY9VS/vPVcdS9vGcZ4UcI0exJWuatVr6wqNn14ouE/TU7fKGYxzU
         cUFuYJuiT3d+zuIik3iilAMuRUWnnj7sxuJ7/zGIdXqTrSvdbYMor2TAw0862NfjGKi2
         gvUVdfusJ4TSHv5J3yCLisQ9nsjLQ+XgaiqXcG7uNWYdXAYlOJwOt2hbgKwagC/W5y81
         GG0gSIXNzi5s5rnEfUbNqGOYBvhdh3hqKd3VgcId7RN1V+SWoo4A9F4xoSLklFztd48c
         QJ5QmuYfxQz4foTVEE7QE2EsVgzh2s5LTvDi2SvJ77Q79KE5iApKjIjFqL29Dh2aOOMg
         66gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4MqTQsyrPlGAY3ZVzPHFppwBaFcUmVAxjZ/gLZ8oCIM=;
        b=MYtb1MiGnaPc0bDE2Pjm5d5YwwZB+5gxXeSfyW+fjkOa2KBCvtpu8v8fbM7aibZOro
         l/7E4UaXF1ngBo2rWrPwmtBLWjpjZNWWZ6+0z2uc5cQOMWHQSNWk9bGWlr4Zemo3t3Gc
         u6eYDxqq+4pZfMC/+aYiTarhuDFLZFlH7V5ZKsLyyulShQ+VkE7QG+BWNsUfMKlgPrvG
         zlt+Y517hHcEDLv5QbFnDqbP8ZjVF3ms9EVBtIYBON0+pYUeGhCWn589fEj6pUwXfR6s
         tGrbBNNQxy66QCQ/xKwxLIjuLkgW8cc/chMxJQycCpY/JYjUzuxawxqWfq4aoMuJE8oQ
         SG7g==
X-Gm-Message-State: AOAM532Xu1TPywuH8SUpq3kHaZxGwdRkWXHrh+a6PbuNC8vdYuGdSnn1
        EoPysI+GeFWRyOHP9S3sEV8=
X-Google-Smtp-Source: ABdhPJz99o3t2aqzUBbPpB8Umrag5RKOsZT6WcUNWQ0L92iB4gSTkFvsWzRTJzw4xvP5MgncWEnwkQ==
X-Received: by 2002:a17:907:2d11:b0:6f4:7cf0:2275 with SMTP id gs17-20020a1709072d1100b006f47cf02275mr16523834ejc.72.1652729935167;
        Mon, 16 May 2022 12:38:55 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
        by smtp.gmail.com with ESMTPSA id p25-20020a17090664d900b006f3ef214e41sm92831ejn.167.2022.05.16.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 12:38:54 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH 2/3] drm/panel: simple: add support for the Samsung LTL101AL01 panel
Date:   Mon, 16 May 2022 21:37:08 +0200
Message-Id: <20220516193709.10037-2-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516193709.10037-1-martin.juecker@gmail.com>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add timings and panel description for the Samsung LTL101AL01 panel.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..e21f304315e4 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3073,6 +3073,37 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing samsung_ltl101al01_timing = {
+	.pixelclock = { 66663000, 66663000, 66663000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 18, 18, 18 },
+	.hback_porch = { 36, 36, 36 },
+	.hsync_len = { 16, 16, 16 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 4, 4, 4 },
+	.vback_porch = { 16, 16, 16 },
+	.vsync_len = { 3, 3, 3 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
+};
+
+static const struct panel_desc samsung_ltl101al01 = {
+	.timings = &samsung_ltl101al01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 135,
+	},
+	.delay = {
+		.prepare = 40,
+		.enable = 300,
+		.disable = 200,
+		.unprepare = 600,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -3966,6 +3997,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "rocktech,rk101ii01d-ct",
 		.data = &rocktech_rk101ii01d_ct,
+	}, {
+		.compatible = "samsung,ltl101al01",
+		.data = &samsung_ltl101al01,
 	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
-- 
2.25.1

