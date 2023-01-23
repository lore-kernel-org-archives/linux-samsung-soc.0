Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0C7C38142
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjAWPNB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjAWPNA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:13:00 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFCBD535
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:13:00 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id m11so110305pji.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGTDxW/0FHkTpFMtVsyR5B6P9WvJldck4Y7e8f4Ze3U=;
        b=UwPu6XfWXFSIuiiGfsHeV0NSIGbeIFJmjzP2t9BTNEk9wj1Jw1u9G6Zi9Xwf3duzuG
         4hwS1uxyftTr6K4PEWoJOzJLZJ85LyLQmt8Vxj7s9MtBJ9MOZvbAS918jDEKzK2Sjr9Y
         FNTJBx+Kumpc78uvJ6LtGa4Nfy2cbUwe/u67E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGTDxW/0FHkTpFMtVsyR5B6P9WvJldck4Y7e8f4Ze3U=;
        b=bVzE82dNJuxVoDbEFmhMU4y9a4qYji/BHXJdukqFFgynLm+hv1dl/zjP9aM9MZwKxG
         Kd8hpoIZOBWIdfuzkBnlTr5BAHiz898A9vuncVswdwRactKM/asyqTm5hw80BemgzCvD
         i/oDcYkRtixeK6IcnTjAkumUzAYs9tT+lOOkvUmEz4QO9GFteIMjEQN8MwlI/sou4cxQ
         eXjti+zZIr99iASfz2g1FuU6UCvAaeIPbO2dfpgt15R/6bWKicZc36w4WIjAn7oVRebx
         oeXb3SMqu861ulrJpduUH2xTpjPVab5wYibXRvCH7mEJTm/UDRGXDtxqDGGlmiCoHvin
         HKCQ==
X-Gm-Message-State: AFqh2kqrW1o+MgE+zZo440VawmDvtD0F4jjta4t68zx6vS6UFLIjuUG4
        zEjPE2mx9mutQBX2V1yZBjyvNw==
X-Google-Smtp-Source: AMrXdXuZigy/zru/JPuBsdufFzgVanTwnd5MnjJMthqYgQ2QWWfto7oDWypUHFrwOhAtKrANIAUG4w==
X-Received: by 2002:a17:902:8493:b0:194:3dce:deb5 with SMTP id c19-20020a170902849300b001943dcedeb5mr26778292plo.27.1674486779349;
        Mon, 23 Jan 2023 07:12:59 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:12:58 -0800 (PST)
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
Subject: [RESEND PATCH v11 04/18] drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
Date:   Mon, 23 Jan 2023 20:41:58 +0530
Message-Id: <20230123151212.269082-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

devm_drm_of_dsi_get_bridge is capable of looking up the downstream
DSI bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_dsi_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df15501b1075..4a165764121d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1470,18 +1470,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
-	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
-	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
-	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
-	}
-
+	dsi->out_bridge = devm_drm_of_dsi_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
@@ -1531,8 +1522,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	dsi->out_bridge = NULL;
-
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-- 
2.25.1

