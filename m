Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D1C7EE2F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjCCOwc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjCCOwS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:52:18 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537481ADF8
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:52:15 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id n6so2906634plf.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XuZz6KPqTEYgEjSXk0X89qnpLQBY2hr14DLYpVgyC0=;
        b=b2x1xbYMS0fzkurVN7BlAN107IXZnf4o5KK2wEKB72P7R60B5LnunTaGEBJqXHcLv+
         GwBOIdKCKIihEi/xUD5195RsOvPHnqc2vzqVskUBj7ZDjSwJUMgrrV3W/rSwkZeECrUa
         XLs54ZZzwrnp+Ex+4VsnuLSrMm+njGgxrgDtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XuZz6KPqTEYgEjSXk0X89qnpLQBY2hr14DLYpVgyC0=;
        b=ESZgSNxLhkFp8TJX9CwlZJBcMa7b3ZtL4PlLmvx4jXU2/SWzw+s3eYllq8BGxA9FRG
         gRSaxJeM0nokbOLd5fV53t4QRdIcGiwkgrEsevrGsLDOwtJ+qMq42U1Qdi/Hyu/Fv/QK
         piQkUQr9VL3qzOeJej82Wx+liRKHREGjnnIzukP8UWAkfXsqpd3RZDuFiFE8AO23TJ7l
         RoWzZio3XQoJAT1qnGh+UC6UKJd0BwDTcgcf6ViJIhHSkd2M/ysy4dyO8NNc3HwJHOGV
         vACsOPspKffrPrY1lWTz5o/E+fJp9Q2+SQoRfhmJqsE51EDwIBbXS1Clb7ddfabGcBRw
         sqyA==
X-Gm-Message-State: AO0yUKUfKmRkbFeDrrEAxLpXXgRzZZfdW00jFRJNknzIEdSy5Ey8Dugv
        gWuJF0OpPLrJ0xkKhpUkBU2ZcA==
X-Google-Smtp-Source: AK7set+RyxnoRtAN/5w1RQuPA3xifYxhb1Al1xeOQoAKVYdwcKc3Y6dGXY3Jty7D/gA7u3ldgsRpEg==
X-Received: by 2002:a05:6a20:b712:b0:cc:a1dd:d0c1 with SMTP id fg18-20020a056a20b71200b000cca1ddd0c1mr2233861pzb.50.1677855134745;
        Fri, 03 Mar 2023 06:52:14 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:52:14 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Date:   Fri,  3 Mar 2023 20:21:22 +0530
Message-Id: <20230303145138.29233-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Inki Dae: please note that this series added on top of exynos-drm-next
since few exynos dsi changes are not been part of drm-misc-next.
Request you to pick these via exynos-drm-next, or let me know if you
have any comments?

Patch 0001 - 0002: find child DSI bridge and panel

Patch 0003 - 0004: optional PHY, PMS_P offset

Patch 0005       : introduce hw_type

Patch 0006	 : fixing host init

Patch 0007	 : atomic_check

Patch 0008	 : input_bus_flags

Patch 0009	 : atomic_get_input_bus_fmts

Patch 0010 - 0011: component vs bridge

Patch 0012	 : DSIM bridge

Patch 0013 - 0014: i.MX8M Mini/Nano

Patch 0015 - 0016: i.MX8M Plus

Changes for v15:
- drop drm_of helpers
- re-added find DSI bridge/Panel helper in dsim
- collect RB from Marek V
- fixed leading underscore in function names
- commit messages updated
- rebased on exynos-drm-next

Changes for v13:
- remove devm call for DSI panel or bridge finding
- rebased on drm-misc-next

Changes for v12:
- collect RB from Marek V
- add te_irq_handler hook
- fix comments from Marek V
- update atomic_get_input_bus_fmts logic

Changes for v11:
- collect RB from Frieder Schrempf
- collect ACK from Rob
- collect ACK from Robert
- fix BIT macro replacements
- fix checkpatch --strict warnings
- fix unneeded commit text
- drop extra lines

Changes for v10:
- rebase on drm-misc-next
- add drm_of_dsi_find_panel_or_bridge
- add devm_drm_of_dsi_get_bridge
- fix host initialization (Thanks to Marek Szyprowski)
- rearrange the tiny patches for easy to review
- update simple names for enum hw_type
- add is_hw_exynos macro
- rework on commit messages

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
https://github.com/openedev/kernel/tree/imx8mm-dsi-v15

v13:
https://lore.kernel.org/all/20230227113925.875425-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (14):
  drm: exynos: dsi: Drop explicit call to bridge detach
  drm: exynos: dsi: Lookup OF-graph or Child node devices
  drm: exynos: dsi: Mark PHY as optional
  drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
  drm: exynos: dsi: Introduce hw_type platform data
  drm: exynos: dsi: Add atomic check
  drm: exynos: dsi: Add input_bus_flags
  drm: exynos: dsi: Add atomic_get_input_bus_fmts
  drm: exynos: dsi: Consolidate component and bridge
  drm: exynos: dsi: Add host helper for te_irq_handler
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Szyprowski (1):
  drm: exynos: dsi: Handle proper host initialization

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1965 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1817 +--------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 8 files changed, 2190 insertions(+), 1732 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

