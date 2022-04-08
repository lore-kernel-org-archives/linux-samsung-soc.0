Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DE8C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 16:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbiDHQZV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiDHQZS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 12:25:18 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB8231C0AA
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 09:23:14 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id r66so8203521pgr.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGCB1sW6LyijUbLjQ0T8cjIYHkAIPaRA2Df2SDrEzx4=;
        b=AUwD0c/HONK4kHDWXFTViVCCou9fnZO3egeZ7s04cFUrIltfJNz+ce01OgdXRoKPky
         Qkn7DhXb4N84zNHd/krryzjn7wt8LZHuJrE8sag6vqNiMuhrbA8rmCGniWNhzX93z3W2
         I7GiWwvIi93BO5QHIKJZ6nPobVHPgqzk3Dgus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGCB1sW6LyijUbLjQ0T8cjIYHkAIPaRA2Df2SDrEzx4=;
        b=vvFej+IcndlSmKmjWldq1XpKGyBR6DuyET5VVYIwB07nMLRvCLc0PFmfcBQoAAkwc5
         cfptw5LSIc9XdH3OpHRtG/KtNpAbd93iA/acBcM8atpWBTWA4pKhNrr1put+SHjdIYif
         jIyNRFd5GTyAxzG7DB9lfh9wo8U1oWkgLZWd6q8jItVMHk/zBRkssKgErvM7a82iR0Em
         Xm3eOHZNlYm3SnqK0mI58zOyu9yJ8bYsVRokdTVvIeSZcTJVLEx0ByUTI2IIWv0jnTq7
         euTK5/SmPGhabTrRbdI1nil181RZzly7QE8WrI1+TK03OsgbuwkSn8FqIw3GdL4QULc+
         Tz6Q==
X-Gm-Message-State: AOAM532J8mfM9jmDB3Lg6ZKzSEYMlZ0eAbbGfzybu35uZ936+ucrFIiE
        oRaP09EkitqL86ZJuysWNMmL/w==
X-Google-Smtp-Source: ABdhPJzVK2WLZLH7V+ZzPjQ0OUWUy++6NHPog+TXp4Ddp3DIpi/rUciXcNDblhENViSmJwi5aCHlIA==
X-Received: by 2002:a63:9d07:0:b0:398:9594:a48f with SMTP id i7-20020a639d07000000b003989594a48fmr16365061pgd.51.1649434993731;
        Fri, 08 Apr 2022 09:23:13 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
        by smtp.gmail.com with ESMTPSA id n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:23:13 -0700 (PDT)
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
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 08/11] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
Date:   Fri,  8 Apr 2022 21:51:05 +0530
Message-Id: <20220408162108.184583-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Finding the right input bus format throughout the pipeline is hard
so add atomic_get_input_bus_fmts callback and initialize with the
default RGB888_1X24 bus format on DSI-end.

This format can be used in pipeline for negotiating bus format between
the DSI-end of this bridge and the other component closer to pipeline
components.

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 38db1f93ed51..02802526f82f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1338,6 +1338,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state,
 				     struct drm_crtc_state *crtc_state,
@@ -1372,6 +1398,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
 	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
-- 
2.25.1

