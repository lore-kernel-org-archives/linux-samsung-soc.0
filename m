From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 0/3] Add Exynos5800 support
Date: Fri,  9 May 2014 17:55:00 +0530
Message-ID: <1399638303-32600-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:51080 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702AbaEIMZM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 08:25:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olof@lixom.net, arunkk.samsung@gmail.com

Exynos5800 is a derivative of Exynos5420 with higher
clock speeds and most other IP blocks remaining the same
except for a few.

This patchset is based on Kukjin's for-next branch
and Tomasz's samsung-next branch containing Shaik's clock
cleanup series for 5420.

Changes from v1
--------------
- Rebased on Shaik's clock consolidation for 5420
- Addressed review comments from Tomasz

Alim Akhtar (1):
  clk: exynos5420: Add 5800 specific clocks

Arun Kumar K (2):
  ARM: dts: Add Exynos5800 dt file
  ARM: dts: Add peach-pi board support

 .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |  144 +++++++++
 arch/arm/boot/dts/exynos5800.dtsi                  |   24 ++
 drivers/clk/samsung/clk-exynos5420.c               |  306 ++++++++++++++++----
 include/dt-bindings/clock/exynos5420.h             |    4 +
 6 files changed, 428 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
 create mode 100644 arch/arm/boot/dts/exynos5800.dtsi

-- 
1.7.9.5
