From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 2/4] clk: samsung: remove np check in clock init
Date: Tue, 12 Mar 2013 00:44:00 +0100
Message-ID: <201303120044.00803.heiko@sntech.de>
References: <201303120042.09633.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39978 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753549Ab3CKXoD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 19:44:03 -0400
In-Reply-To: <201303120042.09633.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

This let to the suspend init never being reached on non-DT platforms.

Signed-off-by: Heiko Stueber <heiko@sntech.de>
---
 drivers/clk/samsung/clk.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index d36cdd5..1a5de69 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -57,8 +57,6 @@ void __init samsung_clk_init(struct device_node *np, void __iomem *base,
 		unsigned long nr_rdump)
 {
 	reg_base = base;
-	if (!np)
-		return;
 
 #ifdef CONFIG_OF
 	clk_table = kzalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
-- 
1.7.2.3
