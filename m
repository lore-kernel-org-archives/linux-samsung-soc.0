From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2nd 2/2] Samsung DT updates for 3.16
Date: Mon, 26 May 2014 11:29:32 +0900
Message-ID: <033001cf788a$53f79c30$fbe6d490$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39666 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901AbaEZC3f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 May 2014 22:29:35 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N65002JVTL9IZE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 11:29:33 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The following changes since commit b5839bd87f197e133a0025c36df286eab6e1d858:

  ARM: dts: Add MFC memory banks to exynos5420 boards (2014-05-20 01:04:13
+0900)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt-2

for you to fetch changes up to 3c8977f17796f0b8816a1a283b0b80b71c83d416:

  ARM: dts: enable usb nodes for exynos4412-trats2 (2014-05-23 03:31:33
+0900)

----------------------------------------------------------------
Samsung 2nd DT updates for v3.16

- exynos4
  : add hsotg device, exynos_usbphy nodes
  : add PMU syscon and audio subsystem nodes
  : replace number by macro in clock binding

- exynos4210-universal_c210
 : add external sd card node and multimedia nodes
 : enable USB functionality

- exynos4412-trats2
 : enable usb nodes and usb gagdet functionality
 : add cm36651 light/proximity sensor node
 : fixed gpio key node

- exynos5250 and exynos5420
  : add pmu syscon handle and sysreg system controller nodes
  : add support for usb2phy
  : replace number by macro in clock binding
  : add USB 2.0 support on exynos5420

- exynos5420-peach-pit
  : move dp hpd gpio pin to pinctrl_0

----------------------------------------------------------------
Beomho Seo (5):
      ARM: dts: add cm36651 light/proximity sensor node for
exynos4412-trats2
      ARM: dts: fixed gpio key node for exynos4412-trats2
      ARM: dts: replace number by macro in clock binding for exynos4
      ARM: dts: replace number by macro in clock binding for exynos5250
      ARM: dts: replace number by macro in clock binding for exynos5420

Chanho Park (4):
      ARM: dts: add PMU syscon node for exynos4
      ARM: dts: add exynos_usbphy node for exynos4
      ARM: dts: add hsotg device node for exynos4
      ARM: dts: enable usb nodes for exynos4412-trats2

Kamil Debski (1):
      ARM: dts: Add usb2phy to exynos5250

Marek Szyprowski (3):
      ARM: dts: enable USB functionality for exynos4210-universal_c210
      ARM: dts: add multimedia nodes for exynos4210-universal_c210
      ARM: dts: add external sd card node for exynos4210-universal_c210

Rahul Sharma (3):
      ARM: dts: move dp hpd gpio pin to pinctrl_0 for exynos5420 peach_pit
      ARM: dts: add pmu syscon handle to exynos5250 hdmi
      ARM: dts: add pmu syscon handle to exynos5420 hdmi

Sylwester Nawrocki (1):
      ARM: dts: Add audio subsystem nodes to exynos4.dtsi

Tomasz Figa (1):
      ARM: dts: Enable USB gadget functionality for exynos4210-trats

Vivek Gautam (3):
      ARM: dts: Add sysreg sytem controller node to exynos5250 and
exynos5420
      ARM: dts: Add usb2phy support on exynos5420
      ARM: dts: Add USB 2.0 support on exynos5420

 .../devicetree/bindings/arm/samsung/pmu.txt        |    3 +
 .../devicetree/bindings/arm/samsung/sysreg.txt     |   11 +++-
 arch/arm/boot/dts/exynos4.dtsi                     |   66
+++++++++++++++++++-
 arch/arm/boot/dts/exynos4210-trats.dts             |   10 +++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |   59 +++++++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts            |   54 +++++++++++++---
 arch/arm/boot/dts/exynos4412.dtsi                  |    4 ++
 arch/arm/boot/dts/exynos4x12.dtsi                  |    9 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |   32 +++++++++-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |   14 ++---
 arch/arm/boot/dts/exynos5420.dtsi                  |   48 +++++++++++++-
 11 files changed, 289 insertions(+), 21 deletions(-)
