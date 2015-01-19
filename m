From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 0/2] thermal: Set default thermal_zoneX mode to "enabled"
Date: Mon, 19 Jan 2015 12:44:02 +0100
Message-ID: <1421667844-13627-1-git-send-email-l.majewski@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

After Exynos TMU rework the default value of 
/sys/class/thermal/thermal_zone0/mode was set to "disabled"

Those two patches enable it by default.

The problem was reported by: Abhilash Kesavan <a.kesavan@samsung.com>

Dependencies:
linux-soc-thermal/next
SHA1: 1813d80874699145f04af6b05ebab0a6419001fb
And applied following patch series:
[PATCH v5 00/18] thermal: exynos: Thermal code rework to use device tree

Lukasz Majewski (2):
  thermal: exynos: Reorder exynos_map_dt_data() function
  thermal: of: Enable thermal_zoneX when sensor is correctly added

 drivers/thermal/of-thermal.c         | 3 +++
 drivers/thermal/samsung/exynos_tmu.c | 7 ++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.0.0.rc2

