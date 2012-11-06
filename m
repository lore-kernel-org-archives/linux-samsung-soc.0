From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 0/2] ARM: Exynos: Enable I2S platform support for Exynos5
Date: Tue, 06 Nov 2012 10:14:42 +0530
Message-ID: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28631 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114Ab2KFEmL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 23:42:11 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD1002LBUCHBQC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:42:10 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MD100EQOUCMW270@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:42:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Changes since V2:
	- Rebased to 3.7-rc3
	- Custom DT bindings are prefixed with samsung
	- idma address is moved from dts file dtsi file as it is soc specific
	  property

Changes since V1:
	- Rebased to 3.6-rc6

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
