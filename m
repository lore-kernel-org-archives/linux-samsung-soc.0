From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v5 1/5] clk: samsung: exynos5433: fix typo in imem divider
Date: Tue, 22 Jan 2019 10:02:28 +0100
Message-ID: <20190122090232.29194-2-k.konieczny@partner.samsung.com>
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
        <CGME20190122090249eucas1p161cfc1364fb8ee76d2d04383935e8f3b@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
Sender: stable-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix typo in imem clock divider 200 switched with 266.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 751e2c4fb65b..ea47f49abc7f 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
 			ENABLE_ACLK_TOP, 25,
 			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
+	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
 			ENABLE_ACLK_TOP, 24,
 			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
+	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
 			ENABLE_ACLK_TOP, 23,
 			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
-- 
2.20.0
