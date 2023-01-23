Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB8BC05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbjAWPMz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjAWPMy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:12:54 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84FB26847
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:12:52 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9so11661676pll.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
        b=WsEQ7ZNakSFaD5MB9QRH0KYZFsxDgwkq4W5DXKR/9AIxLCpBZFeLKSeWwsEoHGm/y2
         XuOrl3dzkQ6uOz7PXUlOpHwWcnNHrl+2C4ZDtD9yQv/aW+gkFg0HS8Rhts7DyvGIdR9c
         YWeKk0ZcBHcZZ5dUY6NKan1SFM5Yozqz0rcxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
        b=IS6ugy6baCReVq0yUSDgPkMlw32XdDmwkbrVSix3RYbvTrgQELojPvdRpdUKFTcssa
         sHygu0i+8ZZpVxdyC9ZtCpshUw67jhLVeOAuqGqifr+DSZoTmoPFRf1/nbIJo7lZ6dPj
         aup0af3vnGQ7UV1ocmy3fC7o/Dec/cQPNd1EHUPmbAnsISbNICcxkllGMQL4lp++NhU5
         rU0aWwYlNnaZo/7v/GJJjNT67Jd2mauFPrrdCRkjlaD80GS/I6I07eySkn5JHpyYJ718
         TWXKZK4fWBakXp1o1flTSY9d31kKfWtetkruUgd7V9dvqQb4EDpYubYjlw3Me9Bs3GW9
         wRBg==
X-Gm-Message-State: AFqh2kr/pfNcKI0kZFmrgJgrbbwJxUVa/5vQr1gRsdth6uhczYxaeBHD
        G3gCZa6OeLlMCzKSSgfUc83zRQ==
X-Google-Smtp-Source: AMrXdXvv5cKZFNGFAXX2Dm8h736TYNMomsAC0I//jhFBp+bIOWUSlW4B2TyNTwZhcxMF+G7mH/yQLw==
X-Received: by 2002:a17:902:8f82:b0:194:5116:c3e1 with SMTP id z2-20020a1709028f8200b001945116c3e1mr23105664plo.24.1674486772176;
        Mon, 23 Jan 2023 07:12:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:12:51 -0800 (PST)
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
Subject: [RESEND PATCH v11 03/18] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Mon, 23 Jan 2023 20:41:57 +0530
Message-Id: <20230123151212.269082-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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
Changes for v11:
- none
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

