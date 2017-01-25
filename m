From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] Exynos5433/TM2: add clocks configuration for display
 subsystem
Date: Wed, 25 Jan 2017 12:51:56 +0100
Message-ID: <1485345118-3082-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170125115214eucas1p23df3e1e72af0b30a06f5ef72eccb88fb@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50260 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751411AbdAYLwW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 06:52:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKC00DE13N3WO10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2017 11:52:15 +0000 (GMT)
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
domains on Exynos5433 SoCs / TM2 boards. All patches needed to get it
working have been pushed to the following git repo:
https://git.linaro.org/people/marek.szyprowski/linux-srpol.git v4.10-next-tm2-pd

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (2):
  clk: samsung: exynos5433: Add IDs for PHYCLK_MIPIDPHY0_* clocks
  arm64: dts: exynos: Add initial configuration for DISP clocks for
    TM2/TM2e

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 25 ++++++++++++++++++----
 drivers/clk/samsung/clk-exynos5433.c               |  6 ++++--
 include/dt-bindings/clock/exynos5433.h             |  5 ++++-
 3 files changed, 29 insertions(+), 7 deletions(-)

-- 
1.9.1
