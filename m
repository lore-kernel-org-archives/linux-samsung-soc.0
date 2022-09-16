Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B34AECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Sep 2022 18:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiIPSSV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIPSSU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:18:20 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05E7B6D27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:18 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w20so10111705ply.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=k78FpsGBN/9CeIU1dKf9WRueN2gjoM3jLsVKiTwXYEc=;
        b=LnfjjIyIPh+3f8ddwKxO+TR2Frx5uZqBCqP6sTW0OjI48HHSR3xSGc9FIKc57pg/6A
         XFksWfMYOCDVC37enuOm19iSbNL24GV3hQocdtl79w6jnWBK+UKsIhNsZup6Omr4mLu2
         oSmfTeGnC9mdBQ8f9CiGiGI6LX7vFRx1AG8Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=k78FpsGBN/9CeIU1dKf9WRueN2gjoM3jLsVKiTwXYEc=;
        b=b3snin5jpAKxSZBDkCbbWqR3Joy75VBAuflr3N0phg3OdIZZEocAZXARVbsMnM1am0
         zSlyOtnAezSXWYwbXC+cbjvQ6XenRq8jkOeH4MJeJb/SRInudamx+2eQNANvA6ZDo2KX
         p+oDb7FGJCkMtLouOI4xIqL5makS9rsZ4cmcSvzpRVgjACbU7vsPSiHkr83gfiZVRj9J
         YoyxKyjwlJ0fKIoL4DjQmcHsgpnRSQdt9njyz2aVpyorRsAeuRu3RuQp5r2qg7ZUo+id
         DWR4IH3PBOG3rpDLqeDUUKx8q493BxZXtdb3MXEu1ohc+yJ/jFustfq9TdkgkmZ1ofss
         OYXA==
X-Gm-Message-State: ACrzQf1LLC5VijTeMFqBrdXsPwDAbLXvbZ+KiEfdoLk3ARE5nBIo+C4s
        z858xhm9bCgdHeqmvxw3VWlHEw==
X-Google-Smtp-Source: AMsMyM6dVp0Kw2qBJOCCRGDf8xnWNPEduQGlVM8rdcg6mvP5PTRHLSW6yohoYvcNatfqAUUJbjf2ug==
X-Received: by 2002:a17:90b:4a0b:b0:202:8568:4163 with SMTP id kk11-20020a17090b4a0b00b0020285684163mr17830711pjb.217.1663352298404;
        Fri, 16 Sep 2022 11:18:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:18:17 -0700 (PDT)
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
Subject: [PATCH v5 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Fri, 16 Sep 2022 23:47:20 +0530
Message-Id: <20220916181731.89764-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

Previous v4 can be available here [1], repo on linux-next [2] and
Engicam i.Core MX8M Mini SoM boot log [3].

The final bridge supports both the Exynos and i.MX8MM DSI devices.

Changes for v3:
* bridge changes to support multi-arch
* updated and clear commit messages
* add hw_type via plat data
* removed unneeded quirk
* rebased on linux-next

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

Patch 0001:	Restore proper bridge chain in exynos_dsi

Patch 0002: 	Samsung DSIM bridge

Patch 0003:	PHY optional

Patch 0004:	OF-graph or Child node lookup

Patch 0005: 	DSI host initialization 

Patch 0006:	atomic check

Patch 0007:	PMS_P offset via plat data

Patch 0008:	atomic_get_input_bus_fmts

Patch 0009:	input_bus_flags

Patch 0010:	document fsl,imx8mm-mipi-dsim

Patch 0011:	add i.MX8MM DSIM support

[3] https://gist.github.com/openedev/22b2d63b30ade0ba55ab414a2f47aaf0
[2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v5
[1] https://patchwork.kernel.org/project/dri-devel/cover/20220829184031.1863663-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (10):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Handle proper DSI host initialization
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

Marek Szyprowski (1):
  drm: exynos: dsi: Restore proper bridge chain order

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1840 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
 include/drm/bridge/samsung-dsim.h             |  115 ++
 8 files changed, 2092 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

