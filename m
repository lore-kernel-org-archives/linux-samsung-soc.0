From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] Samsung clock updates for 4.9
Date: Fri, 09 Sep 2016 17:45:27 +0200
Message-ID: <5763a275-eb8a-6911-6a15-2e0b434d066c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.9-samsung

for you to fetch changes up to be95d2c7d918b2b7b973378a1e92bdc6559c21f9:

  clk: samsung: Add support for EPLL on exynos5410 (2016-09-09 17:35:13 +0200)

----------------------------------------------------------------
In addition to a few clean up and code consolidation patches this
includes:
- addition of sound subsystem related clocks for Exynos5410 SoC
  (EPLL, PDMA) and support for "samsung,exynos5410-audss-clock"
  compatible in the clk-exynos-audss driver,
- addition of DRAM controller related clocks for exynos5420,
- MAINTAINERS update adding Chanwoo Choi as the Samsung SoC
  clock drivers co-maintainer.

----------------------------------------------------------------
Chanwoo Choi (5):
      clk: samsung: Add clock IDs for the CMU_CDREX (DRAM Express Controller)
      MAINTAINERS: Add myself as Samsung SoC clock drivers co-maintainer
      clk: samsung: exynos5260: Move struct samsung_cmu_info to init section
      clk: samsung: exynos5410: Use samsung_cmu_register_one() to simplify code
      clk: samsung: exynos5420: Add clocks for CMU_CDREX domain

Sylwester Nawrocki (7):
      clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks
      clk: samsung: exynos5410: Expose the peripheral DMA gate clocks
      clk: samsung: Use common registration function for pll2550x
      clk: samsung: clk-exynos-audss: controller variant handling rework
      clk: samsung: clk-exynos-audss: Add exynos5410 compatible
      clk: samsung: clk-exynos-audss: Whitespace and debug trace cleanup
      clk: samsung: Add support for EPLL on exynos5410

 .../devicetree/bindings/clock/clk-exynos-audss.txt  |   4 +-
 .../devicetree/bindings/clock/exynos5410-clock.txt  |  21 +-
 MAINTAINERS                                         |   3 +
 drivers/clk/samsung/clk-exynos-audss.c              |  84 +++--
 drivers/clk/samsung/clk-exynos5260.c                | 350 ++++++++++-----------
 drivers/clk/samsung/clk-exynos5410.c                |  61 ++--
 drivers/clk/samsung/clk-exynos5420.c                |  37 +++
 drivers/clk/samsung/clk-exynos5440.c                |   9 +-
 drivers/clk/samsung/clk-pll.c                       | 154 ++++++---
 drivers/clk/samsung/clk-pll.h                       |   2 +
 include/dt-bindings/clock/exynos5410.h              |   3 +
 include/dt-bindings/clock/exynos5420.h              |  11 +-
 include/dt-bindings/clock/exynos5440.h              |   2 +
 13 files changed, 453 insertions(+), 288 deletions(-)

-- 
Thanks,
Sylwester
