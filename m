From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/3] clk/dts: s2mps11: Fix matching as module
Date: Wed, 25 Jul 2018 17:55:14 +0200
Message-ID: <20180725155517.4872-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The DTS patches depend on 1st clock patch.  I will take them through
samsung-soc tree in next release.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  clk: s2mps11: Fix matching when built as module and DT node contains
    compatible
  ARM: dts: exynos: Add compatible for s2mps11 clocks node on Exynos542x
  ARM: dts: exynos: Add compatible for s5m8767 clocks node on Itop Core

 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi |  1 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts   |  1 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts       |  1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi   |  1 +
 drivers/clk/clk-s2mps11.c                       | 30 +++++++++++++++++++++++++
 5 files changed, 34 insertions(+)

-- 
2.14.1
