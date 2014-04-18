From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 0/6] rtc: s5m: Add support for S2MPS14
Date: Fri, 18 Apr 2014 15:18:53 +0200
Message-ID: <1397827139-14589-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


This is second version of patches for S5M RTC driver adding support
for S2MPS14 device.

The patchset is rebased against current Linus' tree (v3.15-rc1-136-gd3e74dc8280c)
and on my last patch for RTC regmap fixes:
 - mfd/rtc: s5m: Do not allocate RTC I2C dummy and regmap for unsupported chipsets
   https://lkml.org/lkml/2014/4/14/50

Changes since v1
================
1. Add patch 6/6 (rtc: s5m: Consolidate two device type switch statements)


Best regards,
Krzysztof


Krzysztof Kozlowski (6):
  mfd/rtc: sec/s5m: Rename SEC* symbols to S5M
  rtc: s5m: Remove undocumented time init on first boot
  rtc: s5m: Use shorter time of register update
  rtc: s5m: Support different register layout
  rtc: s5m: Add support for S2MPS14 RTC
  rtc: s5m: Consolidate two device type switch statements

 drivers/rtc/Kconfig             |   4 +-
 drivers/rtc/rtc-s5m.c           | 310 ++++++++++++++++++++++++++--------------
 include/linux/mfd/samsung/rtc.h |  86 ++++++-----
 3 files changed, 252 insertions(+), 148 deletions(-)

-- 
1.8.3.2
