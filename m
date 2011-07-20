From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/8] ARM: SAMSUNG: Add common PWM Backlight support
Date: Wed, 20 Jul 2011 22:35:12 +0900
Message-ID: <06a901cc46e2$026e7b90$074b72b0$%kim@samsung.com>
References: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48596 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302Ab1GTNgV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 09:36:21 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOM00J9ZWGK6UE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:36:20 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOM00AEHWGKME@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Jul 2011 22:36:20 +0900 (KST)
In-reply-to: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Banajit Goswami' <banajit.g@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com

Banajit Goswami wrote:
> 
>  The patches are created against "for-next" branch of Kukjin Kim's tree
at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
>  Patch [1/8]
>   -- add a common infrastructure to support PWM backlight for various
>      Samsung boards.
> 
>  Patch [2/8]
>   -- Add support for PWM backlight for SMDKV310 board.
> 
>  Patch [3/8]
>   -- Add support for PWM backlight for SMDKC210 board.
> 
>  Patch [4/8]
>   -- Add support for PWM backlight for SMDKV210 board.
> 
>  Patch [5/8]
>   -- Add support for PWM backlight for SMDKC100 board.
> 
>  Patch [6/8]
>   -- Add support for PWM backlight for SMDK6440 board.
> 
> Patch [7/8]
>   -- Add support for PWM backlight for SMDK6450 board.
> 
>  Patch [8/8]
>   -- Add support for PWM backlight for SMDK6410 board.
> 
>  Patch 3 with PWM Backlight support for SMDKC210 is only compile tested.
> 
>    [Patch 1/8] ARM: SAMSUNG: Create a common infrastructure for PWM
> backlight support
>    [Patch 2/8] ARM: EXYNOS4: Add PWM backlight support on Samsung
> SMDKV310 board
>    [Patch 3/8] ARM: EXYNOS4: Add PWM backlight support on Samsung
> SMDKC210 board
>    [Patch 4/8] ARM: S5PV210: Add PWM backlight support on Samsung
> SMDKV210 board
>    [Patch 5/8] ARM: S5PC100: Add PWM backlight support on Samsung
> SMDKC100 board
>    [Patch 6/8] ARM: S5P64X0: Add PWM backlight support on Samsung
> SMDK6440 board
>    [Patch 7/8] ARM: S5P64X0: Add PWM backlight support on Samsung
> SMDK6450 board
>    [Patch 8/8] ARM: S3C64XX: Add PWM backlight support on Samsung
> SMDK6410 board
> 
>  arch/arm/mach-exynos4/Kconfig                  |    4 +
>  arch/arm/mach-exynos4/mach-smdkc210.c          |   16 +++
>  arch/arm/mach-exynos4/mach-smdkv310.c          |   16 +++
>  arch/arm/mach-s3c64xx/Kconfig                  |    1 +
>  arch/arm/mach-s3c64xx/mach-smdk6410.c          |   15 ++-
>  arch/arm/mach-s5p64x0/Kconfig                  |    2 +
>  arch/arm/mach-s5p64x0/mach-smdk6440.c          |   54 ++-------
>  arch/arm/mach-s5p64x0/mach-smdk6450.c          |   54 ++-------
>  arch/arm/mach-s5pc100/Kconfig                  |    1 +
>  arch/arm/mach-s5pc100/mach-smdkc100.c          |   55 ++-------
>  arch/arm/mach-s5pv210/Kconfig                  |    1 +
>  arch/arm/mach-s5pv210/mach-smdkv210.c          |   54 ++-------
>  arch/arm/plat-samsung/Kconfig                  |    6 +
>  arch/arm/plat-samsung/Makefile                 |    1 +
>  arch/arm/plat-samsung/dev-backlight.c          |  151
> ++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/backlight.h |   26 ++++
>  16 files changed, 291 insertions(+), 166 deletions(-)
>  create mode 100644 arch/arm/plat-samsung/dev-backlight.c
>  create mode 100644 arch/arm/plat-samsung/include/plat/backlight.h
> 
> --
> 1.7.2.3

Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
