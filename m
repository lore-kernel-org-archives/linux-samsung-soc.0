From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/5] ARM: dts: exynos: Second pull for v5.4
Date: Wed,  4 Sep 2019 19:50:00 +0200
Message-ID: <20190904175002.10487-4-krzk@kernel.org>
References: <20190904175002.10487-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904175002.10487-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit bfb77169306d5d560a8b62eebaf6d69d02e8d152:

  ARM: dts: exynos: Add CAM power domain to Exynos5422/5800 (2019-08-12 19:02:59 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.4-2

for you to fetch changes up to 51c88919e52873c83f8be0c8f5d0ffd654f1ef4a:

  ARM: dts: exynos: Enable GPU/Mali T604 on Arndale board (2019-09-04 19:25:33 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.4, part 2

1. Fix Exynos542x Chromebooks boot with multi_v7 defconfig,
2. Add GPU (Mali) support to Exynos5250 boards,
3. Minor cleanup for Exynos3250 ADC.

----------------------------------------------------------------
Guillaume Gardet (4):
      ARM: dts: exynos: Fix min/max buck4 for GPU on Arndale board
      ARM: dts: exynos: Add GPU/Mali T604 node to Exynos5250
      ARM: dts: exynos: Enable GPU/Mali T604 on Chromebook Snow
      ARM: dts: exynos: Enable GPU/Mali T604 on Arndale board

Krzysztof Kozlowski (1):
      ARM: dts: exynos: Remove not accurate secondary ADC compatible

Marek Szyprowski (1):
      ARM: dts: exynos: Mark LDO10 as always-on on Peach Pit/Pi Chromebooks

 arch/arm/boot/dts/exynos3250.dtsi             |  3 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |  9 +++--
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  5 +++
 arch/arm/boot/dts/exynos5250.dtsi             | 47 +++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  1 +
 6 files changed, 62 insertions(+), 4 deletions(-)
