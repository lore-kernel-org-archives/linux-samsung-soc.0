From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 04/18] clk: samsung: exynos4: Move local function to init
 section
Date: Wed, 11 May 2016 14:02:00 +0200
Message-ID: <1462968134-6085-4-git-send-email-k.kozlowski@samsung.com>
References: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1462968134-6085-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The local exynos4_get_xom() function is referenced only from other
init-level functions.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 7b3d0f975987..b599ca30d6d0 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1211,7 +1211,7 @@ static struct samsung_clock_alias exynos4x12_aliases[] __initdata = {
  * controller is first remapped and the value of XOM[0] bit is read to
  * determine the parent clock.
  */
-static unsigned long exynos4_get_xom(void)
+static unsigned long __init exynos4_get_xom(void)
 {
 	unsigned long xom = 0;
 	void __iomem *chipid_base;
-- 
1.9.1
