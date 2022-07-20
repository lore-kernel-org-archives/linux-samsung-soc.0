Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458F6C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiGTPxO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:14 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5764BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:13 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a15so18167326pjs.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZjdCys1wARNaHGqSCSF1WaRxrhPvglBL2HzzeN8DBY=;
        b=f9BPhYSsRKAu5C5CWgSOnopXYAxlWSFoYzx3Z/Sboktz59ZhlB20+IjyUmLgJnP4Ie
         1obZII1hQGecpTgT+o7l3kc5qdK0WyzyOx9zitLfkIiNrZDHzY20nE6+Qj8HrK3UXGgL
         ZnUeuLDqbTjPxzclypHTYbGT/Pmx1tJOjhznI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZjdCys1wARNaHGqSCSF1WaRxrhPvglBL2HzzeN8DBY=;
        b=ZsDv9B66K0qkx33YCWvPE6TClG5/Y6lnrBDEd/DlPekplSvlRpiMrKBHdTeeXC0pbJ
         u1TAaqz+Nbr/0WNmOt1Ad2AvoFO8ArafT9L5Uwky85nY9Ey7RXUkd6a1Tf4fewdYLFq2
         3dbqxGuDq+f6uY3VrN/J7NaGBvb+am4nXc9G8FI1sioYVD8lqjRNBNRh3sP0q7UJbfeG
         f6tWu7ClpBUruRSd0A4KggS6oCM3twMmUExT4ABtmxMOtQGw+0Qg86ShF1zr9k63y/qC
         6ANmlQO4HC29cTylV/SrCMH4Qdb3DYVuVihsPTq3uA16ot/r6Be7Gws3aZZK5psh9uBP
         RKmQ==
X-Gm-Message-State: AJIora+uaBzNe98btuvw7ybr0/8Kww0MVBCJIndrnpe2GFNPs6q+4M9F
        IplqvALGFFpp2SSZQvoDL6b0Ng==
X-Google-Smtp-Source: AGRyM1uJVjan2ZkGWRXvL7eayCwSTD8uXDMJM2c548Wbuu2YYcfaD3HTSqO7wvCrQjAkfjxWvjKjoQ==
X-Received: by 2002:a17:902:da8f:b0:16d:1c82:624b with SMTP id j15-20020a170902da8f00b0016d1c82624bmr5257608plx.163.1658332392789;
        Wed, 20 Jul 2022 08:53:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:12 -0700 (PDT)
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
Subject: [PATCH v3 06/13] drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
Date:   Wed, 20 Jul 2022 21:22:03 +0530
Message-Id: <20220720155210.365977-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Host transfer() in DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this
host transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the
controller setup for I2C configured DSI bridges.

This patch adds the DSI initialization from transfer to bridge
pre_enable as the bridge pre_enable API is invoked by core as
it is common across all classes of DSI device drivers.

v3:
* none

v2:
* check initialized state in samsung_dsim_init

v1:
* keep DSI init in host transfer

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9b74a3f98a17..b07909a52f2d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1258,6 +1258,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & DSIM_STATE_INITIALIZED)
+		return 0;
+
 	samsung_dsim_reset(dsi);
 	samsung_dsim_enable_irq(dsi);
 
@@ -1270,6 +1273,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
+	dsi->state |= DSIM_STATE_INITIALIZED;
+
 	return 0;
 }
 
@@ -1289,6 +1294,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	ret = samsung_dsim_init(dsi);
+	if (ret)
+		return;
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
@@ -1464,12 +1473,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = samsung_dsim_init(dsi);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
-- 
2.25.1

