From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] S5PC210/S5PV310/EXYNOS4 interrupts update
Date: Tue, 15 Mar 2011 21:50:36 +0900
Message-ID: <011201cbe30f$9728d000$c57a7000$%kim@samsung.com>
References: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47282 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757548Ab1COMum (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 08:50:42 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI300MMINOHMFD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 21:50:41 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI300F3DNOH91@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 21:50:41 +0900 (KST)
In-reply-to: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com

Marek Szyprowski wrote:
> 
> Hello,
> 
> This patch series perform an update on interrupts support for
> S5PC210/S5PV310/EXYNOS4 platform. An optional support for GPIO
> interrupts handler has been added The patches have been prepared to
> maximise the code reuse, so common code for gpio interrupts for s5pc100,
> s5pc110 & s5pc210 have been prepared.
> 
> The patches have been prepared against
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> for-next branch (commit be7004f73d0).
> 
> Patches that make use of these optional features for universal c210
> board will follow soon.
> 
> Changes since v1:
> - rebased onto latest version of kgene/for-next kernel tree (with s5pv310
>   to exynos4 rename)
> - removed machine specific interrupt patch from this patch series
> 
> Patch summary:
> 
> Marek Szyprowski (4):
>   ARM: EXYNOS4: Add missing GPYx banks.
>   ARM: Samsung: cleanup S5P gpio interrupt code
>   ARM: Samsung: add function to register gpio interrupt bank data
>   ARM: EXYNOS4: add support for gpio interrupts
> 
>  arch/arm/mach-exynos4/gpiolib.c               |   67 ++++++++++-
>  arch/arm/mach-exynos4/include/mach/gpio.h     |   23 ++++-
>  arch/arm/mach-exynos4/include/mach/irqs.h     |   12 ++-
>  arch/arm/mach-s5pc100/gpiolib.c               |    1 +
>  arch/arm/mach-s5pv210/gpiolib.c               |    1 +
>  arch/arm/plat-s5p/irq-gpioint.c               |  169
+++++++++++++++--------
> --
>  arch/arm/plat-samsung/include/plat/gpio-cfg.h |   16 +++
>  7 files changed, 216 insertions(+), 73 deletions(-)
> 
> --

Ok, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
