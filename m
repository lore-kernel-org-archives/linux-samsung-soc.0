From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5] S5PC210/S5PV310/EXYNOS4 interrupts update
Date: Sat, 12 Mar 2011 12:23:45 +0900
Message-ID: <002c01cbe064$ea048fb0$be0daf10$%kim@samsung.com>
References: <1297927527-1338-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:45570 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754339Ab1CLDXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Mar 2011 22:23:55 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHX00JSBDFT2O90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Mar 2011 12:23:53 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHX00744DFT22@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 12 Mar 2011 12:23:53 +0900 (KST)
In-reply-to: <1297927527-1338-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Hello,
> 
> This patch series perform an update on interrupts support for
> S5PC210/S5PV310/EXYNOS4 platform. Two optional features have been added.
> The first one is GPIO interrupts handler, a second is support for board
> specific interrupts. The patches have been prepared to maximise the code
> reuse, so common code for gpio interrupts for s5pc100, s5pc110 & s5pc210
> have been prepared.
> 
> The patches have been prepared against
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> for-next branch (commit 857ddb87db).
> 
> Patches that make use of these 2 optional features for universal c210
> board will follow soon.
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
> 
> Patch summary:
> 
> Marek Szyprowski (5):
>   ARM: S5PV310: Add missing GPYx banks.
>   ARM: Samsung: cleanup S5P gpio interrupt code
>   ARM: Samsung: add function to register gpio interrupt bank data
>   ARM: S5PC210: add support for gpio interrupts
>   ARM: S5PC210: add a placeholder for board specific interrupts
> 
>  arch/arm/mach-s5pc100/gpiolib.c               |    1 +
>  arch/arm/mach-s5pv210/gpiolib.c               |    1 +
>  arch/arm/mach-s5pv310/gpiolib.c               |   67 ++++++++++-
>  arch/arm/mach-s5pv310/include/mach/gpio.h     |   23 ++++-
>  arch/arm/mach-s5pv310/include/mach/irqs.h     |   16 ++-
>  arch/arm/plat-s5p/irq-gpioint.c               |  169
+++++++++++++++--------
> --
>  arch/arm/plat-samsung/include/plat/gpio-cfg.h |   16 +++
>  7 files changed, 220 insertions(+), 73 deletions(-)
> 
> --
> 1.7.1.569.g6f426

Marek,

Could you please re-send this based on my latest for-next which includes
Exynos4 changes?
And would be better to be separate gpio interrupt and board specific
interrupt.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
