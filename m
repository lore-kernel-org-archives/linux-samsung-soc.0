From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] arm64: dts: exynos: Pull for v4.21
Date: Sun,  9 Dec 2018 12:49:10 +0100
Message-ID: <20181209114911.25194-4-krzk@kernel.org>
References: <20181209114911.25194-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209114911.25194-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.21

for you to fetch changes up to 9deffb5ee78e41e2a5d6c448874a24caec6467d0:

  arm64: dts: exynos: Add all CPUs in cooling maps (2018-11-18 15:18:42 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v4.21

1. Update DWC3 hardware modules to Exynos5433 specific variant.
2. Update cooling maps to include all CPU devices in multiple DTS files.

----------------------------------------------------------------
Marek Szyprowski (1):
      arm64: dts: exynos: Update DWC3 modules on Exynos5433 SoCs

Viresh Kumar (1):
      arm64: dts: exynos: Add all CPUs in cooling maps

 arch/arm64/boot/dts/exynos/exynos5433-tmu.dtsi | 36 +++++++++++++++++---------
 arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 24 ++++++++++++-----
 2 files changed, 42 insertions(+), 18 deletions(-)
