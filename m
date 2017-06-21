From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/2] clk: ARM: dts: exynos: Fix hang on Odroid U3
Date: Wed, 21 Jun 2017 21:08:05 +0200
Message-ID: <20170621190807.14850-1-krzk@kernel.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Recent linux-next fails to boot on Odroid U3 (Exynos4412) because
of commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation
for PLL36XX clocks").

Patchset fixes it. Patches are independent although both are required
to fix the issue.

I will be taking DTS change.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  clk: samsung: audss: Fix silent hang on Exynos4412 due to disabled
    EPLL
  ARM: dts: exynos: Add clocks to audss block to fix silent hang on
    Exynos4412

 arch/arm/boot/dts/exynos4.dtsi         | 3 +++
 drivers/clk/samsung/clk-exynos-audss.c | 1 +
 2 files changed, 4 insertions(+)

-- 
2.9.3

