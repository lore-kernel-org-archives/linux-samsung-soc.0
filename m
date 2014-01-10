From: kgene@kernel.org
Subject: RE: [PATCH 0/3] Remove Exynos specific code from legacy files
Date: Fri, 10 Jan 2014 17:12:16 +0900
Message-ID: <093601cf0ddb$acb49b30$061dd190$@kernel.org>
References: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12971 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaAJIMX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 03:12:23 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ6000SEESHURC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 17:12:17 +0900 (KST)
In-reply-to: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Tushar Behera wrote:
> 
> No need to maintain Exynos specific codes for legacy files as they
> are not compiled for Exynos platforms. Remove any reference to Exynos
> from those files.
> 
> Tushar Behera (3):
>   ARM: SAMSUNG: Remove Exynos specific code from devs.c
>   ARM: SAMSUNG: Remove Exynos specific code from s5p-pm-irq.c
>   ARM: SAMSUNG: Remove Exynos specific code from pm-gpio.c
> 
>  arch/arm/plat-samsung/devs.c       |   10 ++--------
>  arch/arm/plat-samsung/pm-gpio.c    |    5 ++---
>  arch/arm/plat-samsung/s5p-irq-pm.c |   13 -------------
>  3 files changed, 4 insertions(+), 24 deletions(-)
> 
OK, looks good to me.
Applied but I squashed into one commit because of one change.

Thanks,
Kukjin
