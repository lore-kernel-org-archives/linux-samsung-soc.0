From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Improve power domains support for Exynos5250 SoCs
Date: Fri, 08 Dec 2017 15:53:53 +0100
Message-ID: <20171208145356.24152-1-m.szyprowski@samsung.com>
References: <CGME20171208145402eucas1p1abc434b9b0309fc6718ee25965cef30a@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41676 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754188AbdLHOyG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 09:54:06 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

This patchset adds support for 2 more power domains (MAU and G3D)
for Exynos5250 SoCs.

Patches have been generated on top of Linux v4.15-rc1.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (3):
  ARM: dts: exynos: Fix power domain node names for Exynos5250
  ARM: dts: exynos: Add audio power domain to Exynos5250
  ARM: dts: exynos: Add G3D power domain to Exynos5250

 arch/arm/boot/dts/exynos5250.dtsi | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

-- 
2.15.0
