From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] Chained irq fixes
Date: Sat, 13 Aug 2011 12:59:08 +0900
Message-ID: <000501cc596d$5bb15f40$13141dc0$%kim@samsung.com>
References: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27572 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752650Ab1HMD7N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 23:59:13 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPU00HWPLQNGLA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Aug 2011 12:59:11 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPU00JEALQNE5@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Aug 2011 12:59:11 +0900 (KST)
In-reply-to: <1311761601-1570-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>

Marek Szyprowski wrote:
> 
> Hello,
> 
> It looks that the chained IRQ enter/exit functions are missing in more
> places. This short patch series fixes all chained irq usage on Exynos4
> platform.
> 
> Best regards
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
> Summary:
> 
> Marek Szyprowski (2):
>   ARM: Exynos4: add required chained_irq_enter/exit to eint code
>   ARM: S5P: add required chained_irq_enter/exit to gpio-int code
> 
>  arch/arm/mach-exynos4/irq-eint.c |    7 +++++++
>  arch/arm/plat-s5p/irq-gpioint.c  |    6 ++++++
>  2 files changed, 13 insertions(+), 0 deletions(-)
> 
> --
> 1.7.1.569.g6f426

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
