From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [GIT PULL] clk/samsung updates for v4.4
Date: Fri, 2 Oct 2015 11:37:14 -0700
Message-ID: <20151002183714.GQ12338@codeaurora.org>
References: <560E53BC.2060609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560E53BC.2060609@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/02, Sylwester Nawrocki wrote:
> 
> The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:
> 
>   Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-4.4
> 
> for you to fetch changes up to 7993b3ebec979b23c2d7425959c9d232c452498b:
> 
>   clk: samsung: exynos7: Add required clock tree for UFS (2015-09-15 11:18:15 +0200)
> 

Thanks, pulled. I put this patch on top though.

-----8<-----
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: samsung: exynos7: Staticize file scope symbols

drivers/clk/samsung/clk-exynos7.c:896:33:
warning: symbol 'fixed_rate_clks_fsys0' was not declared. Should
it be static?
drivers/clk/samsung/clk-exynos7.c:1010:33:
warning: symbol 'fixed_rate_clks_fsys1' was not declared. Should
it be static?

Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/samsung/clk-exynos7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 924215b219da..55f8e2e24ab8 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -893,7 +893,7 @@ PNAME(mout_phyclk_usbdrd300_udrd30_pipe_pclk_user_p)	= { "fin_pll",
 				"phyclk_usbdrd300_udrd30_pipe_pclk" };
 
 /* fixed rate clocks used in the FSYS0 block */
-struct samsung_fixed_rate_clock fixed_rate_clks_fsys0[] __initdata = {
+static struct samsung_fixed_rate_clock fixed_rate_clks_fsys0[] __initdata = {
 	FRATE(0, "phyclk_usbdrd300_udrd30_phyclock", NULL,
 		CLK_IS_ROOT, 60000000),
 	FRATE(0, "phyclk_usbdrd300_udrd30_pipe_pclk", NULL,
@@ -1007,7 +1007,7 @@ PNAME(mout_phyclk_ufs20_rx0_user_p) = { "fin_pll", "phyclk_ufs20_rx0_symbol" };
 PNAME(mout_phyclk_ufs20_rx1_user_p) = { "fin_pll", "phyclk_ufs20_rx1_symbol" };
 
 /* fixed rate clocks used in the FSYS1 block */
-struct samsung_fixed_rate_clock fixed_rate_clks_fsys1[] __initdata = {
+static struct samsung_fixed_rate_clock fixed_rate_clks_fsys1[] __initdata = {
 	FRATE(PHYCLK_UFS20_TX0_SYMBOL, "phyclk_ufs20_tx0_symbol", NULL,
 			CLK_IS_ROOT, 300000000),
 	FRATE(PHYCLK_UFS20_RX0_SYMBOL, "phyclk_ufs20_rx0_symbol", NULL,
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
