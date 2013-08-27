From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/2] Add watchdog DT node to Exynos5420 and fix watchdog DT
 node name for Exynos5
Date: Tue, 27 Aug 2013 18:15:16 +0530
Message-ID: <1377607518-21882-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14188 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753234Ab3H0MX2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 08:23:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, t.figa@samsung.com

This patchset does the following things
	- Fixes the watchdog DT node name to follow convention
	- Adds watchdog DT node to Exynos5420 SoC

Note: This series is rebased and tested on Kgene's for-next branch

Leela Krishna Amudala (2):
  ARM: dts: Fix the watchdog DT node name for Exynos5
  ARM: dts: add watchdog device tree node for exynos5420

 arch/arm/boot/dts/exynos5.dtsi    |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi |    3 ++-
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.7.10.4
