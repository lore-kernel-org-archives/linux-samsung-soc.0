From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.5
Date: Wed, 16 Dec 2015 18:50:14 +0100
Message-ID: <5671A456.9030203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30118 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932425AbbLPRwS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Dec 2015 12:52:18 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


The following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c89:

  Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-4.5

for you to fetch changes up to c5e949c1c24d67ae2813afdf02408a9b0c6fe55c:

  clk: s3c2410: removed unneeded variable in s3c24xx_clkout_set_parent (2015-12-16 16:36:04 +0100)

----------------------------------------------------------------
drivers/clk/samsung updates (mostly bug fixes):
 - instantiation of the cpu clocks and addition of the GSCL
   IP parent clocks to the list of available consumer clocks
   for exynos542x SoCs;
 - MFC IP parent clock fix for exynos542x;
 - fix of locking bug in samsung/clk-cpu.c which caused
   system crashes with cpufreq enabled;
 - minor cleanup for s3c2410.

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      clk: samsung: exynos542x/5800: fix cpu clock configuration data

Marek Szyprowski (3):
      clk: samsung: exynos542x: add missing parent GSCL block clocks
      clk: samsung: exynos542x: fix MFC clock hierarchy parent
      clk: exynos: use irqsave version of spin_lock to avoid deadlock with irqs

Prasanna Karthik (1):
      clk: s3c2410: removed unneeded variable in s3c24xx_clkout_set_parent

Thomas Abraham (1):
      clk: samsung: exynos5420: add cpu clock configuration data and instantiate cpu clock

 drivers/clk/samsung/clk-cpu.c          |   10 ++--
 drivers/clk/samsung/clk-exynos5420.c   |   98 +++++++++++++++++++++++++++++---
 drivers/clk/samsung/clk-s3c2410-dclk.c |    3 +-
 include/dt-bindings/clock/exynos5420.h |    4 ++
 4 files changed, 102 insertions(+), 13 deletions(-)

-- 
Thanks,
Sylwester
