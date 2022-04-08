Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758B5C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 16:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiDHQZC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiDHQZB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 12:25:01 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB40210BBF0
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 09:22:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j20-20020a17090ae61400b001ca9553d073so10135298pjy.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 09:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Is0eSnwBB0c+KCKE5P6y3Z/4g9fKoG//Yrq64nJGzuA=;
        b=PJ1FXOhyq6lEZGcESSV3oZwNaq+cYEByIC3a06+xLMyPUy4BAL3RMx2iQFRq6Zuapa
         GnJw/ocMXEDvDTGDzFf9FeZ7429S7s3jYF9LBWvOAlbq3/4peayUB6XiweycgoC59yhp
         wNjpd+UKj0nS71yvRdLLqDdlPK7xZ/pUb2iqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Is0eSnwBB0c+KCKE5P6y3Z/4g9fKoG//Yrq64nJGzuA=;
        b=gddyDXmMjIqsRgV3OOGoSl/dYcMLlnZ06JcBJDPh7L415owr/TqTihD0l1nHCzAjXs
         GJ3TiUH3lMF2oSs64K+rtna8XnRgmy/XiVUmYVJRaF74TAtOYGhnN9f6uu51Wm8XKbmz
         xd3E55hAUymuooX6Q5FKJrWWa24PHacpYK8EgbayS113wnOwe8/K9Wds/ASrnzqlrfXg
         ygkvPNGDTY0E7FIc53LGpKjiPaTDIdH2MY+2rC2vl/YjJgRP0beJUk4cjFgNDg9Lmm/b
         lIfHlHStQfmKEW7+frzs3fmAf4lwxmhjjPJTfmIXA4saTx4nCvisOwIqGWxBBcI0+k29
         J4bg==
X-Gm-Message-State: AOAM531p83UARp++ovr4jF0WZO38WvPQoXucDtk7KLPmBhhfn94nBNdp
        TS+CxxLezpbUcfAGyDOt933MUg==
X-Google-Smtp-Source: ABdhPJyyC+DLIlCAsb4NS7NYt091VuqvyMKyji4aF7dG4s7CnOE/27EJaHXsz9UfH0iHconOn81y2A==
X-Received: by 2002:a17:902:cf05:b0:156:9d:ca01 with SMTP id i5-20020a170902cf0500b00156009dca01mr19868194plg.111.1649434977157;
        Fri, 08 Apr 2022 09:22:57 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
        by smtp.gmail.com with ESMTPSA id n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:22:56 -0700 (PDT)
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
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 06/11] drm: bridge: samsung-dsim: Add module init, exit
Date:   Fri,  8 Apr 2022 21:51:03 +0530
Message-Id: <20220408162108.184583-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 423d654e8ffd..1fe4b8e737a4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1696,6 +1696,28 @@ struct platform_driver dsi_driver = {
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
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

