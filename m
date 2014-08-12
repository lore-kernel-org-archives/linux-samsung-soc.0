From: y@samsung.com
Subject: [PATCHv2 0/5] rtc: s3c: Refactoring s3c-rtc driver and support
 Exynos3250 RTC
Date: Tue, 12 Aug 2014 11:01:06 +0900
Message-ID: <1407808871-6046-1-git-send-email-y@samsung.com>
References: <y@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:28970 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051AbaHLCBU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 22:01:20 -0400
In-reply-to: <y@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: a.zummo@towertech.it
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>

From: Chanwoo Choi <cw00.choi@samsung.com>

This patchset clean up codes to improve readability as following and support
the RTC of Exynos3250 SoC.
- Remove global variables and then use new s3c_rtc structure
- Remove warn message with checking checkpatch script
- Use variant structure according to SoC type instead of legacy enum variable(s3c_cpu_type)

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
 drivers/rtc/rtc-s3c.c                             | 869 ++++++++++++++--------
 3 files changed, 553 insertions(+), 321 deletions(-)

-- 
1.8.0
