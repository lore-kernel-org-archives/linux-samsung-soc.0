From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/5] Fixes for Exynos5433 TM2 board
Date: Thu, 17 Nov 2016 09:57:56 +0100
Message-ID: <1479373081-11586-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161117085810eucas1p20d425d73d1c1e0de96d2995b96968de7@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45129 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbcKQI6P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 03:58:15 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS00GXH3KZA970@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 08:58:12 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi!

This is a collection of various fixes (mainly related to clocks
configuration) for Exynos 5433 based TM2 board dts. I'm really sorry
that I missed those issues in the initial board submission, but
most of those issue were detected while testing improved clocks driver.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:
v2:
- added missing assigned DRD/HOST usb clocks
- collected tags
- rearanged nodes in alphabetical order

Patch summary:

Marek Szyprowski (4):
  arm64: dts: exynos: Fix FSYS CMU parent clocks in Exynos 5433 SoC
  arm64: dts: exynos: Add missing parent clocks to audio block in Exynos
    5433 SoC
  arm64: dts: exynos: Move FSYS CMU configuration from Exynos5433 dtsi
    to TM2 dts
  arm64: dts: exynos: TM2 - remove unused UART3 and set clocks directly
    on CMU

Sylwester Nawrocki (1):
  arm64: dts: exynos: Assign parent clock of the clkout clock for TM2
    board

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 37 +++++++++++++++++++++++----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 34 +++---------------------
 2 files changed, 36 insertions(+), 35 deletions(-)

-- 
1.9.1
