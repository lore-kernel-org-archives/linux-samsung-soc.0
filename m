From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] Add support for Hardkernel's Odroid HC1 board
Date: Fri, 29 Sep 2017 13:33:00 +0200
Message-ID: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170929113313eucas1p285173d5410c7d0b07f209c76f0ffaeaf@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32906 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751590AbdI2LdR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:33:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi!

This patchset add support for Exynos5422 based Hardkernel's Odroid HC1
board. Odroid HC1 board is based on Odroid XU4 board, but it has no HDMI,
no eMMC, no build-in USB3.0 hub, no extension port pins, and no GPIO
button. USB3.0 ports are used for build-in JMicron USB to SATA bridge and
Gigabit R8152 ethernet chips. HC1 uses only passive cooling.

This patchset is based on current Krzysztof's next/dt branch.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (3):
  ARM: dts: exynos: Move audio clocks configuration to
    odroidxu3-audio.dtsi
  ARM: dts: exynos: Add support for Hardkernel's Odroid HC1 board
  ARM: exynos_defconfig: Enable UAS support for Odroid HC1 board

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443 +++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 217 ++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  |  13 +
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 440 +-------------------
 arch/arm/configs/exynos_defconfig                  |   2 +-
 6 files changed, 676 insertions(+), 440 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-odroid-core.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5422-odroidhc1.dts

-- 
1.9.1
