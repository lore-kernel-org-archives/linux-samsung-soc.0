Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4D3C742A7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 16:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCHQlf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 11:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCHQlc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:41:32 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21777B8F06
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:41:21 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id y2so17034874pjg.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678293680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxcRYcAFiM6jXzQsrD3xe+grt23Ypaeq7iGojFVEogQ=;
        b=o3ke2KJZLo9FWPmVnVJcARNHl08omCRy7G9R33cWETHx47rF/rKDdJc/TyE4toLpJY
         yOmFyCdCJOxqWl6lbQMJhuusK7NjtoO2VFnIq79vQdJ9Gzd5rerXAXqTA0GfkDaJRlVF
         Fr3Gfib3nEqDx1LEJpGLhKOKHihq2iyilJGX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxcRYcAFiM6jXzQsrD3xe+grt23Ypaeq7iGojFVEogQ=;
        b=mz+OJNc3qohoWbB3K4OeikXsymZTbNPKmUxsLYdcjeHPXn9mqkkFMG+nL1Y6P8HtbB
         BvqZkzc5nq7YF7UCYE27s3fQErAf/EHQJ8LDBiLkPPZiJ9yS84k/EE1hNt5ZVWGKPnUx
         jJnnu5X/pTfCM4xd8meYV+f9b8K+AzNByvEOuZjsuAFd/me8Cx3j19vVt6Xl0LXrBmsn
         /1bzMJRidnN4T90KhmEZUxCKovRKlaV+SJt1tuUgx88oh3k+OSpLBQBJj7DMwLZhXzXv
         lmkFhxy+1GjoPZR1/n94EdxTMXli8QF31rURJgWIghOc5SrUI6pNq70LrHL+EGyLFfru
         rD/g==
X-Gm-Message-State: AO0yUKWVkPkAK4AII+gTZ2RGR+QHxPBidJdUmqeKWfYfGa0+NsrAGoBn
        cVNHiWHHgFtbo3+/H61HwKILvg==
X-Google-Smtp-Source: AK7set/kZK8z8YOCa0epAXNVZLam+TnbyPFCW814ZrFnCjc96JUn+yIftuNp5sxytrn6X+qrJ0P7ZA==
X-Received: by 2002:a17:902:eb81:b0:19a:b6bf:1df6 with SMTP id q1-20020a170902eb8100b0019ab6bf1df6mr19864921plg.20.1678293680536;
        Wed, 08 Mar 2023 08:41:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
        by smtp.gmail.com with ESMTPSA id kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:41:19 -0800 (PST)
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
Subject: [PATCH v16 11/16] drm: exynos: dsi: Add host helper for te_irq_handler
Date:   Wed,  8 Mar 2023 22:09:48 +0530
Message-Id: <20230308163953.28506-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
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
index 01ed1677a4fd..b75b5cc88bc8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -325,6 +325,7 @@ struct exynos_dsim_host_ops {
 	void (*unregister_host)(struct exynos_dsi *dsim);
 	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 	void (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
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
@@ -1771,6 +1771,17 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
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
@@ -2068,6 +2079,7 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.unregister_host = exynos_dsi_unregister_host,
 	.attach = exynos_dsim_host_attach,
 	.detach = exynos_dsim_host_detach,
+	.te_irq_handler = exynos_dsim_te_irq_handler,
 };
 
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
-- 
2.25.1

