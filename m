From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2 8/8] clk: apcs-msm8916: simplify probe cleanup by using
 devm
Date: Thu, 1 Nov 2018 09:21:51 +0200
Message-ID: <2e6cd9f1afae4f9e1216a6178a6987b11614f9c7.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1541054985.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Russell King <linux@armlinux.org.uk>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Huang Shijie <sjhuang@iluvatar.ai>, Akshu Agrawal <Akshu.Agrawal@amd.com>R
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, matti.vaittinen@fi.rohmeurope.com
List-Id: linux-samsung-soc@vger.kernel.org

use devm variant for of_provider registration.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/clk/qcom/apcs-msm8916.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index b1cc8dbcd327..f4e0c136ab1a 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -96,8 +96,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = of_clk_add_hw_provider(parent->of_node, of_clk_hw_simple_get,
-				     &a53cc->clkr.hw);
+	ret = devm_of_clk_add_parent_hw_provider(dev, of_clk_hw_simple_get,
+						 &a53cc->clkr.hw);
 	if (ret) {
 		dev_err(dev, "failed to add clock provider: %d\n", ret);
 		goto err;
@@ -118,7 +118,6 @@ static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
 	struct device *parent = pdev->dev.parent;
 
 	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
-	of_clk_del_provider(parent->of_node);
 
 	return 0;
 }
-- 
2.14.3
