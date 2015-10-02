From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.4
Date: Fri, 02 Oct 2015 11:51:56 +0200
Message-ID: <560E53BC.2060609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8233 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189AbbJBJwx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Oct 2015 05:52:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


The following changes since commit 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f:

  Linux 4.3-rc1 (2015-09-12 16:35:56 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-4.4

for you to fetch changes up to 7993b3ebec979b23c2d7425959c9d232c452498b:

  clk: samsung: exynos7: Add required clock tree for UFS (2015-09-15 11:18:15 +0200)

----------------------------------------------------------------
Fixes, improvements and addition of some missing features
of the exynos7 clock controller driver.

----------------------------------------------------------------
Alim Akhtar (16):
      clk: samsung: exynos7: Fix CMU TOPC block clock
      clk: samsung: exynos7: Fix CMU TOP1 block
      clk: samsung: exynos7: Correct nr_clk_ids for fsys0
      clk: samsung: exynos7: Correct nr_clk_ids for fsys1
      clk: samsung: exynos7: Change the CMU_TOPC block clock names
      clk: samsung: exynos7: Adds missing clocks gates of CMU_TOPC
      clk: samsung: exynos7: Correct CMU_TOP0 clocks names
      clk: samsung: exynos7: Correct CMU_TOP1 clocks names
      clk: samsung: exynos7: Correct CMU_CCORE clocks names
      clk: samsung: exynos7: Correct CMU_PERIC0 clocks names
      clk: samsung: exynos7: Correct CMU_PERIC1 clocks names
      clk: samsung: exynos7: Correct CMU_PERIS clocks names
      clk: samsung: exynos7: Correct CMU_FSYS0 clocks names
      clk: samsung: exynos7: Correct CMU_FSYS1 clocks names
      clk: samsung: exynos7: Add missing fixed_clks to cmu_info
      clk: samsung: exynos7: Add required clock tree for UFS

 drivers/clk/samsung/clk-exynos7.c       |  465 +++++++++++++++++++++----------
 include/dt-bindings/clock/exynos7-clk.h |   43 ++-
 2 files changed, 357 insertions(+), 151 deletions(-)

-- 
Regards,
Sylwester
