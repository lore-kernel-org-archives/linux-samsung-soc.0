From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH 0/7] ARM: S5P: Support gpio interrupts and GPIOlib gpio_to_irq
Date: Thu, 03 Jun 2010 14:05:27 +0900
Message-ID: <4C073817.7020000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:51039 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767Ab0FCFF2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jun 2010 01:05:28 -0400
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L3F00JWCA53IU@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 14:05:27 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3F00M4JA52RU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jun 2010 14:05:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

This patch set is to support gpio interrupts and GPIOlib gpio_to_irq of
gpio and external interrupts at the samsung s5p cpus.

---
Joonyoung Shim (7):
      ARM: S5PC100: Move external interrupt defines
      ARM: S5P: Add GPIOlib gpio_to_irq for external interrupts
      ARM: S5PV210: Support GPIOlib gpio_to_irq for external interrupts
      ARM: S5PC100: Use S5P GPIOlib gpio_to_irq function for external interrupts
      ARM: S5PV210: Add gpio interrupt support
      ARM: S5PC100: Use S5P gpio interrupts interface
      ARM: S5P: Add GPIOlib gpio_to_irq for gpio interrupts

 arch/arm/mach-s5pc100/Makefile                 |    2 +-
 arch/arm/mach-s5pc100/gpiolib.c                |   65 +-----
 arch/arm/mach-s5pc100/include/mach/gpio.h      |    7 -
 arch/arm/mach-s5pc100/include/mach/irqs.h      |   18 ++-
 arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +
 arch/arm/mach-s5pc100/irq-gpio.c               |  266 ------------------------
 arch/arm/mach-s5pv210/gpiolib.c                |   13 +-
 arch/arm/mach-s5pv210/include/mach/irqs.h      |   16 ++-
 arch/arm/plat-s5p/Makefile                     |    3 +-
 arch/arm/plat-s5p/gpiolib.c                    |   42 ++++
 arch/arm/plat-s5p/irq-gpioint.c                |  208 ++++++++++++++++++
 arch/arm/plat-samsung/include/plat/gpio-core.h |    6 +
 12 files changed, 319 insertions(+), 334 deletions(-)
 delete mode 100644 arch/arm/mach-s5pc100/irq-gpio.c
 create mode 100644 arch/arm/plat-s5p/gpiolib.c
 create mode 100644 arch/arm/plat-s5p/irq-gpioint.c
