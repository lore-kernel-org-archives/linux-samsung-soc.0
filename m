From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 00/16] pinctrl: samsung: Usability and extensibiltiy
 improvements
Date: Mon, 08 Oct 2012 10:39:00 +0200
Message-ID: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51326 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753971Ab2JHIj3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Oct 2012 04:39:29 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBK000XRFYO1XW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 17:39:28 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBK0094QG1I1U90@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Oct 2012 17:39:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch series is a work on improving usability and extensibiltiy of the
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

Tomasz Figa (16):
  ARM: dts: exynos4210: Replace legacy GPIO bank nodes with pinctrl
    bank nodes
  pinctrl: exynos: Parse wakeup-eint parameters from DT
  pinctrl: samsung: Detect and handle unsupported configuration types
  pinctrl: samsung: Parse pin banks from DT
  pinctrl: exynos: Remove static SoC-specific data
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
  pinctrl: samsung: Add GPIO to IRQ translation
  Documentation: Update samsung-pinctrl device tree bindings
    documentation

 .../bindings/pinctrl/samsung-pinctrl.txt           | 212 ++++++++--
 arch/arm/boot/dts/exynos4210-pinctrl-banks.dtsi    | 459 +++++++++++++++++++++
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi          |   2 +
 arch/arm/boot/dts/exynos4210.dtsi                  | 254 +-----------
 drivers/pinctrl/pinctrl-exynos.c                   | 399 ++++++++----------
 drivers/pinctrl/pinctrl-exynos.h                   | 184 +--------
 drivers/pinctrl/pinctrl-samsung.c                  | 392 ++++++++++++++----
 drivers/pinctrl/pinctrl-samsung.h                  |  87 ++--
 8 files changed, 1205 insertions(+), 784 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4210-pinctrl-banks.dtsi

-- 
1.7.12
