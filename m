From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 2/6] clk: samsung: fix error handling in pll register functions
Date: Wed, 10 Jul 2013 00:58:13 +0200
Message-ID: <201307100058.13941.heiko@sntech.de>
References: <201307100057.06061.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44529 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752375Ab3GIW6Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Jul 2013 18:58:16 -0400
In-Reply-To: <201307100057.06061.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, t.figa@samsung.com, Russell King <linux@arm.linux.org.uk>

kmalloc has its own error reporting when the allocation fails and
the register functions also should return the correct ERR_PTR(-ENOMEM)
when it happens.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/samsung/clk-pll.c |   30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 9153e46..0afaec6 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -79,10 +79,8 @@ struct clk * __init samsung_clk_register_pll35xx(const char *name,
 	struct clk_init_data init;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
 	init.ops = &samsung_pll35xx_clk_ops;
@@ -153,10 +151,8 @@ struct clk * __init samsung_clk_register_pll36xx(const char *name,
 	struct clk_init_data init;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
 	init.ops = &samsung_pll36xx_clk_ops;
@@ -227,10 +223,8 @@ struct clk * __init samsung_clk_register_pll45xx(const char *name,
 	struct clk_init_data init;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
 	init.ops = &samsung_pll45xx_clk_ops;
@@ -308,10 +302,8 @@ struct clk * __init samsung_clk_register_pll46xx(const char *name,
 	struct clk_init_data init;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
 	init.ops = &samsung_pll46xx_clk_ops;
@@ -385,10 +377,8 @@ struct clk * __init samsung_clk_register_pll2550x(const char *name,
 	struct clk_init_data init;
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
-	if (!pll) {
-		pr_err("%s: could not allocate pll clk %s\n", __func__, name);
-		return NULL;
-	}
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
 
 	init.name = name;
 	init.ops = &samsung_pll2550x_clk_ops;
-- 
1.7.10.4
