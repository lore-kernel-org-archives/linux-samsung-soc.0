Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F9BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbiLLScF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 13:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbiLLSbN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 13:31:13 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B91183A2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:37 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id g10so12941450plo.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+Av/2b/ycy/RF3odcL3zI/UzS7FDZGXbIff6fnk4N0=;
        b=BnDGNHVrwFfXAnM9SyZeC9QH9o6KivMSPD1A8n6oPm6t8kdRpWWFIfq14tbtVxieWz
         Qd723axcn8ltXjluGv/NZ9rPBedPFTN0XSwPp5OOdMkHzagWOXC6AnEJC5kUqJQxFkqr
         RJB4Iqe6+yNzfy6qElEhLaGzuElsUeplD426M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+Av/2b/ycy/RF3odcL3zI/UzS7FDZGXbIff6fnk4N0=;
        b=DCeWOb/GSoDXZWDs78t0fAX0xA1PB5XxXwnNM0B1eglVjKPDkQ2/4q11qE+SRRhJFo
         kcecjFoUyD4ZZKtNRcDWTKLwXqzSZwQ/SLpeN9xmj//OisV+UAsKRU5j7agR6yV82J5Y
         73luVn4Q9fskTdmSrnuo9VDXqBgKnPTKtHwl+IxWQpaOYpeDs+8b/Gbeu0uUx5WmACiP
         vBW6gzIJy8JTiai/NwotyicZDc9QJSbfSvE4un9HC3qqyj/WKtzT7I2ogw/vE0UnUTog
         sh3xVLq8ZSiaCUIb88p1RRzEJgH1UlrWUS2MqSXGMM1PRTHKQyYJRgTeSRRPE8jSe+HM
         Vt5Q==
X-Gm-Message-State: ANoB5pnWC6cIYStmYIY8CYmaNnd1a0ZA+Ax9/YVyVMG9iiiXR2XbFvOh
        TxC1xRVistbdOcnx5uyaTsZEyg==
X-Google-Smtp-Source: AA0mqf5hsCFAcHLuL+AKUeephHjjqJ2dqqQyzD8sLhqo13HfDb8qhj+/6xrx4HNXqbUYYXrCRXyb1g==
X-Received: by 2002:a05:6a20:69a0:b0:9d:efbe:52ae with SMTP id t32-20020a056a2069a000b0009defbe52aemr27929032pzk.30.1670869776804;
        Mon, 12 Dec 2022 10:29:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:29:36 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v11 1/3] drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
Date:   Mon, 12 Dec 2022 23:59:21 +0530
Message-Id: <20221212182923.29155-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable the drm panel prepare_prev_first flag so-that the previous
controller should be prepared first before the prepare for the
panel is called.
   
samsung-s6e3ha2, samsung-s6e63j0x03 and samsung-s6e8aa0 are the
effected samsung-s6e panels for this change.
   
This makes sure that the previous controller, likely to be a DSI
host controller should be initialized to LP-11 before the panel
is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11, v10:
- none

 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 5c621b15e84c..1355b2c27932 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -731,6 +731,7 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index e06fd35de814..3223a9d06a50 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -462,6 +462,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e63j0x03_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ctx->bl_dev = backlight_device_register("s6e63j0x03", dev, ctx,
 						&s6e63j0x03_bl_ops, NULL);
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
index 54213beafaf5..362eb10f10ce 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
@@ -1018,6 +1018,7 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &s6e8aa0_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_add(&ctx->panel);
 
-- 
2.25.1

