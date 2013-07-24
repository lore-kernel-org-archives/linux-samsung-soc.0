From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/3] parse watchdog node to read PMU registers addresses
Date: Wed, 24 Jul 2013 15:08:16 +0530
Message-ID: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36807 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568Ab3GXJQH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:16:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF00HXTODYOM40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 18:15:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org

This patch set does the following things
	- add the clock entries to watchdog node.
	- parse the watchdog device node to read pmu wdt sys registers
	  addresses and do mask/unmask enable/disable of WDT in probe
	  and s2r scenarios.

This patch set is rebased on Kgene's for-next branch and is dependent on
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg20582.html

Note: Tested WDT reset on SMDK5420.

Leela Krishna Amudala (3):
  watchdog: s3c2410_wdt: parse watchdog dt node to read PMU registers
    adresses
  ARM: exynos5420: dt: add clock entries to watchdog node
  ARM: dts: exynos: add PMU registers addresses and mask bit to
    watchdog node

 .../devicetree/bindings/watchdog/samsung-wdt.txt   |   14 ++++-
 arch/arm/boot/dts/exynos5.dtsi                     |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |    7 +++
 drivers/watchdog/s3c2410_wdt.c                     |   56 ++++++++++++++++++++
 4 files changed, 77 insertions(+), 2 deletions(-)

-- 
1.7.10.4
