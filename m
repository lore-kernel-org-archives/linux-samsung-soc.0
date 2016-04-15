From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.7
Date: Fri, 15 Apr 2016 19:21:08 +0200
Message-ID: <57112304.3070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.7-samsung

for you to fetch changes up to 6466ee322749e7f440764df053ccccb2d15ab4de:

  Merge branch 'for-v4.7/clk/exynos542x' into for-v4.7/clk/next (2016-04-15 18:57:00 +0200)

----------------------------------------------------------------

This includes addition of some missing clock tree definitions
(UART, MMC2 clocks) for exynos3250 SoC and exporting of IDs
for exynos543x SoC AMBA AXI bus clocks needed for bus frequency
scaling.

----------------------------------------------------------------
Chanwoo Choi (4):
      dt-bindings: Add the clock id of UART2 and MMC2 for Exynos3250
      clk: samsung: exynos3250: Add MMC2 clock
      dt-bindings: clock: Add the clock id for ACLK clock of Exynos542x SoC
      clk: samsung: exynos542x: Add the clock id for ACLK

Pankaj Dubey (1):
      clk: samsung: exynos3250: Add UART2 clock

Sylwester Nawrocki (1):
      Merge branch 'for-v4.7/clk/exynos542x' into for-v4.7/clk/next

 drivers/clk/samsung/clk-exynos3250.c   | 15 +++++++++++++++
 drivers/clk/samsung/clk-exynos5420.c   | 77 +++++++++++++++++++++++++++++++++++++++++++++++------------------------------
 include/dt-bindings/clock/exynos3250.h | 11 ++++++++++-
 include/dt-bindings/clock/exynos5420.h | 24 +++++++++++++++++++++++-
 4 files changed, 95 insertions(+), 32 deletions(-)

--
Thanks, 
Sylwester
