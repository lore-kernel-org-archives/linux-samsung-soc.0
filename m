From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 4.2
Date: Wed, 03 Jun 2015 18:09:39 +0200
Message-ID: <556F26C3.9080302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:20666 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757347AbbFCQJ6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 12:09:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


The following changes since commit 20db7092e478c33a2bf5254063c51f5db6443959:

  Merge branch 'clk-next-hi6220' into clk-next (2015-05-27 22:06:42 -0700)

are available in the git repository at:


  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-for-4.2

for you to fetch changes up to e5c6fc4f271a27d5b236b5f4929bf0f2dab80a7d:

  clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC (2015-06-02
14:52:12 +0200)

----------------------------------------------------------------
Updates of the exynos5433 clock definitions for proper support of SMC,
DVFS of GPU and CPU big.LITTLE cores and a fix for system suspend adding
one of the clock controller's registers to save/restore list.

----------------------------------------------------------------
Chanwoo Choi (1):
      clk: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core

Hyungwon Hwang (1):
      clk: exynos5433: Add DIV_CPIF to the list of stored registers on suspend

Jonghwa Lee (1):
      clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC

Joonyoung Shim (1):
      clk: exynos5433: Add clock flag to support the DVFS of GPU

 drivers/clk/samsung/clk-exynos5433.c |   81 +++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 41 deletions(-)

-- 
Thanks,
Sylwester
