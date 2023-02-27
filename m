Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883D9C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjB0LlJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjB0LlI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:41:08 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B6016337
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:41:07 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id v11so2844636plz.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/pvsdevlqP7CP6iuiZkDWC//vV9mr41wh5OsotB/Yc=;
        b=etdN6B4Mi1P/DeKzAILaVP8jTsuFtEagaBLBWZXFKmFgci1uk/2BkOjo71+OHjyLux
         6/tB/OmEJSOQdqXVDO0SZ/tzRTmqCRKRf7xGtzMdJwEKtAuqGaYAbl+1t3jB/N3YAVy4
         9Z5nidBQCOko9Lij7cN5MqCICk9bikPls0ElA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/pvsdevlqP7CP6iuiZkDWC//vV9mr41wh5OsotB/Yc=;
        b=ozkOQ1vcijiE3Opz8ghnX9kzAq6guRngUBGvd6zwudnUmt7Kpt8nHvqtO7W0OV7z7A
         9FJ2kaAUPCGm8oG33VJAGcKuAYbcgb3w0XN3X7PGBPKMhcb/u6TX1NqqLCJ25aEoRODI
         46596hMXXGYf2cm0Eo8D/SczQ0Qseb9oHBKHYnk7zPBUyDtn5mMRg4S1p+LKvMbK9eXn
         JmNXGJYg8Pgb3duMYU4JzjTMvCsNvzAw0th1BeMTc/BpXp0kYASA5eHOWQJXsIOLE+nn
         eBSr7w5aqgEUUvdb7A/liywqNbQ+H2sXDBiS/M7Vl6Xrs3tBXXG+XhuYNBWUAr4bsa+G
         gYUg==
X-Gm-Message-State: AO0yUKXWQ+hEKpuQm2mxesaD7+c6QkhZbYvYABJ/RL0PUlWcKXsZ32FO
        chy6FyKrlCr+GzFF1z2JovLylQ==
X-Google-Smtp-Source: AK7set+dXkslzu7uYxWeNhKZ7UutDuItz6gSM7qUMRXQhRD4vq4HX9Hf+zEl4I2N9M7MTt3HVM8j8A==
X-Received: by 2002:a17:902:f542:b0:19c:e405:4446 with SMTP id h2-20020a170902f54200b0019ce4054446mr8518208plf.30.1677498066732;
        Mon, 27 Feb 2023 03:41:06 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:41:06 -0800 (PST)
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
Subject: [PATCH v13 13/18] drm: exynos: dsi: Add host helper for te_irq_handler
Date:   Mon, 27 Feb 2023 17:09:20 +0530
Message-Id: <20230227113925.875425-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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
index de8604450fb9..938bbc701d3c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -326,6 +326,7 @@ struct exynos_dsim_host_ops {
 	void (*unregister_host)(struct exynos_dsi *dsim);
 	int (*attach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
+	irqreturn_t (*te_irq_handler)(struct exynos_dsi *dsim);
 };
 
 struct exynos_dsi_enc {
@@ -1334,11 +1335,10 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
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
@@ -1728,6 +1728,17 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
+static irqreturn_t _exynos_dsi_te_irq_handler(struct exynos_dsi *dsim)
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
 static int _exynos_dsi_host_attach(struct exynos_dsi *dsim,
 				   struct mipi_dsi_device *device)
 {
@@ -2042,6 +2053,7 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.unregister_host = exynos_dsi_unregister_host,
 	.attach = _exynos_dsi_host_attach,
 	.detach = _exynos_dsi_host_detach,
+	.te_irq_handler = _exynos_dsi_te_irq_handler,
 };
 
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
-- 
2.25.1

