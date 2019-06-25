From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] arm64: dts: exynos: Pull for v5.3
Date: Tue, 25 Jun 2019 21:34:50 +0200
Message-ID: <20190625193451.7696-3-krzk@kernel.org>
References: <20190625193451.7696-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625193451.7696-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.3

for you to fetch changes up to 4dc2a25d058d71f39e41da986777327b423b92f1:

  arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7 (2019-06-24 19:52:48 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.3

Add Mali nodes to Exynos3 and Exynos4.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: exynos: Add GPU/Mali T760 node to Exynos5433
      arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  5 +++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 51 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  5 +++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            | 11 +++++
 4 files changed, 72 insertions(+)
