From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 00/13] ARM: dts: Add camera and magnetometer support for
 TRATS(2) board
Date: Mon, 01 Jul 2013 17:22:22 +0200
Message-ID: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:65282 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754309Ab3GAPXk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jul 2013 11:23:40 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MP900473K3FFD20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Jul 2013 00:23:39 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series includes some fixes and extensions to the Exynos dts
files to add the camera and magnetometer sensor support for the TRATS
and TRATS2 board. It depends on a patch from Tomasz adding initial
TRATS2 board dts file [1].

Comparing to the previous version of this patch set I've added a few
more patches, for the Exynos4210 based TRATS board and a patch adding
MIPI CSIS/DSIM PHY provider nodes and related properties to the PHY
consumer nodes.

This series has been tested with the S5K6A3/FIMC-IS and S5K5BAFX
(front facing) cameras on top of next-20130627 tag. It can be found
also at:
http://git.linuxtv.org/snawrocki/samsung.git/next-20130627-dts-trats-v3

Detailed changes since v2 are listed in each patch.

Changes since v1:
 - enabled pull down in cam-port-{a, b}-clk-idle nodes (1/8)
 - added node alias for i2c-gpio@0 I2C controller node (7/8).

[1] http://www.spinics.net/lists/arm-kernel/msg253184.html

Andrzej Hajda (2):
  ARM: dts: Add Exynos4210 SoC camera port pinctrl nodes
  ARM: dts: Add S5K5BA sensor regulator definitions for Trats board

Jacek Anaszewski (1):
  ARM: dts: Add AK8975 device node for Exynos4412 TRATS2 board

Sylwester Nawrocki (10):
  ARM: dts: Correct camera pinctrl nodes for Exynos4x12 SoCs
  ARM: dts: Add pinctrl entries for Exynos4x12 FIMC-IS peripherals
  ARM: dts: Add ISP power domain node for Exynos4x12
  ARM: dts: Use generic DMA bindings for Exynos4 SPI devices
  ARM: dts: Add camera subsystem device nodes to exynos4.dtsi
  ARM: dts: Add camera subsystem nodes to exynos4x12.dtsi
  ARM: dts: Add camera device nodes for Exynos4412 TRATS2 board
  ARM: dts: Add camera device nodes for Exynos4210 SoCs
  ARM: dts: Add FIMC nodes for Exynos4210 Trats board
  ARM: dts: Add MIPI PHY node to exynos4.dtsi

 arch/arm/boot/dts/exynos4.dtsi            |  102 ++++++++++++++++++++++++--
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi |   23 ++++++
 arch/arm/boot/dts/exynos4210-trats.dts    |  103 ++++++++++++++++++++++-----
 arch/arm/boot/dts/exynos4210.dtsi         |   30 ++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts   |  110 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   61 ++++++++++++++--
 arch/arm/boot/dts/exynos4x12.dtsi         |  103 +++++++++++++++++++++++++++
 7 files changed, 503 insertions(+), 29 deletions(-)

--
1.7.9.5
