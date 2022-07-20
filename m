Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD38C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiGTPx3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPx2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:28 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8A174BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id g12so1074825pfb.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0eeL5YJ6K1K/xYPiM4D/8wsBy92RLKZITtI/QG6TU2E=;
        b=C/ZB4MD+XhCadB9ByRb9zQVH3CkP5PPzXZ0p8wDhr2QbFnziWRPN6HojLxGEiQ2Ei1
         pe+MJcwaKoX6VAsnqGIQk6s/p21WSoP/63x9Tx0CrO+/yKoDruuZl7zDAE72TnZoR1H1
         ODorIPWnbGQRf+zU58YGZ/D5lQaIMxfYiHn/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0eeL5YJ6K1K/xYPiM4D/8wsBy92RLKZITtI/QG6TU2E=;
        b=5SUEXIWbg49k3i1Is1qLO33IEKAXd5BYcEkKe41B5yLc4Bar/1XEdfZSoDDRm4QKe7
         pPybMoyPefmjGlsd9P+SDKX1FGLcSXz6Gbu57ZIZv677RsLRv+lBoBQOVRbRN5haWPHI
         jPDVKxdXU8GHtwbjHe7mWfrIviznY2HH8q695QeNFVF5HSqRpXpvG5OqBwKVHtHD9Zh0
         FIUlcyf2ioGwgB5gDUEtKUL5/BU1Bd891vuUhnlKKgRERJeuc1ZVRV5Ms15n3bJ6kDT4
         JKysjdSTJv88kW18nHSSjvrNlpZTltZi/f8CKF4Fq4PUC0zGeeZ0VdOj5I4Uu8L1iIP+
         h7FQ==
X-Gm-Message-State: AJIora/Yhi2hCyGZDuxTgz6SMjqnlmooYDpYGN1/roATFfJ9jTkWdkjy
        gZmglUcPzrmzBLOn5ltbA5yyUQ==
X-Google-Smtp-Source: AGRyM1sZ16aLGbhGSuthIDLv8wJdyw4xIzY5kH9mfBVhtnoeLGBHmAM4LeECI6EWetU0paphjwCaNw==
X-Received: by 2002:a63:4cf:0:b0:41a:617f:e195 with SMTP id 198-20020a6304cf000000b0041a617fe195mr4269823pge.89.1658332407383;
        Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
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
Subject: [PATCH v3 08/13] drm: bridge: samsung-dsim: Add module init, exit
Date:   Wed, 20 Jul 2022 21:22:05 +0530
Message-Id: <20220720155210.365977-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add module init and exit functions for the bridge to register
and unregister dsi_driver.

Exynos drm driver stack will register the platform_driver separately
in the common of it's exynos_drm_drv.c including dsi_driver.

Register again would return -EBUSY, so return 0 for such cases as
dsi_driver is already registered.

v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5eb594ea0bdf..5a0fea30e9e8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1737,6 +1737,28 @@ struct platform_driver dsi_driver = {
 	},
 };
 
+static int __init samsung_mipi_dsim_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&dsi_driver);
+
+	/**
+	 * Exynos drm driver stack will register the platform_driver
+	 * separately in the common of it's exynos_drm_drv.c including
+	 * dsi_driver. Register again would return -EBUSY, so return 0
+	 * for such cases as dsi_driver is already registered.
+	 */
+	return ret == -EBUSY ? 0 : ret;
+}
+module_init(samsung_mipi_dsim_init);
+
+static void __exit samsung_mipi_dsim_exit(void)
+{
+	platform_driver_unregister(&dsi_driver);
+}
+module_exit(samsung_mipi_dsim_exit);
+
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
 MODULE_DESCRIPTION("Samsung MIPI DSIM controller bridge");
 MODULE_LICENSE("GPL");
-- 
2.25.1

