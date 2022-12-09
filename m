Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF820C04FDE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiLIP1j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiLIP1V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:27:21 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAD58B38C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:27:19 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso5298926pjh.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwbU4HbazHtFryGlvubFfUrK1mgrKcuqi1e+gJ7LS7g=;
        b=ckqoKKbezKZk83zXcRQfiBvuby6RvzG9fhQvFweJ01TM0SsQ1k0MW6KJIWNICOWbz3
         u+do6PHSKy3ob4Nirg0DOjbfLxTx+bcdhvqgRu4WlNY1fnzKI8der9cuWFGga2WazdBg
         Wd9qw7qipidER0G9nidklJwhKNLdQc+mfCvRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwbU4HbazHtFryGlvubFfUrK1mgrKcuqi1e+gJ7LS7g=;
        b=WiALyRhSdoh34SMYkENPzAKc8E87981FapwiKIBwxwjbkK1mdysOnxp0lJhEOuUG13
         QxaxC9Ts7Wp1Nokbshiwi0fUmoV+Nh/B7NgDGEfx3v+9TrwbC25CddA7eaQgLjMbRo9j
         naqGQX+TdnruXSja9dqv1728HTEDXZ7ISIPGHbuYNTvgCVYtJ0xg9RIruSRKoqhpQMl5
         u/WyMmbReMVjHMGN1f3p5OUARFotiaOQKvATLOXvNPZf87UTxxOp/o/tkr3VZdb/qpjm
         H8W7kgglEQ59TEiCAWRjh/RBzSLw6cIekDiw4W7ATlFqBgR/sBpe1XwUKrrF9/PJXYaU
         PiwA==
X-Gm-Message-State: ANoB5plJsbS4L6v8X27iNuLn2CSbcfv21w7TZJzgspljVgmCtgTAtctn
        XZU0xcvzrq6gIFOyB9rOG11fZQ==
X-Google-Smtp-Source: AA0mqf78qn5I9yDPESKk8dAmyKjyOAK+ZO2uuDs81rvrAHV6rkDEscyNrRqFMEe/caZJKtzZ1LS1Pw==
X-Received: by 2002:a17:902:ce08:b0:189:d2e4:9829 with SMTP id k8-20020a170902ce0800b00189d2e49829mr10001128plg.15.1670599639006;
        Fri, 09 Dec 2022 07:27:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:27:18 -0800 (PST)
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
Subject: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for first DSI transfer
Date:   Fri,  9 Dec 2022 20:53:35 +0530
Message-Id: <20221209152343.180139-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The existing drm panels and bridges in Exynos required host
initialization during the first DSI command transfer even though
the initialization was done before.

This host reinitialization is handled via DSIM_STATE_REINITIALIZED
flag and triggers from host transfer.

Do this exclusively for Exynos.

Initial logic is derived from Marek Szyprowski changes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes from v9:
- derived from v8
- added comments

 drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
 include/drm/bridge/samsung-dsim.h     |  5 +++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2e15d753fdd0..ec3ab679afd9 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1254,6 +1254,19 @@ static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	/*
+	 * FIXME:
+	 * The existing drm panels and bridges in Exynos required host
+	 * initialization during the first DSI command transfer even though
+	 * the initialization was done before.
+	 *
+	 * This host reinitialization is handled via DSIM_STATE_REINITIALIZED
+	 * flag and triggers from host transfer. Do this exclusively for Exynos.
+	 */
+	if ((dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) &&
+	    dsi->state & DSIM_STATE_REINITIALIZED)
+		return 0;
+
 	if (dsi->state & flag)
 		return 0;
 
@@ -1467,7 +1480,7 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+	ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
 	if (ret)
 		return ret;
 
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

