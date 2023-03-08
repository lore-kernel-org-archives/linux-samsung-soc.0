Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97CCC6FD1E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 16:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjCHQkj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 11:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCHQki (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:40:38 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C390B9E308
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:40:37 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id ce8-20020a17090aff0800b0023a61cff2c6so4131968pjb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 08:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678293637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgeRTDzvWlcFd73t/ENW9C7L9wpwOwUrVmn255HzLjQ=;
        b=lAOGtJmgz7dTiJ7CaN+ENZON61RvjcsM1n2GPM138hv1FUEkzI256t5bzcAyAtN8Hf
         OYOnbGuRb53BpHExelolqeynlpj/ZcYtdEDf0FoCLI9AWsc8EZF7g6VoCnTrWom3KE2J
         58iEKJE5AOR+3GzYPFLtLY5s4Fq9HPKn/kGzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgeRTDzvWlcFd73t/ENW9C7L9wpwOwUrVmn255HzLjQ=;
        b=v2Fl6XZmYROzu4T4WkzzXtRjBsYb24O/aDQHPi23KmlAT0AJAAyFb6MCN67CRfRvVp
         HaIyh1FjdY7rf8OYFHTiIB3TLENmd1oZMYYFz1r94gz4oSvduTjvvdQoA4TFv1hp5XU6
         xac2Pjt/O0PIdglGN0lC9wboRF18uBTO841YRWjUDOWun2Yr70WqTufLEN08161VHVWs
         DwH/sYQcTw9KMtg2Qm5Jdu5MxyT6CeiPCiexeh12mcECJsWhfZPByfeL2UP1e20NnOjU
         f2Ql9jQRj0MFz27lyMBjrobQfJiTx+Zt0GdrFcavGCMhHifW6Q8RRPzA3jr9WVfjg4pt
         mzLA==
X-Gm-Message-State: AO0yUKWfRZ84DhkCj2wN0txvsOHXuUfKDl6gouVdEMCqhnOyH1Cyxyaf
        5QsiZV8193N3dDdOHDc2Iykx2w==
X-Google-Smtp-Source: AK7set+wHGDiDcOW9PS+v7RynzDDWjrZOZuGSJtwXmiYKcLoW2/AF9UWR8m6jmBAls1FKi51w6DGqA==
X-Received: by 2002:a17:903:2446:b0:19e:2c25:d65e with SMTP id l6-20020a170903244600b0019e2c25d65emr23524048pls.42.1678293637260;
        Wed, 08 Mar 2023 08:40:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
        by smtp.gmail.com with ESMTPSA id kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:40:36 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v16 03/16] drm: exynos: dsi: Mark PHY as optional
Date:   Wed,  8 Mar 2023 22:09:40 +0530
Message-Id: <20230308163953.28506-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
Changes for v15, v13, v12:
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
index bb0d2502ea02..1615640e25d6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1732,7 +1732,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

