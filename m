From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: exynos: Pull for v5.4
Date: Wed, 11 Sep 2019 20:36:31 +0200
Message-ID: <20190911183632.4317-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Unfortunately the patches were applied right after closing the linux-next.

Best regards,
Krzysztof


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.4

for you to fetch changes up to 266cf9826de38efac416e744d42364ac7fa9dc5b:

  arm64: dts: exynos: Remove useless #address-cells property for GIC node (2019-09-05 21:27:17 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.4

1. Fix boot of Exynos7 due to wrong address/size of memory node,
2. Move GPU under /soc node,
3. Minor cleanup of #address-cells.

----------------------------------------------------------------
Marek Szyprowski (4):
      arm64: dts: exynos: Propagate address/size cell change to /memory node
      arm64: dts: exynos: Move GPU under /soc node for Exynos5433
      arm64: dts: exynos: Move GPU under /soc node for Exynos7
      arm64: dts: exynos: Remove useless #address-cells property for GIC node

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |   2 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 102 ++++++++++-----------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   2 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  23 +++--
 4 files changed, 64 insertions(+), 65 deletions(-)
