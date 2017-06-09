From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 4.13
Date: Fri, 09 Jun 2017 17:34:19 +0200
Message-ID: <9a88fc9f-dcf0-806d-dfa8-25767c11a5d7@samsung.com>
References: <CGME20170609153423epcas1p1ed185ee02db60f56deccdc271ecbc927@epcas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42352 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751543AbdFIPe0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 11:34:26 -0400
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Mike, Stephen,

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.13-samsung

for you to fetch changes up to 9842452acd3dae661f4430c4460edd1fc188377f:

  clk: samsung: exynos542x: Add EPLL rate table (2017-06-09 13:12:55 +0200)

----------------------------------------------------------------
clk/samsung updates for 4.13

 - conversion to the clk_hw API
 - definitions and fixes of exynos5420 SoC audio subsystem
   related clocks

----------------------------------------------------------------
Marek Szyprowski (6):
      clk: samsung: Remove dead code
      clk: samsung: Add local variable to match its purpose
      clk: samsung: Convert common drivers to the new clk_hw API
      clk: samsung: exynos-audss: Convert to the new clk_hw API
      clk: samsung: exynos-clkout: Convert to the new clk_hw API
      clk: samsung: s5pv210-audss: Convert to the new clk_hw API

Sylwester Nawrocki (3):
      clk: samsung: Add enable/disable operation for PLL36XX clocks
      clk: samsung: Add missing exynos5420 audio related clocks
      clk: samsung: exynos542x: Add EPLL rate table

 drivers/clk/samsung/clk-cpu.c           |  17 ++-
 drivers/clk/samsung/clk-exynos-audss.c  |  57 +++++-----
 drivers/clk/samsung/clk-exynos-clkout.c |  18 ++--
 drivers/clk/samsung/clk-exynos5420.c    |  27 ++++-
 drivers/clk/samsung/clk-pll.c           | 101 ++++++++++--------
 drivers/clk/samsung/clk-pll.h           |   4 -
 drivers/clk/samsung/clk-s3c2410-dclk.c  |  75 +++++++------
 drivers/clk/samsung/clk-s5pv210-audss.c |  52 ++++-----
 drivers/clk/samsung/clk.c               |  91 +++++++---------
 drivers/clk/samsung/clk.h               |   9 +-
 include/dt-bindings/clock/exynos5420.h  |   3 +
 11 files changed, 238 insertions(+), 216 deletions(-)

-- 
Thanks,
Sylwester
