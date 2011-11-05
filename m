From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/6]  SPI platform device consolidation
Date: Sat, 05 Nov 2011 12:32:10 +0900
Message-ID: <02ea01cc9b6b$80990660$81cb1320$%kim@samsung.com>
References: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29818 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab1KEDcM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 23:32:12 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU6001RI4HMBK10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 12:32:11 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU6000ZZ4HM7Z40@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 12:32:10 +0900 (KST)
In-reply-to: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

Padmavathi Venna wrote:
> 
> SPI platform devices are defined in respective machine folder of
> Samsung S3C64XX and S5P series SoCs.This patchset moves S3C64XX
> and S5P series of SPI platform devices to a common place plat-samsung.
> This patchset also creates SPI setup files for GPIO configurations and
> initializes the platform specific data in the corresponding machine file.
> 
> Padmavathi Venna (6):
>   ARM: SAMSUNG: Consolidation of SPI platform devices to
>     plat-samsung
>   ARM: S3C64XX: Modified files for SPI consolidation work
>   ARM: S5PC100: Modified files for SPI consolidation work.
>   ARM: S5P64X0: Modified files for SPI consolidation work
>   ARM: S5PV210: Modified files for SPI consolidation work
> 
> The following patch make the corresponding SPI changes required for
> Wolfson Cragganmore S3C6410 variant. This patch is only build tested.
> 
>   ARM: S3C64XX: Modified according to SPI consolidation work.
> 
>  arch/arm/mach-s3c64xx/Kconfig                    |    8 +-
>  arch/arm/mach-s3c64xx/Makefile                   |    2 +-
>  arch/arm/mach-s3c64xx/dev-spi.c                  |  172 -----------------
>  arch/arm/mach-s3c64xx/include/mach/map.h         |    2 +
>  arch/arm/mach-s3c64xx/mach-crag6410.c            |    9 +
>  arch/arm/mach-s3c64xx/mach-smdk6410.c            |   19 ++
>  arch/arm/mach-s3c64xx/setup-spi.c                |   32 +++
>  arch/arm/mach-s5p64x0/Kconfig                    |    7 +-
>  arch/arm/mach-s5p64x0/Makefile                   |    2 +-
>  arch/arm/mach-s5p64x0/dev-spi.c                  |  218
---------------------
>  arch/arm/mach-s5p64x0/include/mach/map.h         |    3 +
>  arch/arm/mach-s5p64x0/mach-smdk6440.c            |   19 ++
>  arch/arm/mach-s5p64x0/mach-smdk6450.c            |   19 ++
>  arch/arm/mach-s5p64x0/setup-spi.c                |   42 ++++
>  arch/arm/mach-s5pc100/Kconfig                    |    5 +
>  arch/arm/mach-s5pc100/Makefile                   |    2 +-
>  arch/arm/mach-s5pc100/dev-spi.c                  |  220
----------------------
>  arch/arm/mach-s5pc100/include/mach/map.h         |    3 +
>  arch/arm/mach-s5pc100/mach-smdkc100.c            |   31 +++
>  arch/arm/mach-s5pc100/setup-spi.c                |   43 +++++
>  arch/arm/mach-s5pv210/Kconfig                    |    5 +
>  arch/arm/mach-s5pv210/Makefile                   |    2 +-
>  arch/arm/mach-s5pv210/dev-spi.c                  |  169 -----------------
>  arch/arm/mach-s5pv210/include/mach/map.h         |    2 +
>  arch/arm/mach-s5pv210/mach-smdkv210.c            |   21 ++
>  arch/arm/mach-s5pv210/setup-spi.c                |   36 ++++
>  arch/arm/plat-samsung/Kconfig                    |   14 ++-
>  arch/arm/plat-samsung/devs.c                     |  112 +++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h        |    8 +-
>  arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |   16 +-
>  30 files changed, 444 insertions(+), 799 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c64xx/dev-spi.c
>  create mode 100644 arch/arm/mach-s3c64xx/setup-spi.c
>  delete mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
>  create mode 100644 arch/arm/mach-s5p64x0/setup-spi.c
>  delete mode 100644 arch/arm/mach-s5pc100/dev-spi.c
>  create mode 100644 arch/arm/mach-s5pc100/setup-spi.c
>  delete mode 100644 arch/arm/mach-s5pv210/dev-spi.c
>  create mode 100644 arch/arm/mach-s5pv210/setup-spi.c

Looks good to consolidate work, but it's merge window so will be back on
this after that.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
