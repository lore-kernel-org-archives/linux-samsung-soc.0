From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: exynos: Changes for v5.2
Date: Sun, 14 Apr 2019 17:48:03 +0200
Message-ID: <20190414154805.10188-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.2

for you to fetch changes up to 8cc76b1c75722196fb3d7ffe67cbfeb721a7b0e3:

  ARM: dts: exynos: Remove console argument from bootargs (2019-04-10 18:13:31 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.2

1. Use proper ADC on Exynos4412.
2. Extend the Exynos5420 Arndale Octa board with: CPU cooling maps,
   unused regulators, ADC and UHS-I SD card support.  Beside that adjust
   regulators to proper level and add always-on when needed.
3. Extend the Exynos5260: high speed I2C and proper external interrupts.
   Also fix shared external interrupt line and use better PLL for MMC
   clocks.
4. Fix audio recording (broken around v5.1) and microphone recording
   (since v4.14) on Exynos5422 Odroid XU3 boards.
5. Minor cleanups (stdout-path and bootargs).

----------------------------------------------------------------
Benjamin Drung (1):
      ARM: dts: exynos: Fix spelling mistake of EXYNOS5420

Krzysztof Kozlowski (13):
      ARM: dts: exynos: Use ADC for Exynos4x12 on Exynos4412
      ARM: dts: exynos: Document regulator used by ADC on Odroid U3
      ARM: dts: exynos: Use stdout path property on Arndale Octa board
      ARM: dts: exynos: Add unused PMIC regulators on Arndale Octa board
      ARM: dts: exynos: Add CPU cooling on Arndale Octa
      ARM: dts: exynos: Order nodes alphabetically in Arndale Octa
      ARM: dts: exynos: Enable ADC on Arndale Octa
      ARM: dts: exynos: Adjust ldo23 and ldo27 to lower levels on Arndale Octa
      ARM: dts: exynos: Add support for UHS-I SD cards on Arndale Octa
      ARM: dts: exynos: Extend the eMMC node on Arndale Octa
      ARM: dts: exynos: Always enable necessary APIO_1V8 and ABB_1V8 regulators on Arndale Octa
      ARM: dts: exynos: Use stdout-path property instead of console in bootargs
      ARM: dts: exynos: Remove console argument from bootargs

Stuart Menefy (4):
      ARM: dts: exynos: Use bustop PLL as the source for MMC clocks on Exynos5260
      ARM: dts: exynos: Add high speed I2C ports for Exynos5260
      ARM: dts: exynos: Add interrupts for dedicated EINTs on Exynos5260
      ARM: dts: exynos: Fix interrupt for shared EINTs on Exynos5260

Sylwester Nawrocki (2):
      ARM: dts: exynos: Fix audio routing on Odroid XU3
      ARM: dts: exynos: Fix audio (microphone) routing on Odroid XU3

 arch/arm/boot/dts/exynos4210-origen.dts           |   4 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts         |   4 +-
 arch/arm/boot/dts/exynos4210-trats.dts            |   4 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts   |   4 +-
 arch/arm/boot/dts/exynos4412-odroidu3.dts         |   5 +
 arch/arm/boot/dts/exynos4412-origen.dts           |   3 +-
 arch/arm/boot/dts/exynos4412-smdk4412.dts         |   4 +-
 arch/arm/boot/dts/exynos4412-trats2.dts           |   3 +-
 arch/arm/boot/dts/exynos4412.dtsi                 |   2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts         |   3 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi         |  16 +
 arch/arm/boot/dts/exynos5260-xyref5260.dts        |   2 +-
 arch/arm/boot/dts/exynos5260.dtsi                 |  82 ++++-
 arch/arm/boot/dts/exynos5410-smdk5410.dts         |   2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts     | 364 +++++++++++++++++++++-
 arch/arm/boot/dts/exynos5420-smdk5420.dts         |   3 +-
 arch/arm/boot/dts/exynos5420.dtsi                 |   2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi |   5 +-
 18 files changed, 477 insertions(+), 35 deletions(-)
