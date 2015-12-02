From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 3/9] ARM64: EXYNOS: clk: Clock dependency for ARM64 for v4.5
Date: Wed, 02 Dec 2015 10:39:40 +0900
Message-ID: <1449020386-20250-4-git-send-email-k.kozlowski@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>, k.kozlowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

Dependency for soc64 changes.

Best regards,
Krzysztof


The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-arm64-symbols-4.5

for you to fetch changes up to 8c2a90ed18a74e8b9cdbba679403faa44d6024fc:

  clk: samsung: Don't build ARMv8 clock drivers on ARMv7 (2015-11-22 19:25:29 +0900)

----------------------------------------------------------------
Remove CONFIG_ARCH_EXYNOS7 symbol from Samsung clocks and instead
build all drivers for ARM64 SoCs under CONFIG_EXYNOS_ARM64_COMMON_CLK.
After the commit there will be no more users of CONFIG_ARCH_EXYNOS7
except ARM64 mach code.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      clk: samsung: Don't build ARMv8 clock drivers on ARMv7

 drivers/clk/samsung/Kconfig  | 6 ++++++
 drivers/clk/samsung/Makefile | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)
