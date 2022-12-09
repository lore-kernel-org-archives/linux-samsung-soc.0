Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BB5C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiLIP1u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:27:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiLIP1a (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:27:30 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2888F720
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:27:29 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d3so5205342plr.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfCnS0osLOS8xaWpCmO4LYnynxznfz+nnT8/dn7VQfk=;
        b=nSJNeITl9fnTfPnvJhvt7rcK/xV7j/NWCI0p9//tsOA/UM56OFpEr7ygGEIbx7Y1No
         XWJd/V2u6MoDaGZXuAZBIhc/UHZa2e2QokYR6Zih3+5iRVGEpIU3l0EEftElSRDOjPN1
         n96YN33rgcOTAZC9jUXZndGbTxC/brxMpVgfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfCnS0osLOS8xaWpCmO4LYnynxznfz+nnT8/dn7VQfk=;
        b=7HPGBEZgEq6gg5ObFpNbFbVrXkbgRDIJoIsEbCWmYCgLIMHGMeq1DpgoDGl8xW+cQC
         nk53NKAE1whf0aDal2NIVi0hOCBVZApDU9K0f+9UkOG04JS/YfPN0bYxJUfoVhkmN45E
         Rqxj48J2aKwW0IdlMPvOSHqWnIHyaeTPKpTUZysr6v86vkmZLEp+poECxUmb97v8Zu4l
         dWeXBJC77uTg6InjxHLmc49P2XgH4SiPzOac6ZNlXGhvoIAOv4anHWAaYk6zN/gBpMg1
         HjrLSp1876gA9WiWG8UEGVBzZfPO84+a+2gijCFb+PL09tk0S0T5tpbAkmhfstEM/5F8
         M8EQ==
X-Gm-Message-State: ANoB5pm73Kf9P1PiCoMg4ODVchH/2S0aqQBt7ukJmuBpU9iZAf3icl+M
        v1tGvgTa71cbseYXGWQ14dZGqA==
X-Google-Smtp-Source: AA0mqf5RMvL/6/KcRoodcz3nCDPqXEouCFOwfCuTdoOSewQ5pw+uHy3hlJMsbykq4AKHdpBGOhdd1Q==
X-Received: by 2002:a17:902:e807:b0:189:63be:8acb with SMTP id u7-20020a170902e80700b0018963be8acbmr8774321plg.59.1670599649351;
        Fri, 09 Dec 2022 07:27:29 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:27:28 -0800 (PST)
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
Subject: [PATCH v9 11/18] drm: bridge: samsung-dsim: Add atomic_check
Date:   Fri,  9 Dec 2022 20:53:36 +0530
Message-Id: <20221209152343.180139-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

v9:
* none

v8:
* update the comments about sync signals polarities
* added clear commit message by including i.MX8M Nano details

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
 drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ec3ab679afd9..c79f7dc49e17 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1342,6 +1342,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
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
+	if (dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM) {
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
@@ -1364,6 +1390,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
-- 
2.25.1

