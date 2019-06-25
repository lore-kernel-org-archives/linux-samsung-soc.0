From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] ARM: dts: exynos: Second pull for v5.3
Date: Tue, 25 Jun 2019 21:34:49 +0200
Message-ID: <20190625193451.7696-2-krzk@kernel.org>
References: <20190625193451.7696-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625193451.7696-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit d2cac68e0d9b038da7207c0b63e1399c4f9f60c4:

  ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU (2019-06-11 20:37:21 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.3-2

for you to fetch changes up to 13efd80acaa4cdb61fde52732178ff9eb4141104:

  ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4 (2019-06-24 20:03:42 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.3, second round

1. Add camera flash to Galaxy S3 boards,
2. Fix PMU affinity interrupt warning on Exynos4,
3. Improve regulator configuration on Odroid XU3/XU4/HC1 family and
   Arndale Octa by disabling unneeded regulators and adding suspend
   configuration.  The suspend configuration brings significant reduce of
   energy usage in Suspend to RAM (e.g. 120 -> ~7 mA on Odroid HC1).
4. Add Mali nodes to Exynos3 and Exynos4.

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      ARM: dts: exynos: Add PMU interrupt affinity to Exynos4 boards
      ARM: dts: exynos: Fix language typo and indentation
      ARM: dts: exynos: Disable unused buck10 regulator on Odroid HC1 board
      ARM: dts: exynos: Add regulator suspend configuration to Arndale Octa board
      ARM: dts: exynos: Add regulator suspend configuration to Odroid XU3/XU4/HC1 family
      ARM: dts: exynos: Use proper regulator for eMMC memory on Arndale Octa
      dt-bindings: gpu: mali: Add Samsung compatibles for Midgard and Utgard
      ARM: dts: exynos: Add GPU/Mali 400 node to Exynos3250
      ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4

Simon Shields (1):
      ARM: dts: exynos: Add flash support to Galaxy S3 boards

 .../devicetree/bindings/gpu/arm,mali-midgard.txt   |  1 +
 .../devicetree/bindings/gpu/arm,mali-utgard.txt    |  1 +
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |  5 ++
 arch/arm/boot/dts/exynos3250-monk.dts              |  5 ++
 arch/arm/boot/dts/exynos3250-rinato.dts            |  5 ++
 arch/arm/boot/dts/exynos3250.dtsi                  | 33 ++++++++
 arch/arm/boot/dts/exynos4.dtsi                     | 38 ++++++++-
 arch/arm/boot/dts/exynos4210-origen.dts            |  5 ++
 arch/arm/boot/dts/exynos4210-trats.dts             |  4 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |  5 ++
 arch/arm/boot/dts/exynos4210.dtsi                  | 31 ++++++-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi        | 32 +++++++
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |  5 ++
 arch/arm/boot/dts/exynos4412-midas.dtsi            |  5 ++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |  5 ++
 arch/arm/boot/dts/exynos4412-prime.dtsi            |  7 ++
 arch/arm/boot/dts/exynos4412.dtsi                  | 27 ++++++
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 82 +++++++++++++++++-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 98 +++++++++++++++++++++-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  6 ++
 20 files changed, 392 insertions(+), 8 deletions(-)
