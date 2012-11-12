From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [RFC PATCH 0/4] ARM: S3C24XX: irq move to drivers and first steps to dt
Date: Mon, 12 Nov 2012 14:46:29 +0100
Message-ID: <201211121446.30167.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:40966 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751911Ab2KLNqj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 08:46:39 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>

On the way back from Barcelona I've started the move of the common
s3c24xx irq-code to drivers/irqchip and also modifications to enable
using it in a devicetree context at some point.

So, as I'm also missing the now probably famous tail-lights in this, it
would be cool to have some feedback if I'm moving in the right
direction here or am thinking wrong somewhere.

The whole endeavour is of course not finished yet, but should not
break anything in its current form.

Tested on a s3c2416 based machine.

Heiko Stuebner (4):
  ARM: S3C24XX: move s3c24xx-irq to drivers/irqchip
  irqchip: s3c24xx: add irq_domains for the interrupt registers
  ARM: S3C24XX: irq_data conversion for s3c_irqsub_* functions
  ARM: S3C24XX: First part converting irq code to use hwirq

 arch/arm/Kconfig                                   |    1 +
 arch/arm/mach-s3c24xx/irq-pm.c                     |    4 +-
 arch/arm/mach-s3c24xx/irq-s3c2412.c                |    6 +-
 arch/arm/mach-s3c24xx/irq-s3c2416.c                |   24 ++--
 arch/arm/mach-s3c24xx/irq-s3c2440.c                |    6 +-
 arch/arm/mach-s3c24xx/irq-s3c2443.c                |   30 ++--
 arch/arm/mach-s3c24xx/irq-s3c244x.c                |    6 +-
 arch/arm/plat-s3c24xx/Makefile                     |    1 -
 arch/arm/plat-samsung/include/plat/irq.h           |   18 ++--
 drivers/irqchip/Kconfig                            |    4 +
 drivers/irqchip/Makefile                           |    1 +
 .../irq.c => drivers/irqchip/irq-s3c24xx.c         |  147 ++++++++++++--------
 12 files changed, 144 insertions(+), 104 deletions(-)
 rename arch/arm/plat-s3c24xx/irq.c => drivers/irqchip/irq-s3c24xx.c (84%)

-- 
1.7.2.3
