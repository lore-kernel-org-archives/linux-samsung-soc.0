From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5PV210: Fix security engine interrupt names
Date: Fri, 25 Mar 2011 17:35:30 +0900
Message-ID: <000701cbeac7$9e9e3130$dbda9390$%kim@samsung.com>
References: <1300826909-14634-1-git-send-email-vzapolskiy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39896 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933346Ab1CYIfl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Mar 2011 04:35:41 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIL008M9UJFS500@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Mar 2011 17:35:39 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIL00C4QUJD6X@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Mar 2011 17:35:39 +0900 (KST)
In-reply-to: <1300826909-14634-1-git-send-email-vzapolskiy@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vladimir Zapolskiy' <vzapolskiy@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Vladimir Zapolskiy wrote:
> 
> This change is intended to correct security subsystem interrupt names
> for Samsung S5PV210 and S5PC110 SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/irqs.h |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-
> s5pv210/include/mach/irqs.h
> index 26710b3..b9f9ec3 100644
> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> @@ -99,9 +99,9 @@
>  #define IRQ_TC			IRQ_PENDN
>  #define IRQ_KEYPAD		S5P_IRQ_VIC2(25)
>  #define IRQ_CG			S5P_IRQ_VIC2(26)
> -#define IRQ_SEC			S5P_IRQ_VIC2(27)
> -#define IRQ_SECRX		S5P_IRQ_VIC2(28)
> -#define IRQ_SECTX		S5P_IRQ_VIC2(29)
> +#define IRQ_SSS_INT		S5P_IRQ_VIC2(27)
> +#define IRQ_SSS_HASH		S5P_IRQ_VIC2(28)
> +#define IRQ_PCM2		S5P_IRQ_VIC2(29)
>  #define IRQ_SDMIRQ		S5P_IRQ_VIC2(30)
>  #define IRQ_SDMFIQ		S5P_IRQ_VIC2(31)
> 
> --

Ok, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
