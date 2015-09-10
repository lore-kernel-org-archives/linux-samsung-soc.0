From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 11/12] clk: samsung: exynos7: Add missing fixed_clks to
 cmu_info
Date: Thu, 10 Sep 2015 14:14:36 +0530
Message-ID: <1441874677-24148-12-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40335 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753100AbbIJJCN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Sep 2015 05:02:13 -0400
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

FSYS0 fixed clocks are not added to fsys0_cmu_info, this make
some of the usb clocks as orphan. This fixes the same.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 189a453..d4c6e47 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -936,6 +936,8 @@ static struct samsung_gate_clock fsys0_gate_clks[] __initdata = {
 };
 
 static struct samsung_cmu_info fsys0_cmu_info __initdata = {
+	.fixed_clks		= fixed_rate_clks_fsys0,
+	.nr_fixed_clks		= ARRAY_SIZE(fixed_rate_clks_fsys0),
 	.mux_clks		= fsys0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
 	.gate_clks		= fsys0_gate_clks,
-- 
1.7.10.4
