From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/5] clk: samsung: exynos: Fix the checkpatch warnings
Date: Mon, 22 Aug 2016 18:48:34 +0900
Message-ID: <1471859319-30681-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, chanwoo@kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patches just fix the checkpatch warnings for exynos5433/3250/5260/5420/4
series without the behavior changes.

Chanwoo Choi (5):
  clk: samsung: exynos5433: Fix the checkpatch warnings
  clk: samsung: exynos3250: Fix the checkpatch warnings
  clk: samsung: exynos5260: Fix the checkpatch warnings
  clk: samsung: exynos5420: Fix the checkpatch warnings
  clk: samsung: exynos4: Fix the checkpatch warnings

 drivers/clk/samsung/clk-exynos3250.c | 97 ++++++++++++++++++++----------------
 drivers/clk/samsung/clk-exynos4.c    | 51 ++++++++++---------
 drivers/clk/samsung/clk-exynos5260.c |  4 +-
 drivers/clk/samsung/clk-exynos5420.c | 11 ++--
 drivers/clk/samsung/clk-exynos5433.c |  6 ++-
 5 files changed, 88 insertions(+), 81 deletions(-)

-- 
1.9.1
