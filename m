Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107C6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348920AbiEDLo6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLox (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:44:53 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B313E0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id cx11-20020a17090afd8b00b001d9fe5965b3so4941732pjb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMs/ahjsuW/3pyoDPdTDx4JCwHHuvSLOtpCm4rKmrXg=;
        b=SVenTxQUkDyXsYbLphK8C8joex+YA17/52S2UEEQuasymHntl+gbZ6hBKGfef+rU9L
         BJgX/jpUAMw69v1x0Y+63HYOLAcQLEh8CeBdOZ2dDhfF9Aw/h08RNOdyD2yeDKkBh4QW
         i0nyfkpjGQYgLcHFOBKBcpeZ9N1J3/6o4DqJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMs/ahjsuW/3pyoDPdTDx4JCwHHuvSLOtpCm4rKmrXg=;
        b=k6oV6Q0CV0l1K8poKtNXfAbpy9Z0TkyW/2mDuyikAPafAey4hX4C3NMwwUZI+TuMTw
         AWIzTA2R1jZ9zAiVu4rbFWa2JV2yCgaHMgh75/cd6W5M4VGhksrb/HwDPsvtxGDmmwaI
         lbAxrkxoOJ4ZZk0uwjzvmamn5bse0Y2NSFltZCtboJsbaoYLmppwbHbAa9m6aekReCSC
         3Wm151jdUL3RQhEGn7IkVDakAY0ggwiAyMdaHr2x8uWETeVojKSZW/tht00ue9bV7atd
         R0reMsdpyKrj/02LC36Qq5fHGm9g6KS0UKWoqYW2Zg1dq9DFD7NrCIKHguATfuCVjcpX
         aL3A==
X-Gm-Message-State: AOAM530OY306EwpVu0CG4BFG5gP7Nl5G9AinbrKiaQKJ5tgsmTN7lI1I
        YBBt49wYQmVCnuiAtq3qwUwpug==
X-Google-Smtp-Source: ABdhPJxD8WMIBN5LbEmrgwis2/7My6i2oV6asbmrzISHufiZynRA61sNuZBJnYMXJamBVxlNiks0ew==
X-Received: by 2002:a17:90a:de87:b0:1d9:8264:baef with SMTP id n7-20020a17090ade8700b001d98264baefmr9889219pjv.227.1651664478075;
        Wed, 04 May 2022 04:41:18 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:17 -0700 (PDT)
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
Subject: [PATCH v2 05/12] drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
Date:   Wed,  4 May 2022 17:10:14 +0530
Message-Id: <20220504114021.33265-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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

v2:
* check initialized state in samsung_dsim_init

v1:
* keep DSI init in host transfer

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 60dc863113a0..b9361af5ef2d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1259,6 +1259,9 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & DSIM_STATE_INITIALIZED)
+		return 0;
+
 	samsung_dsim_reset(dsi);
 	samsung_dsim_enable_irq(dsi);
 
@@ -1271,6 +1274,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
+	dsi->state |= DSIM_STATE_INITIALIZED;
+
 	return 0;
 }
 
@@ -1290,6 +1295,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
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

