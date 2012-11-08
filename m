From: Amit Daniel Kachhap <amit.kachhap@linaro.org>
Subject: [PATCH 0/4] thermal: Add support for interrupt based notification to thermal layer
Date: Thu,  8 Nov 2012 09:56:23 +0530
Message-ID: <1352348786-24255-1-git-send-email-amit.kachhap@linaro.org>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-pm@lists.linux-foundation.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, durgadoss.r@intel.com, lenb@kernel.org, rui.zhang@intel.com, linux-acpi@vger.kernel.org, amit.kachhap@linaro.org, jonghwa3.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The patch submitted by Jonghwa Lee (https://patchwork.kernel.org/patch/1683441/)
adds support for interrupt based notification to thermal layer. This is a good
feature but the current thermal framework needs polling/regular notification for
invoking suitable cooling action. So adding 2 new thermal trend type to implement
this feature.

All these patches are based on thermal maintainer next tree.
git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git next

Amit Daniel Kachhap (3):
  thermal: Add new thermal trend type to support quick cooling
  thermal: exynos: Miscellaneous fixes to support falling threshold
    interrupt
  thermal: exynos: Use the new thermal trend type for quick cooling
    action.

Jonghwa Lee (1):
  Thermal: exynos: Add support for temperature falling interrupt.

 drivers/thermal/exynos_thermal.c             |  105 +++++++++++++++-----------
 drivers/thermal/step_wise.c                  |   19 ++++-
 include/linux/platform_data/exynos_thermal.h |    3 +
 include/linux/thermal.h                      |    2 +
 4 files changed, 80 insertions(+), 49 deletions(-)

