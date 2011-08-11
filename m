From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: Samsung: add i2c hdmiphy controller definitions
Date: Thu, 11 Aug 2011 19:54:45 +0900
Message-ID: <016d01cc5815$1609a4b0$421cee10$%kim@samsung.com>
References: <1311580547-9468-1-git-send-email-m.szyprowski@samsung.com>
 <1311580547-9468-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57372 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab1HKKyt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Aug 2011 06:54:49 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPR003LIFN8WO50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 19:54:47 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPR00A4JFNBIG@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Aug 2011 19:54:47 +0900 (KST)
In-reply-to: <1311580547-9468-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Tomasz Stanislawski' <t.stanislaws@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
> 
> This patch adds hdmiphy dedicated i2c controller definitions.
> 
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> [m.szyprowski: renamed to i2c-hdmiphy and squashed Exynos4 and S5PV210
> patches]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos4/clock.c                    |    6 ++
>  arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h |   16 ++++++
>  arch/arm/mach-exynos4/include/mach/irqs.h        |    2 +
>  arch/arm/mach-exynos4/include/mach/map.h         |    4 ++
>  arch/arm/mach-s5pv210/clock.c                    |    6 ++
>  arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h |   16 ++++++
>  arch/arm/mach-s5pv210/include/mach/irqs.h        |    2 +-
>  arch/arm/mach-s5pv210/include/mach/map.h         |    3 +
>  arch/arm/plat-s5p/Kconfig                        |    5 ++
>  arch/arm/plat-s5p/Makefile                       |    1 +
>  arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59
> ++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/devs.h        |    1 +
>  arch/arm/plat-samsung/include/plat/iic.h         |    1 +
>  13 files changed, 121 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/include/mach/iic-hdmiphy.h
>  create mode 100644 arch/arm/mach-s5pv210/include/mach/iic-hdmiphy.h
>  create mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
> 

(snip)

> +#ifndef PLAT_S5P_IIC_HDMIPHY_H_
> +#define PLAT_S5P_IIC_HDMIPHY_H_

Marek, how about to use 'I2C' instead of 'IIC'?
I think, we can use it now even thouhg IIC/iic is still used...

And I don't think we should change the old regarding files..  if required, I
will do it.

> +
> +#define S5P_IIC_HDMIPHY_BUS_NUM		(8)

Same as above.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
