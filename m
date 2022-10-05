Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751B5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiJEPNW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbiJEPNV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2022 11:13:21 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C11B6E2C3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Oct 2022 08:13:20 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id n198so1709740iod.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Oct 2022 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1b/OkZVE0RzV7zia8rRogaQ7aQF3pfaZimR6lGLDog=;
        b=diIXyEYNda1xcH4QZUqkqsVHDjzHdPiYi9gt6Jmkp2mv7z+f8ZrI/b5LM0FluhspRk
         ub/ZRGjbZQKfROu3PD7L/YiJ9Y1vMLd3dkFzvGlbzcGouEVBNSHK0mDAf4vdONi9H7tw
         +v36EKHZyYYcQX/xQZYkrO13nqD6GB08UzEWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1b/OkZVE0RzV7zia8rRogaQ7aQF3pfaZimR6lGLDog=;
        b=wYdOmuWw5waQKoESJ5mr8izehxkk7IiwLAthMDehr1k/3YRy9VOJ65UTzZi0x3muzb
         ccBMaHaA2tplsnYxrpyh3MG2KTJUwZoiHpL9QjqffbRdSRyeDCU5JhVuoYI4G9rSm2id
         8EBYncRf3fpcKGOume6eE49/2AXj4CV5ryCVD5XFdzIUE27m7s+oSCggBEYtsFLDPTcO
         9T3H2sttdxrs7TBX2jUiq/zgLlySZ4IRH39hIPu0AMaJgyDOL/yx32rKn2vKUdLzejk8
         VVQdL1NmbhNI1evmmpSQrICH+cMdHvPkosgLId+Z4A2n1H6eDGl+WyGsLHLuAGF4hbMc
         rVLw==
X-Gm-Message-State: ACrzQf0VPKcNYLLLsz0ZlhuPbc/sPFxLpaFN3dJjr6K/SFy2J6AsMf5Y
        cZaHr+G76CE8WfO4J9aq7IJAYw==
X-Google-Smtp-Source: AMsMyM7yCcF+7doyamms1Xy0nXKGpHXASuNpsqSYFXaX4PPlbtMRZNiDUYYHW+R3KkO1lPSxdNsMDA==
X-Received: by 2002:a05:6638:13ca:b0:35a:7ece:3c6a with SMTP id i10-20020a05663813ca00b0035a7ece3c6amr54330jaj.318.1664982799364;
        Wed, 05 Oct 2022 08:13:19 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
        by smtp.gmail.com with ESMTPSA id w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:13:18 -0700 (PDT)
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
Subject: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Wed,  5 Oct 2022 20:42:59 +0530
Message-Id: <20221005151309.7278-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8MM DSI devices.

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

Patch 0001: 	Samsung DSIM bridge

Patch 0002:	PHY optional

Patch 0003:	OF-graph or Child node lookup

Patch 0004: 	DSI host initialization 

Patch 0005:	atomic check

Patch 0006:	PMS_P offset via plat data

Patch 0007:	atomic_get_input_bus_fmts

Patch 0008:	input_bus_flags

Patch 0009:	document fsl,imx8mm-mipi-dsim

Patch 0010:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7

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

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 8 files changed, 2108 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

