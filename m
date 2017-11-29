From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/6] Power domains support for Exynos5433 SoCs
Date: Wed, 29 Nov 2017 12:26:32 +0100
Message-ID: <20171129112638.15813-1-m.szyprowski@samsung.com>
References: <CGME20171129112648eucas1p18273a4a2176518171c22ee49f8bfd21b@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37115 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932237AbdK2L0w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 06:26:52 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

Hello,

This patchset is a final step to add support for all power domains
in Exynos5433 SoCs. This patchset contains patches which add definitions
of the power domains found in Exynos5433 SoCs. Finally all the
dependencies has been merged to v4.15-rc1, so the domains can be
instantiated in exynos5433.dtsi.

Patches have been generated on top of Linux v4.15-rc1.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:

v2:
- dropped exynos-pd patch, which has been already merged
- dropped FSYS power domain patch until the issues with SD card mode
  switch failure gets resolved

v1: https://www.spinics.net/lists/linux-samsung-soc/msg57719.html
- initial version


Patch summary:

Marek Szyprowski (6):
  arm64: dts: exynos: Add GSCL power domain to Exynos 5433 SoC
  arm64: dts: exynos: Add DISP power domain to Exynos 5433 SoC
  arm64: dts: exynos: Add MSCL power domain to Exynos 5433 SoC
  arm64: dts: exynos: Add MFC power domain to Exynos 5433 SoC
  arm64: dts: exynos: Add AUD power domain to Exynos5433 SoC
  arm64: dts: exynos: Add remaining power domains to Exynos5433 SoC

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 114 +++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

-- 
2.15.0
