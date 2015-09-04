From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 00/11] clk: samsung: exynos7: Cleanup of clock file
Date: Fri, 04 Sep 2015 17:07:05 +0530
Message-ID: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Currently there are lots of ambiguity between clock names in clock file
and in user manual, which leads to lots of confusion for the reviewers.
This series attempts to cleanup the exynos7 clock file as per
user manual naming convention.
This also adds some of the missing Gate clocks which are needed
to complete the clock tree.

First 10 patches are mostly cleanup which does not affect any
functionality to the current code.

Patch 11/11 adds UFS clock addressing review comments [1]
Krzysztof, hope you are ok with including UFS clock patch with this series.

This patch has a dependency on [2]
[1] -> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg46183.html
[2]-> https://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg46122.html

Alim Akhtar (11):
  clk: samsung: exynos7: Change the CMU_TOPC block clock name
  clk: samsung: exynos7: Corrects CMU_TOP0 clocks names
  clk: samsung: exynos7: Corrects CMU_TOP1 clocks names
  clk: samsung: exynos7: Corrects CMU_CCORE clocks names
  clk: samsung: exynos7: Corrects CMU_PERIC0 clocks names
  clk: samsung: exynos7: Corrects CMU_PERIC1 clocks names
  clk: samsung: exynos7: Corrects CMU_PERIS clocks names
  clk: samsung: exynos7: Corrects CMU_FSYS0 clocks names
  clk: samsung: exynos7: Corrects CMU_FSYS1 clocks names
  clk: samsung: exynos7: Add missing fixed_clks to cmu_info
  clk: samsung: exynos7: Add required clock tree for UFS

 drivers/clk/samsung/clk-exynos7.c       |  430 ++++++++++++++++++++++---------
 include/dt-bindings/clock/exynos7-clk.h |   43 +++-
 2 files changed, 341 insertions(+), 132 deletions(-)

-- 
1.7.10.4

