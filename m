Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C87C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiGTPwb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiGTPwa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:52:30 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDA94BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:30 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id l14-20020a17090a72ce00b001f20ed3c55dso2642167pjk.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KYWZwhb1ZSYMdId0x3rlbXi6AM1i5QxI3S7xvaz7eF8=;
        b=oJwEosghuEyW84bAjoYVaYX4vS8LQabWRNbFU/6Q9EmovdXw/CKLRqjMqEn/crpQAO
         cWcVXjz3iR98DiJV7aNuoka9yeY1GS9XD4rZEUEomDcWFqYDUdQjYFuP1WHark2/KjJc
         iZZfWdmpQfZmNl2fc8ujSCdtVbnLIp2QPT958=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KYWZwhb1ZSYMdId0x3rlbXi6AM1i5QxI3S7xvaz7eF8=;
        b=P37zzhADd7bwoa7SgweqMLWZS2GFhn0waYtAun8+WpBqOA4D4+45PwXeWPZQDvquzi
         G9279YAdj4NJ5NexfscJ4cMhzgeOb6ey/or6T39EuzazvYXWU/d3FKJIyNgb264Ycg8H
         dF6kasv4FBoav9p7u3lK7WeFYhXNIZtIHtTLQKVFT9SVY1ehEVoEQNfuZGt3hOGAWQYO
         Omg7nnSwyBbCEI1J5Vk1hmBOzswekQGO9o+TM4UzJJ70wEpFCDXREDBeX6WZA0M1kBT2
         dMXNP6y5q6w52XEq3IOOB8dgnsd3JzwPj+erorqmBYIqjMIgJyrUC+QsGjXro+GE9uvi
         da/A==
X-Gm-Message-State: AJIora8EO+Dq9m4Kbxj9KyxpmCdPSAaliC1u2pcYivlhuxopTwkbfPpm
        68J/KUBy6AdtY4q8FF/Otm8kow==
X-Google-Smtp-Source: AGRyM1vIlPt6mZ1DC9Q8SplUz9lA4D9c/ORKQb71HYgrzZMeOpaX7fVkWmaxn+AuVF+Vhv4zcJTvSg==
X-Received: by 2002:a17:90b:3890:b0:1f0:2abb:e7d1 with SMTP id mu16-20020a17090b389000b001f02abbe7d1mr6270480pjb.158.1658332349528;
        Wed, 20 Jul 2022 08:52:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:52:29 -0700 (PDT)
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
Subject: [PATCH v3 00/13] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Wed, 20 Jul 2022 21:21:57 +0530
Message-Id: <20220720155210.365977-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

Previous v2 can be available here [1].

The final bridge supports both the Exynos and i.MX8MM DSI devices.

On, summary this patch-set break the entire DSIM driver into
- platform specific glue code for platform ops, component_ops.
- common bridge driver which handle platform glue init and invoke.

Patch 0001:	Restore proper bridge chain in exynos_dsi

Patch 0002: 	Samsung DSIM bridge

Patch 0003:	Common lookup code for OF-graph or child

Patch 0004: 	plat_data quirk flag via driver_data

Patch 0005/11:  bridge fixes, atomic API's

Patch 0012:	document fsl,imx8mm-mipi-dsim

Patch 0013:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interested, please have a look on this repo [2]

[2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2 
[1] https://patchwork.kernel.org/project/dri-devel/cover/20220504114021.33265-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (12):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Handle platform init via driver_data
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
  drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add module init, exit
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

Marek Szyprowski (1):
  drm: exynos: dsi: Restore proper bridge chain order

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1850 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1717 +--------------
 include/drm/bridge/samsung-dsim.h             |  106 +
 8 files changed, 2042 insertions(+), 1654 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

