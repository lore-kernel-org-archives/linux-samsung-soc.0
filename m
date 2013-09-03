From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH V4 0/4] exynos dwmmc device tree node cleanup
Date: Tue,  3 Sep 2013 11:34:20 +0530
Message-ID: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:63175 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754976Ab3ICGEf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 02:04:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree@vger.kernel.org
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ian.campbell@citrix.com, t.figa@samsung.com, dianders@chromium.org, cjb@laptop.org, thomas.abraham@linaro.org, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

changes from V3:
	1.Added two new patch in the series
		[1] ARM: dts: Move fifo-depth property from board dts
 		[2] ARM: dts: rename mmc dts node for exynos5 series
changes from V2:
	1.remove from exynos5.dtsi and add in exynos5250.dtsi
	  in single patch.Suggested by Tomasz Figa.
	2.Separate patch for changing status property of dwmmc node
	  in smdk5250 and arndale board dts file.

V1 Patches:
1.[PATCH 1/2] ARM: dts: remove dwmmc nodes from exynos5 common dts file.
	http://www.spinics.net/lists/linux-samsung-soc/msg21602.html
2.[PATCH 2/2] ARM: dts: Add dwmmc nodes in SOC specific dts file
	http://www.spinics.net/lists/linux-samsung-soc/msg21603.html

Yuvaraj Kumar C D (4):
  ARM: dts: Move dwmmc nodes from exynos5.dtsi to exynos5250.dtsi
  ARM: dts: exynos: change status property of dwmmc nodes
  ARM: dts: Move fifo-depth property from board dts
  ARM: dts: rename mmc dts node for exynos5 series

 arch/arm/boot/dts/cros5250-common.dtsi    |    8 +++----
 arch/arm/boot/dts/exynos5.dtsi            |   21 -----------------
 arch/arm/boot/dts/exynos5250-arndale.dts  |   16 ++++---------
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 ++++---------
 arch/arm/boot/dts/exynos5250-snow.dts     |    2 +-
 arch/arm/boot/dts/exynos5250.dtsi         |   36 ++++++++++++++++++++++-------
 6 files changed, 41 insertions(+), 58 deletions(-)

-- 
1.7.9.5
