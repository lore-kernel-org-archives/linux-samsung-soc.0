Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A25C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjAZOpo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjAZOpm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:45:42 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDFF3AB6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:41 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id 5so2020883plo.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaDUbyvaCyU9ZYo1dnwr9WAZI/IyrlPNZL6ZHPBz5Bk=;
        b=ThwyGZGdOeWLAVxgJnCuRyaLP3g/9BmANXXNJCjyZo7NVzwAb9YxdHJ8tDHHb8JYxh
         ULFPoZCOTdW8yfup82Mv9VxQ4oOKpg7y9//LLj2a06uJdyo0M6YMQC4mJ0+qJJVa8fV8
         eNhVsMUiMbYI7TvJxoFwBWrz8FBCH2zkc+SQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaDUbyvaCyU9ZYo1dnwr9WAZI/IyrlPNZL6ZHPBz5Bk=;
        b=RUCWAOe2ySNCbxZXdJty1DEMOAqVTqTKOrb6sRMQrX3uMIiPO1a+MNuff8RwJbt/Sm
         GYL2clads/N6CvWkfn9NIQEB8nRsBRdLuDhAE9ddu6CBdSMEYsOsbtEYOc0ehtdPtY+h
         Qv6CAJp3mHT7XQrJNrTdIcbGqvst+lx/+1rGHgJMW/LJJpsH3/DqJjGoYPFDAH0ZbA4R
         44gaARGLVvFvnkpHcdvNkPyQ3j8+ubWupBqRawyx0wd1LirCH2JAv6KqEbozC094oSWJ
         k8bUPoGj+VNRwzsxNUaD5sdSd30uXpFjS93kNrsEgEaz0ozYfv6hxxFB8fqb4z4u0u6d
         oGlQ==
X-Gm-Message-State: AO0yUKV4HZABmPPKNsux6kSYf7itjeS7SkmCcReQT9ljwTXWE/8PusdL
        RPfV8mbIPsFJKgT14nx+j8ilW3JkmYHUP9y7rUY=
X-Google-Smtp-Source: AK7set8F1v98xH49xiuoWfSvm5Xn6Ukd+Rk/o2nUU+2RLymR+7uEmXIJEIqvwGAIwwqW+WFGQ56yZw==
X-Received: by 2002:a05:6a20:7d83:b0:bb:cf2f:3b09 with SMTP id v3-20020a056a207d8300b000bbcf2f3b09mr8145162pzj.51.1674744340798;
        Thu, 26 Jan 2023 06:45:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:45:40 -0800 (PST)
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
Subject: [PATCH v12 05/18] drm: exynos: dsi: Mark PHY as optional
Date:   Thu, 26 Jan 2023 20:14:14 +0530
Message-Id: <20230126144427.607098-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
Changes for v12:
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

