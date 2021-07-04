Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE190C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A13016192B
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhGDJGq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhGDJGp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:06:45 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BE3C061762
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:04:09 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id kt19so9578680pjb.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTKmWZ3CVp6OOAYCiyLaCDGps1R2HQjeuLrAdsNm2oA=;
        b=UDC9ZLWAnBD/te5tkNc4neJrdsL39umnb6TeP5DVxcgX6VP1wc9JP051M8hMz8GF9C
         3PMZSFE7eMEduQqdDhaE6yZAMNT1kdQyQ7Xoidg6iu1lW8ZOQT3t9Rnqqo6q2foTQLii
         l/wW9qGcpF8BxYeozkF5e+ysR2VEEtjDL/K4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTKmWZ3CVp6OOAYCiyLaCDGps1R2HQjeuLrAdsNm2oA=;
        b=YYNHk+ZfEMH34/JVwwUCp9MpRlLv0igO54xhnrl4ou7Od6VDlOdImX9gln2/z3kpZ1
         1QTl5jDLNp7H5/TrB9tYVd3UJok8PHYlf9ARfMYQFg5XMR1AhYptFSr4Cj2eJinwAQcf
         ARtJttQAp9eg2Bskot4VxQ2MElrSaYhFiHRvhhynWEuIfZdX+QFZeplqTbxmM3QBbluF
         8dIsejEE4mWeOVPexfSE9KX+QJwdfd3wbA3wgZMCsCXSHgzXXpTQIH5lLiksEVKYabw+
         dFXIB5Ha47W4hO9k/+VXtkfJjKLrWML8qYLaQnwzV6eaqN5Y1o5icyEuiutOfIytGXY8
         EpKw==
X-Gm-Message-State: AOAM531JMhVEFZFWccI3cuNN3ps4gweCNN2t8VKomJZ9sgWEpZYtUfSt
        N9OkPLsuPBwoxwrKVMUa8iz4Rw==
X-Google-Smtp-Source: ABdhPJx7D44IjbUDdiCn9uNITwKa1N6d+4SXQCDPMDnwm/1x3fHOq9ypbbk1oXFGD/T4d0lggaK8jA==
X-Received: by 2002:a17:90a:b316:: with SMTP id d22mr8682362pjr.233.1625389448833;
        Sun, 04 Jul 2021 02:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:04:08 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [RFC PATCH 00/17] drm: bridge: Samsung MIPI DSIM bridge
Date:   Sun,  4 Jul 2021 14:32:13 +0530
Message-Id: <20210704090230.26489-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8MM DSI devices.

Right now bridge offers two sets of implementations.

A. With component_ops and exynos specific code exclusively for
   exynos dsi drivers and it's legacy bindings.

B. Without componenet_ops for newly implemented bridges and its
   users like i.MX8MM.

The future plan is to fix the implementation A) by dropping
component_ops and fixing exynos specific code in order to make
the bridge more mature to use and the same is mentioned in
drivers TODO.

Patch 0001 - 0006: Bridge conversion
Patch 0007 - 0017: Samsung MIPI DSIM bridge fixes, additions

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interest, please have a look on this repo
https://github.com/openedev/linux/tree/070421-imx8mm-dsim

Would appreciate anyone from the exynos team to test it on
the exynos platform?

Any inputs?
Jagan.

Jagan Teki (17):
  drm/exynos: dsi: Convert to bridge driver
  drm/exynos: dsi: Handle drm_device for bridge
  drm/exynos: dsi: Use the drm_panel_bridge API
  drm/exynos: dsi: Create bridge connector for encoder
  drm/exynos: dsi: Get the mode from bridge
  drm/exynos: dsi: Handle exynos specifics via driver_data
  drm: bridge: Move exynos_drm_dsi into bridges
  dt-bindings: display: bridge: Add Samsung MIPI DSIM bridge
  drm: bridge: samsung-dsim: Add module init, exit
  drm: bridge: samsung-dsim: Update the of_node for port(s)
  drm: bridge: samsung-dsim: Find the possible DSI devices
  dt-bindings: display: bridge: samsung,mipi-dsim: Add i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support
  drm: bridge: samsung-dsim: Add input_bus_flags
  drm: bridge: samsung-dsim: Move DSI init in bridge enable
  drm: bridge: samsung-dsim: Fix PLL_P offset
  drm: bridge: samsung-dsim: Add bridge mode_fixup

 .../display/bridge/samsung,mipi-dsim.yaml     | 360 +++++++++
 .../bindings/display/exynos/exynos_dsim.txt   |  90 ---
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/bridge/Kconfig                |  15 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../samsung-dsim.c}                           | 758 ++++++++++--------
 drivers/gpu/drm/exynos/Kconfig                |   9 -
 drivers/gpu/drm/exynos/Makefile               |   1 -
 8 files changed, 795 insertions(+), 451 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
 rename drivers/gpu/drm/{exynos/exynos_drm_dsi.c => bridge/samsung-dsim.c} (69%)

-- 
2.25.1

