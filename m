Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D8CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Nov 2022 18:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiKJSkB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKJSkA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 13:40:00 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81FB1A807
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:39:59 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id c2so2174160plz.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2022 10:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ENiegKatEa49yjNORy5MxklDcwyC2/WB0nXjwNhQHE=;
        b=DRjRvbLqk7Md9E/fwhCV+NaMx8jh6SwebSkyHmHMt5RrLatuew7tLx1Mfzkb/N2QWf
         fG5v3UyXUVUjEbS6GyfoWhLZV1gnUw8r/w4NEvejqi9u+BaZVTkg3G2pS3i+FFLOj89E
         rMGoURtTmdxMgp+CmaK2wzUU6bUgsjhFD/AVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ENiegKatEa49yjNORy5MxklDcwyC2/WB0nXjwNhQHE=;
        b=4KZ4KrKkCQ5K6mg8CL/u1HVSf3JAGB33MYyTbVAzp1LsP1phVJ1gV/7HEAYBWE33rs
         VgaH6AODvupYnuUGb1fIzxf3Pkg6oxoP26ORXy8WxpOi+/RwU6ifHgYwRhLkFpcbRED4
         3uuUh3sAV+Y9dWFw+4YyKWoSi0TUL187CpHPis60PhDY2forstPzEM9VjOyZKBHNokLI
         sGvIddil+nsq03ASZcGrI7ueUTueivlQxwMYCqKNJKORjDhTjReLLzzfWo2+wPfjf9o1
         9TPwIVovZ8mOy/4ieReHN+kzp8/o0ZAK+NBZxSYdgNLQHUyKKC8ePTAbcRbMJHlSOJMl
         Mjjg==
X-Gm-Message-State: ACrzQf1bwvJcju0w8WG0lT2PDAQTy8zBH/Fu2vy3Peo3GRCHO+hbEjl9
        2/lCzJcs9T10vlCr3ylBVC+Bjg==
X-Google-Smtp-Source: AMsMyM6EoXwnrW0dDyRM3KLPMRLYkWlVwz2Zx7d0v+ZvtJa0rm5sA5GqlBQFKLxIRRnmcOmAAmt05w==
X-Received: by 2002:a17:902:c643:b0:186:9efc:67a1 with SMTP id s3-20020a170902c64300b001869efc67a1mr65112158pls.30.1668105599256;
        Thu, 10 Nov 2022 10:39:59 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:39:58 -0800 (PST)
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
Subject: [PATCH v8 00/14] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Fri, 11 Nov 2022 00:08:39 +0530
Message-Id: <20221110183853.3678209-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

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

Patch 0001:	Fix MIPI_DSI*_NO_* mode bits

Patch 0002:	Properly name HSA/HBP/HFP/HSE bits

Patch 0003: 	Samsung DSIM bridge

Patch 0004:	PHY optional

Patch 0005:	OF-graph or Child node lookup

Patch 0006: 	DSI host initialization 

Patch 0007:	atomic check

Patch 0008:	PMS_P offset via plat data

Patch 0009:	atomic_get_input_bus_fmts

Patch 0010:	input_bus_flags

Patch 0011:	document fsl,imx8mm-mipi-dsim

Patch 0012:	add i.MX8M Mini/Nano DSIM support

Patch 0013:	document fsl,imx8mp-mipi-dsim

Patch 0014:	add i.MX8M Plus DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v8

Any inputs?
Jagan.

Jagan Teki (13):
  drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
  drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Handle proper DSI host initialization
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1908 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +--------------
 include/drm/bridge/samsung-dsim.h             |  116 +
 8 files changed, 2162 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

