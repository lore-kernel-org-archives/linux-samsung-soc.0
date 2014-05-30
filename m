From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/5] Samsung DT updates for 3.16
Date: Sat, 31 May 2014 04:59:24 +0900
Message-ID: <5388E31C.5070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:51607 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbaE3T72 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 15:59:28 -0400
Received: by mail-pa0-f46.google.com with SMTP id kq14so2046902pab.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 12:59:28 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 3c8977f17796f0b8816a1a283b0b80b71c83d416:

   ARM: dts: enable usb nodes for exynos4412-trats2 (2014-05-23 03:31:33 
+0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt-3

for you to fetch changes up to 345e9bf08276395bd6620dfab56d1b679136d2ce:

   ARM: dts: add secure firmware support for exynos5420-arndale-octa 
(2014-05-31 04:03:31 +0900)

----------------------------------------------------------------
Samsung 3rd DT updates for v3.16

- add dts files support for new SoCs
   : exynos3250 SoC
   : exynos5260 SoC and exynos5260-xyref5260 board
   : exynos5410 SoC and exynos5410-smdk5410 board
   : exynos5800 SoC and exynos5800-peach-pi board

- exynos4210-origen and exynos4412-origen
   : enable RTC and WDT nodes
   : use key code macros

- exynos5250-arndale
   : use key code macros

- exynos5420-arndale-octa
   : add secure firmware support

- exynos5440
   : update watchdog node name

----------------------------------------------------------------
Arun Kumar K (5):
       ARM: dts: add dts file for exynos5800 SoC
       ARM: dts: add dts file for exynos5800-peach-pi board
       ARM: dts: add mfc node for exynos5800
       ARM: dts: correct the usb phy node in exynos5420-peach-pit
       ARM: dts: correct the usb phy node in exynos5800-peach-pi

Chanwoo Choi (1):
       ARM: dts: add pmu sysreg node to exynos3250

Rahul Sharma (5):
       ARM: dts: add dts files for exynos5260 SoC
       ARM: dts: add dts file for exynos5260-xyref5260 board
       ARM: dts: enable hdmi for exynos5800-peach-pi
       ARM: dts: enable display controller for exynos5800-peach-pi
       ARM: dts: enable fimd for exynos5800-peach-pi

Sachin Kamat (3):
       ARM: dts: enable RTC and WDT nodes on Origen boards
       ARM: dts: use key code macros on Origen and Arndale boards
       ARM: dts: update watchdog node name in exynos5440

Tarek Dakhran (1):
       ARM: dts: add dts files for exynos5410 and exynos5410-smdk5410

Tomasz Figa (1):
       ARM: dts: add dts files for exynos3250 SoC

Tushar Behera (1):
       ARM: dts: add secure firmware support for exynos5420-arndale-octa

Vivek Gautam (1):
       ARM: dts: add Vbus regulator for USB 3.0 on exynos5800-peach-pi

  .../devicetree/bindings/arm/samsung/pmu.txt        |   1 +
  arch/arm/boot/dts/Makefile                         |   5 +-
  arch/arm/boot/dts/exynos3250-pinctrl.dtsi          | 475 +++++++++++++++++
  arch/arm/boot/dts/exynos3250.dtsi                  | 444 ++++++++++++++++
  arch/arm/boot/dts/exynos4210-origen.dts            |  19 +-
  arch/arm/boot/dts/exynos4412-origen.dts            |  21 +-
  arch/arm/boot/dts/exynos5250-arndale.dts           |  13 +-
  arch/arm/boot/dts/exynos5260-pinctrl.dtsi          | 574 
+++++++++++++++++++++
  arch/arm/boot/dts/exynos5260-xyref5260.dts         | 103 ++++
  arch/arm/boot/dts/exynos5260.dtsi                  | 304 +++++++++++
  arch/arm/boot/dts/exynos5410-smdk5410.dts          |  82 +++
  arch/arm/boot/dts/exynos5410.dtsi                  | 206 ++++++++
  arch/arm/boot/dts/exynos5420-arndale-octa.dts      |   5 +
  arch/arm/boot/dts/exynos5420-peach-pit.dts         |   4 +-
  arch/arm/boot/dts/exynos5440.dtsi                  |   2 +-
  arch/arm/boot/dts/exynos5800-peach-pi.dts          | 253 +++++++++
  arch/arm/boot/dts/exynos5800.dtsi                  |  28 +
  17 files changed, 2518 insertions(+), 21 deletions(-)
  create mode 100644 arch/arm/boot/dts/exynos3250-pinctrl.dtsi
  create mode 100644 arch/arm/boot/dts/exynos3250.dtsi
  create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
  create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260.dts
  create mode 100644 arch/arm/boot/dts/exynos5260.dtsi
  create mode 100644 arch/arm/boot/dts/exynos5410-smdk5410.dts
  create mode 100644 arch/arm/boot/dts/exynos5410.dtsi
  create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
  create mode 100644 arch/arm/boot/dts/exynos5800.dtsi
