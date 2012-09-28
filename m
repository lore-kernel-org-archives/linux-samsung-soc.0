From: Tomasz Figa <t.figa@samsung.com>
Subject: [RFC PATCH 00/16] pinctrl: samsung: Usability and extensibiltiy
 improvements
Date: Fri, 28 Sep 2012 16:28:31 +0200
Message-ID: <1348842527-22460-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15248 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757572Ab2I1O3I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 10:29:08 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB2008ICDKH84P0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 23:29:06 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB200E7BDK3XB70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Sep 2012 23:29:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This RFC series is a work on improving usability and extensibiltiy of the
pinctrl-samsung driver. It consists of three main parts:
 - moving SoC-specific data to device tree
 - converting the driver to use one GPIO chip and one IRQ domain per pin bank
 - introducing generic wake-up interrupt capability description

What the first part does is replacing static platform-specific data in
pinctrl-samsung driver with data dynamically parsed from device tree.

It aims at reducing the SoC-specific part of the driver and thus the
amount of modifications to driver sources when adding support for next
SoCs (like Exynos4x12).

In addition, it extends the description of SoC-specific attributes to cover all
mainlined Samsung SoCs, starting from s3c24xx and ending on latest Exynos5
series, with the exception of 4-bit banks with more than 8 pins on S3C64xx,
which will be covered by futher patch(es).

The second part attempts to simplify usage of the driver and fix several
problems of current implementation, in particular:

  - Simplifies GPIO pin specification in device tree by using pin
    namespace local to pin bank instead of local to pin controller, e.g.

	gpios = <&gpj0 3 0>;

    instead of

	gpios = <&pinctrl0 115 0>;

  - Simplifies GPIO interrupt specification in device tree by using
    namespace local to pin bank (and equal to GPIO namespace), e.g.

	interrupt-parent = <&gpj0>;
	interrupts = <3 0>;

    instead of

	interrupt-parent = <&pinctrl0>;
	interrupts = <115 0>;

  - Simplifies internal GPIO pin to bank translation thanks to
    correspondence of particular GPIO chips to pin banks. This allows
    to remove the (costly in case of GPIO bit-banging drivers) lookup
    over all banks to find the one that the pin is from.

Third part is focused on removing the static, hard-coded description of wake-up
interrupt controller and wake-up interrupt layout.

It defines a (mostly) generic (in scope of targetted SoCs) wake-up interrupt
layout specification format that allows to specify which pin banks support
wake-up interrupts and how they are handled (direct or multiplexed/chained).

See particular patches for more detailed descriptions and the last patch for
updated device tree bindings.

Any comments are welcome.

Tomasz Figa (16):
  pinctrl: exynos: Parse wakeup-eint parameters from DT
  pinctrl: samsung: Detect and handle unsupported configuration types
  pinctrl: samsung: Parse pin banks from DT
  pinctrl: exynos: Remove static platform-specific data
  pinctrl: samsung: Parse bank-specific eint offset from DT
  pinctrl: samsung: Hold OF node of pin bank in bank struct
  pinctrl: samsung: Hold pointer to driver data in bank struct
  pinctrl: exynos: Use one IRQ domain per pin bank
  pinctrl: samsung: Do not pass gpio_chip to pin_to_reg_bank
  pinctrl: samsung: Use one GPIO chip per pin bank
  pinctrl: samsung: Use per-bank IRQ domain for wake-up interrupts
  pinctrl: exynos: Set pin function to EINT in irq_set_type of wake-up
    EINT
  pinctrl: samsung: Parse offsets of particular registers from DT
  ARM: dts: exynos4210: Remove legacy gpio nodes
  ARM: dts: exynos4210: Add platform-specific descriptions for pin
    controllers
  Documentation: Update samsung-pinctrl device tree bindings
    documentation

 .../bindings/pinctrl/samsung-pinctrl.txt           | 212 ++++++++--
 arch/arm/boot/dts/exynos4210-pinctrl-banks.dtsi    | 459 +++++++++++++++++++++
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi          |   2 +
 arch/arm/boot/dts/exynos4210.dtsi                  | 254 +-----------
 drivers/pinctrl/pinctrl-exynos.c                   | 401 ++++++++----------
 drivers/pinctrl/pinctrl-exynos.h                   | 184 +--------
 drivers/pinctrl/pinctrl-samsung.c                  | 372 +++++++++++++----
 drivers/pinctrl/pinctrl-samsung.h                  |  87 ++--
 8 files changed, 1186 insertions(+), 785 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4210-pinctrl-banks.dtsi

-- 
1.7.12
