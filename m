From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/2] Add support for Hardkernel's Odroid HC1 board
Date: Mon, 02 Oct 2017 08:39:33 +0200
Message-ID: <1506926375-5782-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20171002063944eucas1p2fa7c64b99c0b5d03429ab9e28f89010d@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34203 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbdJBGjs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Oct 2017 02:39:48 -0400
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

Changlelog:
v2:
- fixed incorrect names of thermal zones
- extended commit description

v1:
- initial version

Patch summary:

Marek Szyprowski (2):
  ARM: dts: exynos: Add support for Hardkernel's Odroid HC1 board
  ARM: exynos_defconfig: Enable UAS support for Odroid HC1 board

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 443 +++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 213 ++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 428 +-------------------
 arch/arm/configs/exynos_defconfig                  |   2 +-
 5 files changed, 659 insertions(+), 428 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-odroid-core.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5422-odroidhc1.dts

-- 
1.9.1
