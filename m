From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/3] clk: samsung: add Exynos5433 CPU clocks
Date: Tue, 24 May 2016 15:19:14 +0200
Message-ID: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The following patches add a support for CPU clocks for Exynos5433.

Please note that for full cpufreq-dt support there are also DTS and
cpufreq-dt-platdev changes needed.  They will be sent separately
later.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (3):
  clk: samsung: exynos5433: prepare for adding CPU clocks
  clk: samsung: cpu: prepare for adding Exynos5433 CPU clocks
  clk: samsung: exynos5433: add CPU clocks configuration data and
    instantiate CPU clocks

 drivers/clk/samsung/clk-cpu.c        | 131 +++++++++++++++++++++++++++++-
 drivers/clk/samsung/clk-cpu.h        |   4 +-
 drivers/clk/samsung/clk-exynos5433.c | 149 +++++++++++++++++++++++++++--------
 drivers/clk/samsung/clk.c            |  12 +--
 drivers/clk/samsung/clk.h            |   4 +
 5 files changed, 258 insertions(+), 42 deletions(-)

-- 
1.9.1

