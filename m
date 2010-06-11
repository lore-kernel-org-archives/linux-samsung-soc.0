From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
Date: Fri, 11 Jun 2010 17:33:14 +0900
Message-ID: <4C11F4CA.10802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:19268 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759152Ab0FKIdP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Jun 2010 04:33:15 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L3U00HYOD3E6310@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jun 2010 17:33:14 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L3U00EC9D3EYA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Jun 2010 17:33:14 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

This patch v2 set is to support gpio interrupts of samsung s5p cpus, and
the GPIOlib gpio_to_irq goes to plat-samsung gpiolib, so patch v2 set 
has four commit smaller than v1.

Changes since v1:
- Add irq_base to s3c_gpio_chip struct 
- GPIOlib gpio_to_irq() is implemented to samsung_gpiolib_to_irq() of
  plat-samsung gpiolib

Joonyoung Shim (4):
      ARM: S5PV210: Add gpio interrupt support
      ARM: S5PC100: Use S5P gpio interrupts interface
      ARM: S5PC100: Move external interrupt defines
      ARM: SAMSUNG: Add GPIOlib gpio_to_irq

 arch/arm/mach-s5pc100/Makefile                 |    2 +-
 arch/arm/mach-s5pc100/gpiolib.c                |   70 ++-----
 arch/arm/mach-s5pc100/include/mach/gpio.h      |    7 -
 arch/arm/mach-s5pc100/include/mach/irqs.h      |   18 ++-
 arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +
 arch/arm/mach-s5pc100/irq-gpio.c               |  266 ------------------------
 arch/arm/mach-s5pv210/gpiolib.c                |   18 ++-
 arch/arm/mach-s5pv210/include/mach/irqs.h      |   16 ++-
 arch/arm/plat-s5p/Makefile                     |    2 +-
 arch/arm/plat-s5p/irq-gpioint.c                |  208 ++++++++++++++++++
 arch/arm/plat-samsung/gpiolib.c                |    9 +
 arch/arm/plat-samsung/include/plat/gpio-core.h |    6 +
 12 files changed, 295 insertions(+), 334 deletions(-)
 delete mode 100644 arch/arm/mach-s5pc100/irq-gpio.c
 create mode 100644 arch/arm/plat-s5p/irq-gpioint.c
