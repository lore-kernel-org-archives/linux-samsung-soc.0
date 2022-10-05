Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E7BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:13:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbiJEPNa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiJEPNa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:13:30 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CAA6E88E
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Oct 2022 08:13:29 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id s16so2054715ioa.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2022 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQZh1WL8LN/9jE0F7Kfj3L3iyOE3VYmZbk12zg0k2YE=;
        b=QmcCZNdjvn4xJDQhu1/YU9JkJPrdAbyl4Kc7KfNzdq6AH8j4Qk15udzMAvjGNlLwDf
         ravXapf48/bcPFQb+zX8AcbMhIpUkjAYVsbg3kZv/pXDz9ZhNqiiYxs2Wul45mEQph0X
         hvEGxqx7oUbQkJAow9MpjbjKvsmeY0X33QysE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQZh1WL8LN/9jE0F7Kfj3L3iyOE3VYmZbk12zg0k2YE=;
        b=utvCy43SU9SkGdB/DJCBEv3PKT3TDr8Lb+iaK74CzFo1efR51L9JdxJzu7BcNj0q4R
         K7Ib5Kil3rLXxw0dSGibbRTIApHBoABU1FfV4VeS/5oi2TZY4gQSEJEw7HinvmUYgx8F
         dRm75s7ScNLhaJ/4EHzJFKIWkxvR952YpQm3yFOo95OkyoW11rAl5Jo3kvv+SIlC+9YB
         FaHJ0p4R0fpUghNq+otgHok/ytAZYcSNVi+MLaRgjDOw6kxdD4yduRHEW4yJAK5Yr3fU
         DIl+1CoJgi51Po2MJrW5exRpZmFUCHYJ/bClaJTncnDJhDrKHM7G5P4d0IsUV7MnYfr1
         mvJQ==
X-Gm-Message-State: ACrzQf12apfKl2CmF2UwA5rIiVJTNsYpSNjqpv/WVSpisDGPyBf53j9C
        f/MbA9LB6Ka1lynfbx9+lX0YwA==
X-Google-Smtp-Source: AMsMyM55piOjJ29rBh3EAxJKxdmTnLY6qdSde/uB4CpDbefwoxKucpm391ho7Vm67rBWK1zmLX9zqw==
X-Received: by 2002:a02:cc85:0:b0:363:3812:9509 with SMTP id s5-20020a02cc85000000b0036338129509mr44215jap.249.1664982808649;
        Wed, 05 Oct 2022 08:13:28 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:13:28 -0700 (PDT)
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
Subject: [PATCH v7 05/10] drm: bridge: samsung-dsim: Add atomic_check
Date:   Wed,  5 Oct 2022 20:43:04 +0530
Message-Id: <20221005151309.7278-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

No clear evidence about whether it can be documentation issues or
something, so added a comment FIXME for this and updated the active low
sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.

v7:
* fix the hw_type checking logic

v6:
* none

v5:
* rebase based new bridge changes [mszyprow]
* remove DSIM_QUIRK_FIXUP_SYNC_POL
* add hw_type check for sync polarities change.

v4:
* none

v3:
* add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 563781bb27c4..b46346232c52 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1315,6 +1315,31 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
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
+	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
+		/**
+		 * FIXME:
+		 * At least LCDIF + DSIM needs active low sync,
+		 * but i.MX 8M Mini Applications Processor Reference Manual,
+		 * Rev. 3, 11/2020 says
+		 *
+		 * 13.6.3.5.2 RGB interface
+		 * Vsync, Hsync, and VDEN are active high signals.
+		 */
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
@@ -1353,6 +1378,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
-- 
2.25.1

