From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko.stuebner@bqreaders.com>
Subject: [PATCH 0/5] ARM: S3C24XX: more fixes and enhancements for the s3c24xx irqs
Date: Tue, 26 Feb 2013 23:55:44 +0100
Message-ID: <201302262355.44995.heiko.stuebner@bqreaders.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35306 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758699Ab3BZWzz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Feb 2013 17:55:55 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Asorted fixes and enhancements for the recent redo of the s3c24xx
interrupt controllers.

The only real error that gets fixed is the handling of 0-hwirq as
parent_irq on s3c2412 in patch 2. No other of the s3c24xx platforms
uses the bit0 of the parent controller as parent_irq.

Heiko Stuebner (5):
  ARM: S3C24XX: fix redundant checks in the irq mapping function
  ARM: S3C24XX: fix irq parent check
  ARM: S3C24XX: move s3c24xx_init_irq to s3c2410_init_irq
  ARM: S3C24XX: make s3c24xx_init_intc static
  ARM: S3C24XX: add handle_irq function

 arch/arm/Kconfig                                 |    1 +
 arch/arm/mach-s3c24xx/common.h                   |    1 +
 arch/arm/mach-s3c24xx/include/mach/entry-macro.S |   70 ---------
 arch/arm/mach-s3c24xx/irq.c                      |  167 +++++++++++++--------
 arch/arm/mach-s3c24xx/mach-amlm5900.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c               |    7 +-
 arch/arm/mach-s3c24xx/mach-n30.c                 |    4 +-
 arch/arm/mach-s3c24xx/mach-otom.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2410.c            |    2 +-
 arch/arm/mach-s3c24xx/mach-tct_hammer.c          |    2 +-
 arch/arm/mach-s3c24xx/mach-vr1000.c              |    2 +-
 arch/arm/plat-samsung/include/plat/cpu.h         |    1 -
 14 files changed, 115 insertions(+), 150 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/entry-macro.S

-- 
1.7.2.3
