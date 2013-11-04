From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 0/3] ARM: dts: exynos: Add missing dt data to bring up kernel
 featurea
Date: Mon, 04 Nov 2013 10:55:58 +0900
Message-ID: <1383530161-24080-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35671 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752031Ab3KDB4L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Nov 2013 20:56:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Chanwoo Choi <cw00.choi@samsung.com>

This patchset add missing dt data to bring up kernel feature
- GPS_ALIVE power domain
- PMU
- Clock data for Multi core timer

Changes since v2:
- Delete MAUDIO power domain

Changes since v1:
- Fix wrong address of GPS_ALIVE power domain

Chanwoo Choi (2):
  ARM: dts: exynos4212: Add PMU dt data for pmu-irq
  ARM: dts: exynos4x12: Add gps_alive power domain for exynos4x12

Marek Szyprowski (1):
  ARM: dts: exynos4212: Add missing clock for multi core timer

 arch/arm/boot/dts/exynos4212.dtsi | 8 ++++++++
 arch/arm/boot/dts/exynos4x12.dtsi | 5 +++++
 2 files changed, 13 insertions(+)

-- 
1.8.0
