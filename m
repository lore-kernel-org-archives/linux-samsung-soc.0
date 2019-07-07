From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: exynos: Late pull for v5.3
Date: Sun,  7 Jul 2019 20:01:15 +0200
Message-ID: <20190707180115.5562-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Late third pull of DTS changes, on top of previous pull request.
This contains important fix for stuff merged recently, one cleanup
and two minor fixups for regulators.

Best regards,
Krzysztof


The following changes since commit 13efd80acaa4cdb61fde52732178ff9eb4141104:

  ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4 (2019-06-24 20:03:42 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.3-3

for you to fetch changes up to 841ed60264b3d37d5bf3e32cff168920e4923f88:

  ARM: dts: exynos: Adjust buck[78] regulators to supported values on Arndale Octa (2019-07-01 20:28:37 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.3, third round

1. Fix imprecise abort on Exynos4210 caused by newly added Mali nodes,
2. Reorganize Mali nodes under /soc,
3. Adjust buck regulators voltages on Arndale Octa and Odroid XU3/XU4
   family to sane values.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: exynos: Adjust buck[78] regulators to supported values on Odroid XU3 family
      ARM: dts: exynos: Adjust buck[78] regulators to supported values on Arndale Octa

Marek Szyprowski (2):
      ARM: dts: exynos: Fix imprecise abort on Mali GPU probe on Exynos4210
      ARM: dts: exynos: Move Mali400 GPU node to "/soc"

 arch/arm/boot/dts/exynos3250.dtsi             | 66 +++++++++++++--------------
 arch/arm/boot/dts/exynos4.dtsi                | 50 ++++++--------------
 arch/arm/boot/dts/exynos4210.dtsi             | 20 ++++++++
 arch/arm/boot/dts/exynos4412.dtsi             | 22 +++++++++
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  6 +--
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 10 ++--
 6 files changed, 97 insertions(+), 77 deletions(-)
