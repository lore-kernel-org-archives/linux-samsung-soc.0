Return-Path: <SRS0=oxPC=CM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB22C2BD11
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9998B206A5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Sep 2020 16:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgICQ5g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728688AbgICQ50 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:57:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBB53C061249
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2020 09:57:25 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kDsY5-0003Y5-GI; Thu, 03 Sep 2020 18:57:24 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kDsY3-005L33-GY; Thu, 03 Sep 2020 18:57:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Sep 2020 18:57:01 +0200
Message-Id: <20200903165717.1272492-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 00/16] drm/exynos: Convert driver to drm bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello,

the Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
the Exynos Decon. The driver for the LCDIF does not use the component
framework, but uses drm bridges.

This series converts the Exynos MIPI DSI into a drm bridge and makes it usable
with such drivers. Although the driver is converted, it still supports the
component framework API to stay compliant with the Exynos DRM driver.

Unfortunately, I don't have any Exynos SoC to actually test the series.  I
tested the driver with a few additional unfinished patches on the i.MX8M Mini
EVK, but somebody should definitely verify that the driver is still working on
Exynos hardware.

Patch 1 is a quick documentation fix.

Patches 2 to 6 implement the drm bridge interface.

Patches 7 to 12 rework the driver to make it easier to split platform specific
from common code.

Patches 13 and 14 add callbacks to handle the tearing effect interrupt and to
tell the Exynos DRM driver, if the MIPI DSI bridge is using command or video
mode. I am not too happy with these callbacks and any suggestion for a better
solution is very welcome.

Patches 15 and 16 finally split and move the drm bridge driver out of the
Exynos DRM driver.

Michael


Michael Tretter (16):
  drm/encoder: remove obsolete documentation of bridge
  drm/exynos: extract helper functions for probe
  drm/exynos: remove in_bridge_node from exynos_dsi
  drm/exynos: implement a drm bridge
  drm/exynos: convert encoder functions to bridge function
  drm/exynos: configure mode on drm bridge
  drm/exynos: get encoder from bridge whenever possible
  drm/exynos: use exynos_dsi as drvdata
  drm/exynos: call probe helper from bind
  drm/exynos: move dsi host registration to probe helper
  drm/exynos: shift register values to fields on write
  drm/exynos: use identifier instead of register offsets
  drm/exynos: add callback for tearing effect handler
  drm/exynos: add callback for enabling i80 mode
  drm/exynos: split out platform specific code
  drm/exynos: move bridge driver to bridges

 drivers/gpu/drm/bridge/Kconfig          |    7 +
 drivers/gpu/drm/bridge/Makefile         |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c   | 1797 ++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1843 ++---------------------
 include/drm/bridge/samsung-dsim.h       |   57 +
 include/drm/drm_encoder.h               |    1 -
 6 files changed, 1967 insertions(+), 1739 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.20.1

