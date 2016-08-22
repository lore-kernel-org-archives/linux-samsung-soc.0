From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/2] clk: samsung: Move struct samsung_cmu_info to init section
Date: Mon, 22 Aug 2016 11:49:43 +0900
Message-ID: <1471834185-20249-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, chanwoo@kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset moves the struct samsung_cmu_info to init section for
exynos5260/5410 because they are used only in initconst section.

Chanwoo Choi (2):
  clk: samsung: exynos5260: Move struct samsung_cmu_info to init section
  clk: samsung: exynos5410: Use samsung_cmu_register_one() to simplify code

 drivers/clk/samsung/clk-exynos5260.c | 350 +++++++++++++++++------------------
 drivers/clk/samsung/clk-exynos5410.c |  33 ++--
 2 files changed, 188 insertions(+), 195 deletions(-)

-- 
1.9.1
