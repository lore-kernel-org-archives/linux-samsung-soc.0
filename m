From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL v2] clk/samsung fixes for 4.1
Date: Tue, 05 May 2015 11:39:50 +0200
Message-ID: <55488FE6.4040003@samsung.com>
References: <554105AC.8060800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <554105AC.8060800@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mike,

this is a corrected version of pull request I sent on 29/04/15.

The following changes since commit b787f68c36d49bb1d9236f403813641efa74a031:

  Linux 4.1-rc1 (2015-04-26 17:59:10 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-fixes-4.1-2

for you to fetch changes up to 97372e5a99449b4fffa824a382ad6358066a9918:

  clk: exynos5420: Restore GATE_BUS_TOP on suspend (2015-05-05 10:51:04 +0200)

----------------------------------------------------------------
clk/samsung fixes for 4.1

 - missing CONFIG_ARCH_EXYNOS5433 -> CONFIG_ARCH_EXYNOS substitution
   to actually enable clk-exynos5433.c compilation,
 - fixes of exynos5433 clk tree definitions: register offsets, parent
   clocks, PLL coefficients,
 - fix for exynos5420 system sleep regression introduced in 3.19.

----------------------------------------------------------------
Chanwoo Choi (3):
      clk: Use CONFIG_ARCH_EXYNOS instead of CONFIG_ARCH_EXYNOS5433
      clk: exynos5433: Fix wrong parent clock of sclk_apollo clock
      clk: exynos5433: Fix wrong PMS value of exynos5433_pll_rates

Javier Martinez Canillas (1):
      clk: exynos5420: Restore GATE_BUS_TOP on suspend

Jonghwa Lee (2):
      clk: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG
      clk: exynos5433: Fix CLK_PCLK_MONOTONIC_CNT clk register assignment

 drivers/clk/samsung/Makefile         |    2 +-
 drivers/clk/samsung/clk-exynos5420.c |    1 +
 drivers/clk/samsung/clk-exynos5433.c |   12 ++++++------
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
Thanks,
Sylwester
