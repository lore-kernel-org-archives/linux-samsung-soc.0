From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for v4.11
Date: Thu, 19 Jan 2017 18:54:41 +0100
Message-ID: <684f822a-b405-f7f1-da45-965fe14ac741@samsung.com>
References: <CGME20170119175445epcas1p41dcadba15bf106dd4a3a76a3a0278467@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

Here is my pull request with a few clk/samsung updates for v4.11.
Commit "clk: samsung: Add CPU clk configuration data for Exynos4412 Prime"
has been already pulled into the arm-soc tree as a dependency.


The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-v4.11-samsung

for you to fetch changes up to cb4ac949ea14416a2d57b7a343bc4b571074e3bd:

  clk: samsung: Remove Exynos4415 driver (SoC not supported anymore) (2017-01-16 11:33:38 +0100)

----------------------------------------------------------------
clk/samsung updates for v4.11:
 - addition of the CPU clock configuration data for Exynos4412
   Prime SoC variant,
 - removal of driver for deprecated Exynos4415 SoC,
 - switching from the syscore to regular system sleep PM ops
   in the audio subsystem clocks controller driver,
 - updates of the definitions of some "Network On Chip" related
   clocks.

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
      clk: samsung: Add CPU clk configuration data for Exynos4412 Prime

Chanwoo Choi (1):
      clk: samsung: exynos5433: Set NoC (Network On Chip) clocks as critical

Krzysztof Kozlowski (1):
      clk: samsung: Remove Exynos4415 driver (SoC not supported anymore)

Marek Szyprowski (1):
      clk: samsung: exynos-audss: Replace syscore PM with platform device PM

 .../bindings/clock/exynos4415-clock.txt          |   38 -
 drivers/clk/samsung/Makefile                     |    1 -
 drivers/clk/samsung/clk-exynos-audss.c           |   24 +-
 drivers/clk/samsung/clk-exynos4.c                |    4 +
 drivers/clk/samsung/clk-exynos4415.c             | 1022 ------------------
 drivers/clk/samsung/clk-exynos5433.c             |    8 +-
 include/dt-bindings/clock/exynos4415.h           |  360 ------
 7 files changed, 18 insertions(+), 1439 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt
 delete mode 100644 drivers/clk/samsung/clk-exynos4415.c
 delete mode 100644 include/dt-bindings/clock/exynos4415.h

--
Regards, 
Sylwester
