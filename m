Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAC6C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 12:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238258AbiLNM7y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 07:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238416AbiLNM7w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 07:59:52 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2234710FCB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:52 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id s7so3245819plk.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRA4g7zBULv9cktOq5gSiTnCBz1g3lpTo4+Og/fOWPw=;
        b=IJWEwMARelm/XIjJ5+SeCaVajYe4gPQ+R5qn3Ltc2FduFfJW8DzC69q/Q3IpY5s1vJ
         xe78nrVROxtHc6uQwZHKp5XkyaJyuIxXqZ8d9g49wju4JkLNaFD23gS2TQF0wARUc+/h
         RNh72kVsDRc5kJ2yGHYmnXliUkf0pzwGySfJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRA4g7zBULv9cktOq5gSiTnCBz1g3lpTo4+Og/fOWPw=;
        b=UPmndvbVw5IchJT2QhT5LIPhGgF9p8Y0Pes9SDndPgClzxQXY2jE/WQntM4gWNFFDn
         3F6csChQ0u84R+VwKS18jCDVAoNg87dxJEM70kKhUlrJpdrbckdgGyB7aV7ZFSdaS04S
         2Bfsw6llmpCPSGx9YAZtoH5cEgiy1mdst+6D4f/a4KkgW+jsUi050BAaIKRa+0m3CXr/
         pKOFfCFTt3CrcoOTpsPYcDlLJijxnSpGxuwW8kpxuJ9Q6OQKMRZJd3jPcFpxiF2IblAr
         cy4+N7X7Nfvbgr/hskoVPXTHX2kFpcsdqdjW0hJ0eNaVZEWwRSnPkLr3rbqM4U3WAQ7W
         1ODg==
X-Gm-Message-State: ANoB5plrZXUC4rsLougV/+QeQS9yRNnftZIHgs7mFV6KQsdiFRArZc3z
        zUNpFAaCUpKtAsIxLcJOHkySEQ==
X-Google-Smtp-Source: AA0mqf5TP5GojEziXe46EJ41N9ynT+W157bgrsgiSgIN8wBFPPtT5IP1yuKAcrdnjMQNKK/h5hZ/4Q==
X-Received: by 2002:a17:903:2412:b0:188:f47f:ac06 with SMTP id e18-20020a170903241200b00188f47fac06mr22560240plo.19.1671022791593;
        Wed, 14 Dec 2022 04:59:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.04.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 04:59:51 -0800 (PST)
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
Subject: [PATCH v10 03/18] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Wed, 14 Dec 2022 18:28:52 +0530
Message-Id: <20221214125907.376148-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..df15501b1075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->out_bridge->funcs->detach)
-		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
-- 
2.25.1

