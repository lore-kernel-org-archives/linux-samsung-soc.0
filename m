Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81E4ECAAD5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiH2SlF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiH2SlD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:41:03 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0952B7F0B4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:03 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 145so8689462pfw.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=P8VFeEM/BFJI467dCNlhyUmXQlADynuLsgzoWk47wCg=;
        b=EPSFr67+xfTIyGBIh3RYgbAX5fNxJaVR6R4ntWQPcH3goFHbRgOpUTUkozy0PyqKZQ
         tWUTihCpY0hC4P8R/uimrljrbbklIXgyvl9PBBh+xn73amdL/ko7cBn8seP9Xdh4fzFO
         CN0iAuNlqPllYtuV4HfqBaBP7P2pxnhBzqWQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=P8VFeEM/BFJI467dCNlhyUmXQlADynuLsgzoWk47wCg=;
        b=E4brd/aUXnfVfrnSA+3Guxmu9jPlZSvl3sIyj+vZDu4xvD9N8Q5rCL0x936b6yFAkp
         S+NdGjWrOmyvumrGYKXWRgVAvFysYON02MeJt0P4VmHAOa4gkLAH7f1ypgdccQwAMLUm
         /fMGpW7uHbZGyM6Af7d1z4rc6GBpVaj4O6gFh8LUonl3FvjCa3cbQpMOgdISL+Rj63zJ
         SwYnki4V1ZG9/WrDjIbKERZX+aGP/4n25nIrTUcyspSABngdXRjOX0dZc5ZbK/QZtzo1
         xaziko+YNacjC+I2SsruCJtL+yd/68e8b8yKLqC4ZnVS+fACln7HLmzX0cZEfp3/IQfB
         chvA==
X-Gm-Message-State: ACgBeo0Ejv6kz+l5HG+wlg5L+ju9n3kLpjm8Y0Bo5foGBqgQPtIs4BkS
        WczFpJW7VWBYNlavDJJ++1u0vw==
X-Google-Smtp-Source: AA6agR6PuGUOWRB54FiVXcq+DeYxGBCJLzqGuDD46zbx+u/8z/espw13ja8BVRylsZBCfn1YgyGaPQ==
X-Received: by 2002:a63:1921:0:b0:42b:6eb3:bce5 with SMTP id z33-20020a631921000000b0042b6eb3bce5mr15304041pgl.231.1661798462536;
        Mon, 29 Aug 2022 11:41:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:41:02 -0700 (PDT)
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
Subject: [PATCH v4 01/12] drm: exynos: dsi: Restore proper bridge chain order
Date:   Tue, 30 Aug 2022 00:10:20 +0530
Message-Id: <20220829184031.1863663-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

v4:
* none

v3:
* new patch

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..e5b1540c4ae4 100644
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
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
-- 
2.25.1

