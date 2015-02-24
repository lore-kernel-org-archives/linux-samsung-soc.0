From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 0/2] thermal: exynos: Fix NULL pointer error and bug of
 PD_DET_EN of Exynos7
Date: Tue, 24 Feb 2015 13:56:53 +0900
Message-ID: <1424753815-15113-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com
Cc: kgene@kernel.org, b.zolnierkie@samsung.com, amit.daniel@samsung.com, l.majewski@samsung.com, a.kesavan@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch-set fix the bug of PD_DET_EN bit field of Exynos7 TMU.
And the clean-up the exynos compatible table by making oneline entry.

Changes from v1:
- Rebased it on Linux 4.0-rc1
- Add acked message by Lukasz Majewski
- Drop first patch [1] because NULL poiner error don't happen.
  [1] http://www.spinics.net/lists/linux-samsung-soc/msg42424.html

Chanwoo Choi (2):
  thermal: exynos: Fix wrong control of power down detection mode for Exynos7
  thermal: exynos: Clean-up code to use oneline entry for exynos compatible table

 drivers/thermal/samsung/exynos_tmu.c | 41 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

-- 
1.8.5.5

