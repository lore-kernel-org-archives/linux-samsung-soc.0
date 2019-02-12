From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/4] dt-bindings: clock: exynos: Add ADC clock ID to Exynos5410
Date: Tue, 12 Feb 2019 18:50:50 +0100
Message-ID: <20190212175052.6310-3-krzk@kernel.org>
References: <20190212175052.6310-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212175052.6310-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add ID for TSADC clock to Exynos5410.  Choose the same value of ID as in
Exynos5420 to make it simpler/compatible in future (although clock
driver code is not shared).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/dt-bindings/clock/exynos5410.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
index 5b911ede0534..86c2ad56c5ef 100644
--- a/include/dt-bindings/clock/exynos5410.h
+++ b/include/dt-bindings/clock/exynos5410.h
@@ -45,6 +45,7 @@
 #define CLK_USI1		266
 #define CLK_USI2		267
 #define CLK_USI3		268
+#define CLK_TSADC		270
 #define CLK_PWM			279
 #define CLK_MCT			315
 #define CLK_WDT			316
-- 
2.17.1
