From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: Samsung: use dma-pl330 device name for clock
Date: Fri, 19 Aug 2011 14:24:09 +0900
Message-ID: <000701cc5e30$3a4e1a60$aeea4f20$%kim@samsung.com>
References: <1313530266-14939-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63948 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752432Ab1HSFYP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 01:24:15 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ500BV0TOB23L0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:12 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ500KA7TOA6V@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 14:24:12 +0900 (KST)
In-reply-to: <1313530266-14939-1-git-send-email-vz@mleia.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vladimir Zapolskiy' <vz@mleia.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Vladimir Zapolskiy wrote:
> 
> This changeset replaces s3c-pl330.x clock device names with
> dma-pl330.x, otherwise there won't be a correspondence between clock
> device name and amba device name, thus clocks can't be enabled.
> 
> Fixes runtime errors on clk_get() from drivers/dma/pl330.c:
>   dma-pl330 dma-pl330.0: Cannot get operation clock.
>   dma-pl330: probe of dma-pl330.0 failed with error -22
> 
> The changes are based on linux-samsung/next/topic-dma-pl330 branch.
> 
> Vladimir Zapolskiy (3):
>   ARM: EXYNOS4: use dma-pl330 device name for clock
>   ARM: S5PC100: use dma-pl330 device name for clock
>   ARM: S5PV210: use dma-pl330 device name for clock
> 
>  arch/arm/mach-exynos4/clock.c |    4 ++--
>  arch/arm/mach-s5pc100/clock.c |    4 ++--
>  arch/arm/mach-s5pv210/clock.c |    4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> --
> 1.7.5.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
