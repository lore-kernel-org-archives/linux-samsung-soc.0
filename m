From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: exynos: Second round for v4.21
Date: Tue, 18 Dec 2018 21:10:03 +0100
Message-ID: <20181218201003.12806-2-krzk@kernel.org>
References: <20181218201003.12806-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218201003.12806-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 9deffb5ee78e41e2a5d6c448874a24caec6467d0:

  arm64: dts: exynos: Add all CPUs in cooling maps (2018-11-18 15:18:42 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.21-2

for you to fetch changes up to 74ebbdda7cecf789661c208faccbeef10a7f05da:

  arm64: dts: exynos: Add Bluetooth chip to TM2(e) boards (2018-12-17 20:23:32 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v4.21, part 2

Add IMEM clock controller (for Security SubSystem) and Bluetooth chip to
Exynos5433 TM2(e) boards.

----------------------------------------------------------------
Kamil Konieczny (1):
      arm64: dts: exynos: Add IMEM clock controller to Exynos5433

Marek Szyprowski (1):
      arm64: dts: exynos: Add Bluetooth chip to TM2(e) boards

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 15 +++++++++++++++
 2 files changed, 29 insertions(+)
