From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung Fixes for v3.1-rc3
Date: Sat, 20 Aug 2011 00:01:09 +0900
Message-ID: <005401cc5e80$d494d410$7dbe7c30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31412 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755821Ab1HSPBM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 11:01:12 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600073KDXGX80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 20 Aug 2011 00:01:10 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ600CEFKDY79@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 20 Aug 2011 00:01:10 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Hi Arnd,

This is pull request for Samsung fixes for v3.1-rc3.

Please pull Samsung fixes from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
samsung-fixes

These things are for _real_ fixing.

And as a note, following is only for v3.1:

5d747c6 ARM: S5P: fix bug in spdif_clk_get_rate
3f6065d ARM: S5P: add required chained_irq_enter/exit to gpio-int code
70b0e82 ARM: EXYNOS4: add required chained_irq_enter/exit to eint code
995b528 ARM: SAMSUNG: Add chained enrty/exit call to timer interrupt handler
7e1291d ARM: S5PV210: Fix build warning
5a1993f ARM: EXYNOS4: Fix the IRQ definitions for MIPI CSIS device
6b875cb ARM: EXYNOS4: remove duplicated inclusion
af8a9f6 ARM: EXYNOS4: Fix wrong devname to support clkdev
b8a297d ARM: SAMSUNG: Fix Section mismatch in samsung_bl_set()
ac0d151 ARM: S5P64X0: Replace irq_gc_ack() with irq_gc_ack_set_bit()

Of course, others should be fixed on stable kernel.

f98d429 ARM: S3C64XX: Fix build break in PM debug
d2edddf ARM: EXYNOS4: Add restart hook for proper reboot
2b431ff ARM: EXYNOS4: Increase reset delay for USB HOST PHY
c1a238a ARM: EXYNOS4: Use the correct regulator names on universal_c210

So will send above to stable@kernel.org soon.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 93ee7a9340d64f20295aacc3fb6a22b759323280:

  Linux 3.1-rc2 (2011-08-14 15:09:08 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
samsung-fixes

Abhilash Kesavan (2):
      ARM: S5PV210: Fix build warning
      ARM: S3C64XX: Fix build break in PM debug

Huang Weiyi (1):
      ARM: EXYNOS4: remove duplicated inclusion

Jonghwan Choi (1):
      ARM: EXYNOS4: Fix wrong devname to support clkdev

Kukjin Kim (2):
      ARM: S5P64X0: Replace irq_gc_ack() with irq_gc_ack_set_bit()
      ARM: SAMSUNG: Fix Section mismatch in samsung_bl_set()

Kyungmin Park (2):
      ARM: EXYNOS4: Use the correct regulator names on universal_c210
      ARM: EXYNOS4: Add restart hook for proper reboot

Marek Szyprowski (3):
      ARM: SAMSUNG: Add chained enrty/exit call to timer interrupt handler
      ARM: EXYNOS4: add required chained_irq_enter/exit to eint code
      ARM: S5P: add required chained_irq_enter/exit to gpio-int code

Naveen Krishna Chatradhi (1):
      ARM: S5P: fix bug in spdif_clk_get_rate

Sylwester Nawrocki (1):
      ARM: EXYNOS4: Fix the IRQ definitions for MIPI CSIS device

Yulgon Kim (1):
      ARM: EXYNOS4: Increase reset delay for USB HOST PHY

 arch/arm/mach-exynos4/clock.c                  |    2 +-
 arch/arm/mach-exynos4/cpu.c                    |   11 ++++++++++-
 arch/arm/mach-exynos4/include/mach/irqs.h      |    5 ++---
 arch/arm/mach-exynos4/include/mach/regs-pmu.h  |    2 ++
 arch/arm/mach-exynos4/irq-eint.c               |    7 +++++++
 arch/arm/mach-exynos4/mach-universal_c210.c    |    4 ++--
 arch/arm/mach-exynos4/setup-usb-phy.c          |    2 +-
 arch/arm/mach-s3c64xx/pm.c                     |    1 +
 arch/arm/mach-s5p64x0/irq-eint.c               |    2 +-
 arch/arm/mach-s5pv210/pm.c                     |    2 +-
 arch/arm/plat-s5p/clock.c                      |    2 +-
 arch/arm/plat-s5p/irq-gpioint.c                |    6 ++++++
 arch/arm/plat-samsung/include/plat/backlight.h |    2 +-
 arch/arm/plat-samsung/irq-vic-timer.c          |    5 +++++
 14 files changed, 41 insertions(+), 12 deletions(-)
