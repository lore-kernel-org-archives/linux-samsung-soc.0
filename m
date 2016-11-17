From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/3] Media devices support for Exynos5433 TM2 board
Date: Thu, 17 Nov 2016 10:01:54 +0100
Message-ID: <1479373317-11711-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161117090207eucas1p2a928c452b520e75a9dae420fabfd9adb@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56675 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbcKQJCK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 04:02:10 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGS0068P3RL1680@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 09:02:09 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi!

This patchset adds support for various media devices found in Exynos 5433
SoC and enables them on TM2 board. Patches are prepared on top of my
previous patchset with fixes for Exynos 5433 TM2 board (see "Fixes for
Exynos5433 TM2 board" thread).

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:
v2:
- rearranged nodes in alphabetical order
- added irq type flags
- moved aliases to board dts
- unified order of clock-names and clocks properties


Patch summary:

Marek Szyprowski (3):
  arm64: dts: exynos: TM2 - add support for GScaler devices
  arm64: dts: exynos: TM2 - add support for JPEG codec device
  arm64: dts: exynos: TM2 - add support for MFC video codec device

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  26 ++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 123 ++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)

-- 
1.9.1
