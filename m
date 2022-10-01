Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5959EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Oct 2022 08:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbiJAIHR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Oct 2022 04:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAIHQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 04:07:16 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6531419341E
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Oct 2022 01:07:15 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id bh13so5943681pgb.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Oct 2022 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=f2/sunB1LnJ5LmZFp20lgms1Dr4ed7SwWpkE0LxREhs=;
        b=eYE9fxG/g4fN3hv1Xsn4GWm0owQ1/xJHmjy2kVEJaeCobw9OD4Zb1hAcXfBG1uHR0f
         RWzUnNhi1jMP6L3FxYy0bzfeW/hHBrW+jDbVsuWpmRElnAm3QJIk6sonaTDLOTIMPqbi
         KVJWAHGiGg5gfY4npA4G+8jIuwM5n3t/o2vmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=f2/sunB1LnJ5LmZFp20lgms1Dr4ed7SwWpkE0LxREhs=;
        b=rd1Qseu2XQGv4GB/KAFi76SqYI4qGWxqaE7LisRz/4nAFroo+Vmh2m8Vf7WvsovA/v
         9wBoia0Nw6BbnKSmvcvfFeUo+As1b9KOHNhtan4Zd7COFQDYyt2TJm2UCCyJsXEg8aGO
         gweFzOvwpyVlqlPi8GPLQvvafgb94/paFtUbw1d+KiFu6b++yhzYbK5xcE/5vDCaK4vx
         Z3b1ZZH0mIl5qwW5ddBiWwQ3zrfwceLvEMm3yjbmd/AUabILJ7p/0RNic8y4VSB74INN
         v4zeFMo1Hne5d5mPn7MXiZMrv0snRI+Uvaro2k6qTm+YRiVUuwdj6w66KQVBw6iM29F/
         AfuQ==
X-Gm-Message-State: ACrzQf0FURzZ6hWGhogLSqTkphYHEI3niF4QiIgVaxMSAwkXw84oP8D4
        aimdZlbIj8/jD1VQcj+yx/38YuFW8ax3Seiw
X-Google-Smtp-Source: AMsMyM7JKh6uflQudzYdb0q2EMBIAzFGt0PglXp9ph2b8jjHveHvi3EIGRF0AvVL+Y2Tz6t/KcFuVA==
X-Received: by 2002:a65:4bc1:0:b0:439:e6a5:122a with SMTP id p1-20020a654bc1000000b00439e6a5122amr10666688pgr.443.1664611634883;
        Sat, 01 Oct 2022 01:07:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
        by smtp.gmail.com with ESMTPSA id c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 01:07:14 -0700 (PDT)
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
Subject: [PATCH v6 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Sat,  1 Oct 2022 13:36:40 +0530
Message-Id: <20221001080650.1007043-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8MM DSI devices.

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
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v6

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
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1769 ++--------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 8 files changed, 2111 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

