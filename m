Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA260C38142
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbjAWPNJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjAWPNI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:13:08 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F181448F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:13:06 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id dw9so11925757pjb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OP7Jau0/ejAFJB5Wx1RIrnmlhV/a7KNNElWN91vRccI=;
        b=l5+Ef8r4rNFiRhhs0AiJc3Qbr7UUlHM8S5pKNDBWj26bpmEB1JxtEFBaJ55mcH9K1T
         I405/zKKEMWf6rZGt+13ymYRWMhMqOdKM/Wwn03uLEF7S/c1PG7xW4CTSWf87BvDsbtL
         C8ij67LGu87JJTpGP5lTVZQoeo1zZapDPWUL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OP7Jau0/ejAFJB5Wx1RIrnmlhV/a7KNNElWN91vRccI=;
        b=XLfNk5UOEkUwC7b8jFdkKAoK0M1LDFJ5st43HXcNjaBsphwTUCXN53yldDFjq85wbA
         BocbdQocua7EBjIem0YuPFNSwLQr/YVRt/OpNHHehR1+dc0XNa1cB3rpLidhmMEF3C/c
         RUrlbf2Slhf7NhxOXwc6ci/ZEEKELpcvU/I0I8M/yz16VJ8xjqZePBZPj/MMxg6ihXQ/
         jrdTtcIAMXBj1dMCP4IN5h+13E+uS6GxK5k4KWjT01R3R2JhOELNntAOjiLhBIAl2DZS
         f0uG0ryEJx4qX4bNTRawhza5t0yfMBolZr5fqXCGLXPGY2TIqCcqJVL/nVndlY3h8re6
         dtVQ==
X-Gm-Message-State: AFqh2kq0Ward6fKX9jmMNG4o/f0ligTnmBeDw4MVT2mU70NTqhqQQQ3J
        zb0M0zzzMQAeT8SVU4Wjvjx9Lw==
X-Google-Smtp-Source: AMrXdXvWmN8cB1fzCP2Nd8Yh2Gzd9nFYsyRDEG7fEvcNg//ZVqix++YjKwydaa01JguD0qhGcTs2EA==
X-Received: by 2002:a17:902:a408:b0:194:98ef:db00 with SMTP id p8-20020a170902a40800b0019498efdb00mr24530354plq.19.1674486786305;
        Mon, 23 Jan 2023 07:13:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:05 -0800 (PST)
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
Subject: [RESEND PATCH v11 05/18] drm: exynos: dsi: Mark PHY as optional
Date:   Mon, 23 Jan 2023 20:41:59 +0530
Message-Id: <20230123151212.269082-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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

