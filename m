From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2]  ARM: S5PC210: I2C devices updates
Date: Mon, 11 Oct 2010 16:23:11 +0900
Message-ID: <009101cb6915$2c89f720$859de560$%kim@samsung.com>
References: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34632 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750731Ab0JKHW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Oct 2010 03:22:57 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA400E8K767SV40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Oct 2010 16:22:55 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA400DEU7673P@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Oct 2010 16:22:55 +0900 (KST)
In-reply-to: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Hello,
> 
> This is an updated version of I2C patches posted by Kyungmin Park in
> '[PATCH 0/7] ARM: S5PC210: I2C devices support and Universal board
> updates' thread.
> 
> All issues related to i2c device definitions reported by Kukjin Kim have
> been fixed. We also merged some of the patches together to avoid build
> breaks.
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> ---
> 
> Patch summary:
> 
> Kyungmin Park (3):
>   ARM: S5PC110: Fix wrong interrupt I2C2 and I2C3 number
>   ARM: S5PC210: Define address & interrupt for all I2C blocks
>   ARM: S5PC210: add I2C{3, 4, 5, 6, 7} device support
> 
>  arch/arm/mach-s5pv210/include/mach/irqs.h |    4 +-
>  arch/arm/mach-s5pv310/Kconfig             |   25 +++++++++++
>  arch/arm/mach-s5pv310/Makefile            |    5 ++
>  arch/arm/mach-s5pv310/include/mach/irqs.h |    7 +++
>  arch/arm/mach-s5pv310/include/mach/map.h  |   11 ++++-
>  arch/arm/mach-s5pv310/setup-i2c3.c        |   25 +++++++++++
>  arch/arm/mach-s5pv310/setup-i2c4.c        |   25 +++++++++++
>  arch/arm/mach-s5pv310/setup-i2c5.c        |   25 +++++++++++
>  arch/arm/mach-s5pv310/setup-i2c6.c        |   25 +++++++++++
>  arch/arm/mach-s5pv310/setup-i2c7.c        |   25 +++++++++++
>  arch/arm/plat-samsung/Kconfig             |   25 +++++++++++
>  arch/arm/plat-samsung/Makefile            |    5 ++
>  arch/arm/plat-samsung/dev-i2c2.c          |    4 +-
>  arch/arm/plat-samsung/dev-i2c3.c          |   68
> +++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/dev-i2c4.c          |   68
> +++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/dev-i2c5.c          |   68
> +++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/dev-i2c6.c          |   68
> +++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/dev-i2c7.c          |   68
> +++++++++++++++++++++++++++++
>  arch/arm/plat-samsung/include/plat/iic.h  |    5 ++
>  19 files changed, 550 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv310/setup-i2c3.c
>  create mode 100644 arch/arm/mach-s5pv310/setup-i2c4.c
>  create mode 100644 arch/arm/mach-s5pv310/setup-i2c5.c
>  create mode 100644 arch/arm/mach-s5pv310/setup-i2c6.c
>  create mode 100644 arch/arm/mach-s5pv310/setup-i2c7.c
>  create mode 100644 arch/arm/plat-samsung/dev-i2c3.c
>  create mode 100644 arch/arm/plat-samsung/dev-i2c4.c
>  create mode 100644 arch/arm/plat-samsung/dev-i2c5.c
>  create mode 100644 arch/arm/plat-samsung/dev-i2c6.c
>  create mode 100644 arch/arm/plat-samsung/dev-i2c7.c
> 
> --

Ok...will apply...but we need to sort out this next time.
And need to change C100 IRQ names...will submit it myself.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
