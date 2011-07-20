From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/6] ARM: EXYNOS4: Increase NR_IRQS for devices with
 more IRQs
Date: Thu, 21 Jul 2011 02:04:55 +0900
Message-ID: <06c801cc46ff$29855330$7c8ff990$%kim@samsung.com>
References: <1309421729-11172-1-git-send-email-myungjoo.ham@samsung.com>
 <1309421729-11172-2-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:64574 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab1GTRFF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 13:05:05 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LON00MHV64CNQB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 02:05:04 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LON00LBR64D79@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 02:05:01 +0900 (KST)
In-reply-to: <1309421729-11172-2-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Changhwan Youn' <chaos.youn@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, tushar.behera@linaro.org

MyungJoo Ham wrote:
> 
> MAX8997/17042, which are used by Exynos4-NURI, use additional IRQ
> numbers after GPIO's IRQs. The patch creates some room for those
> devices.
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/include/mach/irqs.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-
> exynos4/include/mach/irqs.h
> index 31f6bed..51b5db5 100644
> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
> @@ -154,6 +154,6 @@
>  #define IRQ_GPIO_END		(S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)
> 
>  /* Set the default NR_IRQS */
> -#define NR_IRQS			(IRQ_GPIO_END)
> +#define NR_IRQS			(IRQ_GPIO_END + 64)

I applied but basically, we have to avoid using hard coded value like 64 on
this. The NR_IRQS depends on CPU not board but this change is needed for
supporting some specific board and if you need more interrupt numbers, will
you increase it? It is not good way.

We need to fix this up next time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
