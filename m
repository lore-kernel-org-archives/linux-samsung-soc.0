From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: Exynos4: Universal C210 machine update
Date: Wed, 22 Jun 2011 13:50:31 +0900
Message-ID: <008d01cc3097$f0463670$d0d2a350$%kim@samsung.com>
References: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40847 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123Ab1FVEut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 00:50:49 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LN6008QTDFEVH50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 13:50:41 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LN6008Z8DGHYO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 22 Jun 2011 13:50:41 +0900 (KST)
In-reply-to: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> Hello,
> 
> This is a short patch series that updates device definitions for
> Universal C210 board. The series is based on kgene/for-next kernel tree.
> 
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
> Marek Szyprowski (3):
>   ARM: Exynos4: Universal_C210: add FIMC device
>   ARM: Exynos4: Universal_C210: add MCS Touchkey device
>   ARM: Exynos4: Universal_C210: add qt602240 touch screen device
> 
>  arch/arm/mach-exynos4/Kconfig               |    7 ++
>  arch/arm/mach-exynos4/mach-universal_c210.c |  108
> +++++++++++++++++++++++++++
>  2 files changed, 115 insertions(+), 0 deletions(-)
> 
> --

Hi Marek,

OK, applied whole series.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
