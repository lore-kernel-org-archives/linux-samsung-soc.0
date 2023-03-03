Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A15C7EE32
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjCCOxH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:53:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjCCOwx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:52:53 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B02A19B6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:52:52 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id u5so2892024plq.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GNP64t5VbWNZ3TjO4FhppfcB2OtIjrbdxbfXm3Vv04=;
        b=Ssp71cr+XwgJrUFhfrxmrK79fPfpOX+quFycGiGRcVqn6TRu1/L7YgxEmDvTnfteEY
         HgJ13eWFZgFRPBXdXPIhRYotLv3KHK77WuVxrHC2+0YV0BQ5bYJsKT8QxGiynAtegoO1
         5/apcoidmTfDzOKa/h3Ubf7Wgl45PArElWMYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GNP64t5VbWNZ3TjO4FhppfcB2OtIjrbdxbfXm3Vv04=;
        b=IRFFUJ1Otg2NU0Ir7bXhawvPzH/qXprMsIQr8YhQI3EVDsg8Ym3Pmy9pL86WrlKA0Y
         fLu50pMhpHfeTSLw+6a3ZglsjCAzjkFd/9thnZjeudZDMJGoF5JDKH48O5W9R27R2ofp
         TXF0z7B8FQnMgRSrPYmg4B6d/jF8vxxHN2yCDsG4rH2xbw1RQCMsdBOknMBsGZ2Pur42
         ZLgcRL+RyZPcvR7XMRKcILT8S20r1IcjyljVp/sxgv7T8xFOOMdHRMMmUTeMZNRKSsz/
         ioXnkSK2Me7Wiok9LNIho+Ou5oYpCxJbdYnUUfXyqujHzEEFVjPqNAtR/Y4oa+Hze/de
         oDiA==
X-Gm-Message-State: AO0yUKUdGzOXTzfZvqGWXnobKi+/OP/BLDP77GqaJlLKoF3wSDu75H/X
        AyZU2ub/Xpb1L7jnMwg+KtwLjg==
X-Google-Smtp-Source: AK7set88E27V6rOYpLZjVp5l+CX0apMmZR326T5A2KrK6/PKc8UrPh8m05A5t+BY5t6tI/Srl0r3Bg==
X-Received: by 2002:a17:90a:1957:b0:237:659a:a44d with SMTP id 23-20020a17090a195700b00237659aa44dmr2090856pjh.9.1677855171757;
        Fri, 03 Mar 2023 06:52:51 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:52:51 -0800 (PST)
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
Subject: [PATCH v15 07/16] drm: exynos: dsi: Add atomic check
Date:   Fri,  3 Mar 2023 20:21:29 +0530
Message-Id: <20230303145138.29233-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
Changes for v15, v13:
- none
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
index fe195d76ce76..796480e4a18b 100644
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

