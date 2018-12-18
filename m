From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: exynos: Second round for v4.21
Date: Tue, 18 Dec 2018 21:10:02 +0100
Message-ID: <20181218201003.12806-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 57b13b8b34002ce8f1d822ea05f0a84e5bc3a64a:

  ARM: dts: exynos: remove display-port node from Arndale (2018-12-06 19:47:15 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.21-2

for you to fetch changes up to 8ac686d7dfed721102860ff2571e6b9f529ae81a:

  ARM: dts: exynos: Specify I2S assigned clocks in proper node (2018-12-13 21:56:07 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v4.21, part 2

1. Add missing CPUs in cooling maps for Odroid X2 (missed in previous
   round of fixups).
2. Fix clock configuration in audio subsystem on Odroid XU3/XU4.

----------------------------------------------------------------
Markus Reichl (1):
      ARM: dts: exynos: Add missing CPUs in cooling maps for Odroid X2

Sylwester Nawrocki (1):
      ARM: dts: exynos: Specify I2S assigned clocks in proper node

 arch/arm/boot/dts/exynos4412-prime.dtsi           | 6 ++++--
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 9 ++++-----
 arch/arm/boot/dts/exynos5422-odroidxu4.dts        | 9 ++++-----
 3 files changed, 12 insertions(+), 12 deletions(-)
