From: "Mutharaju, Prasanna (P.)" <mkarthi3@visteon.com>
Subject: [PATCH v3] clk: s3c2410: removed unneeded variable in
 s3c24xx_clkout_set_parent
Date: Mon, 30 Nov 2015 07:52:22 +0000
Message-ID: <20151130075219.GA27737@jci-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-am1on0141.outbound.protection.outlook.com ([157.56.112.141]:11670
	"EHLO emea01-am1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752518AbbK3Hw1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 02:52:27 -0500
Content-Language: en-US
Content-ID: <7FFF97F83E698945B1CD4A4112EC2C88@eurprd06.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

From: Prasanna Karthik <mkarthi3@visteon.com>

Remove unneeded variable used to store return value.
---
v3: Modified subject and changelog comments
---

Signed-off-by: Prasanna Karthik <mkarthi3@visteon.com>
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
