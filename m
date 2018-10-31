From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH 3/8] clk: clk-s3c2410-dclk: clean up clkdev lookup leak
Date: Wed, 31 Oct 2018 10:31:48 +0200
Message-ID: <f1d3f6d26c2731050b4be90c32397c62e4dc31a8.1540970653.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1540970653.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1540970653.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Russell King <linux@armlinux.org.uk>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Huang Shijie <sjhuang@iluvatar.ai>, Akshu Agrawal <Akshu.Agrawal@amd.com>R
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, matti.vaittinen@fi.rohmeurope.com
List-Id: linux-samsung-soc@vger.kernel.org

Use devm variant of clkdev lookup registration in order to avoid
clkdev lookup leak at device remove.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/clk/samsung/clk-s3c2410-dclk.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
index 0d92f3e5e3d9..07798debfec4 100644
--- a/drivers/clk/samsung/clk-s3c2410-dclk.c
+++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
@@ -309,16 +309,17 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 			goto err_clk_register;
 		}
 
-	ret = clk_hw_register_clkdev(clk_table[MUX_DCLK0], "dclk0", NULL);
+	ret = devm_clk_hw_register_clkdev(&pdev->dev, clk_table[MUX_DCLK0],
+					  "dclk0", NULL);
 	if (!ret)
-		ret = clk_hw_register_clkdev(clk_table[MUX_DCLK1], "dclk1",
-					     NULL);
+		ret = devm_clk_hw_register_clkdev(&pdev->dev,
+				clk_table[MUX_DCLK1], "dclk1", NULL);
 	if (!ret)
-		ret = clk_hw_register_clkdev(clk_table[MUX_CLKOUT0],
-					     "clkout0", NULL);
+		ret = devm_clk_hw_register_clkdev(&pdev->dev,
+				clk_table[MUX_CLKOUT0], "clkout0", NULL);
 	if (!ret)
-		ret = clk_hw_register_clkdev(clk_table[MUX_CLKOUT1],
-					     "clkout1", NULL);
+		ret = devm_clk_hw_register_clkdev(&pdev->dev,
+				clk_table[MUX_CLKOUT1], "clkout1", NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register aliases, %d\n", ret);
 		goto err_clk_register;
-- 
2.14.3
