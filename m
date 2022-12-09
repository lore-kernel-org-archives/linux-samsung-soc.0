Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F45C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbiLIPYf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbiLIPYe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 10:24:34 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B767D79C0F
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Dec 2022 07:24:33 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id s7so5211909plk.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Dec 2022 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXC2J8gtGNCluV+1whLnrK+sDhHk+0PxofuJ1e2mza8=;
        b=YaRRKeW7BmSh7/eDUD6hvrpr083Libsx4dFL8yRl321G+pnvH8Kr7xpVXQI2yYohTx
         xI8lmviM5Menr1GUazQkN2HyEPyD/23JiSMj0mA4o97EUOgAR3++polKKc/qtf8v1dG0
         DXD0eMgsSLadOIXW+PkhPAfv0v82kJ4waXYrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXC2J8gtGNCluV+1whLnrK+sDhHk+0PxofuJ1e2mza8=;
        b=K/WBd10MTtfP9E/5fd2USrBTx/njrfHwUGJDmm7hXH5eCmyCp+iepMw5X/8t5mM6eC
         F+mNuIUNp8I9On0wwYaBmSpjK8SrCayd0DzPXwTAN34BgJ9G7WC1bDkoqjXPdMBSq/22
         makD6Zb+9tRHAZao1CgQamXhW50oojvQ6pycKRuFgN4XqYc4IxHbE0BcshMojf30KnvM
         mn380OYKcaYlVQGsNVE7EuwxxN4yBU+YQgiva9NBl7WyJGVOUTLjqEzwdR1iyNweYfUM
         q9Dn/iZyvQEOfvLy6Qu8tf2WPD+Z6ddwlefn04VgULHHCXbay9mavaJkp+8p6XcA6hL3
         DHuw==
X-Gm-Message-State: ANoB5pndwLcQgH8eWx/aHCsKiqWzFkEosTRBwnrnyz/zOLDFAPpgWN7j
        4ftAILxcIgYPbG+zmOia8wI7+g==
X-Google-Smtp-Source: AA0mqf7LExIpN5F6hLQNhYaRnE5Gh3zL55dc+SLWtEF/Seev4CfPXwucnvYWAuSjoHgDtoST6thWlw==
X-Received: by 2002:a17:903:3254:b0:189:907b:7cbb with SMTP id ji20-20020a170903325400b00189907b7cbbmr6539871plb.50.1670599473108;
        Fri, 09 Dec 2022 07:24:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:24:32 -0800 (PST)
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
Subject: [PATCH v9 00/18] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Fri,  9 Dec 2022 20:53:25 +0530
Message-Id: <20221209152343.180139-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Changes for v9:
- rebase on drm-misc-next
- drop drm bridge attach fix for Exynos
- added prepare_prev_first flag
- added pre_enable_prev_first flag
- fix bridge chain order for exynos
- added fix for Exynos host init for first DSI transfer
- added MEDIA_BUS_FMT_FIXED
- return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
- added MEDIA_BUS_FMT_YUYV10_1X20
- added MEDIA_BUS_FMT_YUYV12_1X24

Changes for v8:
* fixed comment lines
* fixed commit messages
* fixed video mode bits
* collect Marek Ack
* fixed video mode bit names
* update input formats logic
* added imx8mplus support

Changes for v7:
* fix the drm bridge attach chain for exynos drm dsi driver
* fix the hw_type checking logic

Changes for v6:
* handle previous bridge for exynos dsi while attaching bridge 

Changes for v5:
* bridge changes to support multi-arch
* updated and clear commit messages
* add hw_type via plat data
* removed unneeded quirk
* rebased on linux-next
t
Changes for v4:
* include Inki Dae in MAINTAINERS
* remove dsi_driver probe in exynos_drm_drv to support multi-arch build
* update init handling to ensure host init done on first cmd transfer

Changes for v3:
* fix the mult-arch build
* fix dsi host init
* updated commit messages

Changes for v2:
* fix bridge handling
* fix dsi host init
* correct the commit messages

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v9

v8:
https://lore.kernel.org/all/20221110183853.3678209-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (16):
  drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
  drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
  drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Add host init in pre_enable
  drm: bridge: samsung-dsim: Init exynos host for first DSI transfer
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

Marek Szyprowski (2):
  drm/bridge: tc358764: Enable pre_enable_prev_first flag
  drm: exynos: dsi: Restore proper bridge chain order

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1934 +++++++++++++++++
 drivers/gpu/drm/bridge/tc358764.c             |    1 +
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1769 +--------------
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c |    1 +
 .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  |    1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c |    1 +
 include/drm/bridge/samsung-dsim.h             |  116 +
 12 files changed, 2195 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

