Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A1CC07E95
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0BD26162A
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhGDJIa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGDJI3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:08:29 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064E7C061764
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:55 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id v7so15078777pgl.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NPJDGg5FUIlGKxFIr3cHBiKXJApkbS5HOtFGL2ZFtnI=;
        b=Y5vOqA5VOi+FrwY2NKDcz7f743/FfVMilz2a7ydOaqlPDwHXGJjXCnQvNZTUZG/VAJ
         0BEywGa25xiOVnSMvFN7wTdpafQeHwxBu142wKYTkUutW6p/tf4wc4vO4Nx3curO3sw1
         +8tiTqWBXHMVJq18XEJ+M59Ivjsq64+kwcAeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NPJDGg5FUIlGKxFIr3cHBiKXJApkbS5HOtFGL2ZFtnI=;
        b=Um/rJhBHZgGwSTBju6oecZ/Jn1GHHzIof8WV0cAtNCHP+CnxQTbnWbjBfa3o4Bwty4
         UbzIfwM6jkK10qXtZtlSRHdru22r7yM7zLzHr9ykFXFCqPXoCwVmBhzBP5WY9M7vkMeH
         85FKCMvFyevOqgjMFqjRWVpnPpjrJJ5swmbzF5eGtGnWBmhUXoSwJ+70EetsoNv91rdj
         nGvi3fzjE/q4jXL2tWdpkvq6paejV5t212SU6D9TDQC1gy8Go5mN0wh9ttzGYg9pKjsZ
         TI8EcLP03pnPySQSvsfg8gMU7sYfGAhEx3Jcr6qU9gHOuGaAguD/wkz3zoMn9byzbeKa
         Y4ww==
X-Gm-Message-State: AOAM5325j38Ayhoi8Zw9ceit3RLQCv4ie5+hMoNZ3JXkJQ0rxYDBT7Mq
        9QyJpK7LtLay/JQioqmR63RL4A==
X-Google-Smtp-Source: ABdhPJzkHWVdOK7EaakstBIyQU5sd1VI/Q64M2LP26zyXubUC+ZrLsxppnNHkOOSw62DRzm7TEhTUg==
X-Received: by 2002:a63:4b23:: with SMTP id y35mr9529467pga.179.1625389554638;
        Sun, 04 Jul 2021 02:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:54 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [RFC PATCH 17/17] drm: bridge: samsung-dsim: Add bridge mode_fixup
Date:   Sun,  4 Jul 2021 14:32:30 +0530
Message-Id: <20210704090230.26489-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixing up the mode flags are required in order to correlate
the correct sync flags in i.MX8MM eLCDIF.

So, handle the mode flags via bridge, mode_fixup.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0ed218f5eefc..c2a76ee5ac4e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1474,6 +1474,16 @@ static void samsung_dsim_bridge_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static bool samsung_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
+					   const struct drm_display_mode *mode,
+					   struct drm_display_mode *adjusted_mode)
+{
+	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+
+	return true;
+}
+
 static void samsung_dsim_bridge_mode_set(struct drm_bridge *bridge,
 					 const struct drm_display_mode *mode,
 					 const struct drm_display_mode *adjusted_mode)
@@ -1542,6 +1552,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.enable = samsung_dsim_bridge_enable,
 	.disable = samsung_dsim_bridge_disable,
 	.mode_set = samsung_dsim_bridge_mode_set,
+	.mode_fixup = samsung_dsim_bridge_mode_fixup,
 	.attach = samsung_dsim_bridge_attach,
 };
 
-- 
2.25.1

