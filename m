From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: exynos: Second pull for v5.1
Date: Tue, 19 Feb 2019 19:52:14 +0100
Message-ID: <20190219185214.5544-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit ec33745bccc8f336957c751f4153421cc9ef5a54:

  ARM: dts: exynos: Fix pinctrl definition for eMMC RTSN line on Odroid X2/U3 (2019-01-25 20:18:10 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.1-2

for you to fetch changes up to 625c731d1b2af487fc6be10b9a505699c045813a:

  ARM: dts: exynos: Add support for secondary DAI to Odroid XU4 (2019-02-18 20:52:25 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.1, part 2

1. Enable ADC on Odroid HC1 board.
2. Fix clkout register failure on Exynos3250.
3. Allow using earlycon on Arndale board.
4. Disable ARM PMU on Odroid XU3 Lite because it is locked by Trusted
   Firmware.
5. Add support for secondary DAI to Odroid XU3 and XU4 boards.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: exynos: Enable ADC on Odroid HC1

Marek Szyprowski (3):
      ARM: dts: exynos: Add minimal clkout parameters to Exynos3250 PMU
      ARM: dts: exynos: Add stdout path property to Arndale board
      ARM: dts: exynos: Disable ARM PMU on Odroid XU3-lite

Sylwester Nawrocki (2):
      ARM: dts: exynos: Add support for secondary DAI to Odroid XU3
      ARM: dts: exynos: Add support for secondary DAI to Odroid XU4

 arch/arm/boot/dts/exynos3250.dtsi                  | 3 +++
 arch/arm/boot/dts/exynos5250-arndale.dts           | 2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 5 +++++
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 6 ++++--
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 5 -----
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts    | 8 ++++++++
 arch/arm/boot/dts/exynos5422-odroidxu4.dts         | 4 +++-
 7 files changed, 24 insertions(+), 9 deletions(-)
