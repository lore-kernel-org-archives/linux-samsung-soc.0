From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 00/10] ARM: S3C24XX gpio cleanups and fixes
Date: Thu, 12 Jul 2012 18:19:53 +0900
Message-ID: <0fb401cd600f$7ef9f9e0$7cededa0$%kim@samsung.com>
References: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56978 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544Ab2GLJTy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:19:54 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M710025XJ8XTO10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:19:53 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71003YGJ959300@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:19:53 +0900 (KST)
In-reply-to: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sylwester Nawrocki wrote:
> 
> This changset attempts to remove the users of an obsolete GPIO API in
> Samsung S3C24XX platform and instead use the gpiolib API. It should
> allow to drop some s3c24xx SoC specific headers as a next step and
> simplify drivers/gpio/gpio-samsung.c driver a little. With the
> introduction of the pinctrl GPIO driver we're going to have three
> distinct GPIO APIs. Let's avoid this and drop the s3c24xx_gpio_*
> functions, which have been scheduled for removal since about v2.6.35.
> 
> Additionally this changeset includes two minor fixes, for AC97 clock
> and CAMIF interrupts.
> 
> 
> Sylwester Nawrocki (10):
>   ARM: S3C24XX: Free the backlight gpio requested in Mini2440 board code
>   ARM: S3C24XX: Convert SMDK board file to the gpiolib API
>   ARM: S3C24XX: Convert QT2410 board file to the gpiolib API
>   ARM: S3C24XX: Convert the PM code to gpiolib API
>   ARM: S3C24XX: Convert the touchscreen setup code to common GPIO API
>   ARM: S3C24XX: Remove unused GPA, GPE, GPH bank GPIO aliases
>   ARM: S3C24XX: Remove unused GPIO definitions for port J
>   ARM: S3C24XX: Remove unused GPIO definitions for Openmoko GTA02 board
>   ARM: S3C24XX: Correct AC97 clock control bit for S3C2440
>   ARM: S3C24XX: Correct CAMIF interrupt definitions
> 
>  arch/arm/mach-s3c24xx/clock-s3c2440.c           |    2 +-
>  arch/arm/mach-s3c24xx/common-smdk.c             |   20 ++++---
>  arch/arm/mach-s3c24xx/include/mach/gpio-nrs.h   |   21 -------
>  arch/arm/mach-s3c24xx/include/mach/gta02.h      |   69
--------------------
> --
>  arch/arm/mach-s3c24xx/include/mach/regs-gpio.h  |   17 +++++-
>  arch/arm/mach-s3c24xx/include/mach/regs-gpioj.h |   70
-------------------
> ----
>  arch/arm/mach-s3c24xx/mach-gta02.c              |    1 -
>  arch/arm/mach-s3c24xx/mach-mini2440.c           |    4 +-
>  arch/arm/mach-s3c24xx/mach-qt2410.c             |    6 +-
>  arch/arm/mach-s3c24xx/mach-rx1950.c             |    1 -
>  arch/arm/mach-s3c24xx/pm-s3c2410.c              |   12 +++-
>  arch/arm/mach-s3c24xx/pm-s3c2412.c              |    1 -
>  arch/arm/mach-s3c24xx/s3c2412.c                 |    1 -
>  arch/arm/mach-s3c24xx/s3c244x.c                 |    1 -
>  arch/arm/mach-s3c24xx/setup-ts.c                |    6 +--
>  arch/arm/plat-samsung/devs.c                    |    3 +-
>  16 files changed, 43 insertions(+), 192 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/regs-gpioj.h
> 
> --
> 1.7.4.1

Basically, looks ok to me :)

I need to check in detail then will apply this series with some guys' ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
