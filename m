From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/4] Implement RTC support for S3C2443/S3C2416/S3C2450
Date: Fri, 9 Dec 2011 10:46:26 +0100
Message-ID: <201112091046.26563.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:53236 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751729Ab1LIJqs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Dec 2011 04:46:48 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, rtc-linux@googlegroups.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

Similar to the ADC the RTC of S3C2443 and S3C2416/2450 has some slight
variances when compared to the existing types.

This series adds support for those SoCs.

As with the ADC patches, these changes where tested on S3C2416 hardware.
The S3C2443 quirks are a subset of those and are done according to the
datasheet, but not tested on real hardware (as I do not own a S3C2443 device).

I'm also not sure if my changes to the devicetree block in patch 2 are
correct, so I would be really happy if someone could take a closer look
at them.

Heiko Stuebner (4):
  ARM: SAMSUNG: cleanup of rtc register definitions
  rtc-s3c: make room for more variants in devicetree block
  rtc-s3c: add variants for S3C2443 and S3C2416
  ARM: S3C2443/S3C2416: add s3c_rtc_setname and rename rtc devices

 arch/arm/mach-s3c2416/s3c2416.c               |    2 +
 arch/arm/mach-s3c2443/s3c2443.c               |    2 +
 arch/arm/plat-samsung/include/plat/regs-rtc.h |   92 +++++++++++++++---------
 arch/arm/plat-samsung/include/plat/rtc-core.h |   27 +++++++
 drivers/rtc/rtc-s3c.c                         |   71 ++++++++++++++++---
 5 files changed, 149 insertions(+), 45 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/rtc-core.h

-- 
1.7.5.4
