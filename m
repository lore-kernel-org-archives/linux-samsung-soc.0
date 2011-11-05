From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add SPI support
Date: Sat, 05 Nov 2011 12:37:47 +0900
Message-ID: <02eb01cc9b6c$4937aae0$dba700a0$%kim@samsung.com>
References: <1320411606-11518-1-git-send-email-padma.v@samsung.com>
 <1320411606-11518-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36049 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752604Ab1KEDht (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 23:37:49 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU6002MU4QZ4DC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 12:37:47 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU6001GN4QZ7V20@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 12:37:47 +0900 (KST)
In-reply-to: <1320411606-11518-2-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk

Padmavathi Venna wrote:
> 
> Add SPI setup files for GPIO configurations.
> Add SPI clkdev support.
> Initialize SPI platform specific code in the machine file.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/mach-exynos4/Kconfig                   |    5 ++
>  arch/arm/mach-exynos4/Makefile                  |    1 +
>  arch/arm/mach-exynos4/clock.c                   |   72 +++++++++++++-----
> ----
>  arch/arm/mach-exynos4/include/mach/irqs.h       |    3 +
>  arch/arm/mach-exynos4/include/mach/map.h        |    6 ++
>  arch/arm/mach-exynos4/include/mach/spi-clocks.h |   16 +++++
>  arch/arm/mach-exynos4/mach-smdkv310.c           |   35 +++++++++++
>  arch/arm/mach-exynos4/setup-spi.c               |   47 +++++++++++++++
>  8 files changed, 155 insertions(+), 30 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/include/mach/spi-clocks.h
>  create mode 100644 arch/arm/mach-exynos4/setup-spi.c
> 
The mach-exynos4 directory will be re-organized in this merge window. So
maybe you need to wait for v3.2-rc1.

And I will be on this after that :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
