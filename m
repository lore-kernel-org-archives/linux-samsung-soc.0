Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ED3C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbjCCOxj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjCCOxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:53:14 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB8414EA1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:53:13 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id n6so2909575plf.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ7rcemt848q2zQcT+lSKMTmWxXIUz+vskppcEdmPWE=;
        b=MECwk9YwcW4hH23pMpV9ibT0/I9cpvyQWibnA+4yOERhp24mOst0xorAsLQePkxzNH
         9Owr8gVgkd/Su95DEzZpfEfhmZ+u8hxsiH8tR7guGt3xsfCOHBPy8R5zBId3gPmSPAdS
         c4rKtH3N9pcRitKx9ZVOIUWd95lInZEvruzQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ7rcemt848q2zQcT+lSKMTmWxXIUz+vskppcEdmPWE=;
        b=IwFpwYLPcaEW4oJWFIaMj7UnFqggOzAylKjCUJEG44SLhdjTJmGYUaEh46aYRDf+4x
         oQi0Iay6NTzRWN7RrGi6C1TFtlHRkGqj6i39Pv5NaehizfifA/uJeQF8aKszxfdW03QI
         EPdjQP3vP1CteQvlatiFrW/5iX8xJaHparJE8vbNJv6zYasJPz90CVn3FdTk9OlIWGXt
         9MRoUeztTt7vPht2RHo6VH5NM4BzBPaNZbG8gzURUlTbrhmXYa4YMux+vDki3rPz1Tqd
         MrthuYE1tcMCtv0OimRO9YCAzZ1WTjHW7W/HwY3lSv0tQhrra8GZMLkHAAY1/WiLPwKn
         26Fw==
X-Gm-Message-State: AO0yUKW2O7ysuMmZ0xoHkxbflEyb9yhPfYSVAimw6G0uUbPUCw01Jp2c
        GePLpIRAeTYiQDO1Xwj/2gHQ8A==
X-Google-Smtp-Source: AK7set99ggwcpnKkofUANhGMbdjMO4m7mdjgdXuo4LpOoEXmvDTaX4RwpDrfsgV2A635WiPYyV6g3Q==
X-Received: by 2002:a05:6a20:9386:b0:cc:d762:64a with SMTP id x6-20020a056a20938600b000ccd762064amr3085837pzh.8.1677855192602;
        Fri, 03 Mar 2023 06:53:12 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:53:12 -0800 (PST)
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
Subject: [PATCH v15 11/16] drm: exynos: dsi: Add host helper for te_irq_handler
Date:   Fri,  3 Mar 2023 20:21:33 +0530
Message-Id: <20230303145138.29233-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

IRQ handler for te-gpio seems to be common across DSIM host.

However, Exynos is handling this via CRTC drivers but there is no clear
evidence on how the same has been handled in i.MX8MM. Keeping the handler
as-it-is can be a viable option but adding DSIM bridge core in upcoming
patches is not possible to call Exynos CRTC handler as DSIM bridge has
to be common across DRM bridge core instead of platform specific DRM
drivers like Exynos here.

So, this patch handles the handler via platform host helper, so-that
handling platform specific hook across Exynos and generic can be
reasonable till it makes it generic across all platforms.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15:
- remove leading  underscores in function names
- collect RB from Marek
Changes for v13:
- none
Changes for v12:
- updated patch
- suggested by Marek V
Changes for v11:
- none
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index afe2d293c785..2fc166ebe3c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -325,6 +325,7 @@ struct exynos_dsim_host_ops {
 	void (*unregister_host)(struct exynos_dsi *dsim);
 	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+	irqreturn_t (*te_irq_handler)(struct exynos_dsi *dsim);
 };
 
 struct exynos_dsi_enc {
@@ -1333,11 +1334,10 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 {
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
-	struct exynos_dsi_enc *dsi_enc = dsi->priv;
-	struct drm_encoder *encoder = &dsi_enc->encoder;
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
 
-	if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
-		exynos_drm_crtc_te_handler(encoder->crtc);
+	if (pdata->host_ops && pdata->host_ops->te_irq_handler)
+		return pdata->host_ops->te_irq_handler(dsi);
 
 	return IRQ_HANDLED;
 }
@@ -1761,6 +1761,17 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static irqreturn_t exynos_dsim_te_irq_handler(struct exynos_dsi *dsim)
+{
+	struct exynos_dsi_enc *dsi_enc = dsim->priv;
+	struct drm_encoder *encoder = &dsi_enc->encoder;
+
+	if (dsim->state & DSIM_STATE_VIDOUT_AVAILABLE)
+		exynos_drm_crtc_te_handler(encoder->crtc);
+
+	return IRQ_HANDLED;
+}
+
 static int exynos_dsim_host_attach(struct exynos_dsi *dsim,
 				   struct mipi_dsi_device *device)
 {
@@ -2075,6 +2086,7 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.unregister_host = exynos_dsi_unregister_host,
 	.attach = exynos_dsim_host_attach,
 	.detach = exynos_dsim_host_detach,
+	.te_irq_handler = exynos_dsim_te_irq_handler,
 };
 
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
-- 
2.25.1

