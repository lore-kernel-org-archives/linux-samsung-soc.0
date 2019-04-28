From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: exynos: Second round for v5.2
Date: Sun, 28 Apr 2019 16:42:21 +0200
Message-ID: <20190428144221.11187-2-krzk@kernel.org>
References: <20190428144221.11187-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190428144221.11187-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 77fc46976e0bfcd78d30fb4c9f0169752b4339c9:

  arm64: dts: exynos: Add SlimSSS to Exynos5433 (2019-03-20 19:29:57 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.2-2

for you to fetch changes up to f36afdd0f53583759562cef3a8453919e3b86a7c:

  arm64: dts: exynos: Move fixed-clocks out of soc (2019-04-24 19:57:59 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.2, second round

DTC warning fixes: move fixed-clocks, timer and pmu nodes outside of soc
node.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: exynos: Move pmu and timer nodes out of soc
      arm64: dts: exynos: Move fixed-clocks out of soc

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 49 ++++++++++++-------------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 57 +++++++++++++++---------------
 2 files changed, 54 insertions(+), 52 deletions(-)
