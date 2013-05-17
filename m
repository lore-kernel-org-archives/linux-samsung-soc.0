From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] clk: exynos5250: Add sclk_mpll to the parent list of mout_cpu clock
Date: Fri, 17 May 2013 11:25:53 +0530
Message-ID: <1368770153-29041-3-git-send-email-tushar.behera@linaro.org>
References: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, patches@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

'mout_mpll' is added the list of parent clocks for 'mout_cpu'.
'mout_mpll' is an alias to the clock 'sclk_mpll'. Hence 'sclk_mpll'
should be added to the list of parent clocks.

This results in an error when cpufreq driver for EXYNOS5250 tries to
set 'mout_mpll' as a parent for 'mout_cpu'.

clk_set_parent: clk sclk_mpll can not be parent of clk mout_cpu

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 drivers/clk/samsung/clk-exynos5250.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 05d099d..b6d79c0 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -155,7 +155,7 @@ static __initdata unsigned long exynos5250_clk_regs[] = {
 
 /* list of all parent clock list */
 PNAME(mout_apll_p)	= { "fin_pll", "fout_apll", };
-PNAME(mout_cpu_p)	= { "mout_apll", "mout_mpll", };
+PNAME(mout_cpu_p)	= { "mout_apll", "sclk_mpll", };
 PNAME(mout_mpll_fout_p)	= { "fout_mplldiv2", "fout_mpll" };
 PNAME(mout_mpll_p)	= { "fin_pll", "mout_mpll_fout" };
 PNAME(mout_bpll_fout_p)	= { "fout_bplldiv2", "fout_bpll" };
-- 
1.7.9.5
