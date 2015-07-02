From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/2] thermal: exynos: Fix minor issue
Date: Thu, 02 Jul 2015 15:39:59 +0900
Message-ID: <1435819201-30729-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: l.majewski@samsung.com, eduardo.valentin@ti.com, rui.zhang@intel.com
Cc: kgene@kernel.org, k.kozlowski@samsung.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes the two minor issue. The first patch add the CONFIG_THERMAL_OF
dependency and second patch removes the unused code.

Chanwoo Choi (2):
  thermal: exynos: Add the dependency of CONFIG_THERMAL_OF instead of CONFIG_OF
  thermal: exynos: Remove unused code related to platform_data on probe()

 drivers/thermal/samsung/Kconfig      | 2 +-
 drivers/thermal/samsung/exynos_tmu.c | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
1.8.5.5

