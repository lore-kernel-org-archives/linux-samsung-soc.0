Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C24C001B2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238439AbiLNNBQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238475AbiLNNAn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:00:43 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646C327C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:37 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id gt4so6849746pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z01OaA7zrA2+KfvvrlxHXzqsMcnora6T9Om/qcw6zXw=;
        b=O2SkxtZjb1RJRAmc4+5Vx9OMxHn4ntdcaNoyMuics87kHIEzBnI2wlTpWIkLYvqwWF
         maL6IN0+GuzbG7YLv83BAKFuXJykFo5i4BWVnpDoRvvPam+/CC9J/dGW+CWNxdrkQd9x
         aRuUkXrAmBq42jSGutygVxEzZ6PXi2GGOaGdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z01OaA7zrA2+KfvvrlxHXzqsMcnora6T9Om/qcw6zXw=;
        b=Fx+tBxqzZ3ma+Q1BXxvEs+nQCru7mp8lF4QcUzoO4yjHEMRRT3sA0xo35y2Jk60Je0
         TXIYn2Y69/KbZKhv0voul2sTAruFHRALyvxcKzMwqk0jSbdAdPonYChDIzwlyeEaYtVq
         x5Edyf1UDbAnlfKmGaY8wljCt7RlACp7Yv4wAHxRCkhRL3lcQ7n8Pitpu05QIUZHG94Q
         t58G5WhjjL52461Z1n9tzxD0UJ1+4EUAFq6/tePu6mB2wnlMNbBJNDcMDVxGU5x8pROJ
         9W260uB1HtkHkFprPGDToNu+XGtIJ1MPbpWfB7uCQgBcDGs/TLrnpJFGeaO/wsm4ueO6
         LH+g==
X-Gm-Message-State: ANoB5pmikOk/A/lodR7C3tNigsx5LtMSpP7ISrLyRYsLU1jUGygqHul1
        OD1KW7K/Fraf/zAXDvL7ZG3PDA==
X-Google-Smtp-Source: AA0mqf4BUZCvuHdgrVSAF3qBD52DGDilmSlX6Maj4WxsI0e2JGMR8GKdXvetoYOnqFAN0p6v2FUOpg==
X-Received: by 2002:a17:903:330d:b0:18f:9b13:5fc2 with SMTP id jk13-20020a170903330d00b0018f9b135fc2mr13047280plb.52.1671022836497;
        Wed, 14 Dec 2022 05:00:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:00:35 -0800 (PST)
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
Subject: [PATCH v10 09/18] drm: exynos: dsi: Add atomic check
Date:   Wed, 14 Dec 2022 18:28:58 +0530
Message-Id: <20221214125907.376148-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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
something, so added a comment FIXME for this and updated the active low
sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.

Comments are suggested by Marek Vasut.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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
index 5792f9883cee..12a40576f937 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -263,6 +263,7 @@ enum exynos_dsi_type {
 	DSIM_TYPE_EXYNOS5410,
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
+	DSIM_TYPE_IMX8MM,
 
 	DSIM_TYPE_COUNT,
 };
@@ -1466,6 +1467,32 @@ static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1488,6 +1515,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= exynos_dsi_atomic_check,
 	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
 	.atomic_enable			= exynos_dsi_atomic_enable,
 	.atomic_disable			= exynos_dsi_atomic_disable,
-- 
2.25.1

