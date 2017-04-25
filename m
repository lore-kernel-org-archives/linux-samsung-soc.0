From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates
Date: Tue, 25 Apr 2017 12:48:39 +0200
Message-ID: <d3368372-c7c7-8d34-e8c1-64c94ffd06a9@samsung.com>
References: <CGME20170425104844epcas5p2aaaca4371c1510c7beecf670e0e58b2b@epcas5p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

This pull request contains only patches converting clk/samsung to the clk_hw
API, if it's too late please just postpone that to 4.13 merge window. Thanks.

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git for-v4.12/clk/next

for you to fetch changes up to 6a907d767e72eaf26c57fc54a372d34ab303bfbb:

  clk: samsung: s5pv210-audss: Convert to the new clk_hw API (2017-04-25 11:32:55 +0200)

----------------------------------------------------------------
Marek Szyprowski (6):
      clk: samsung: Remove dead code
      clk: samsung: Add local variable to match its purpose
      clk: samsung: Convert common drivers to the new clk_hw API
      clk: samsung: exynos-audss: Convert to the new clk_hw API
      clk: samsung: exynos-clkout: Convert to the new clk_hw API
      clk: samsung: s5pv210-audss: Convert to the new clk_hw API

 drivers/clk/samsung/clk-cpu.c           | 17 +++--
 drivers/clk/samsung/clk-exynos-audss.c  | 55 +++++++-------
 drivers/clk/samsung/clk-exynos-clkout.c | 18 ++---
 drivers/clk/samsung/clk-pll.c           | 14 ++--
 drivers/clk/samsung/clk-pll.h           |  4 --
 drivers/clk/samsung/clk-s3c2410-dclk.c  | 75 ++++++++++---------
 drivers/clk/samsung/clk-s5pv210-audss.c | 50 ++++++-------
 drivers/clk/samsung/clk.c               | 91 +++++++++++-------------
 drivers/clk/samsung/clk.h               |  9 ++-
 9 files changed, 160 insertions(+), 173 deletions(-)

-- 
Regards,
Sylwester
