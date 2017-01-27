From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.11, part 2
Date: Fri, 27 Jan 2017 18:22:50 +0100
Message-ID: <3297ef21-a1d6-51b0-4d99-70c9a041c952@samsung.com>
References: <CGME20170127172254epcas1p41085b7154dba751e0c19d4f92a8558a7@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.11-samsung-2

for you to fetch changes up to 02c952c8f95fd0adf1835704db95215f57cfc8e6:

  clk: samsung: mark s3c...._clk_sleep_init() as __init (2017-01-27 13:30:00 +0100)

----------------------------------------------------------------
Exporting clock IDs for Exynos5433 SoC MIPI DSI DPHY,
Exynos PLL code updates and overall minor clean-ups.

----------------------------------------------------------------
Marek Szyprowski (4):
      clk: samsung: exynos5433: Add IDs for PHYCLK_MIPIDPHY0_* clocks
      clk: samsung: exynos5433: Add data for 250MHz and 278MHz PLL rates
      clk: samsung: exynos5433: Correct typos in SoC name
      clk: samsung: Add enable/disable support for PLL35XX clocks

Martin Kaiser (1):
      clk: samsung: mark s3c...._clk_sleep_init() as __init

 drivers/clk/samsung/clk-exynos5433.c   | 36 ++++++++++++++++++++----------------
 drivers/clk/samsung/clk-pll.c          | 45 ++++++++++++++++++++++++++++++++++++++-------
 drivers/clk/samsung/clk-s3c2410.c      |  4 ++--
 drivers/clk/samsung/clk-s3c2412.c      |  4 ++--
 drivers/clk/samsung/clk-s3c2443.c      |  4 ++--
 drivers/clk/samsung/clk-s3c64xx.c      |  4 ++--
 include/dt-bindings/clock/exynos5433.h |  5 ++++-
 7 files changed, 70 insertions(+), 32 deletions(-)

-- 
Thanks,
Sylwester
