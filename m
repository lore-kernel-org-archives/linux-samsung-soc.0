From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/5 v3]  S3C / S5PC100: add clockevent/clocksource support
Date: Thu, 10 Jan 2013 01:37:13 +0100
Message-ID: <201301100137.13695.heiko@sntech.de>
References: <50885608.1030503@openwide.fr> <6825637.7rn5o5FT8e@flatron> <50EDF297.4020908@openwide.fr>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:36634 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932224Ab3AJAhU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 19:37:20 -0500
In-Reply-To: <50EDF297.4020908@openwide.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Romain Naour <romain.naour@openwide.fr>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>

Am Mittwoch, 9. Januar 2013, 23:43:35 schrieb Romain Naour:
> This series of patches converts the s3c and s5pc100 timer driver to the
> clocksource/clockevent API. I made some test on a mini2440 board and I had
> to reduce timers frequency to 1MHz in order to produce a timer's overflow
> every 64ms. Initial timer's frequency (8,45MHz) provide only 7ms between
> each overflow. It is not enough. As timers were previously used to produce
> an IRQ at 200Hz, some board (Osiris, Anubis board) use an external 12MHz
> signal to clock the timers (tclk1). So, I changed their configuration to
> select internal pclk clock instead, but I can't test it.
> 
> Since clockevent/clocksource API becomes available, we can use High
> Resolution Timer and Tickless mode.
> 
> Most of the work is already done in s5p-time.c (renamed samsung-time.c).
> I added some #define for s3c24xx and s5pc100 case.

not sure, if the ack I added to the previous patches will carry thru, so:

The whole series

Acked-by: Heiko Stuebner <heiko@sntech.de>

and tested on a s3c2416 based machine, so

Tested-by: Heiko Stuebner <heiko@sntech.de>


> 
> Naour Romain (5):
>   Rename s5p-time to samsung-time
>   Add samsung-time support for s3c24xx
>   Add samsung-time support for s3c64xx
>   Add samsung-time support for s5pc100
>   Remove unused plat-samsung/time.c
> 
>  arch/arm/Kconfig                                   |   9 +-
>  arch/arm/mach-exynos/Kconfig                       |   2 +-
>  arch/arm/mach-exynos/mach-universal_c210.c         |   6 +-
>  arch/arm/mach-s3c24xx/Kconfig                      |   6 +
>  arch/arm/mach-s3c24xx/mach-amlm5900.c              |   5 +-
>  arch/arm/mach-s3c24xx/mach-anubis.c                |   4 +-
>  arch/arm/mach-s3c24xx/mach-at2440evb.c             |   4 +-
>  arch/arm/mach-s3c24xx/mach-bast.c                  |   4 +-
>  arch/arm/mach-s3c24xx/mach-gta02.c                 |   4 +-
>  arch/arm/mach-s3c24xx/mach-h1940.c                 |   5 +-
>  arch/arm/mach-s3c24xx/mach-jive.c                  |   4 +-
>  arch/arm/mach-s3c24xx/mach-mini2440.c              |   4 +-
>  arch/arm/mach-s3c24xx/mach-n30.c                   |   6 +-
>  arch/arm/mach-s3c24xx/mach-nexcoder.c              |   4 +-
>  arch/arm/mach-s3c24xx/mach-osiris.c                |   4 +-
>  arch/arm/mach-s3c24xx/mach-otom.c                  |   4 +-
>  arch/arm/mach-s3c24xx/mach-qt2410.c                |   4 +-
>  arch/arm/mach-s3c24xx/mach-rx1950.c                |   4 +-
>  arch/arm/mach-s3c24xx/mach-rx3715.c                |   4 +-
>  arch/arm/mach-s3c24xx/mach-smdk2410.c              |   4 +-
>  arch/arm/mach-s3c24xx/mach-smdk2413.c              |   8 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c              |   4 +-
>  arch/arm/mach-s3c24xx/mach-smdk2440.c              |   4 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c              |   4 +-
>  arch/arm/mach-s3c24xx/mach-tct_hammer.c            |   4 +-
>  arch/arm/mach-s3c24xx/mach-vr1000.c                |   4 +-
>  arch/arm/mach-s3c24xx/mach-vstms.c                 |   5 +-
>  arch/arm/mach-s3c64xx/Kconfig                      |   2 +
>  arch/arm/mach-s3c64xx/mach-anw6410.c               |   4 +-
>  arch/arm/mach-s3c64xx/mach-crag6410.c              |   4 +-
>  arch/arm/mach-s3c64xx/mach-hmt.c                   |   4 +-
>  arch/arm/mach-s3c64xx/mach-mini6410.c              |   4 +-
>  arch/arm/mach-s3c64xx/mach-ncp.c                   |   4 +-
>  arch/arm/mach-s3c64xx/mach-real6410.c              |   4 +-
>  arch/arm/mach-s3c64xx/mach-smartq.c                |   2 +
>  arch/arm/mach-s3c64xx/mach-smartq5.c               |   3 +-
>  arch/arm/mach-s3c64xx/mach-smartq7.c               |   3 +-
>  arch/arm/mach-s3c64xx/mach-smdk6400.c              |   4 +-
>  arch/arm/mach-s3c64xx/mach-smdk6410.c              |   4 +-
>  arch/arm/mach-s5p64x0/Kconfig                      |   4 +-
>  arch/arm/mach-s5p64x0/mach-smdk6440.c              |   6 +-
>  arch/arm/mach-s5p64x0/mach-smdk6450.c              |   6 +-
>  arch/arm/mach-s5pc100/Kconfig                      |   1 +
>  arch/arm/mach-s5pc100/mach-smdkc100.c              |   4 +-
>  arch/arm/mach-s5pv210/Kconfig                      |   2 +-
>  arch/arm/mach-s5pv210/mach-aquila.c                |   6 +-
>  arch/arm/mach-s5pv210/mach-goni.c                  |   6 +-
>  arch/arm/mach-s5pv210/mach-smdkc110.c              |   6 +-
>  arch/arm/mach-s5pv210/mach-smdkv210.c              |   6 +-
>  arch/arm/mach-s5pv210/mach-torbreck.c              |   6 +-
>  arch/arm/plat-samsung/Kconfig                      |   2 +-
>  arch/arm/plat-samsung/Makefile                     |   3 +-
>  arch/arm/plat-samsung/include/plat/cpu.h           |   5 -
>  arch/arm/plat-samsung/include/plat/s5p-time.h      |  40 ---
>  arch/arm/plat-samsung/include/plat/samsung-time.h  |  51 ++++
>  .../plat-samsung/{s5p-time.c => samsung-time.c}    | 144 +++++------
>  arch/arm/plat-samsung/time.c                       | 285
> --------------------- 57 files changed, 274 insertions(+), 475
> deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/s5p-time.h
>  create mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
>  rename arch/arm/plat-samsung/{s5p-time.c => samsung-time.c} (68%)
>  delete mode 100644 arch/arm/plat-samsung/time.c
