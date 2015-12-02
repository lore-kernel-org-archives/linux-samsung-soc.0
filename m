From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 8/9] ARM64: EXYNOS: dts: DeviceTree for ARM64 for v4.5
Date: Wed, 02 Dec 2015 10:39:45 +0900
Message-ID: <1449020386-20250-9-git-send-email-k.kozlowski@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>, k.kozlowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

Few changes for Espresso board.

Best regards,
Krzysztof


The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.5

for you to fetch changes up to fb026cb6524744c8bd0f133f4b0d8e2595d04e15:

  arm64: dts: Add reboot node for exynos7 (2015-11-18 22:47:16 +0900)

----------------------------------------------------------------
Samsung DeviceTree ARM64 updates and improvements for 4.5:
1. Add S2MPS15 PMIC node to Espresso board. This gives proper
   control over regulators, provides 32KHz clocks and RTC driver.
2. Enable HS200 mode operation on Espresso board for MMC0.
3. Add reboot capability (generic syscon-reboot).

----------------------------------------------------------------
Alim Akhtar (3):
      arm64: dts: Add S2MPS15 PMIC node on exynos7-espresso
      arm64: dts: Enable HS200 mode operation on exynos7-espresso
      arm64: dts: Add reboot node for exynos7

 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 282 +++++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/exynos7.dtsi         |   7 +
 2 files changed, 288 insertions(+), 1 deletion(-)
