From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 0/5] rtc: s3c: Refactoring s3c-rtc driver and support
 Exynos3250 RTC
Date: Thu, 28 Aug 2014 18:02:34 +0900
Message-ID: <1409216559-22402-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it
Cc: kgene.kim@samsung.com, akpm@linux-foundation.org, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset clean up codes to improve readability as following and support
the RTC of Exynos3250 SoC.
- Remove global variables and then use new s3c_rtc structure
- Remove warn message with checking checkpatch script
- Use variant structure according to SoC type instead of legacy enum variable(s3c_cpu_type)

Changes from v2:
- Drop the checking statement of 'info->base' because it is un-needed

Changes from v1:
- Fix NULL pointer panic of s3c_rtc_settime()
- Check info->base value to protect NULL pointer panic

Chanwoo Choi (5):
  rtc: s3c: Define s3c_rtc structure to remove global variables.
  rtc: s3c: Remove warning message when checking coding style with checkpatch script
  rtc: s3c: Add s3c_rtc_data structure to use variant data instead of s3c_cpu_type
  rtc: s3c: Add support for RTC of Exynos3250 SoC
  ARM: dts: Fix wrong compatible string of Exynos3250 RTC dt node

 Documentation/devicetree/bindings/rtc/s3c-rtc.txt |   3 +
 arch/arm/boot/dts/exynos3250.dtsi                 |   2 +-
 drivers/rtc/rtc-s3c.c                             | 851 ++++++++++++++--------
 3 files changed, 535 insertions(+), 321 deletions(-)

-- 
1.8.0
