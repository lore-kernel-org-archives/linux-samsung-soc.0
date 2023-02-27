Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6A7C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjB0Ljy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:39:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjB0Ljx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:39:53 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA54EEB53
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:39:52 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id x34so5847125pjj.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuq+y+HWw18yw8Sob2qSkhl5lK1AxCLgf7u71EJPHEk=;
        b=XO8VVmB/hwLaztPZ/sAhrdZmaYrs5ncE0RsyQA1pmLm8kYaz7hyN3l4khaR8kfjtQO
         uXlyE9diL97ZBL9BZ3arnna8+YCYjkOUNWZyl4qsQfey8YWlS6tVP5An81GPTHorzkXj
         21qAB9IswB+/tmzLfT8QzVwkzkZBdgcWPKAIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuq+y+HWw18yw8Sob2qSkhl5lK1AxCLgf7u71EJPHEk=;
        b=PZ0Ns9kt/oY+e61MIuioXOomNolLKYnMvsf6TgdwiFKPpt77vPWHBvUdWuImaNyOsn
         re91vTHhxlB5ys29SEjBkQu26pvXhIgrx3vL9YtGrADcHMi0n0Du8k0kPPAlbmvvAcLL
         DeMIjONMNMxnjQqj1AQ3R/4mocS9gEpc8fWHgQBWv6/ciOoKXHyxG7EGHYj2Kpii4KDT
         Ijg7KrLZODYykoz808IVuhP92k6RDu63jZD5J+edyT/zPYhLfFrD54W5h5Acppq384Jn
         nXSoQmdkG0ePlyYkM31+rf15KSRGggMAVF0QXmcXJ8uiOY/YdUkO4Ndk6Rj+Ascvx1OZ
         tI3Q==
X-Gm-Message-State: AO0yUKUxHTZ2nAoYFC/ZyE1th/mOpQNInwX5DK/pT+2En3fucoIXfQ/J
        yPjnKrPv8D0QjHAuZCXIAvJhnA==
X-Google-Smtp-Source: AK7set8jN2nFdydfvmMeL5O1CNTAU79kNAhBLbqh8lLl93e0qMxNPZl0daLwvp8M+WpPesVZAVK/sQ==
X-Received: by 2002:a17:903:42cd:b0:19c:d5c7:9401 with SMTP id jy13-20020a17090342cd00b0019cd5c79401mr9789215plb.52.1677497992292;
        Mon, 27 Feb 2023 03:39:52 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:39:51 -0800 (PST)
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
        Jagan Teki <jagan@amarulasolutions.com>,
        Maxime Ripard <mripard@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for drmm_panel_bridge_add
Date:   Mon, 27 Feb 2023 17:09:09 +0530
Message-Id: <20230227113925.875425-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
which automatically removes the bridge when drm pointer is cleaned.

Supporting the same on non-component bridges like host DSI bridge requires
a drm pointer which is indeed available only when a panel-bridge is found.

For these use cases, the caller would call the drmm_panel_bridge_add by
passing NULL to drm pointer.

So, assign the bridge->dev to drm pointer for those cases.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- new patch

Note: use case on 
"[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper"

 drivers/gpu/drm/bridge/panel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index d4b112911a99..45a0c6671000 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
 	if (IS_ERR(bridge))
 		return bridge;
 
+	/*
+	 * For non-component bridges, like host DSI bridge the DRM pointer
+	 * can be available only when a panel-bridge is found.
+	 */
+	if (!drm)
+		drm = bridge->dev;
+
 	ret = drmm_add_action_or_reset(drm, drmm_drm_panel_bridge_release,
 				       bridge);
 	if (ret)
-- 
2.25.1

