From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/5] Fixes for Exynos5433 TM2 board
Date: Wed, 16 Nov 2016 14:06:50 +0100
Message-ID: <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161116130707eucas1p2bf1f2f6b02d360c0cd603d2e72a7ea35@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15756 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752206AbcKPNHL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:07:11 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ00KH9KFXAJ60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:07:09 +0000 (GMT)
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

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 21 +++++++++++++++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 34 ++++-----------------------
 2 files changed, 23 insertions(+), 32 deletions(-)

-- 
1.9.1
