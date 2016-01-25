From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RESEND v2 0/2] arm64: EXYNOS: Consolidate Exynos7 symbol
Date: Mon, 25 Jan 2016 09:50:19 +0900
Message-ID: <1453683021-6998-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Michael and Stephen,


Patch 2 *depends* on patch 1. I was thinking about merging this through
arm-soc tree after getting your acks.

Can you look at patch 1 here and share your comments?



Short introduction
==================
We don't need ARCH_EXYNOS7 symbol because all ARMv8 platforms should
fall under generic ARCH_EXYNOS. In the same time there is no sense
in building clocks for these ARMv8 SoCs on ARMv7 builds. In future
this will also influence PMU [1] driver.


Best regards,
Krzysztof

[1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg48090.html


Krzysztof Kozlowski (2):
  clk: samsung: Don't build ARMv8 clock drivers on ARMv7
  arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into ARCH_EXYNOS

 arch/arm64/Kconfig.platforms        | 11 ++---------
 arch/arm64/boot/dts/exynos/Makefile |  2 +-
 arch/arm64/configs/defconfig        |  2 +-
 drivers/clk/samsung/Kconfig         |  6 ++++++
 drivers/clk/samsung/Makefile        |  4 ++--
 5 files changed, 12 insertions(+), 13 deletions(-)

-- 
1.9.1

