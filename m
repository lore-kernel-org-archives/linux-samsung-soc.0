From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] clk: samsung: Delete an error message for a failed memory
 allocation in exynos_register_cpu_clock()
Date: Wed, 27 Sep 2017 15:55:17 +0200
Message-ID: <19c81633-7110-260a-70c6-c55fad5607d6@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 15:46:53 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/samsung/clk-cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 6686e8ba61f9..d2c99d8916b8 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -457,8 +457,6 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 
 	cpuclk->cfg = kmemdup(cfg, sizeof(*cfg) * num_cfgs, GFP_KERNEL);
 	if (!cpuclk->cfg) {
-		pr_err("%s: could not allocate memory for cpuclk data\n",
-				__func__);
 		ret = -ENOMEM;
 		goto unregister_clk_nb;
 	}
-- 
2.14.1
