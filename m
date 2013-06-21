From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/8] ARM: dts: Add camera and barometer sensor support for
 TRATS2 board
Date: Fri, 21 Jun 2013 14:50:16 +0200
Message-ID: <1371819024-12596-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:23449 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933510Ab3FUMvA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 08:51:00 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOQ002TRUCQPVG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Jun 2013 21:50:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series includes some fixes and extensions to the Exynos
dts files to add the camera and barometer sensor support for TRATS2
board. It depends on a patch from Tomasz adding initial TRATS2
board dts file [1].

[1] http://www.spinics.net/lists/arm-kernel/msg253184.html

Jacek Anaszewski (1):
  ARM: dts: Add AK8975 device node for Exynos4412 TRATS2 board

Sylwester Nawrocki (7):
  ARM: dts: Correct camera pinctrl nodes for Exynos4x12 SoCs
  ARM: dts: Add pinctrl entries for Exynos4x12 FIMC-IS peripherals
  ARM: dts: Add ISP power domain node for Exynos4x12
  ARM: dts: Use generic DMA bindings for Exynos4 SPI devices
  ARM: dts: Add camera nodes for Exynos4 SoCs
  ARM: dts: Add camera subsystem nodes to exynos4x12.dtsi
  ARM: dts: Add camera device nodes for Exynos4412 TRATS2 board

 arch/arm/boot/dts/exynos4.dtsi            |   80 +++++++++++++++++--
 arch/arm/boot/dts/exynos4412-trats2.dts   |  106 +++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   61 ++++++++++++--
 arch/arm/boot/dts/exynos4x12.dtsi         |  123 +++++++++++++++++++++++++++++
 4 files changed, 357 insertions(+), 13 deletions(-)

--
1.7.9.5
