From: Pavel Fedin <p.fedin@samsung.com>
Subject: [PATCH 0/4] Exynos SROMc configuration and Ethernet support for
 SMDK5410
Date: Mon, 26 Oct 2015 14:47:40 +0300
Message-ID: <cover.1445859834.git.p.fedin@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38229 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753447AbbJZLrv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 07:47:51 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT002VFSROLM10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 11:47:48 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch extends Exynos SROM controller driver with ability to configure
controller outputs and enables SMSC9115 Ethernet chip on SMDK5410 board,
which is connected via SROMc bank #3.

With this patch, support for the whole existing SMDK range can be added.
Actually, only bank number is different.

This patchset also depends on Exynos 5410 pinctrl support, introduced by
patches 0003 and 0004 from this set:
[PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html

Pinctrl support is necessary in order to correctly configure
multifunctional pins of the Exynos chip.

Pavel Fedin (4):
  ARM: dts: Add SROMc to Exynos 5410
  drivers: exynos-srom: Add support for bank configuration
  ARM: dts: Add Ethernet chip to SMDK5410
  Documentation: dt-bindings: Describe SROMc configuration

 .../bindings/arm/samsung/exynos-srom.txt           | 19 +++++++++-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          | 42 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos5410.dtsi                  |  5 +++
 arch/arm/mach-exynos/Kconfig                       |  2 +-
 drivers/soc/samsung/Kconfig                        |  2 +-
 drivers/soc/samsung/exynos-srom.c                  | 42 +++++++++++++++++++++-
 6 files changed, 108 insertions(+), 4 deletions(-)

-- 
2.4.4
