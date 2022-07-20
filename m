Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C2AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiGTPxl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiGTPxf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:35 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFFA4BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:34 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q41-20020a17090a1b2c00b001f2043c727aso2655263pjq.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1MmIYAi0CzqUnm8evBibi87aQyljaw+zPjXUhxloQug=;
        b=mHjHibFPl5AEVmv4OWOUiuBDmDNS7FS2T+uTCA/gFw+jukwGEGuz2FxyksmMwtzWzu
         EEhDwyUoBQ1OWmsm0JfEypDn38TGbfTGoLFtt7bLRl/f6Tpy3GKk4EFrt0zAVdkOngFn
         H8Pgx8ppIArgExgdy+urN+bD14dfOT4oMs/Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MmIYAi0CzqUnm8evBibi87aQyljaw+zPjXUhxloQug=;
        b=flvakjpFhM8lOAMcstHFZtCpen6aEGC8ItjouVjhZQjLWXY66EdBieeEmDANm12m5a
         +itY16cfVwkxI7Z8eN0lmZDdgtSPdOw0L+S9JzY6qzNX7PIV9sp/3//Z6BpXq1gkX7fs
         mMRpXXqf8EAqkdV+letOnfUrsraDsuUtz+1g3ljbo1EZL2dt9Y26SSrtveIv64ofOqG5
         kKelofh2FDuZqd2v2cnU7FItyFMAI7jzDMptg0u8VmcNKASZ5qROKV+EEqrTh/tez2iu
         s9s4E7Fjz/CxAvlYveIcLaHPB/QDw03QO0yiztQulY4YULG4UUtgH0C1gcO7wfhp7dmQ
         XvFQ==
X-Gm-Message-State: AJIora/HZxdFyixd7z8xoOipH0L5tAGEiJk/qb3VRCYcb5k98gj+o0TM
        HkkoeqyUa6QpHdg1ZgtyCUy+Cg==
X-Google-Smtp-Source: AGRyM1uummsEiwuhJYyAtQAkejNqA9QIK5AltZR34DfENCQr0Ig+awsEdKgwAgXdTKXg/S0OaiSdfw==
X-Received: by 2002:a17:90b:3b4b:b0:1ef:f5b0:ce60 with SMTP id ot11-20020a17090b3b4b00b001eff5b0ce60mr6311657pjb.71.1658332413996;
        Wed, 20 Jul 2022 08:53:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:33 -0700 (PDT)
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
        Neil Armstrong <narmstrong@baylibre.com>,
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
Subject: [PATCH v3 09/13] drm: bridge: samsung-dsim: Add atomic_check
Date:   Wed, 20 Jul 2022 21:22:06 +0530
Message-Id: <20220720155210.365977-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Explicit fixing up of mode_flags is required for DSIM present
in i.MX8M SoC.

At least the LCDIF + DSIM needs active low sync polarities in
order to correlate the correct sync flags of the surrounding
components in the chain to make sure the whole pipeline can
work properly.

So, add DSIM_QUIRK_FIXUP_SYNC_POL to handle this fixup via bridge
atomic_check.

v3:
* add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5a0fea30e9e8..376e9682e130 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1339,6 +1339,23 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (dsi->driver_data->quirks & DSIM_QUIRK_FIXUP_SYNC_POL) {
+		/* At least LCDIF + DSIM needs active low sync */
+		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	}
+
+	return 0;
+}
+
 static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
 				  const struct drm_display_mode *adjusted_mode)
@@ -1361,6 +1378,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index c852d7b9981e..4eacaf18e00a 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -35,6 +35,7 @@ struct samsung_dsim_transfer {
 
 enum samsung_dsim_quirks {
 	DSIM_QUIRK_PLAT_DATA		= BIT(0),
+	DSIM_QUIRK_FIXUP_SYNC_POL	= BIT(1),
 };
 
 struct samsung_dsim_driver_data {
-- 
2.25.1

