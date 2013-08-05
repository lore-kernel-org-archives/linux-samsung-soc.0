From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [GIT PULL] Samsung PWM support cleanup
Date: Tue, 06 Aug 2013 01:32:25 +0200
Message-ID: <3573853.gDiLaTfgOu@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:55265 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755378Ab3HEXcb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Aug 2013 19:32:31 -0400
Received: by mail-ea0-f172.google.com with SMTP id r16so1923882ead.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Aug 2013 16:32:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Olof, Arnd,

Here is the Samsung PWM cleanup series for you. Particular patches of the
series involve following modifications:
 1) fixing up few things in samsung_pwm_timer clocksource driver,
 2) moving remaining Samsung platforms to the new clocksource driver,
 3) removing old clocksource driver,
 4) adding new multiplatform- and DT-aware PWM driver,
 5) moving all Samsung platforms to use the new PWM driver,
 6) removing old PWM driver,
 7) removing all PWM-related code that is not used anymore.

This is my first pull request ever, so I hope I haven't screwed up anything. ;)

Best regards,
Tomasz

The following changes since commit c095ba7224d8edc71dcef0d655911399a8bd4a3f:

  Linux 3.11-rc4 (2013-08-04 13:46:46 -0700)

are available in the git repository at:

  git://github.com/tom3q/linux.git v3.12-next/pwm-cleanup

for you to fetch changes up to 519e8e0da7509fcc71c12bcd3a681bb62770f692:

  ARM: SAMSUNG: Remove plat/regs-timer.h header (2013-08-06 01:21:55 +0200)

----------------------------------------------------------------
Tomasz Figa (20):
      clocksource: samsung_pwm_timer: Do not request PWM mem region
      clocksource: samsung_pwm_timer: Correct definition of AUTORELOAD bit
      clocksource: samsung_pwm_timer: Cache clocksource register address
      clocksource: samsung_pwm_timer: Do not use clocksource_mmio
      clocksource: samsung_pwm_timer: Handle suspend/resume correctly
      ARM: SAMSUNG: Unify base address definitions of timer block
      ARM: SAMSUNG: Add new PWM platform device
      ARM: SAMSUNG: Set PWM platform data
      ARM: SAMSUNG: Move all platforms to new clocksource driver
      ARM: SAMSUNG: Remove old samsung-time driver
      ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
      pwm: samsung: Rename to pwm-samsung-legacy
      pwm: Add new pwm-samsung driver
      ARM: SAMSUNG: Rework private data handling in dev-backlight
      ARM: SAMSUNG: Modify board files to use new PWM platform device
      pwm: Remove superseded pwm-samsung-legacy driver
      ARM: SAMSUNG: Remove old PWM timer platform devices
      ARM: SAMSUNG: Remove pwm-clock infrastructure
      ARM: SAMSUNG: Remove remaining uses of plat/regs-timer.h header
      ARM: SAMSUNG: Remove plat/regs-timer.h header

 arch/arm/Kconfig                                   |  11 +-
 arch/arm/mach-s3c24xx/Kconfig                      |   6 -
 arch/arm/mach-s3c24xx/clock-s3c2410.c              |   1 -
 arch/arm/mach-s3c24xx/clock-s3c2412.c              |   1 -
 arch/arm/mach-s3c24xx/clock-s3c2416.c              |   2 -
 arch/arm/mach-s3c24xx/clock-s3c2443.c              |   2 -
 arch/arm/mach-s3c24xx/common.c                     |  27 +
 arch/arm/mach-s3c24xx/include/mach/map.h           |   2 +
 arch/arm/mach-s3c24xx/mach-h1940.c                 |   4 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c                |   5 +-
 arch/arm/mach-s3c64xx/Kconfig                      |   2 -
 arch/arm/mach-s3c64xx/clock.c                      |   2 -
 arch/arm/mach-s3c64xx/common.c                     |  32 +-
 arch/arm/mach-s3c64xx/include/mach/irqs.h          |   8 -
 arch/arm/mach-s3c64xx/include/mach/map.h           |   1 +
 arch/arm/mach-s3c64xx/irq-pm.c                     |   2 -
 arch/arm/mach-s3c64xx/mach-crag6410.c              |   4 +-
 arch/arm/mach-s3c64xx/mach-hmt.c                   |   4 +-
 arch/arm/mach-s3c64xx/mach-smartq.c                |   4 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |   5 +-
 arch/arm/mach-s5p64x0/Kconfig                      |   2 -
 arch/arm/mach-s5p64x0/clock-s5p6440.c              |   2 -
 arch/arm/mach-s5p64x0/clock-s5p6450.c              |   2 -
 arch/arm/mach-s5p64x0/common.c                     |  27 +
 arch/arm/mach-s5p64x0/include/mach/irqs.h          |   2 -
 arch/arm/mach-s5p64x0/include/mach/map.h           |   1 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |   5 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |   5 +-
 arch/arm/mach-s5p64x0/pm.c                         |   3 -
 arch/arm/mach-s5pc100/Kconfig                      |   1 -
 arch/arm/mach-s5pc100/clock.c                      |   2 -
 arch/arm/mach-s5pc100/common.c                     |  28 +
 arch/arm/mach-s5pc100/include/mach/irqs.h          |   2 -
 arch/arm/mach-s5pc100/include/mach/map.h           |   1 +
 arch/arm/mach-s5pc100/mach-smdkc100.c              |   5 +-
 arch/arm/mach-s5pv210/Kconfig                      |   1 -
 arch/arm/mach-s5pv210/clock.c                      |   1 -
 arch/arm/mach-s5pv210/common.c                     |  28 +
 arch/arm/mach-s5pv210/include/mach/irqs.h          |   2 -
 arch/arm/mach-s5pv210/include/mach/map.h           |   1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   5 +-
 arch/arm/mach-s5pv210/pm.c                         |  10 -
 arch/arm/plat-samsung/Kconfig                      |  14 -
 arch/arm/plat-samsung/Makefile                     |   3 -
 arch/arm/plat-samsung/dev-backlight.c              |  61 +-
 arch/arm/plat-samsung/devs.c                       |  42 +-
 arch/arm/plat-samsung/include/plat/clock.h         |   4 -
 arch/arm/plat-samsung/include/plat/devs.h          |   1 +
 arch/arm/plat-samsung/include/plat/irq-vic-timer.h |  13 -
 arch/arm/plat-samsung/include/plat/irqs.h          |   9 -
 arch/arm/plat-samsung/include/plat/pwm-clock.h     |  81 ---
 arch/arm/plat-samsung/include/plat/pwm-core.h      |  22 +
 arch/arm/plat-samsung/include/plat/regs-timer.h    | 124 ----
 arch/arm/plat-samsung/include/plat/samsung-time.h  |  23 -
 arch/arm/plat-samsung/irq-vic-timer.c              |  98 ---
 arch/arm/plat-samsung/pwm-clock.c                  | 474 --------------
 arch/arm/plat-samsung/s5p-irq.c                    |   4 -
 arch/arm/plat-samsung/samsung-time.c               | 394 ------------
 drivers/clocksource/Kconfig                        |   1 -
 drivers/clocksource/samsung_pwm_timer.c            | 108 ++--
 drivers/pwm/pwm-samsung.c                          | 709 ++++++++++++++-------
 61 files changed, 786 insertions(+), 1660 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/irq-vic-timer.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/pwm-clock.h
 create mode 100644 arch/arm/plat-samsung/include/plat/pwm-core.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/regs-timer.h
 delete mode 100644 arch/arm/plat-samsung/irq-vic-timer.c
 delete mode 100644 arch/arm/plat-samsung/pwm-clock.c
 delete mode 100644 arch/arm/plat-samsung/samsung-time.c
