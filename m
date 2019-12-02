Return-Path: <SRS0=GbDS=ZY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11B0C43141
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Dec 2019 19:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94EB7217F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Dec 2019 19:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sddcI5js"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbfLBTdc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Dec 2019 14:33:32 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41254 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbfLBTdb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 14:33:31 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so806418ljc.8;
        Mon, 02 Dec 2019 11:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ziacaDT5ojzWXLyawunTmtP2RY8dGuryn8kq/1BtKS0=;
        b=sddcI5jsaMfWn/78NbEh1ItFa3htles17a7S2GxuBnfw8EGrqWdQq7HkZHjqJsWvut
         VDGhwKNOs1pB6+2hSoNc2Fy2/J9jzTBQrmOb5sEwxK9MZJN+ydX4fCPg+t7aD1qKpkjo
         yysZG995mtrjjGPHCESf/q/8KceeZ5wnp6IMEmhZzcCag438p650Fn3bpikZtooCDOPP
         Ua3HwNS8A6DCrNhqO/b40VgQYJiJLttWNgb6bEX7jsLZ7tLx1hu5f50E51pgUTHh2gFL
         bVk46NLX3t5W/tDxiZ9YYAY8yqZxCBR7u8spRmvuAKL7fBjVd+US3HBR9HtQpkxcj63h
         pSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ziacaDT5ojzWXLyawunTmtP2RY8dGuryn8kq/1BtKS0=;
        b=dNVBe8hJPbSI7soYfXMdXzCrQ8eld6D/kMPplde/9q9/02KXRpvB9qcKwg20RdeGTn
         fDCvBkMzV9GxzzKfukVmUiU2HC0jxnjs40F/tAumaPxT0TCfGtKraVOG+dOG4wzwbeMo
         LGxnRP4Bbwep/sVMIxvuBPgVuGV8S8fc97Y8kY9sTsJ1wzNgBqe0+fvZC7gCZ7ls46C0
         7N5mXHvUzdEuOJzaZn1FnArnfFVBJim4ZRbotmn/8lKak5bCOVjXq32F29xPO05UW7PB
         YCrTbrd1y3uHbAjfU7MZ1SDVEaB6Ztg2z6y/nRsZg8HK1dun7MTo4RzhrkWLUAqxbPrM
         QFtw==
X-Gm-Message-State: APjAAAUOLCS1MFJiqY6btW2vFIujPf+oYueXrd4P/msTey+ITMSPKzzC
        H3ELjYrNqsjYrM44bNTVNbI=
X-Google-Smtp-Source: APXvYqwu5DjS+1a3b7ZBEWBw4hcW7WJdhp41DTTVhmMuxsDxpn8LvqwTqvwr8F6v3F4KQxwRHBv+sg==
X-Received: by 2002:a2e:9110:: with SMTP id m16mr278458ljg.140.1575315208043;
        Mon, 02 Dec 2019 11:33:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id g13sm79482lfb.74.2019.12.02.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:33:27 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 12/26] drm/panel: kingdisplay-kd097d04: use drm_panel backlight support
Date:   Mon,  2 Dec 2019 20:32:16 +0100
Message-Id: <20191202193230.21310-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the backlight support in drm_panel to simplify the driver

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 353ee6caa01c..bac1a2a06c92 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -3,7 +3,6 @@
  * Copyright (c) 2017, Fuzhou Rockchip Electronics Co., Ltd
  */
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -23,7 +22,6 @@ struct kingdisplay_panel {
 	struct drm_panel base;
 	struct mipi_dsi_device *link;
 
-	struct backlight_device *backlight;
 	struct regulator *supply;
 	struct gpio_desc *enable_gpio;
 
@@ -191,8 +189,6 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 	if (!kingdisplay->enabled)
 		return 0;
 
-	backlight_disable(kingdisplay->backlight);
-
 	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
 	if (err < 0)
 		DRM_DEV_ERROR(panel->dev, "failed to set display off: %d\n",
@@ -303,18 +299,10 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 static int kingdisplay_panel_enable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int ret;
 
 	if (kingdisplay->enabled)
 		return 0;
 
-	ret = backlight_enable(kingdisplay->backlight);
-	if (ret) {
-		DRM_DEV_ERROR(panel->dev,
-			      "Failed to enable backlight %d\n", ret);
-		return ret;
-	}
-
 	kingdisplay->enabled = true;
 
 	return 0;
@@ -388,13 +376,13 @@ static int kingdisplay_panel_add(struct kingdisplay_panel *kingdisplay)
 		kingdisplay->enable_gpio = NULL;
 	}
 
-	kingdisplay->backlight = devm_of_find_backlight(dev);
-	if (IS_ERR(kingdisplay->backlight))
-		return PTR_ERR(kingdisplay->backlight);
-
 	drm_panel_init(&kingdisplay->base, &kingdisplay->link->dev,
 		       &kingdisplay_panel_funcs, DRM_MODE_CONNECTOR_DSI);
 
+	err = drm_panel_of_backlight(&kingdisplay->base);
+	if (err)
+		return err;
+
 	return drm_panel_add(&kingdisplay->base);
 }
 
@@ -432,12 +420,12 @@ static int kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 	int err;
 
-	err = kingdisplay_panel_unprepare(&kingdisplay->base);
+	err = drm_panel_unprepare(&kingdisplay->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to unprepare panel: %d\n",
 			      err);
 
-	err = kingdisplay_panel_disable(&kingdisplay->base);
+	err = drm_panel_disable(&kingdisplay->base);
 	if (err < 0)
 		DRM_DEV_ERROR(&dsi->dev, "failed to disable panel: %d\n", err);
 
@@ -455,8 +443,8 @@ static void kingdisplay_panel_shutdown(struct mipi_dsi_device *dsi)
 {
 	struct kingdisplay_panel *kingdisplay = mipi_dsi_get_drvdata(dsi);
 
-	kingdisplay_panel_unprepare(&kingdisplay->base);
-	kingdisplay_panel_disable(&kingdisplay->base);
+	drm_panel_unprepare(&kingdisplay->base);
+	drm_panel_disable(&kingdisplay->base);
 }
 
 static struct mipi_dsi_driver kingdisplay_panel_driver = {
-- 
2.20.1

