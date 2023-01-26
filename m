Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAD1C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjAZOqd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjAZOqd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:46:33 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E4B3AB6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:46:32 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso1894234pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4Zt0Fx4HYrC+EA7BQu40bK0DS9Q1S4wdUAYAMr7AkA=;
        b=nnNSrk9XqUihNoOrwl2DdVzuRJWqTChqyGbY5xa2qBcsl5d50b8RWOz3tniUMgO/Cb
         VjCZg2G8yiCR8ZnRs1tKHJQ8ESx7kqhueMA8hty2BukeYVRYG/GGJaRAua8O9p0nEQyQ
         91BWjpLUkhVs9XdkS0CZkpZyF87+za9rYUFbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4Zt0Fx4HYrC+EA7BQu40bK0DS9Q1S4wdUAYAMr7AkA=;
        b=sXPdAqp8E3V8iHiDxfkLSJDiz3kS8i6WDp7hKY6Vgdo0N7euF9Wd+8fyrki7S3EA/d
         xcwArEBwnOvr/UTmlflzWooJRAHWoYzcxBVaEeAgM5STxF6eObgRq5WjYwhbnSsNZfa+
         lGrvuUHTNOU46Gq6jPAIsTzIlyxSo6w8yPGO/GDwikWKdeMf+XlTE4HjqyDf9sXERipt
         qZAu2+z5lq/mhDqygXC3KtwlMjyoiS/Ub+hEHoQo8ABTPUb0Y1PXLNZY/onmW1kKKOcR
         2+GBH6PjqkJOEHAVF4/hg3XKv72bfCO8lP2m9aWZE6n2wsq7XphYsotUMS4PHae15Ljv
         cqzw==
X-Gm-Message-State: AO0yUKXMFrb7/it2BuptFN2AbZohAssAxhxFqMp7CGa+vgsmOvCwUSPL
        +iLM3N9zo94D5ne2dNMxhZHDZA==
X-Google-Smtp-Source: AK7set9JVEd32JABr+ccMpKxRzgjywtwItuQOmzFSzKKuKt0J618iQ09CnYCm2akYidtK6cJVxOn/w==
X-Received: by 2002:a05:6a20:ce49:b0:bb:9aee:f6d3 with SMTP id id9-20020a056a20ce4900b000bb9aeef6d3mr10489096pzb.46.1674744391517;
        Thu, 26 Jan 2023 06:46:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:46:30 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v12 09/18] drm: exynos: dsi: Add atomic check
Date:   Thu, 26 Jan 2023 20:14:18 +0530
Message-Id: <20230126144427.607098-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Look like an explicit fixing up of mode_flags is required for DSIM IP
present in i.MX8M Mini/Nano SoCs.

At least the LCDIF + DSIM needs active low sync polarities in order
to correlate the correct sync flags of the surrounding components in
the chain to make sure the whole pipeline can work properly.

On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
Rev. 3, 11/2020 says.
"13.6.3.5.2 RGB interface
 Vsync, Hsync, and VDEN are active high signals."

i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
3.6.3.5.2 RGB interface
i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
13.6.2.7.2 RGB interface
both claim "Vsync, Hsync, and VDEN are active high signals.", the
LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.

No clear evidence about whether it can be documentation issues or
something, so added proper comments on the code.

Comments are suggested by Marek Vasut.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
- fix commit message
Changes for v10, v9:
- none
Changes for v8:
- update the comments about sync signals polarities
- added clear commit message by including i.MX8M Nano details
Changes for v7:
- fix the hw_type checking logic
Changes for v6:
- none
Changes for v5:
- rebase based new bridge changes [mszyprow]
- remove DSIM_QUIRK_FIXUP_SYNC_POL
- add hw_type check for sync polarities change.
Changes for v4:
- none
Changes for v3:
- add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup
Changes for v2:
- none
Changes for v1:
- fix mode flags in atomic_check instead of mode_fixup

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d4a976d86f08..d8958838ab7b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -263,6 +263,7 @@ enum exynos_dsi_type {
 	DSIM_TYPE_EXYNOS5410,
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
+	DSIM_TYPE_IMX8MM,
 	DSIM_TYPE_COUNT,
 };
 
@@ -1465,6 +1466,32 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int exynos_dsi_atomic_check(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	/*
+	 * The i.MX8M Mini/Nano glue logic between LCDIF and DSIM
+	 * inverts HS/VS/DE sync signals polarity, therefore, while
+	 * i.MX 8M Mini Applications Processor Reference Manual Rev. 3, 11/2020
+	 * 13.6.3.5.2 RGB interface
+	 * i.MX 8M Nano Applications Processor Reference Manual Rev. 2, 07/2022
+	 * 13.6.2.7.2 RGB interface
+	 * both claim "Vsync, Hsync, and VDEN are active high signals.", the
+	 * LCDIF must generate inverted HS/VS/DE signals, i.e. active LOW.
+	 */
+	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM) {
+		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	}
+
+	return 0;
+}
+
 static void exynos_dsi_mode_set(struct drm_bridge *bridge,
 				const struct drm_display_mode *mode,
 				const struct drm_display_mode *adjusted_mode)
@@ -1487,6 +1514,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= exynos_dsi_atomic_check,
 	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
 	.atomic_enable			= exynos_dsi_atomic_enable,
 	.atomic_disable			= exynos_dsi_atomic_disable,
-- 
2.25.1

