From: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>
Subject: [PATCH v3] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Date: Mon, 30 Nov 2015 09:52:35 +0000
Message-ID: <20151130095109.GA28767@jci-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <EF1EC10BBCA54D45A6C73362008CBA04@eurprd06.prod.outlook.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Remove unneeded variable used to store return value.

Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>

---
v3: Modified subject and changelog comments
---
---
 drivers/clk/samsung/clk-s3c2410-dclk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
index e9eb935..ec6fb14 100644
--- a/drivers/clk/samsung/clk-s3c2410-dclk.c
+++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
@@ -77,12 +77,11 @@ static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
 static int s3c24xx_clkout_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct s3c24xx_clkout *clkout = to_s3c24xx_clkout(hw);
-	int ret = 0;
 
 	s3c2410_modify_misccr((clkout->mask << clkout->shift),
 			      (index << clkout->shift));
 
-	return ret;
+	return 0;
 }
 
 static const struct clk_ops s3c24xx_clkout_ops = {
-- 
1.9.1
