From: Tomasz Figa <t.figa@samsung.com>
Subject: [RFC PATCH 0/6] pinctrl: samsung: Convert the driver to use per-bank
 GPIO and interrupt specifiers
Date: Fri, 21 Sep 2012 16:22:51 +0200
Message-ID: <1348237377-21299-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21354 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752843Ab2IUOXX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 10:23:23 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAP007P5EMVREC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 23:23:22 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAP0020KEMM3N30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 23:23:22 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This is a continuation of work focused on improving the pinctrl-samsung
driver.

First part on which this one depends:
[RFC 0/6] pinctrl: samsung: Remove static platform-specific data
http://article.gmane.org/gmane.linux.kernel.samsung-soc/12759

This series attempts to simplify usage of the driver and fix several
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

Any comments are welcome.

To do:
  - Bindings documentation
  - Per-bank interrupt specifiers for wake-up interrupts
  - Configuration of pins used as wake-up interrupts to EINT function

Tomasz Figa (6):
  pinctrl: samsung: Hold OF node of pin bank in bank struct
  pinctrl: samsung: Hold pointer to driver data in bank struct
  pinctrl: exynos: Use one IRQ domain per pin bank
  pinctrl: samsung: Do not pass gpio_chip to pin_to_reg_bank
  pinctrl: samsung: Use one GPIO chip per pin bank
  ARM: dts: exynos4210: Update pin bank nodes to reflect per-bank GPIO
    chips and IRQ domains

 arch/arm/boot/dts/exynos4210-pinctrl-banks.dtsi |  72 ++++++++++
 arch/arm/boot/dts/exynos4210.dtsi               |   4 -
 drivers/pinctrl/pinctrl-exynos.c                | 118 +++++------------
 drivers/pinctrl/pinctrl-exynos.h                |  12 --
 drivers/pinctrl/pinctrl-samsung.c               | 168 ++++++++++++++----------
 drivers/pinctrl/pinctrl-samsung.h               |  18 ++-
 6 files changed, 220 insertions(+), 172 deletions(-)

-- 
1.7.12
