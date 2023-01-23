Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB5FC38142
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjAWMYO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjAWMYN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:24:13 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF080902A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:12 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id x24-20020a17090ab01800b00229f43b506fso10083635pjq.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP7Jau0/ejAFJB5Wx1RIrnmlhV/a7KNNElWN91vRccI=;
        b=FF4S3dKsgra2tkuAhNkCNGGEcAAs3n/RL1vJY4p1Q1UEcoybUoKN94vWWxrwOR2g7k
         3lDbQ79uvVGGpKgaZgy/ayeHRH5aRzItqTaA6RGK9CPZMIrHWMKaDqG3Iuarw5egLfvN
         d5r9e97BzqztE87iPONYoegr7e+QqF+KXliZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP7Jau0/ejAFJB5Wx1RIrnmlhV/a7KNNElWN91vRccI=;
        b=8GCzeqwDPy0umleqD9NuCZ4OoyK2QvDyEV3EhaYQeEPpefTMkRreE8qpkXhyQnzodA
         VVUftzpii9LYZ4LQCV5A+GIAMS7i16F1xQfWnFzTm5G7WEKR2toBNzFqQ9qJSoKicO0r
         nkWb9pR5eqssDItP12n1wDM+MJTqLDRWowEgsFWKEhrJx1xInViCWv/M84/fs06wBdO8
         i1P8a8LEwSroEor9e0eH8g2bNYn31jzFRWRZp0BGV6u2N6z71fOMZlN+OVq6dnvG4p8Y
         HqOFbvjqDC3eDBYliCwsXb0rnyJ8n+ARan4Zp20FQ4/K2o0gpOqsLFLb+gjMTt3+iR3k
         NP6w==
X-Gm-Message-State: AFqh2kpG81b4SESts8zknXgdKp9r+MWwsKy3JV1zThjBlnH+E/d/9bru
        CCpd3pMJSz3TYHg1I1OMzjVykA==
X-Google-Smtp-Source: AMrXdXuueVo5X6gxR7qPc2LuaNuA0fktl6al3LAoFF+Diz17x36ywiqFq2drDO/TmgDXNOF8oFxdAw==
X-Received: by 2002:a17:903:234e:b0:194:d67b:491f with SMTP id c14-20020a170903234e00b00194d67b491fmr19321183plh.13.1674476652311;
        Mon, 23 Jan 2023 04:24:12 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:24:11 -0800 (PST)
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
Subject: [PATCH v11 05/18] drm: exynos: dsi: Mark PHY as optional
Date:   Mon, 23 Jan 2023 17:53:06 +0530
Message-Id: <20230123122319.261341-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The same Samsung MIPI DSIM master can also be used in NXP's
i.MX8M Mini/Nano/Plus SoC.

In i.MX8M Mini/Nano/Plus SoC the DSI Phy requires a MIPI DPHY
bit to reset in order to activate the PHY and that can be done
via upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect Frieder RB
Changes for v10:
- add Plus in commit message
- collect Marek RB
Changes for v9, v8, v7, v6, v5, v4, v3, v2:
- none
Changes for v1:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 4a165764121d..5918d31127aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1687,7 +1687,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

