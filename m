From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 4.15
Date: Fri, 13 Oct 2017 14:27:00 +0200
Message-ID: <965b1a13-72a9-76a1-d5f5-5276944761cd@samsung.com>
References: <CGME20171013122704epcas2p205fdf3238de4a42ae773eb8a2c4b790d@epcas2p2.samsung.com>
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

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.15-samsung

for you to fetch changes up to a4f21e9ceb5c81f5b297cabb98dac0b5c03bd4dc:

  clk: samsung: Remove obsolete clkdev alias support (2017-10-09 11:34:03 +0200)

----------------------------------------------------------------
clk/samsung updates for v4.15

Overall clk/samsung clean up and fixes. Removed remaining unused code
after removal of exynos4212 SoC support; dropped internal data structure
fields and related code for registering clkdev lookup entry for each
possible clock object, clkdev aliases could still be defined if needed
in a separate table; other minor fixes of the clock tree definitions.

----------------------------------------------------------------
Andrzej Pietrasiewicz (1):
      clk: samsung: Fix m2m scaler clock on Exynos542x

Marek Szyprowski (11):
      clk: samsung: Properly propagate flags in __PLL macro
      clk: samsung: Remove support for Exynos4212 SoCs in Exynos CLKOUT driver
      clk: samsung: Remove support for obsolete Exynos4212 CPU clock
      clk: samsung: Remove clkdev alias support in Exynos4 clk driver
      clk: samsung: Remove double assignment of CLK_ARM_CLK in Exynos4 driver
      clk: samsung: Remove clkdev alias support in Exynos5250 clk driver
      clk: samsung: Drop useless alias in Exynos5420 clk driver
      clk: samsung: Rework clkdev alias handling in Exynos5440 driver
      clk: samsung: Rework clkdev alias handling in S3C2443 driver
      clk: samsung: Add explicit MPLL, EPLL clkdev aliases in S3C2443 driver
      clk: samsung: Remove obsolete clkdev alias support

Markus Elfring (1):
      clk: samsung: Delete a memory allocation error message in clk-cpu.c

 drivers/clk/samsung/clk-cpu.c           |  2 -
 drivers/clk/samsung/clk-exynos-clkout.c |  2 -
 drivers/clk/samsung/clk-exynos4.c       | 82 ++++++-----------------------
 drivers/clk/samsung/clk-exynos5250.c    | 18 +++----
 drivers/clk/samsung/clk-exynos5420.c    |  5 +-
 drivers/clk/samsung/clk-exynos5440.c    | 12 ++++-
 drivers/clk/samsung/clk-pll.c           |  9 ----
 drivers/clk/samsung/clk-s3c2443.c       | 16 +++---
 drivers/clk/samsung/clk.c               | 33 ++----------
 drivers/clk/samsung/clk.h               | 73 +++++--------------------
 include/dt-bindings/clock/s3c2443.h     |  2 +
 11 files changed, 64 insertions(+), 190 deletions(-)


-- 
Thanks,
Sylwester
