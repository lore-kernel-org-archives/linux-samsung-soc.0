From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 00/10] ARM: S3C24XX: rework irq handling for a later dt usage
Date: Sun, 18 Nov 2012 01:51:00 +0100
Message-ID: <201211180151.01029.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53095 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752453Ab2KRAvJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 17 Nov 2012 19:51:09 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>

All S3C24XX arches share the same interrupt registers and basic handling
principles but the individual interrupts differ quite a lot between all
the arches.

This series therefore tries to unify this a bit by abstracting the irq
handling and enabling the arches to simply provide a structure describing
its individual interrupts.

With this declarative approach it should also be (hopefully) easy to
move this to devicetree later.

For the initial transformation (in patch 1) I gave up on trying to do
this in individual steps, so the patch might be a bit bumpy to read,
but the new irq code does provide the exactly same interrupts and
handlers as the old code. This also means that the unconverted arches
shouldn't feel any difference at all.

I've only included the s3c2416 and s3c2443 interrupts for now, as the
s3c2416 is my main development platform and the s3c2443 is so very
similar. But the other arches use the same mechanics so conversion
should be quite easy later.

As it seems to be the policy for drivers/irqchip that drivers there
should not contain platform-hooks or pollute the namespace with custom
init functons, the irq code stays in plat-s3c24xx for now.

Heiko Stuebner (10):
  ARM: S3C24XX: transform irq handling into a declarative form
  ARM: S3C24XX: move irq-pm code into main irq file
  ARM: S3C24XX: cleanup irq-pm integration
  ARM: S3C24XX: move s3c2416 irq init to common irq code
  ARM: S3C24XX: modify s3c2416 irq init to initialize all irqs
  ARM: S3C24XX: assimilate s3c2416 subirqs into new structure
  ARM: S3C24XX: assimilate second s3c2416 interrupt into new structure
  ARM: S3C24XX: move s3c2443 irq code to irq.c
  ARM: S3C24XX: modify s3c2443 irq init to initialize all irqs
  ARM: S3C24XX: assimilate s3c2443 subirqs into new structure

 arch/arm/mach-s3c24xx/Makefile               |    6 +-
 arch/arm/mach-s3c24xx/common.h               |    2 +
 arch/arm/mach-s3c24xx/irq-pm.c               |   95 ---
 arch/arm/mach-s3c24xx/irq-s3c2416.c          |  348 --------
 arch/arm/mach-s3c24xx/irq-s3c2443.c          |  281 -------
 arch/arm/mach-s3c24xx/mach-smdk2416.c        |    2 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c        |    2 +-
 arch/arm/mach-s3c24xx/s3c2410.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2412.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2416.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2440.c              |    4 +-
 arch/arm/mach-s3c24xx/s3c2442.c              |    4 +-
 arch/arm/plat-s3c24xx/Kconfig                |    1 +
 arch/arm/plat-s3c24xx/irq.c                  | 1140 ++++++++++++++++----------
 arch/arm/plat-samsung/include/plat/pm.h      |    6 -
 arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
 arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
 17 files changed, 737 insertions(+), 1169 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/irq-pm.c
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c

-- 
1.7.2.3
