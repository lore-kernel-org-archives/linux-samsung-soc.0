From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V1 0/2] ARM: Exynos: Enable I2S platform support for Exynos5
Date: Thu, 27 Sep 2012 15:56:34 +0530
Message-ID: <1348741596-29451-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63006 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754494Ab2I0KVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 06:21:53 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB0001EU7FGQBH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:21:52 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MB000MWN7G70X10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:21:50 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

This patch set enables device tree based platform support for the three I2S
controllers on Samsung's Exynos5 SoC's.

Padmavathi Venna (2):
  ARM: dts: Add nodes for i2s controllers for Samsung Exynos5 platforms
  ARM: EXYNOS: Enable platform support for I2S controllers

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   28 ++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    6 ++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

-- 
1.7.4.4
