From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.15, part 2
Date: Mon, 16 Oct 2017 12:29:19 +0200
Message-ID: <148bdf52-8e47-7696-f42d-98625d9dc43e@samsung.com>
References: <CGME20171016102923epcas1p445d71065cec89b9f62b9f02a5446c2dc@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

This change set is based off of your clk-pm-runtime branch, I needed to
do it that way as there were dependencies on the newly added clk runtime
PM feature.  In this tag there is also a fix commit related to changes 
introduced in the clk-pm-runtime branch. There will be a merge conflict, 
you can find the conflict resolution hint below. 

The following changes since commit ae432a9b314e07d486acfadc4df2f922721e6757:

  clk: samsung: exynos-audss: Add support for runtime PM (2017-09-07 15:26:01 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.15-exynos-pm

for you to fetch changes up to 7679eb20353dc74e47fbc97b2d77fd4f88a77c0f:

  clk: samsung: Add a separate driver for Exynos4412 ISP clocks (2017-10-16 11:25:50 +0200)

----------------------------------------------------------------
clk/samsung updates for v4.15, part 2

 - An addition of separate driver for the Exynos 4412 ISP CMU, needed
   to model and properly handle the clock controller's dependencies
   on the ISP power domain.
 - Adding __maybe_unused attributes to the exynos5433_cmu_{suspend,
   resume} ops to suppress compiler warnings with CONFIG_PM disabled.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: samsung: exynos5433: mark PM functions as __maybe_unused

Marek Szyprowski (3):
      clk: samsung: Instantiate Exynos4412 ISP clocks only when available
      clk: samsung: Add dt bindings for Exynos4412 ISP clock controller
      clk: samsung: Add a separate driver for Exynos4412 ISP clocks

 .../devicetree/bindings/clock/exynos4-clock.txt  |  43 +++++
 drivers/clk/samsung/Makefile                     |   1 +
 drivers/clk/samsung/clk-exynos4.c                |  31 +++-
 drivers/clk/samsung/clk-exynos4412-isp.c         | 179 +++++++++++++++++++
 drivers/clk/samsung/clk-exynos5433.c             |   4 +-
 include/dt-bindings/clock/exynos4.h              |  35 ++++
 6 files changed, 284 insertions(+), 9 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-exynos4412-isp.c


-------8<----------
 +
 +		of_address_to_resource(np, 0, &res);
 +		if (resource_size(&res) > 0x18000) {
 +			samsung_clk_register_div(ctx, exynos4x12_isp_div_clks,
 +				ARRAY_SIZE(exynos4x12_isp_div_clks));
 +			samsung_clk_register_gate(ctx, exynos4x12_isp_gate_clks,
 +				ARRAY_SIZE(exynos4x12_isp_gate_clks));
 +		}
 +
- 		if (of_machine_is_compatible("samsung,exynos4412")) {
- 			exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
- 				mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
- 				e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
- 				CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
- 		} else {
- 			exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
- 				mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
- 				e4212_armclk_d, ARRAY_SIZE(e4212_armclk_d),
- 				CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
- 		}
+ 		exynos_register_cpu_clock(ctx, CLK_ARM_CLK, "armclk",
+ 			mout_core_p4x12[0], mout_core_p4x12[1], 0x14200,
+ 			e4412_armclk_d, ARRAY_SIZE(e4412_armclk_d),
+ 			CLK_CPU_NEEDS_DEBUG_ALT_DIV | CLK_CPU_HAS_DIV1);
  	}
-------8<----------

-- 
Thanks,
Sylwester
