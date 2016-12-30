From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v3 0/2] Add support for the S6E3HA2 panel on TM2 board
Date: Fri, 30 Dec 2016 15:58:26 +0900
Message-ID: <1483081108-32055-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20161230065850epcas5p3ecad04edde7dfe1f2ad3c86815dcc377@epcas5p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53944 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751119AbcL3G6y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Dec 2016 01:58:54 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: robh@kernel.org, thierry.reding@gmail.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Purpose of this patch is add support for S6E3HA2 AMOLED panel on
the TM2 board. The first patch adds support for S6E3HA2 panel
device tree document and driver, the second patch add support for
S6E3HA2 panel device tree.

Changes for V3:

- In the DT binding document, made it clearly that the panel is a
  child node of dsi.
- Fix reset-gpio active from high to low.
- Is the OF graph saying related to [1]?
  Althogh the panel is a child of dsi, I think OF graph necessary.
  because if a remote-endpoint is not specified, the dsi also
  panel is not probed.
- The display-timings has been fixed to be provided by the device
  driver. however, I think display-timings is necessary in dts.
  because if dts does not have display-timings, dsi will not load.

[1]: Documentation/devicetree/bindings/media/video-interfaces.txt

Hoegeun Kwon (1):
  drm/panel: Add support for S6E3HA2 panel driver on TM2 board

Hyungwon Hwang (1):
  arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board

 .../bindings/display/panel/samsung,s6e3ha2.txt     |  58 ++
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  31 +
 drivers/gpu/drm/panel/Kconfig                      |   6 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 741 +++++++++++++++++++++
 5 files changed, 837 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha2.txt
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c

-- 
1.9.1
