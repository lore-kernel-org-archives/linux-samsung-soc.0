Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAE7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiLNNAB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237566AbiLNNAA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:00:00 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3A111A2B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:59 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so3954094pjb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 04:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XV0iT2+anlnzNFxB8gtw/95iQZwlim72SiDndwZJCQ=;
        b=MS2PaqXT09EvFJyYSXexPYVxg4aVmHicJbuzxXNMPSzLZf/FCtwPXqaGtAPSlGvmvh
         yWBK1Pz/v5XOFmyuFVAHHXr1bq8SFBW9vRHV1hDjGosl2rw2SgLdydt6vDoOr+AS8U41
         8776lncLrP1/nJXWjv/8ddH8uWz2KIjqWnN7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XV0iT2+anlnzNFxB8gtw/95iQZwlim72SiDndwZJCQ=;
        b=fhlAy4RCqSOWdOv371Ios8KZEF1eRrqFUoQ/dPWo4F0N94a88dQZ97ubQxjj8Z4agm
         juOttN7TZpYf2Gmp6+xWM3XSoj8VDZZri4M/+EbU6MNTSl6i/4ofi3rmb09yI+cMmzh1
         vIJotvX21IOOs3X0fRkDwwPcmS/MdcVuVlvkzjEOuoHbOVpPxIwkD2PrKZSQBrByRkup
         amgRlzZiZ6hhKMq+ivURo4YAQx0w16QKc7n0rnDCFa5i6Ln1QVTDR7k8H4wr4bk26aLb
         tVCUgXTIt9r8gReCRQDef0E3RIEeoPIoKK/oioiV8vY80IbeiZ3sDY9sbJt4t+rLEjdH
         Gk/w==
X-Gm-Message-State: ANoB5pk0IIDt4gFx/zqAOp3Z1nnqCn2j52mrY8qAqF9qZwLzRHxRvniv
        GSJGWgja6bKFm9BA0o5lc0NhGQ==
X-Google-Smtp-Source: AA0mqf4mn9yZbjgtYZklDvcincCE+syJtjxqqM4T/PZgvSKF4Yht7xGp61btDnP2ETITbQiv+AOfNw==
X-Received: by 2002:a05:6a20:d68b:b0:9d:efbf:6604 with SMTP id it11-20020a056a20d68b00b0009defbf6604mr30432564pzb.18.1671022799002;
        Wed, 14 Dec 2022 04:59:59 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 04:59:58 -0800 (PST)
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
Subject: [PATCH v10 04/18] drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
Date:   Wed, 14 Dec 2022 18:28:53 +0530
Message-Id: <20221214125907.376148-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
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

