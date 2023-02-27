Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EB7C64ED8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjB0LkP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjB0LkO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:40:14 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5239F14209
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:40:13 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y11so2228359plg.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIgviWBqKUtGyYA8pNcGlHAIxKkXaoAhqP3nf0sw740=;
        b=rOiJ8pyf9kmHJjVRYdsBFOn86aOpsqmNLaPTTXPNvp/OLocQQiYgOkP3MYLb5ubNtC
         kqRDW1tyqgXGYUoFC31gGKSyHB8WJGsueLh17oUzeuQxZx5t/zuUmT9wF+XnmFVRdPTq
         SOg3NlHis5PfCNdG5YsiPd5j3d+bhWaAF6RdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIgviWBqKUtGyYA8pNcGlHAIxKkXaoAhqP3nf0sw740=;
        b=ABjGimnD9ptxAuAnZ2vqWLuhIotusD/3AH1ISNg1SqNEr8X4rr6etQF7wY1NITUQQD
         qsXyISkeuoCb0qT9CbjXFBR6XJnn/OePTpw3wE+0ADkoUpsIKDnGCRJJoc8oGEf92kF5
         2BIzsfiEAjgQpGTGjy7zCZSvCzwplUi48np179xkLlmzRiLQJXih3ASf8rXATxPTcsqO
         m/Xf95PEcWjvya9EflKcT3IZDIlkfEPvC3CegkNd2jH5kZvtrZjtfWkt66y2XLz9wHP3
         gwnnw7JGtokmeVM8TNOvEq16888YJ+FNSfRiYBALl4Xg1xaGLJP79eDVJi5Bo8mUmzhY
         asnw==
X-Gm-Message-State: AO0yUKWnRaxgekSn7un2B6sYqtd3b0QgyYYFw1q8HW6qBLev1Pue8mLp
        cddBBGrjoMV0hGSXt6bh9dZYdg==
X-Google-Smtp-Source: AK7set8IpvK1WwFCHMF+/wUkuolgkNdF5M5D/xwxylDkjMmreSt7PbWPqSfF/mjoXnRcQURBcC+wCg==
X-Received: by 2002:a17:903:18d:b0:19c:f232:4604 with SMTP id z13-20020a170903018d00b0019cf2324604mr7364687plg.10.1677498012743;
        Mon, 27 Feb 2023 03:40:12 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:40:12 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v13 05/18] drm: exynos: dsi: Mark PHY as optional
Date:   Mon, 27 Feb 2023 17:09:12 +0530
Message-Id: <20230227113925.875425-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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
Changes for v13, v12:
- none
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
index 12a6dd987e8f..529e010291c8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1699,7 +1699,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

