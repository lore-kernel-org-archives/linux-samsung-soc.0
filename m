From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Exynos: add CPU performance counters
Date: Thu, 23 Nov 2017 15:34:28 +0100
Message-ID: <20171123143431.12434-1-m.szyprowski@samsung.com>
References: <CGME20171123143445eucas1p1fec892cbeaf16f5642eff952b8d9e1cb@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49744 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752699AbdKWOev (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 09:34:51 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marian Mihailescu <mihailescu2m@gmail.com>

Hi!

This patchset enables support for ARM PMU (Performance Monitoring Units)
available in all supported Exynos SoCs. ARM PMU nodes were missing in dts
for Exynos 4210, 4412, 5410, 542x, 5433 SoCs.

Tested on Odroid U3, Odroid XU3, Google Snow and TM2 boards.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (2):
  ARM: dts: exynos: Add CPU performance counters to Exynos4 boards
  ARM64: dts: exynos: Add CPU performance counters to Exynos5433 boards

Marian Mihailescu (1):
  ARM: dts: exynos: Add CPU perf counters to Exynos54xx boards

 arch/arm/boot/dts/exynos4210.dtsi          |  6 ++++++
 arch/arm/boot/dts/exynos4412.dtsi          |  6 ++++++
 arch/arm/boot/dts/exynos5410.dtsi          |  5 +++++
 arch/arm/boot/dts/exynos5420-cpus.dtsi     | 10 ++++++++++
 arch/arm/boot/dts/exynos5422-cpus.dtsi     | 10 ++++++++++
 arch/arm/boot/dts/exynos54xx.dtsi          | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 18 ++++++++++++++++++
 7 files changed, 75 insertions(+)

-- 
2.14.2
