From: Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [GIT PULL] clk/samsung updates for 4.20-rc1
Date: Fri, 5 Oct 2018 13:49:14 +0200
Message-ID: <9cf68fe8-73cf-4ee9-6ad4-d6b7ba8f02f8@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.20-samsung

for you to fetch changes up to 9dbcfe1ace4e9c57b819df1054eaeceb9bfd34f5:

  dt-bindings: clock: samsung: Add SPDX license identifiers (2018-10-05 13:36:40 +0200)

----------------------------------------------------------------
clk/samsung updates for 4.20

- consolidation of system suspend related code in Exynos, S5P, S3C SoC clk drivers,
- fixes of system suspend support on Exynos542x (Odroid boards) and Exynos5433 SoC,
- removal of obsoleted Exynos4212 ISP clock definitions,
- correction of Exynos CPU clock implementation,
- addition of SPDX license identifiers.

----------------------------------------------------------------
Joonyoung Shim (1):
      clk: samsung: exynos5420: Define CLK_SECKEY gate clock only or Exynos5420

Krzysztof Kozlowski (1):
      dt-bindings: clock: samsung: Add SPDX license identifiers

Marek Szyprowski (16):
      clk: samsung: Remove excessive include
      clk: samsung: s3c2410: Use generic helper for handling suspend/resume
      clk: samsung: s3c2412: Use generic helper for handling suspend/resume
      clk: samsung: s3c2443: Use generic helper for handling suspend/resume
      clk: samsung: s3c64xx: Use generic helper for handling suspend/resume
      clk: samsung: s5pv210: Use generic helper for handling suspend/resume
      clk: samsung: exynos5250: Use generic helper for handling suspend/resume
      clk: samsung: Add support for setting registers state before suspend
      clk: samsung: exynos4: Use generic helper for handling suspend/resume
      clk: samsung: exynos5420: Use generic helper for handling suspend/resume
      clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
      clk: samsung: exynos5433: Add suspend state for TOP, CPIF & PERIC CMUs
      clk: samsung: Remove obsolete code for Exynos4412 ISP clocks
      clk: samsung: exynos5433: Keep sclk_uart clocks enabled in suspend
      clk: samsung: exynos5420: Enable PERIS clocks for suspend
      clk: samsung: Use clk_hw API for calling clk framework from clk notifiers

 drivers/clk/samsung/clk-cpu.c              |   6 +-
 drivers/clk/samsung/clk-cpu.h              |   2 +-
 drivers/clk/samsung/clk-exynos-audss.c     |   1 -
 drivers/clk/samsung/clk-exynos3250.c       |   1 -
 drivers/clk/samsung/clk-exynos4.c          | 226 +++-------------------------------
 drivers/clk/samsung/clk-exynos5250.c       |  42 +------
 drivers/clk/samsung/clk-exynos5420.c       |  76 ++----------
 drivers/clk/samsung/clk-exynos5433.c       |  33 ++++-
 drivers/clk/samsung/clk-s3c2410.c          |  43 +------
 drivers/clk/samsung/clk-s3c2412.c          |  43 +------
 drivers/clk/samsung/clk-s3c2443.c          |  43 +------
 drivers/clk/samsung/clk-s3c64xx.c          |  66 +---------
 drivers/clk/samsung/clk-s5pv210.c          |  41 +-----
 drivers/clk/samsung/clk.c                  |  23 ++--
 drivers/clk/samsung/clk.h                  |  18 ++-
 include/dt-bindings/clock/exynos3250.h     |   5 +-
 include/dt-bindings/clock/exynos4.h        |  37 +-----
 include/dt-bindings/clock/exynos5250.h     |   7 +-
 include/dt-bindings/clock/exynos5260-clk.h |   7 +-
 include/dt-bindings/clock/exynos5410.h     |   7 +-
 include/dt-bindings/clock/exynos5420.h     |   7 +-
 include/dt-bindings/clock/exynos5433.h     |   5 +-
 include/dt-bindings/clock/exynos7-clk.h    |   7 +-
 include/dt-bindings/clock/s3c2410.h        |   5 +-
 include/dt-bindings/clock/s3c2412.h        |   5 +-
 include/dt-bindings/clock/s3c2443.h        |   5 +-
 26 files changed, 120 insertions(+), 641 deletions(-)

--
Regards,
Sylwester
