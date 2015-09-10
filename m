From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 00/12] clk: samsung: exynos7: Cleanup of clock file
Date: Thu, 10 Sep 2015 14:14:25 +0530
Message-ID: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45110 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753855AbbIJIyc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Sep 2015 04:54:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

Currently there are lots of ambiguity between clock names in clock file
and in user manual, which leads to lots of confusion for the reviewers.
This series attempts to cleanup the exynos7 clock file as per
user manual naming convention.
This also adds some of the missing Gate clocks which are needed
to complete the clock tree.

Changes since v1:
- Addressed various review comments from Krzysztof[1]
- Collected Reviewed-by from Krzysztof
- This also modifies patch 05/12 and 12/12, moved Gate clocks addition to patch 02/12

This patch series has a dependency on [2]

[1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg46391.html
[2]-> https://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg46122.html

Alim Akhtar (12):
  clk: samsung: exynos7: Change the CMU_TOPC block clock names
  clk: samsung: exynos7: Adds missing clocks gates of CMU_TOPC
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

 drivers/clk/samsung/clk-exynos7.c       |  421 +++++++++++++++++++++----------
 include/dt-bindings/clock/exynos7-clk.h |   43 +++-
 2 files changed, 332 insertions(+), 132 deletions(-)

-- 
1.7.10.4
