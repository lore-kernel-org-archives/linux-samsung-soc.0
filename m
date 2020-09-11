Return-Path: <SRS0=sx2+=CU=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2E8C43461
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F283E22211
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Sep 2020 16:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgIKQx5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Sep 2020 12:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgIKPGQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:06:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE727C0617BC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Sep 2020 06:54:27 -0700 (PDT)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kGjVK-0007wN-46; Fri, 11 Sep 2020 15:54:18 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kGjVH-00FKnN-G9; Fri, 11 Sep 2020 15:54:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel@pengutronix.de, Laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sylvester.nawrocki@gmail.com, a.hajda@samsung.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 11 Sep 2020 15:53:57 +0200
Message-Id: <20200911135413.3654800-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH v2 00/16]  drm/exynos: Convert driver to drm bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
bridge and make it usable with other drivers. Although the driver is
converted, it still supports the component framework API to stay compliant
with the Exynos DRM driver.

The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
the Exynos Decon. The driver for the LCDIF does not use the component
framework, but uses drm bridges.

I don't have any Exynos SoC to actually test the series. I build a dummy to
test the bridge with a component driver, to make sure that at least the
initialization is working. Furthermore, tested the driver as a bridge with a
few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
should verify that the driver is still working on Exynos hardware.

I also changed the order of the patches to first make the driver more platform
independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
to 13) and finally expose the API, split the code and move the platform
independent driver to the bridges (patches 14 - 16). Hopefully this simplifies
testing/bisecting and helps me to understand potential error reports.

Also I added host_ops for attach/detach and the tearing effect handler to make
the calls into the platform code more visible.

Furthermore, the series should now apply to linux-next and correctly build the
exynos_defconfig.

Thanks,

Michael

Changelog:

v2:
- rebase on linux-next
- verify with exynos_defconfig
- fix crashes reported by Marek Szyprowski Exynos3250-based Rinato
- reorder patches
- add host_ops for platform specific code
- roughly test component framework integration with dummy

Michael Tretter (16):
  drm/encoder: remove obsolete documentation of bridge
  drm/exynos: remove in_bridge_node from exynos_dsi
  drm/exynos: use exynos_dsi as drvdata
  drm/exynos: extract helper functions for probe
  drm/exynos: move dsi host registration to probe
  drm/exynos: shift register values to fields on write
  drm/exynos: use identifier instead of register offsets
  drm/exynos: add host_ops callback for platform drivers
  drm/exynos: add callback for tearing effect handler
  drm/exynos: implement a drm bridge
  drm/exynos: convert encoder functions to bridge function
  drm/exynos: configure mode on drm bridge
  drm/exynos: get encoder from bridge whenever possible
  drm/exynos: add API functions for platform drivers
  drm/exynos: split out platform specific code
  drm/exynos: move bridge driver to bridges

 drivers/gpu/drm/bridge/Kconfig          |    9 +
 drivers/gpu/drm/bridge/Makefile         |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c   | 1790 +++++++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig          |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1927 ++---------------------
 include/drm/bridge/samsung-dsim.h       |   64 +
 include/drm/drm_encoder.h               |    1 -
 7 files changed, 2027 insertions(+), 1770 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.20.1

