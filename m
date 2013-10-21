From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 00/12] Add DRM Exynos HDMI on SoCs from Exynos4 family
Date: Mon, 21 Oct 2013 16:18:19 +0200
Message-ID: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49828 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752626Ab3JUOSt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 10:18:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, t.figa@samsung.com, kishon@ti.com, sw0312.kim@samsung.com, inki.dae@samsung.com, rahul.sharma@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, mturquette@linaro.org, Tomasz Stanislawski <t.stanislaws@samsung.com>

This patchset adds support for HDMI at SoCs from Exynos4 family. The patches
are rebased on kishon/next. Additionally, The patchset contains small fixes to
PHY and CLK frameworks.  I preferred to keep all the patches together for the
first version of the RFC.

The interesting part might be 'propagation of clk_set_parent()'.  This feature
allows to remove the usage of artificial clocks in drivers.  Such a situation
happens for Exynos HDMI and 'mout_hdmi' where the clock is not even mentioned in
some versions of SoC's documentation. Since enabling and setting rate can be
propagated I think that clk_set_parent() should also be propagated. This would
simplify driver's code and make it less dependant on SoC's version.

Another interesting feature refers to simple PHY driver.  This driver register
a PHY interface that operates by setting a special bit in platform register.
This situation is very common in Exynos SoCs.  The current version supports
only one phy per node.  The code might be modified to support multiple phys
from single simple-phy provider to avoid creation of multiple nodes in DT.

All comments are welcome.

Regards,
Tomasz Stanislawski


Tomasz Stanislawski (12):
  clk: propagate parent change up one level
  clk: exynos4: export sclk_hdmiphy clock
  clk: exynos4: enable clk_set_parent() propagation for sclk_hdmi and
    sclk_mixer clocks
  phy: Add simple-phy driver
  phy: use of_phy_simple_xlate for NULL xlate function
  Revert "drm/exynos: add mout_hdmi clock in hdmi driver to change
    parent"
  drm: exynos: hdmi: use hdmiphy as PHY
  drm: exynos: hdmi: simplify extracting hpd-gpio from DT
  drm: exynos: add compatibles for HDMI and Mixer chips and exynos4210
    SoC
  arm: dts: exynos4: add i2c controller for HDMIPHY
  arm: dts: exynos4: add HDMI devices
  arm: dts: universal_c210: add HDMI devices

 .../devicetree/bindings/clock/exynos4-clock.txt    |    1 +
 arch/arm/boot/dts/exynos4.dtsi                     |   43 +++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |   53 ++++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |    4 +
 drivers/clk/clk.c                                  |    6 +
 drivers/clk/samsung/clk-exynos4.c                  |   10 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   41 +++----
 drivers/gpu/drm/exynos/exynos_mixer.c              |    3 +
 drivers/phy/Kconfig                                |    5 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-core.c                             |    2 +-
 drivers/phy/phy-simple.c                           |  128 ++++++++++++++++++++
 include/linux/clk-provider.h                       |    1 +
 13 files changed, 269 insertions(+), 29 deletions(-)
 create mode 100644 drivers/phy/phy-simple.c

-- 
1.7.9.5
