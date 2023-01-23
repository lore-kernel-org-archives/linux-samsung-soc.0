Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5960C05027
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 12:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjAWMYA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 07:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjAWMX7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 07:23:59 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73037ED5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:23:58 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k18so11202243pll.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
        b=U7Z/TTCIXdU1Sg8aWRDeI4EW9B6BDnjXjN/NsswcIDm1lLUWgrtpk9bwW/f9cS9Ity
         ct+GTV+8hivlaXqKBcSQbm9BosO0N+UM8D8jgUbj3w1QFRVU5MDnTB8daGcCnbnkj3hU
         dsPXO4rxOnxnMomq7IDeyg9YZoFPijgQEEUCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
        b=2ST9hiyjTqGzvhi5tei57TQHf2/x/1yssoSxJgAqUR9F12rjmjG/onyfEJQJ/N1t1o
         4OmDWVJLZUKRyun7qAJY+dM9quUVPgvfhIQcl8cqi7kPsUKuZpJFqxaDF6j3wugpHTyh
         s42Tm7gjVH9pe7+kKUnvCQ0C06M41wOj3AgQQiQPu9Owx88o/zXUE3JY56yJ05fw3+x2
         k+OFsyseLQRHAf07BCYTabmIdRIIdV6b9FtlrbQd48aYP+yx73/M5MmJapI87UcVvmbi
         yxE0OpwgSqN3vTFVPNp/oAGpLAw3ahJgfY5IYlHGw9c7vzoShk2sS0BRhcIH7EKwo6Tt
         /eug==
X-Gm-Message-State: AFqh2kqYk3xtbmDRly5EqpxJVuPgtI2ElM9zheqxqwnogTYrzt6gtHyk
        TlYRBINOGU0HuMvnTyMzHCdC/A==
X-Google-Smtp-Source: AMrXdXs2nxMlWnkjtQRTXuSpY/fBRpS/WCIrtfmXgMoW57GTUxJRy4ekcMfUhkF4pBa6T+sZfe97Fg==
X-Received: by 2002:a17:902:7889:b0:189:5ef4:6ae9 with SMTP id q9-20020a170902788900b001895ef46ae9mr22040224pll.45.1674476638215;
        Mon, 23 Jan 2023 04:23:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:23:57 -0800 (PST)
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
Subject: [PATCH v11 03/18] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Mon, 23 Jan 2023 17:53:04 +0530
Message-Id: <20230123122319.261341-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

