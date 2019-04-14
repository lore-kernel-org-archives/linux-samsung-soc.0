From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] arm64: dts: exynos: Changes for v5.2
Date: Sun, 14 Apr 2019 17:48:04 +0200
Message-ID: <20190414154805.10188-2-krzk@kernel.org>
References: <20190414154805.10188-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414154805.10188-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.2

for you to fetch changes up to 77fc46976e0bfcd78d30fb4c9f0169752b4339c9:

  arm64: dts: exynos: Add SlimSSS to Exynos5433 (2019-03-20 19:29:57 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.2

1. Use proper clock rates for GSCALER module on TM2 boards.
2. Add clocks for local paths on DECON and GSCALER modules of
   Exynos5433.
3. Add Slim SecuritySubSystem to Exynos5433.

----------------------------------------------------------------
Andrzej Hajda (2):
      arm64: dts: exynos: configure GSCALER related clocks on TM2
      arm64: dts: exynos: add DSD/GSD clocks to DECONs and GSCALERs of Exynos5433

Kamil Konieczny (1):
      arm64: dts: exynos: Add SlimSSS to Exynos5433

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  6 ++++
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  6 ++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 34 +++++++++++++++-------
 3 files changed, 34 insertions(+), 12 deletions(-)
