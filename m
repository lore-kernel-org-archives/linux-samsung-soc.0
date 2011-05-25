From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RFC][PATCH 0/7] ARM: Add clkdev support for Samsung's platforms
Date: Wed, 25 May 2011 14:52:50 -0700
Message-ID: <4DDD7A32.80309@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:34467 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753272Ab1EYVwx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 17:52:53 -0400
Received: by pzk9 with SMTP id 9so37360pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 14:52:53 -0700 (PDT)
In-Reply-To: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 05/19/11 14:18, Thomas Abraham wrote:
> Thomas Abraham (7):
>    ARM: SAMSUNG: Add clkdev infrastructure
>    ARM: S3C24XX: Add clkdev support
>    ARM: S3C64XX: Add clkdev support
>    ARM: S5P64X0: Add clkdev support
>    ARM: S5PC100: Add clkdev support
>    ARM: S5PV210: Add clkdev support
>    ARM: Exynos4: Add clkdev support
>
>   arch/arm/Kconfig                            |    6 ++
>   arch/arm/mach-exynos4/clock.c               |   63 +++++++++++++++++++-
>   arch/arm/mach-exynos4/include/mach/clkdev.h |    7 ++
>   arch/arm/mach-exynos4/time.c                |    2 +
>   arch/arm/mach-s3c2412/clock.c               |    3 +
>   arch/arm/mach-s3c2416/clock.c               |    5 ++
>   arch/arm/mach-s3c2443/clock.c               |    4 +
>   arch/arm/mach-s3c64xx/clock.c               |   25 ++++++++
>   arch/arm/mach-s3c64xx/include/mach/clkdev.h |    7 ++
>   arch/arm/mach-s5p64x0/clock-s5p6440.c       |   20 +++++++
>   arch/arm/mach-s5p64x0/clock-s5p6450.c       |   19 ++++++
>   arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 ++
>   arch/arm/mach-s5pc100/clock.c               |   42 +++++++++++++-
>   arch/arm/mach-s5pc100/include/mach/clkdev.h |    7 ++
>   arch/arm/mach-s5pv210/clock.c               |   42 +++++++++++++-
>   arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 ++
>   arch/arm/plat-s3c24xx/include/mach/clkdev.h |    7 ++
>   arch/arm/plat-s3c24xx/s3c2410-clock.c       |    3 +
>   arch/arm/plat-s3c24xx/s3c2443-clock.c       |    4 +
>   arch/arm/plat-s5p/s5p-time.c                |    9 +++
>   arch/arm/plat-samsung/clock.c               |   83 ++-------------------------
>   arch/arm/plat-samsung/include/plat/clock.h  |    3 +
>   arch/arm/plat-samsung/pwm-clock.c           |   10 +++
>   arch/arm/plat-samsung/time.c                |    2 +
>   24 files changed, 303 insertions(+), 84 deletions(-)
>   create mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
>   create mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h
>   create mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
>   create mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h
>   create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
>   create mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h
>
Hi Thomas,

Thanks for this patches :)

There are some comments in each patches and I need to check again about 
the devname like following.

s5p-fimc vs. s5pv210-fimc
sdhci-s3c vs. s3c-sdhci
and so on...

Since I'm out of office now, don't have all regarding materials. I will 
back this soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
