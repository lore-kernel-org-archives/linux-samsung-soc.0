From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/4] Updated s5p-tv platform definitions
Date: Mon, 05 Sep 2011 21:47:56 +0900
Message-ID: <003001cc6bca$08f8ca30$1aea5e90$%kim@samsung.com>
References: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41235 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758Ab1IEMr5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Sep 2011 08:47:57 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR10025HVJI9AW0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 21:47:56 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LR100ABQVJW4U00@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 05 Sep 2011 21:47:56 +0900 (KST)
In-reply-to: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Stanislawski' <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com

Tomasz Stanislawski wrote:
> 
> Hello,
> 
> This patch series contains platform definitions for s5p-tv driver
> rebased onto latest for-next branch (including generic GIC and clockdev
> changes).
> 
> Changes since v3:
> - vpll code was fixed and moved back to mach-dependant code
> - changed naming from IIC to I2C
> 
> Changes since v2:
> - moved vpll code to plat-s5p/clock-vpll.c
> 
> Changes since v1:
> - renamed i2c8 to common i2c-hdmiphy
> - moved common vpll code to plat-s5p/clock.c
> - added check for pll locking
> - various minor coding style fixes here and there
> 
> Best regards
> 
> Tomasz Stanislawski (4):
>   ARM: Samsung: add i2c hdmiphy controller definitions
>   ARM: S5P: add support for tv device
>   ARM: Exynos4: enable TV support on Universal_C210 board
>   ARM: S5PV210: enable TV support on GONI board
> 
>  arch/arm/mach-exynos4/Kconfig                    |    2 +
>  arch/arm/mach-exynos4/clock.c                    |  200
> +++++++++++++++++++++-
>  arch/arm/mach-exynos4/cpu.c                      |    2 +
>  arch/arm/mach-exynos4/include/mach/i2c-hdmiphy.h |   16 ++
>  arch/arm/mach-exynos4/include/mach/irqs.h        |    4 +
>  arch/arm/mach-exynos4/include/mach/map.h         |   12 ++
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h    |    6 +
>  arch/arm/mach-exynos4/mach-universal_c210.c      |   74 ++++++++
>  arch/arm/mach-s5pv210/Kconfig                    |    1 +
>  arch/arm/mach-s5pv210/clock.c                    |  137 ++++++++++++++-
> -
>  arch/arm/mach-s5pv210/cpu.c                      |    4 +
>  arch/arm/mach-s5pv210/include/mach/i2c-hdmiphy.h |   16 ++
>  arch/arm/mach-s5pv210/include/mach/irqs.h        |    4 +-
>  arch/arm/mach-s5pv210/include/mach/map.h         |   13 ++
>  arch/arm/mach-s5pv210/include/mach/regs-clock.h  |    3 +-
>  arch/arm/mach-s5pv210/mach-goni.c                |    9 +
>  arch/arm/plat-s5p/Kconfig                        |   10 +
>  arch/arm/plat-s5p/Makefile                       |    2 +
>  arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 +++++++
>  arch/arm/plat-s5p/dev-tv.c                       |   98 +++++++++++
>  arch/arm/plat-s5p/include/plat/pll.h             |   14 ++-
>  arch/arm/plat-samsung/include/plat/devs.h        |    6 +
>  arch/arm/plat-samsung/include/plat/iic.h         |    1 +
>  arch/arm/plat-samsung/include/plat/tv-core.h     |   44 +++++
>  24 files changed, 720 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/include/mach/i2c-hdmiphy.h
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/i2c-hdmiphy.h
>  create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
>  create mode 100644 arch/arm/plat-s5p/dev-tv.c
>  create mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h
> 
> --
> 1.7.6

Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
