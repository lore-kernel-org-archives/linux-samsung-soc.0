Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7EFC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiKJSkV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:40:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiKJSkU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:40:20 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8767205C8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:40:19 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id l6so2400672pjj.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI9nmADqBaRgKnAq2H3CdzUb+UwaNTPrY74SU7vfqFU=;
        b=l5FjXvkq5HVxEw3lCJgroZtqhB1QttJlrhOzmXeT/IxiGyPlLC39mt9z9oNuGaiadp
         4/C+ZSkY0zfO1f28o0iw532Wuo9/yD7p3dc64GqEvAikYDVfp/BbSHcAJp/Bhb9dwFeU
         Wdp3VyN025uy42XNOVGHSixIVwwRI4ne1eqLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pI9nmADqBaRgKnAq2H3CdzUb+UwaNTPrY74SU7vfqFU=;
        b=E9HoY9UF/owQyVUApV88LgvGAycqZKFvuk8O14k3Qgic0ZM7y+KMW0h5jfqe3XBIpu
         KtIk6UZLsEERQ/1c4l+YMvXpUxfqn4xiKIAnvUMB3Pk789gG8EwEbdczjWgjIHxtyNDc
         pUi5j2B16H9dJJCkTmVUH1u/sMVb5zfeeeFftVfmuskcnGWSyA6Cj2fX1HpVLOEaXW1t
         /Jo8AYO9rI6zq5AT8JshILYFg4bZeApG/pTzyFlDpegv7Fg6WmxXZqsNu1152oS6J6yN
         rIGcsE5+RRnkSUj3MBr3pSxS8+KndxXLg00tfLY33IgJAWJXUnWOxlYp/r174+VUbfBI
         AoJw==
X-Gm-Message-State: ACrzQf3HA2/Eb9rkvWmuVzm68PVj6OBSEUpy7rXtFeQESEnhvROXanv/
        SGTWqmbbgIUdlo6wu22Ck1fBhw==
X-Google-Smtp-Source: AMsMyM5V3qpfdSSL+gEipc7vxlrSx04nNJNWcE7lsFbj5SuuWkLW12e3zhb0YHmc04dOOSTWCiyQtQ==
X-Received: by 2002:a17:90a:d814:b0:20a:b98f:b839 with SMTP id a20-20020a17090ad81400b0020ab98fb839mr1674598pjv.23.1668105619201;
        Thu, 10 Nov 2022 10:40:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:40:18 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Date:   Fri, 11 Nov 2022 00:08:40 +0530
Message-Id: <20221110183853.3678209-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
0 = Enable and 1 = Disable.

The logic for checking these mode flags was correct before
the MIPI_DSI*_NO_* mode flag conversion.

Fix the MIPI_DSI*_NO_* mode flags handling.

Fixes: 0f3b68b66a6d ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
features")
Cc: Nicolas Boichat <drinkcat@chromium.org>
Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..b5305b145ddb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
 			reg |= DSIM_HSE_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
 			reg |= DSIM_HFP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
 			reg |= DSIM_HBP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
 			reg |= DSIM_HSA_MODE;
 	}
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		reg |= DSIM_EOT_DISABLE;
 
 	switch (dsi->format) {
-- 
2.25.1

