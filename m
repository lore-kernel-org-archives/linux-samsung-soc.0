Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62E4C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 08:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiJAII1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 04:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAII0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 04:08:26 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426F837188
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 01:08:25 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d10so6110759pfh.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ke/kHSIUtl4EAJQ/hjOQA71nefBPkPlcvo1GhHET9E8=;
        b=YE7cv58N9RW4OIyM4jXxEGd5pB/yhJBnKPT2iilRqtyLVs3ajOGpJbSnDdQNhcN0ha
         zw12nEDF52P8edMqEgBLo/lytT4aE2iqPNOPCF6k7Ut4BVbShI8ViLQj6uF0X6xTC/Nc
         rSUM6jL8/Uxa72RAohk4QcF8EDYOf0CWTpiRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ke/kHSIUtl4EAJQ/hjOQA71nefBPkPlcvo1GhHET9E8=;
        b=t9QRk0c8zadWnv3u58qxjCrMFX8r7hH2DZFR60mf3+rj/29dvzmZvOLJp0MEOhcQm9
         pfHyNFa8FmU+FrBX8+3zmWvww2LOYE3GiAxrmF5Mgm6T/D+wlHTOEhAa2P7wDbS+7K1h
         iKWt6cQTt7c4l1yZ8f8LVu2WuQM2ZJz4RoI5G2jeMq+cjaiR1rvzOLZE8vsYuzFLqEXu
         ZkPDrj+jVhRZf0JzCZPqN8IVy7c2xjcF18wKJy672GqpAzNkPXfxo8vcVyZLa0FFh5vm
         d8gjBlYoHduvvJXRYtPWYkdA8y9EkdMNfQ+vr+BytHAx3/pYPSTUblbTTAMpVhE3KNkY
         RshQ==
X-Gm-Message-State: ACrzQf2wsxR15vWQqRsOoVNKiVIm2ZEmrxXIgghilahgc+XE6kZKvpcs
        cmsstOuAbGMOkinyZ6A8ZUiFUA==
X-Google-Smtp-Source: AMsMyM6JwRvi+Ewzv0hDAvXHAw9i9EWDyl03ectNydcJIUPmzlbehB8fAz+xeesUswLt08bzxqLnmg==
X-Received: by 2002:a63:33cf:0:b0:439:f026:aab2 with SMTP id z198-20020a6333cf000000b00439f026aab2mr10713031pgz.86.1664611704758;
        Sat, 01 Oct 2022 01:08:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
        by smtp.gmail.com with ESMTPSA id c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 01:08:24 -0700 (PDT)
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
        Neil Armstrong <narmstrong@linaro.org>,
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
Subject: [PATCH v6 04/10] drm: bridge: samsung-dsim: Handle proper DSI host initialization
Date:   Sat,  1 Oct 2022 13:36:44 +0530
Message-Id: <20221001080650.1007043-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DSI host initialization handling in previous exynos dsi driver has
some pitfalls. It initializes the host during host transfer() hook
that is indeed not the desired call flow for I2C and any other DSI
configured downstream bridges.

Host transfer() is usually triggered for downstream DSI panels or
bridges and I2C-configured-DSI bridges miss these host initialization
as these downstream bridges use bridge operations hooks like pre_enable,
and enable in order to initialize or set up the host.

This patch is trying to handle the host init handler to satisfy all
downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
flag to ensure that host init is also done on first cmd transfer, this
helps existing DSI panels work on exynos platform (form Marek
Szyprowski).

v6, v5:
* none

v4:
* update init handling to ensure host init done on first cmd transfer

v3:
* none

v2:
* check initialized state in samsung_dsim_init

v1:
* keep DSI init in host transfer

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
 include/drm/bridge/samsung-dsim.h     |  5 +++--
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2ba909ec5239..0636440e4420 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
 	disable_irq(dsi->irq);
 }
 
-static int samsung_dsim_init(struct samsung_dsim *dsi)
+static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & flag)
+		return 0;
+
 	samsung_dsim_reset(dsi);
-	samsung_dsim_enable_irq(dsi);
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED))
+		samsung_dsim_enable_irq(dsi);
 
 	if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
 		samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
@@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
+	dsi->state |= flag;
+
 	return 0;
 }
 
@@ -1269,6 +1276,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+	if (ret)
+		return;
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
@@ -1458,12 +1469,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
@@ -1653,6 +1661,7 @@ static int __maybe_unused samsung_dsim_suspend(struct device *dev)
 
 	if (dsi->state & DSIM_STATE_INITIALIZED) {
 		dsi->state &= ~DSIM_STATE_INITIALIZED;
+		dsi->state &= ~DSIM_STATE_REINITIALIZED;
 
 		samsung_dsim_disable_clock(dsi);
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index b8132bf8e36f..0c5a905f3de7 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -17,8 +17,9 @@ struct samsung_dsim;
 
 #define DSIM_STATE_ENABLED		BIT(0)
 #define DSIM_STATE_INITIALIZED		BIT(1)
-#define DSIM_STATE_CMD_LPM		BIT(2)
-#define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
+#define DSIM_STATE_REINITIALIZED	BIT(2)
+#define DSIM_STATE_CMD_LPM		BIT(3)
+#define DSIM_STATE_VIDOUT_AVAILABLE	BIT(4)
 
 enum samsung_dsim_type {
 	SAMSUNG_DSIM_TYPE_EXYNOS3250,
-- 
2.25.1

