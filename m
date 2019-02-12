From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/4] clk/ARM: exynos: Add ADC to Exynos5410 (Odroid XU)
Date: Tue, 12 Feb 2019 18:50:48 +0100
Message-ID: <20190212175052.6310-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The DTS patch depends on bindings header with clock ID.  I will take it
through samsung-soc for consecutive release.


Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  dt-bindings: clock: exynos: Put CLK_UART3 in order
  dt-bindings: clock: exynos: Add ADC clock ID to Exynos5410
  clk: samsung: exynos5410: Add gate clock for ADC
  ARM: dts: exynos: Add ADC node to Exynos5410 and Odroid XU

 arch/arm/boot/dts/exynos5410-odroidxu.dts |  5 +++++
 arch/arm/boot/dts/exynos5410.dtsi         |  6 ++++++
 arch/arm/boot/dts/exynos5420.dtsi         | 18 ++++++------------
 arch/arm/boot/dts/exynos54xx.dtsi         |  9 +++++++++
 drivers/clk/samsung/clk-exynos5410.c      |  1 +
 include/dt-bindings/clock/exynos5410.h    |  3 ++-
 6 files changed, 29 insertions(+), 13 deletions(-)

-- 
2.17.1
