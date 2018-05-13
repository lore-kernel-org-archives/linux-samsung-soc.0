From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/5] arm64: dts: exynos: Stuff for v4.18
Date: Sun, 13 May 2018 17:42:37 +0200
Message-ID: <20180513154238.22508-5-krzk@kernel.org>
References: <20180513154238.22508-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180513154238.22508-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.18

for you to fetch changes up to 8dd6203f32f20cb83469eb859efded9e403b3e9f:

  arm64: dts: exynos: Add mem-2-mem Scaler devices (2018-05-13 11:26:13 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v4.18

1. Fix DTC warnings.
2. Add mem-2-mem Scaler devices.

----------------------------------------------------------------
Andrzej Pietrasiewicz (1):
      arm64: dts: exynos: Add mem-2-mem Scaler devices

Krzysztof Kozlowski (2):
      arm64: dts: exynos: Move syscon poweroff and restart nodes under the PMU
      arm64: dts: exynos: Remove unneeded address space mapping for soc node

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 66 +++++++++++++++++++++++++-----
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 18 ++++----
 2 files changed, 65 insertions(+), 19 deletions(-)
