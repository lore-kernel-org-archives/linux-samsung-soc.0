From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: exynos: Pull for v5.3
Date: Sun, 16 Jun 2019 19:55:13 +0200
Message-ID: <20190616175513.3681-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.3

for you to fetch changes up to d2cac68e0d9b038da7207c0b63e1399c4f9f60c4:

  ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU (2019-06-11 20:37:21 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.3

1. Fixes for minor warnings.
2. Enable ADC on Exynos5410 Odroid XU board.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: exynos: Move CPU OPP tables out of SoC node on Exynos5420
      ARM: dts: exynos: Raise maximum buck regulator voltages on Arndale Octa
      ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU

 arch/arm/boot/dts/exynos5410-odroidxu.dts     |   5 +
 arch/arm/boot/dts/exynos5410.dtsi             |   6 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  14 +-
 arch/arm/boot/dts/exynos5420.dtsi             | 234 +++++++++++++-------------
 arch/arm/boot/dts/exynos54xx.dtsi             |   9 +
 5 files changed, 142 insertions(+), 126 deletions(-)
