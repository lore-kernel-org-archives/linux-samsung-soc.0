Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236FFC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:25:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbiLIPZK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:25:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiLIPZF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:25:05 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7867A8B38C
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:25:04 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id w23so5190935ply.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0bkfE/NcofHpZ784ykKYOCGEROmx5jroWhn+xMWIFY=;
        b=eJ9/BncMiZUP6tyio2c5dxhR4akKO8sbrLzdigRs0sWHSF2tDdt8HHFUTamDhZqS1y
         Se98Nh1glWWeK0/aPQmisXFcUNTIT5gVajJadORR47SozG+o8lKQerc4DDjfQYFYv0zJ
         nwp4DnvtDf3SdjXO8RYhMVPN01NIU24glAQ1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0bkfE/NcofHpZ784ykKYOCGEROmx5jroWhn+xMWIFY=;
        b=pU7YeyxemC+lrS0sVIk/e93T8+ypbQcCO9V5Xoyb5xoPk4IuGhat9IHYG0TCcBR9jj
         34FFbD+YYNIdo+m1yXQodj7Nyp8JyrLc9hlPitXwWnk2sOy6u1xcqKAwxqmnVgezsd+L
         vDQMN63JqLoSZGRamb1LCF/bnU6dJ7Fmi9EmZqCKBzbpNxH3KzltunnCXRuchVuD1BKn
         4an11LUHZe8jDaGIMz7qPbau24FUcmAZbmnv6bunnj9NqItFXBr4ABVnkD3P8h5AKVp8
         XRbEsEMWqh5B4YPYxWZ9a9Y+z9aOymyRK9UZTFjUnbB5zbcY7HpXNE9EiSmYQD7oUh5/
         vQlg==
X-Gm-Message-State: ANoB5pnl+m0w49UBM8YnGQ5CMvFyQ52NbaUPFBwR+R9i9YhrpRfYGcPZ
        y0fsdJvNozdspVnl1QjXpGQhEg==
X-Google-Smtp-Source: AA0mqf7FzJBBotDaa2r+o1ZDMAzGBSGDePLkRq8t9eln0607UPuyfEwdDluW2xioJrmKEHZSLoHHkA==
X-Received: by 2002:a17:902:6bcc:b0:186:d89d:f0c1 with SMTP id m12-20020a1709026bcc00b00186d89df0c1mr5247211plt.42.1670599503903;
        Fri, 09 Dec 2022 07:25:03 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:25:03 -0800 (PST)
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
Subject: [PATCH v9 02/18] drm/bridge: tc358764: Enable pre_enable_prev_first flag
Date:   Fri,  9 Dec 2022 20:53:27 +0530
Message-Id: <20221209152343.180139-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Enable the drm bridge pre_enable_prev_first flag so that the
previous bridge pre_enable should be called first before the
pre_enable for the tc358764 bridge is called.

This makes sure that the previous bridge should be initialized
properly before the tc358764 bridge is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- new patch

 drivers/gpu/drm/bridge/tc358764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 53259c12d777..f85654f1b104 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -369,6 +369,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.25.1

