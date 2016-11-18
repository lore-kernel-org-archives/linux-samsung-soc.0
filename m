From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.10
Date: Fri, 18 Nov 2016 19:07:58 +0100
Message-ID: <b8c981b1-6b0e-d3b7-f326-fcc3b2e729b7@samsung.com>
References: <CGME20161118180800eucas1p24f5dce538660811ac7284ec0d122d563@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:59929 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752017AbcKRSIF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Nov 2016 13:08:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.10-exynos5433

for you to fetch changes up to 37bf4ab84be2ae00f116436eb2c876a0ca953a64:

  clk: exynos5433: Mark some clocks as critical (2016-11-18 13:55:51 +0100)

----------------------------------------------------------------
Exynos5433 SoC related fixes:
 - addition of missing documentation and DT properties for the CMU_AUD
   block source clocks,
 - correction of CMU_FSYS parent clock definition,
 - marking as critical clocks which have to be enabled in order
   to access control registers of child CMUs.

----------------------------------------------------------------
Marek Szyprowski (3):
      clk: exynos5433: Fix parent clocks for FSYS block
      clk: exynos5433: Add documentation for the audio block parent clocks
      clk: exynos5433: Mark some clocks as critical

 .../bindings/clock/exynos5433-clock.txt       | 13 ++++++--
 drivers/clk/samsung/clk-exynos5433.c          | 30 +++++++++----------
 2 files changed, 25 insertions(+), 18 deletions(-)

--
Thanks,
Sylwester
