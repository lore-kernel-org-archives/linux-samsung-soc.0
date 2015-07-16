From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL] ARM: EXYNOS: dts: Improvements for 4.3
Date: Thu, 16 Jul 2015 11:41:58 +0900
Message-ID: <1437014519-19571-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28873 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753649AbbGPCmL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jul 2015 22:42:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Dear Kukjin,

DTS related improvements. Description along with a tag.
You can find them also on the lists with my reviewed-by.

Best regards,
Krzysztof


The following changes since commit a419d78a6f97f8c977fe55d5d590cd0654ec=
d1ee:

  ARM: dts: Exynos4210: add CPU OPP and regulator supply property (2015=
-07-13 21:16:05 +0900)

are available in the git repository at:

  https://github.com/krzk/linux.git tags/samsung-dt-4.3

for you to fetch changes up to cd0b551be420d49c2bde8dcf5ea147278dc89ffb=
:

  ARM: dts: Extend exynos5420-pinctrl nodes using labels instead of pat=
hs (2015-07-16 11:22:11 +0900)

----------------------------------------------------------------
Device Tree improvements for Exynos based boards:
1. Enable proper USB 3.0 regulators on Odroid XU3 board.
2. Set over-heat and over-voltage thresholds for Trats2 board fuel
   gauge.
3. Fix missing display frequency on Exynos3250 Rinato board
   (necessary to fix the display).
4. Enable thermal management and fan control on Odroid XU3 board.
   The speed of fan is adjusted to current temperature of SoC.
5. Cleanups and usage of label-notation for overriding nodes.

----------------------------------------------------------------
Anand Moon (5):
      ARM: dts: odroidxu3: Enable USB3 regulators
      ARM: dts: exynos5422-odroidxu3: Add pwm-fan node
      ARM: dts: exynos5422-odroidxu3: Enable TMU at Exynos5422 base
      ARM: dts: exynos5422-odroidxu3: Define default thermal-zones
      ARM: dts: exynos5422-odroidxu3: Enable thermal-zones

Andreas F=C3=A4rber (1):
      ARM: dts: Clean up exynos5410-smdk5410 indentation

Hyungwon Hwang (1):
      ARM: dts: fix the clock-frequency of exynos3250-rinato board's pa=
nel

Javier Martinez Canillas (4):
      ARM: dts: Include exynos5250-pinctrl after the nodes were defined
      ARM: dts: Extend exynos5250-pinctrl nodes using labels instead of=
 paths
      ARM: dts: Include exynos5420-pinctrl after the nodes were defined
      ARM: dts: Extend exynos5420-pinctrl nodes using labels instead of=
 paths

Krzysztof Kozlowski (2):
      ARM: dts: Set max17047 over heat and over voltage thresholds
      ARM: dts: Use labels for overriding nodes in exynos4210-universal

 arch/arm/boot/dts/exynos3250-rinato.dts            |    2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |  620 ++++----
 arch/arm/boot/dts/exynos4412-trats2.dts            |    3 +
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi          | 1600 ++++++++++--=
--------
 arch/arm/boot/dts/exynos5250.dtsi                  |    3 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |    6 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          | 1411 +++++++++---=
-----
 arch/arm/boot/dts/exynos5420.dtsi                  |    3 +-
 arch/arm/boot/dts/exynos5422-cpu-thermal.dtsi      |   59 +
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |   46 +
 10 files changed, 1930 insertions(+), 1823 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-cpu-thermal.dtsi
