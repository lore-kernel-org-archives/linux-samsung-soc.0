From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] Samsung clk updates for 4.8
Date: Mon, 13 Jun 2016 15:10:10 +0200
Message-ID: <575EB0B2.8040001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-4.8

for you to fetch changes up to 0e4504470667d355b53ca3c9802fdd2120c9f946:

  clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to PCIE device (2016-06-10 12:15:30 +0200)

----------------------------------------------------------------
 - a fix for exynos7 to prevent gating some critical CMU clocks,
 - addition of CPU clocks for CPU frequency scaling on Exynos5433 SoCs,
 - additions for exynos5410 SoC required for Odroid XU board support,
 - register accessors fixes for kernels built for big endian operation
   (mostly exynos4 SoCs),
 - Exynos5433 clock definitions fixes required for suspend to RAM and
   the audio subsystem operation,
 - many cleanups changing attributes of the clock initializer data

----------------------------------------------------------------
Alim Akhtar (1):
      clk: samsung: exynos7: Don't gate CMU_{CCORE, FSYS0} blocks clock

Bartlomiej Zolnierkiewicz (3):
      clk: samsung: exynos5433: prepare for adding CPU clocks
      clk: samsung: cpu: prepare for adding Exynos5433 CPU clocks
      clk: samsung: exynos5433: add CPU clocks configuration data and instantiate CPU clocks

Beomho Seo (1):
      clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag for AUD UART

Jaehoon Chung (1):
      clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to PCIE device

Javier Martinez Canillas (1):
      clk: samsung: exynos5420: Set ID for aclk333 gate clock

Jonghwa Lee (1):
      clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flags to avoid hang during S2R

Krzysztof Kozlowski (31):
      dt-bindings: clock: Add license and reformat Exynos5410 clock IDs
      dt-bindings: clock: Add PWM and USB clock IDs to Exynos5410
      dt-bindings: clock: Add I2C, HSI2C and RTC clock IDs to Exynos5410
      dt-bindings: clock: Add TMU clock ID to Exynos5410
      dt-bindings: clock: Add watchdog and SSS clock IDs to Exynos5410
      clk: samsung: Remove useless check for return value of samsung_clk_init
      clk: samsung: clkout: Add support for Exynos5410
      clk: samsung: Constify clock init data with clock arrays
      clk: samsung: exynos3250: Move platform driver and of_device_id to init section
      clk: samsung: exynos3250: Constify all clock initializers
      clk: samsung: exynos4: Move local function to init section
      clk: samsung: exynos4: Constify all clock initializers
      clk: samsung: exynos4415: Constify all clock initializers
      clk: samsung: exynos4415: Move PLL rates data to init section
      clk: samsung: exynos5250: Constify all clock initializers
      clk: samsung: exynos5260: Constify all clock initializers
      clk: samsung: exynos5410: Constify all clock initializers
      clk: samsung: exynos5420: Constify all clock initializers
      clk: samsung: exynos5440: Constify all clock initializers
      clk: samsung: exynos7: Constify all clock initializers
      clk: samsung: exynos5433: Constify all clock initializers
      clk: samsung: exynos5433: Move PLL rates data to init section
      clk: samsung: exynos5420: Move sleep init function and PLL data to init section
      clk: samsung: exynos5250: Move sleep init function to init section
      clk: samsung: Fully constify mux parent names
      clk: samsung: exynos3250: Move PLL rates data to init section
      clk: samsung: exynos5410: Add serial3, USB and PWM clocks
      clk: samsung: exynos5410: Add I2C, HSI2C and RTC clocks
      clk: samsung: exynos5410: Add TMU clock
      clk: samsung: Suppress unbinding to prevent theoretical attacks
      clk: samsung: exynos5410: Add WDT, ACLK266 and SSS clocks

Matthew Leach (2):
      clk: samsung: fixup endian in pll clk
      clk: samsung: exynos4: fixup reg access on be

 drivers/clk/samsung/clk-cpu.c           | 131 +++++++++-
 drivers/clk/samsung/clk-cpu.h           |   4 +-
 drivers/clk/samsung/clk-exynos-clkout.c |   2 +
 drivers/clk/samsung/clk-exynos3250.c    |  41 +--
 drivers/clk/samsung/clk-exynos4.c       |  64 +++--
 drivers/clk/samsung/clk-exynos4415.c    |  30 +--
 drivers/clk/samsung/clk-exynos5250.c    |  27 +-
 drivers/clk/samsung/clk-exynos5260.c    | 114 ++++----
 drivers/clk/samsung/clk-exynos5410.c    |  58 ++++-
 drivers/clk/samsung/clk-exynos5420.c    |  40 ++-
 drivers/clk/samsung/clk-exynos5433.c    | 432 +++++++++++++++++++------------
 drivers/clk/samsung/clk-exynos5440.c    |  12 +-
 drivers/clk/samsung/clk-exynos7.c       | 119 ++++-----
 drivers/clk/samsung/clk-pll.c           | 122 ++++-----
 drivers/clk/samsung/clk-s3c2410-dclk.c  |   5 +-
 drivers/clk/samsung/clk-s3c2410.c       |   2 -
 drivers/clk/samsung/clk-s3c2412.c       |   2 -
 drivers/clk/samsung/clk-s3c2443.c       |   2 -
 drivers/clk/samsung/clk-s3c64xx.c       |   2 -
 drivers/clk/samsung/clk-s5pv210.c       |   2 -
 drivers/clk/samsung/clk.c               |  14 +-
 drivers/clk/samsung/clk.h               |  22 +-
 include/dt-bindings/clock/exynos5410.h  |  76 ++++--
 include/dt-bindings/clock/exynos5433.h  |   3 +-
 24 files changed, 812 insertions(+), 514 deletions(-)

--
Thanks, 
Sylwester
