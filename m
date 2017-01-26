From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/3] Exynos5433/TM2: add clocks configuration for display
 subsystem
Date: Thu, 26 Jan 2017 13:37:51 +0100
Message-ID: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170126123805eucas1p23881b01fa3f9719e2bfea9cd5cf1b429@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58480 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752107AbdAZMiK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 07:38:10 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKE00C8F0FIYN20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 12:38:06 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello,

This patchset is a next step to add support for all power domains on
Exynos5433 SoCs. This patchset contains patches for initial clocks
configuration on TM2/TM2e boards. Till now display subsystem worked only
because the clock hierarchy has been configured by the bootloader.
However when power domains are added, such configuration might be lost
if the display power domain get turned off before display clock
controller's probe.

Patches have been generated on top of linux-next from 25th January 2017.

This is a part of a larger task, which goal is to add support for power
domains on Exynos5433 SoCs and TM2/TM2e boards. All patches needed to get it
working have been pushed to the following git repo:
https://git.linaro.org/people/marek.szyprowski/linux-srpol.git v4.10-next-tm2-pd

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:
v2:
 - corrected DISP PLL rate from 266MHz to 250MHz (TM2) and 278MHz (TM2e)
 - added a patch with PLL data for 250MHZ and 278MHz rates

v1:
 - initial version


Patch summary:

Marek Szyprowski (3):
  clk: samsung: exynos5433: Add IDs for PHYCLK_MIPIDPHY0_* clocks
  clk: samsung: exynos5433: Add data for 250MHz and 278MHz PLL rates
  arm64: dts: exynos: Add initial configuration for DISP clocks for
    TM2/TM2e

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 ---------
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 29 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 29 ++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5433.c               |  8 ++++--
 include/dt-bindings/clock/exynos5433.h             |  5 +++-
 5 files changed, 68 insertions(+), 15 deletions(-)

-- 
1.9.1
