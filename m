From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Media devices support for Exynos5433 TM2 board
Date: Wed, 16 Nov 2016 14:11:26 +0100
Message-ID: <1479301889-11393-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161116131137eucas1p1cedfa8741324b0c44154846aae1abe84@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16089 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752532AbcKPNLl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 08:11:41 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGQ00MPGKNEFY60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Nov 2016 13:11:38 +0000 (GMT)
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


Patch summary:

Marek Szyprowski (3):
  arm64: dts: exynos: TM2 - add support for GScaler devices
  arm64: dts: exynos: TM2 - add support for JPEG codec device
  arm64: dts: exynos: TM2 - add support for MFC video codec device

 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts |  23 +++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 140 ++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

-- 
1.9.1
