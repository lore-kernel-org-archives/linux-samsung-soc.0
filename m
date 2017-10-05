From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v5 0/2] add Silicon Image SiI9234 driver
Date: Thu, 05 Oct 2017 16:07:09 +0200
Message-ID: <1507212431-5801-1-git-send-email-m.purski@samsung.com>
References: <CGME20171005140754eucas1p26437dba3d34f8ec461bb3393244904cf@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36578 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdJEOH6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 10:07:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, krzk@kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Maciej Purski <m.purski@samsung.com>

Hi everyone,

These patches are a continuation of work by Tomasz Stanislawski on sii9324 driver, which was described
in th following letter:
https://lists.freedesktop.org/archives/dri-devel/2014-April/057481.html

The main differences from the previous code are:
* driver moved to /gpu/drm/bridge/ and integrated with drm/bridge subsystem
* added filtering-out unsupported display modes
* changed gpio interface to up-to-date
* changed interrupt handling
* improve code style
* add hdmi and sii9324 to exynos4412-trats2 device tree

All comments are welcome.

Regards,
Maciej Purski

Changes in v5:
- fix checkpatch warnings
- fix gpios property in i2c-mhl

Changes in v4:
- change documentation to more accurate
- use msleep() instead of usleep() and usleep_range()
- improve code style

Changes in v3:
- change sii9234 device tree node name
- use defines from dt-bindings/pinctrl/samsung.h

Changes in v2:
- regulators used in driver now model all physical regulators
  used by the device
- substitute some of the magic values with macros
- improve coding style
- improve error handling in sii9234_probe()
- fix commit message

Maciej Purski (2):
  drm/bridge: add Silicon Image SiI9234 driver
  ARM: dts: exynos: Add HDMI and Sil9234 to Trats2 board

 .../devicetree/bindings/display/bridge/sii9234.txt |  49 +
 arch/arm/boot/dts/exynos4412-trats2.dts            | 112 +++
 drivers/gpu/drm/bridge/Kconfig                     |   8 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/sii9234.c                   | 996 +++++++++++++++++++++
 5 files changed, 1166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
 create mode 100644 drivers/gpu/drm/bridge/sii9234.c

-- 
2.7.4
