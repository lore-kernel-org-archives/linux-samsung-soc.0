From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: dts: exynos: DT for v5.4
Date: Fri, 16 Aug 2019 18:30:41 +0200
Message-ID: <20190816163042.6604-2-krzk@kernel.org>
References: <20190816163042.6604-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816163042.6604-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.4

for you to fetch changes up to bfb77169306d5d560a8b62eebaf6d69d02e8d152:

  ARM: dts: exynos: Add CAM power domain to Exynos5422/5800 (2019-08-12 19:02:59 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.4

1. Add AHCI to Exynos5250,
2. Add camera and GPU power domains to Exynos5422,
3. Minor cleanup.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: exynos: Use space after '=' in exynos4412-itop-scp-core

Marek Szyprowski (4):
      ARM: dts: exynos: Add port map to Exynos5250 AHCI node
      ARM: dts: exynos: Move MSC power domain to the right (sorted) place
      ARM: dts: exynos: Add G3D power domain to Exynos542x
      ARM: dts: exynos: Add CAM power domain to Exynos5422/5800

 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 18 +++++++++---------
 arch/arm/boot/dts/exynos5250.dtsi               |  1 +
 arch/arm/boot/dts/exynos5420.dtsi               | 13 ++++++++++---
 arch/arm/boot/dts/exynos5800.dtsi               |  9 +++++++++
 4 files changed, 29 insertions(+), 12 deletions(-)
