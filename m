From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV310: Update MAX_COMBINER_NR
Date: Thu, 14 Oct 2010 10:56:39 +0900
Message-ID: <003c01cb6b43$0bf55740$23e005c0$%kim@samsung.com>
References: <1286867763-21515-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14224 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753806Ab0JNB4V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Oct 2010 21:56:21 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA900ETSC1VYZ50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 10:56:19 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA900H8EC1VEN@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 10:56:19 +0900 (KST)
In-reply-to: <1286867763-21515-1-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Jongpill Lee' <boyko.lee@samsung.com>

Sangbeom Kim wrote:
> 
> From: Jongpill Lee <boyko.lee@samsung.com>
> 
> This patch updates MAX_COMBINER_NR from 39 to 40 because
> S5PV310 need 39th combiner for including EINT16_31.
> 
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
>  arch/arm/mach-s5pv310/include/mach/irqs.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-
> s5pv310/include/mach/irqs.h
> index b2acc62..f301af7 100644
> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
> @@ -89,6 +89,6 @@
> 
>  #define NR_IRQS
> 	COMBINER_IRQ(MAX_COMBINER_NR, 0)
> 
> -#define MAX_COMBINER_NR		39
> +#define MAX_COMBINER_NR		40
> 
>  #endif /* __ASM_ARCH_IRQS_H */
> --

Ok...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
