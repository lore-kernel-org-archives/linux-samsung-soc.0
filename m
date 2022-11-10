Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841A2C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiKJSkd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiKJSkd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:40:33 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE0BB19C0B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:40:31 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id l2so2169455pld.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWQPw8kMGq61u2i3C2KyyYluiC9el7Rd/PLrQ+mO7W0=;
        b=goQ7p8zPMXgAfhGlVCGrkGciAvJvmErOHid9LNIxI1xYET7qKUmr9Bywo1rflRousl
         odZTkXfJVZ6eW4sC9UlxmmjbB018tUSujGgQOqVZVtFlext72knTU56pDrw3FxYreB1R
         LqJH4YejnEge4CFgaubqgxeWpPhqGKmYIqJxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWQPw8kMGq61u2i3C2KyyYluiC9el7Rd/PLrQ+mO7W0=;
        b=uzBf4Bv5NYZWVdXiDvely1ftKI7R6otDuelom6lEFakGHSBa7zSPtIeRi0MXSPxnny
         gzBRVuztmnEUWmBcVhPn64Pqe8vrVAj4ubtRQwEdk/98aV3IuK/3FgKiXE57Gv9QRhIZ
         QTJcQcBtR0s43kWWjiOBKpLmaHSUQJFVeKkz18455eixKeHjJ/i/4tGyJ/QPsPQNH6tn
         cn6lBKN4gr9vE6/3vFZoeNyu9VnAhnWlwnpasgv9ojwZHba52JDfYHRqKE4sZgSm5GIt
         KN59KDmTZa55CePdqmxyQOwl6r1bQC2E09EKxCRQHgzLr0CI3u3li+D/QNpdQDizfMMy
         JPZg==
X-Gm-Message-State: ANoB5pmccz0/ufF+uQas/6flr3H9Mr4dX5vWCISQwH3wy85OQE8hnP+B
        Df5KAbts3w/br0m9pz+l8NyjPQ==
X-Google-Smtp-Source: AA0mqf5tMAPa5oKIRBRnWVvCjzLXh/u5bEn5mb8qPkVZv230xJzCgmMNSwOxtAdxATEyBohMaemNbA==
X-Received: by 2002:a17:902:c3d1:b0:188:758f:f473 with SMTP id j17-20020a170902c3d100b00188758ff473mr25672647plj.113.1668105631202;
        Thu, 10 Nov 2022 10:40:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:40:29 -0800 (PST)
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
Subject: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
Date:   Fri, 11 Nov 2022 00:08:41 +0530
Message-Id: <20221110183853.3678209-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
conversion as 'disable mode bit' due to its bit definition,
0 = Enable and 1 = Disable.

Fix the naming convention of the mode bits.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b5305b145ddb..fce7f0a7e4ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -75,10 +75,10 @@
 #define DSIM_MAIN_PIX_FORMAT_RGB565	(0x4 << 12)
 #define DSIM_SUB_VC			(((x) & 0x3) << 16)
 #define DSIM_MAIN_VC			(((x) & 0x3) << 18)
-#define DSIM_HSA_MODE			(1 << 20)
-#define DSIM_HBP_MODE			(1 << 21)
-#define DSIM_HFP_MODE			(1 << 22)
-#define DSIM_HSE_MODE			(1 << 23)
+#define DSIM_HSA_DISABLE		(1 << 20)
+#define DSIM_HBP_DISABLE		(1 << 21)
+#define DSIM_HFP_DISABLE		(1 << 22)
+#define DSIM_HSE_DISABLE		(1 << 23)
 #define DSIM_AUTO_MODE			(1 << 24)
 #define DSIM_VIDEO_MODE			(1 << 25)
 #define DSIM_BURST_MODE			(1 << 26)
@@ -804,13 +804,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
-			reg |= DSIM_HSE_MODE;
+			reg |= DSIM_HSE_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
-			reg |= DSIM_HFP_MODE;
+			reg |= DSIM_HFP_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
-			reg |= DSIM_HBP_MODE;
+			reg |= DSIM_HBP_DISABLE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
-			reg |= DSIM_HSA_MODE;
+			reg |= DSIM_HSA_DISABLE;
 	}
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-- 
2.25.1

