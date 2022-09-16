Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40C7ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Sep 2022 18:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiIPSS2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIPSS1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:18:27 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEF4B6D27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:26 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ge9so10308592pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=evpdRiLLPj8Lu/GCT1crgCmnHzo/7eQnkgWkH42QQ/k=;
        b=W1QEp6HF06COuxtcDMZcOJJyNxZHua+I7KuRB2xlQCsegc3plvtw/N5BobrQviA9U9
         NHfyTT6LvM/CEOOkFDNGDUr5rh7HX17h511Y6brIhx4dLSc9QEAgw+vd/BJq623harcg
         ucRXUwwyh/EgduyrqYlShxfPodb30TiQ4GWcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=evpdRiLLPj8Lu/GCT1crgCmnHzo/7eQnkgWkH42QQ/k=;
        b=eWaThu5yKtVxXLwZgStz+JW7k8wor2q89JFv/yUF5E2eER9uTmsGA1svQrGfcXKZgs
         ke6yBCmvfEv25snXl89ZRpiJcy9hjKkwRLVbpBwBrR2ODGQ6PZdzrIk9m8kM9xPlsxEI
         lT7nhUF3TbwO2bcJ6HZ42B9UWJ7Tas/wsgSlrlmO48pzHrRlnp0pDvIqsSj+5DMiOhm6
         bfz1H5YbVVB3qtKIaRu37fOmIscTreqIP0X2drrB5RD6SINW9VIGtw770zkh6whSSmWN
         wcCyporBXgqOEj1cyJWR+wbV4KFkAUwGZU9uSmKwB985TXqR4HFEKrqTWAEX7kuW8lRk
         DPlA==
X-Gm-Message-State: ACrzQf32MBvPYAU76zviYqRB0XJIjPA1ndwuGv8WTeoEbp3ktjFj2lHI
        lWj3O914DPxGDaVLq+DZG+CZzw==
X-Google-Smtp-Source: AMsMyM5tFBRMMV05KMLG/vmyPgQXqqS/Zii1t+5qNtGrc9v8RI7ilVaypvhioFuAGkauxAM+3y9SZg==
X-Received: by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id m10-20020a170902db0a00b001782636b6demr1104299plx.58.1663352306312;
        Fri, 16 Sep 2022 11:18:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:18:25 -0700 (PDT)
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
Subject: [PATCH v5 01/11] drm: exynos: dsi: Restore proper bridge chain order
Date:   Fri, 16 Sep 2022 23:47:21 +0530
Message-Id: <20220916181731.89764-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

v5:
* exclude the NULL replacement in exynos_dsi_host_attach

v4:
* none

v3:
* new patch

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..f4e3d2518ad0 100644
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
-- 
2.25.1

