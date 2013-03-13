From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 3/4] clk: samsung: always allocate the clk_table
Date: Wed, 13 Mar 2013 15:00:08 +0100
Message-ID: <201303131500.08457.heiko@sntech.de>
References: <201303131458.18671.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:59148 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932623Ab3CMOAL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 10:00:11 -0400
In-Reply-To: <201303131458.18671.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

This is needed to allow looking up previous created clocks when
adding separate aliases to them.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes since v1:
adapt to the changes in patch 2/4

 drivers/clk/samsung/clk.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index ca04b9e..1ed5716 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -76,14 +76,14 @@ void __init samsung_clk_init(struct device_node *np, void __iomem *base,
 	}
 #endif
 
-	if (!np)
-		return;
-
-#ifdef CONFIG_OF
 	clk_table = kzalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
 	if (!clk_table)
 		panic("could not allocate clock lookup table\n");
 
+	if (!np)
+		return;
+
+#ifdef CONFIG_OF
 	clk_data.clks = clk_table;
 	clk_data.clk_num = nr_clks;
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
-- 
1.7.2.3
