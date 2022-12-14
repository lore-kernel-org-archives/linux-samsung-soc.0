Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B85C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbiLNNBb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238520AbiLNNAt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:00:49 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DDC60C7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:44 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id t2so3262767ply.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aE+Kf4GZG5cBJgW4Glr+nCZ/Jxj375yDCGwPDOZtAag=;
        b=QYfGH67RCNP4ggltQXFylrBgZVcAg9cRrbZdN1vWHTdLaGFcPMLRvVSRKMRVxOE35t
         XRXDZK4tFshArITirZrpNslKMeBf09ZzOVPlT38d32Ij9Z9uW4vD/ACxkr9zUqMIn2oZ
         +aNzZN0m46RtLWUI5b8zf/kLB5E+3kRLLYr4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aE+Kf4GZG5cBJgW4Glr+nCZ/Jxj375yDCGwPDOZtAag=;
        b=ey1x7eU30/Z/uy7Guo0YfgUMEX6cnanNiFvmIkguBIA2z2TW+fmpot+Gknsrflcouk
         THGAXeHafMj905MH/eJ4k/t0+WZa+m1l75pRxhycDeCS+sHwqUCKDV4ikRZrFmrZDq+O
         3EC8/ndFgT8fgTXUUk4G8S4uwp4BBFzu8ENAzjQLw7Z4NimmqLhUksXtqkvj/9ROobSA
         0WRK/O8H5PmUFzVn4I9De2EKKhDGqxAyUq++W7pzkXviw07lY44EANw99tvnKB0xQEII
         ERTx9d3cUJF4M/MAkhcgLiyYemHlu1gUJaqWuz3KusX3ykTjF2Ha/2OGg7sgAZQhfLeF
         tkFg==
X-Gm-Message-State: ANoB5pkCjYvnwqPWZ2ks+Ph2DjCmB+NCUycV3ZlS1eNJocLheqsXYPcZ
        Qw6RoQaMP41OnblbzigFlzd9tA==
X-Google-Smtp-Source: AA0mqf7JNLSv0OByMIEhJW/YCj/gWjdNa7I85fBn049iQTXla5BLMm2+FnSQqWbyAvRAcdmsBL0Dzw==
X-Received: by 2002:a17:902:7d93:b0:189:666a:8d78 with SMTP id a19-20020a1709027d9300b00189666a8d78mr23375559plm.4.1671022843876;
        Wed, 14 Dec 2022 05:00:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:00:43 -0800 (PST)
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
Subject: [PATCH v10 10/18] drm: exynos: dsi: Add input_bus_flags
Date:   Wed, 14 Dec 2022 18:28:59 +0530
Message-Id: <20221214125907.376148-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
active low (DE_LOW). This makes the valid data transfer on each
horizontal line.

So, add additional bus flags DE_LOW setting via input_bus_flags
for i.MX8M Mini/Nano platforms.

Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10, v9:
- none
Changes for v8:
- add DE_LOW for i.MX8M Mini/Nano platforms.
Changes for v7, v6:
- none
Changes for v5:
- rebased based on updated bridge changes
Changes for v4 - v1:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 12a40576f937..36820a7b5884 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1692,6 +1692,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1778,6 +1782,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->bridge.pre_enable_prev_first = true;
 
+	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
+	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &dsim_bridge_timings_de_low;
+
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
-- 
2.25.1

