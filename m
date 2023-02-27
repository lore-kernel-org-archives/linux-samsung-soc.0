Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD370C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjB0LkB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjB0LkA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:40:00 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF90F11674
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:39:59 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id x34so5847378pjj.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rsXUA1KC0Yo0ZaAbDx/BQxkAqMf2mzDgWqmsD9i/BI=;
        b=eZ7KZSmMRN5/NNRkc88HUUlo+bZewhD9hLYONuMIxZUQVGbzisbr0iNvz9GPLyiNvP
         bnF+aE3VJvwPjQfQMQUNtRewgzE+amUN0OryL9Z3wdRMN/HZMaZu02LWvPWvBw7+OHRW
         HPvqpX2dYFiOj7I89gta7UFVIRomCtogdPrEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rsXUA1KC0Yo0ZaAbDx/BQxkAqMf2mzDgWqmsD9i/BI=;
        b=RpOM47Nkm6VwVE7y+/MfyQfdb/RyEq7u2ObXWH153aQNm+aM/DAYRKFZD3agRtG54x
         rFoGOPYaSlHLzFnWFgKVs5yQqN2aqX3EK0vWPdg/uiI5lfWXQM3WGm5DNRCxHTSfrJl5
         4BL5pNPnanGG64EtmUGqxgazFz5+UnuXFzytLlG0kcJNEqgjmomNnbGaB80WsUvTDQO+
         BFKBVzwJPneNm2BJofYgx1vsPIc0KNHkRDdpViUXLmNWhm+tX4aHMcykImTLVjXohZ4q
         rcwrGgkBosa+HTX6wfPMrhhK2G/qf4Paw7ePdWEskEyOYVKmu5hpBF2nga33ewWZHsoH
         XmIA==
X-Gm-Message-State: AO0yUKVT6bAJmGBqLC3eFyvTqmlWHV4N8LKg5qCHLhU8pv41KCdsOkrs
        FOOYl8MtLJqLSgrWDgbD55XCJQ==
X-Google-Smtp-Source: AK7set9liMsOr27MdRyeWehoz6qo7iJGYnzUHNMJqJYFfXfb/J46WFubYCRG6IV8hhlwMeKNw2KcnA==
X-Received: by 2002:a17:902:d2c6:b0:19d:1dfe:eac8 with SMTP id n6-20020a170902d2c600b0019d1dfeeac8mr1802046plc.26.1677497999350;
        Mon, 27 Feb 2023 03:39:59 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:39:58 -0800 (PST)
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
Subject: [PATCH v13 03/18] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Mon, 27 Feb 2023 17:09:10 +0530
Message-Id: <20230227113925.875425-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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
Changes for v13, v12, v11:
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

