Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA4DC05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjAZOpc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjAZOpb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:45:31 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E58240D9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:30 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id a18so2023787plm.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+otNyxyXWcvyXtJMZVAopiBO8ADOw+cl3pmhYxy9GFM=;
        b=eXOCY6fEwa1JrUYgLzhqoNqUhakM22BvEl43yn19idNsGR+O6No3F5Bq4A/xaTf4xZ
         745lwgYE0mn6euJXiQ1QuJG6QTobS8z0nE6n8bphXGLpqJ8BW1KWkyysgi/EHGlpp7AA
         hbcdWsoO4+FWpPACsw+mi56ljGfDZqR/dmzzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+otNyxyXWcvyXtJMZVAopiBO8ADOw+cl3pmhYxy9GFM=;
        b=zhMqqYs06u74vZ0yzK7fNuaL50G0Bg5ruFDR7nKiQZo9k4lUq01j/9h/dGW65RcaPW
         8/TEUC+UZx+kL7lZ7y6rzAHS5gmYGAsGA1gYw/OT4+Jx5owmklD0v1IsfKeU52FkEG6o
         IGhi/l4IcggNjes88F7uphRATNSSw84pAc+GAXHAeZgZyOksTWGla3XUIzM8evqBLih3
         A/OwEA9hvqdEDVWQsvfdR4+LXRGwn2oazic/R3I5T5y+AHfrQSidB4aBgZojsOJqA6I2
         yFwCEC8hW7lulkzVSkJ+niXAiZjqTlWfSzIjQQtWzrx21WrmdwIi7LNMcUgmr+DCAF+U
         OTOg==
X-Gm-Message-State: AFqh2koavPexExkq3+pVC8aIPeip/uHztrHCEYu3nq7+XFouCvbCOaYg
        YJ5QHVHpXjZtS+kPbIDzO6sK7A==
X-Google-Smtp-Source: AMrXdXuNdw1GnUQgFqRPC5d02u5dQmcpQR8QFkHUIq13Y/hHY9DQ4R191oCz8HOpqTIIevqOMLTBuA==
X-Received: by 2002:a05:6a20:8b88:b0:b8:aca6:b64f with SMTP id m8-20020a056a208b8800b000b8aca6b64fmr34401167pzh.34.1674744329524;
        Thu, 26 Jan 2023 06:45:29 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:45:28 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v12 04/18] drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
Date:   Thu, 26 Jan 2023 20:14:13 +0530
Message-Id: <20230126144427.607098-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

devm_drm_of_dsi_get_bridge is capable of looking up the downstream
DSI bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_dsi_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12, v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df15501b1075..4a165764121d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1470,18 +1470,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
-	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
-
+	dsi->out_bridge = devm_drm_of_dsi_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
@@ -1531,8 +1522,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	dsi->out_bridge = NULL;
-
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-- 
2.25.1

