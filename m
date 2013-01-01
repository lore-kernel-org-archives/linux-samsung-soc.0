From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH v2 00/11] ARM: S3C24XX: rework irq handling for a later dt usage
Date: Tue, 1 Jan 2013 22:51:15 +0100
Message-ID: <201301012251.15899.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:56745 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752439Ab3AAVva (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jan 2013 16:51:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>

Second version of redoing the s3c24xx irqs in a generic way by using a
declarative approach.

Changes include further generalizations resulting only in common
irq-type declarations being needed and thus again easier code.

As in the first version, the 1st patch might be hard to read due to the
rewrite character, but I didn't see a way to do these changes in individual
steps. So it might be helpful to look at the result after applying this patch.

Runtime-tested on a s3c2416 based board and compile tested for the others.

As also written before, inclusion of the other S3C24XX SoCs to follow once
the general approach is acceptable.

Heiko Stuebner (11):
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
  ARM: S3C24XX: remove maskack irq ack funtions

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
 arch/arm/plat-s3c24xx/irq.c                  | 1092 +++++++++++++++-----------
 arch/arm/plat-samsung/include/plat/pm.h      |    6 -
 arch/arm/plat-samsung/include/plat/s3c2416.h |    1 +
 arch/arm/plat-samsung/include/plat/s3c2443.h |    2 +
 17 files changed, 649 insertions(+), 1209 deletions(-)
 delete mode 100644 arch/arm/mach-s3c24xx/irq-pm.c
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2416.c
 delete mode 100644 arch/arm/mach-s3c24xx/irq-s3c2443.c

-- 
1.7.2.3
