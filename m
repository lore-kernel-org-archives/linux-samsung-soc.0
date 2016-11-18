From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 RESEND 0/3] Media devices support for Exynos5433 TM2 board
Date: Fri, 18 Nov 2016 13:23:10 +0100
Message-ID: <1479471793-13021-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44472 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752037AbcKRMXl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 07:23:41 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGU01ZCM7R6KGD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2016 21:23:38 +0900 (KST)
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
v2 resend:
- rebased on next/dt64

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
