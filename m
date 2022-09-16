Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8CCECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Sep 2022 18:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiIPSTB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIPSTB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:19:01 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA68B6D77
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:58 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id v4so21055142pgi.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TLVefyfl9f8OxBnZeywVyOFE3VwZP0fby31K9AwiC9o=;
        b=L9VBWsyOi4aAOP1N5cphFgPL5o4+5Mb7jcxx54eANBYJYxaZOj3id90llk/n4mHBXW
         VeMzj8PQ1jDwA5BjPoKKdS+uYu66inHXf7kdzPVostEepOeHmGec4JarxAgq9P+a12xh
         fQldQpr9DSSgNTmBl07lR/fo3RT8qK4aG3xRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TLVefyfl9f8OxBnZeywVyOFE3VwZP0fby31K9AwiC9o=;
        b=gkv4UxFb9Ih3BHFTSWAS8FmpJmJdLFt4db671UUz3WeWVdlL5wGYq96oPniC0HJOYU
         XThM6SeTWdGE83zC5q3aB2f73jcYSF727vj58bOsl4gvg+9sbuusfGH0apfe1BlWkwTe
         hmXhBuZxF1NylIWJ4R2pvtJJ0dSwS4eqTjt72//k3/VjbwNeblno4PsjavD5Zd83kB0f
         32apbTlHj0xhEQKYR4RUYXESZoV+UHJUoNz5ZvYgZay0aK2ZlSHla+yVBal2TG9nOI6j
         +zO52SbqZn87d1jiKum7AFudq/47FgaiG/fCIsa8vB2tACaqsB83Vyyh84Vv1QHL58pF
         aLDw==
X-Gm-Message-State: ACrzQf1tvGkrUNzk55S0I2+C8IfmauoZ02EK//t5YX/NnCUudzF+4Th2
        1jLyXj1Uf/o5HcJHUW5InJNjHA==
X-Google-Smtp-Source: AMsMyM7z03vFn453lZ+WiEUW12UgMn9NGi7NPzCBcL+U0HmYiTLPMo39cXo+vgUcEZaYlkEJ+rg0KQ==
X-Received: by 2002:a63:2fc7:0:b0:42c:3683:7e50 with SMTP id v190-20020a632fc7000000b0042c36837e50mr5781542pgv.534.1663352337125;
        Fri, 16 Sep 2022 11:18:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:18:56 -0700 (PDT)
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
Subject: [PATCH v5 05/11] drm: bridge: samsung-dsim: Handle proper DSI host initialization
Date:   Fri, 16 Sep 2022 23:47:25 +0530
Message-Id: <20220916181731.89764-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

v5:
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
index eac2dc2f24ba..6d524338d4ff 100644
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
@@ -1442,12 +1453,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
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
@@ -1637,6 +1645,7 @@ static int __maybe_unused samsung_dsim_suspend(struct device *dev)
 
 	if (dsi->state & DSIM_STATE_INITIALIZED) {
 		dsi->state &= ~DSIM_STATE_INITIALIZED;
+		dsi->state &= ~DSIM_STATE_REINITIALIZED;
 
 		samsung_dsim_disable_clock(dsi);
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 478f0291fb94..57b27d75369e 100644
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

