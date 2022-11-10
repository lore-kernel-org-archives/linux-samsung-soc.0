Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFC7C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiKJSlJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:41:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiKJSlH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:41:07 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436FE19C20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:06 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso2433489pjc.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo60Yc6E8FyFlqiwb1b4t9ZpcglzeAFRUlIMg3kohkc=;
        b=mcLoW5TTqmk53BCLZUp6E+ychWdy4q6VcS37u14XB2PgGvp4BXZwYXT9++DuIbPJcq
         zWcBW8SPoC0crDWpvyP6xJ96aGXr99le7U0FGKGjm6fwjMAtG44twzuJ8remgZCy5WG0
         0uv8s+uUCr/c+ooJWC6hClOh+oQUayxvfKbC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo60Yc6E8FyFlqiwb1b4t9ZpcglzeAFRUlIMg3kohkc=;
        b=WAEW44wms/dE/fDZRpw6XXhWR0jWbZNmuchLjI0Wa7Cplt9r2sMrKKM+yQFvA8vKdM
         YiQ44m6L2NaWzGgwUNqGGo5W5WVqVcyfQHyoR3axKo2KCGORvedGUbPLdqUr/VDzOFHV
         o6wWVH+Wd3Y1N12/FLQdvbT208ctxmPDrVJZMzsfJlQv4LXztqdCwzjHr1dNVIwQtdv5
         6SJAMSEuAx1LN5IoAl+/TOcpB+rtMdK0yaRYSemmT5TqYs5UnYoPZJ3BNHAX1bAUuyIs
         iiuY9a8ZEVzcptE8kQKQYUF0jSgQZ/yI6BeAG0KPaTK/H9avBK3DCaC7pSwg/B/++mV/
         o9dQ==
X-Gm-Message-State: ACrzQf0pgJ0seueV/TNgp8mcjvpO9wmHzL/INoD/YNTLKBHyiOglmG/w
        mic2lpgdMn8Y4uGm7qvyoyKerA==
X-Google-Smtp-Source: AMsMyM48eoM5/wFqVgOtS7w1A+4ef4J58piCH2ScCaaDzpj2IW6rOKFXrnpslXv/06EhVeGQmPsSpA==
X-Received: by 2002:a17:902:ab1c:b0:17e:c0f0:96a4 with SMTP id ik28-20020a170902ab1c00b0017ec0f096a4mr1747519plb.80.1668105665652;
        Thu, 10 Nov 2022 10:41:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:41:05 -0800 (PST)
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
Subject: [PATCH v8 07/14] drm: bridge: samsung-dsim: Add atomic_check
Date:   Fri, 11 Nov 2022 00:08:46 +0530
Message-Id: <20221110183853.3678209-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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
index ec7e01ae02ea..3c0a8580508b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1315,6 +1315,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1353,6 +1379,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
-- 
2.25.1

