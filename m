From: kgene@kernel.org
Subject: RE: [PATCH V2 0/3] ARM: SAMSUNG: Remove plat/regs-serial.h file
Date: Fri, 10 Jan 2014 17:12:04 +0900
Message-ID: <093501cf0ddb$a7b6aec0$f7240c40$@kernel.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
 <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53195 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbaAJIMK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 03:12:10 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ600I58ES86D00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 17:12:08 +0900 (KST)
In-reply-to: <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: broonie@linaro.org

Tushar Behera wrote:
> 
> plat-samsung/include/plat/regs-serial.h only includes linux/serial_s3c.h.
> Including linux/serial_s3c.h directly would reduce platform dependency
> while working towards multi-platform kernel.
> 
> Tested on top of Kukjin's for-next branch.
> Commit 8109c47 "Merge branch 'v3.14-next/dt-exynos-3' into for-next"
> 
> Changes for V2:
> * Squashed patches #2 to #8 from original series.
> * Rebased on top of Kukjin's for-next branch.
> 
> Sachin Kamat (1):
>   ARM: SAMSUNG: Remove platform dependency from samsung.S
> 
> Tushar Behera (2):
>   ARM: SAMSUNG: Replace inclusion of plat/regs-serial.h header file
>   ARM: SAMSUNG: Delete unused plat/regs-serial.h header file
> 
>  arch/arm/include/debug/samsung.S                 |    2 +-
>  arch/arm/mach-exynos/common.c                    |    2 +-
>  arch/arm/mach-s3c24xx/clock-s3c2410.c            |    3 +--
>  arch/arm/mach-s3c24xx/clock-s3c2412.c            |    3 +--
>  arch/arm/mach-s3c24xx/clock-s3c2440.c            |    2 +-
>  arch/arm/mach-s3c24xx/common.c                   |    2 +-
>  arch/arm/mach-s3c24xx/dma-s3c2410.c              |    2 +-
>  arch/arm/mach-s3c24xx/dma-s3c2412.c              |    2 +-
>  arch/arm/mach-s3c24xx/dma-s3c2440.c              |    2 +-
>  arch/arm/mach-s3c24xx/dma-s3c2443.c              |    2 +-
>  arch/arm/mach-s3c24xx/include/mach/debug-macro.S |    2 +-
>  arch/arm/mach-s3c24xx/mach-amlm5900.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-anubis.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-at2440evb.c           |    2 +-
>  arch/arm/mach-s3c24xx/mach-bast.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-gta02.c               |    2 +-
>  arch/arm/mach-s3c24xx/mach-h1940.c               |    2 +-
>  arch/arm/mach-s3c24xx/mach-jive.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-mini2440.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-n30.c                 |    2 +-
>  arch/arm/mach-s3c24xx/mach-nexcoder.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-osiris.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-otom.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-qt2410.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-rx1950.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-rx3715.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c          |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2410.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2413.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2416.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2440.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-smdk2443.c            |    2 +-
>  arch/arm/mach-s3c24xx/mach-tct_hammer.c          |    2 +-
>  arch/arm/mach-s3c24xx/mach-vr1000.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-vstms.c               |    2 +-
>  arch/arm/mach-s3c24xx/pm.c                       |    2 +-
>  arch/arm/mach-s3c24xx/s3c2410.c                  |    2 +-
>  arch/arm/mach-s3c24xx/s3c2412.c                  |    2 +-
>  arch/arm/mach-s3c24xx/s3c244x.c                  |    2 +-
>  arch/arm/mach-s3c24xx/sleep-s3c2410.S            |    2 +-
>  arch/arm/mach-s3c24xx/sleep.S                    |    2 +-
>  arch/arm/mach-s3c64xx/common.c                   |    2 +-
>  arch/arm/mach-s3c64xx/include/mach/debug-macro.S |    2 +-
>  arch/arm/mach-s3c64xx/irq-pm.c                   |    2 +-
>  arch/arm/mach-s3c64xx/mach-anw6410.c             |    2 +-
>  arch/arm/mach-s3c64xx/mach-crag6410.c            |    2 +-
>  arch/arm/mach-s3c64xx/mach-hmt.c                 |    2 +-
>  arch/arm/mach-s3c64xx/mach-mini6410.c            |    2 +-
>  arch/arm/mach-s3c64xx/mach-ncp.c                 |    2 +-
>  arch/arm/mach-s3c64xx/mach-real6410.c            |    2 +-
>  arch/arm/mach-s3c64xx/mach-smartq.c              |    2 +-
>  arch/arm/mach-s3c64xx/mach-smdk6400.c            |    3 +--
>  arch/arm/mach-s3c64xx/mach-smdk6410.c            |    2 +-
>  arch/arm/mach-s3c64xx/s3c6400.c                  |    2 +-
>  arch/arm/mach-s3c64xx/s3c6410.c                  |    2 +-
>  arch/arm/mach-s5p64x0/common.c                   |    2 +-
>  arch/arm/mach-s5p64x0/include/mach/debug-macro.S |    3 +--
>  arch/arm/mach-s5p64x0/irq-pm.c                   |    2 +-
>  arch/arm/mach-s5p64x0/mach-smdk6440.c            |    2 +-
>  arch/arm/mach-s5p64x0/mach-smdk6450.c            |    2 +-
>  arch/arm/mach-s5pc100/common.c                   |    2 +-
>  arch/arm/mach-s5pc100/include/mach/debug-macro.S |    2 +-
>  arch/arm/mach-s5pc100/mach-smdkc100.c            |    2 +-
>  arch/arm/mach-s5pv210/common.c                   |    2 +-
>  arch/arm/mach-s5pv210/include/mach/debug-macro.S |    2 +-
>  arch/arm/mach-s5pv210/mach-aquila.c              |    2 +-
>  arch/arm/mach-s5pv210/mach-goni.c                |    2 +-
>  arch/arm/mach-s5pv210/mach-smdkc110.c            |    2 +-
>  arch/arm/mach-s5pv210/mach-smdkv210.c            |    2 +-
>  arch/arm/mach-s5pv210/mach-torbreck.c            |    2 +-
>  arch/arm/plat-samsung/clock.c                    |    2 +-
>  arch/arm/plat-samsung/devs.c                     |    2 +-
>  arch/arm/plat-samsung/include/plat/regs-serial.h |    1 -
>  arch/arm/plat-samsung/include/plat/uncompress.h  |    2 +-
>  arch/arm/plat-samsung/init.c                     |    3 +--
>  arch/arm/plat-samsung/pm.c                       |    3 +--
>  76 files changed, 75 insertions(+), 82 deletions(-)
>  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-serial.h
> 
> --
> 1.7.9.5

Nice cleanup <plat/regs-serial>, applied.

Thanks,
Kukjin
