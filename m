From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] ARM: S5PV310: Add the definition for external interrupt
Date: Fri, 15 Oct 2010 10:58:20 +0900
Message-ID: <001a01cb6c0c$735b4600$5a11d200$%kim@samsung.com>
References: <1286450698-12029-1-git-send-email-jongsun.han@samsung.com>
 <1286450698-12029-3-git-send-email-jongsun.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:24525 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753291Ab0JOB6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 21:58:03 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAB009ML6SP2170@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Oct 2010 10:58:01 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAB00HXJ6SPNA@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Oct 2010 10:58:02 +0900 (KST)
In-reply-to: <1286450698-12029-3-git-send-email-jongsun.han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jongsun Han' <jongsun.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

Jongsun Han wrote:
> 
> This patch add the definition for both IRQs and GPIO registers for
external
> interrupt.
> 
> Signed-off-by: Jongsun Han <jongsun.han@samsung.com>
> ---
>  arch/arm/mach-s5pv310/include/mach/irqs.h      |   26 +++++++++++++++-
>  arch/arm/mach-s5pv310/include/mach/regs-gpio.h |   37
> ++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv310/include/mach/regs-gpio.h
> 
> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-
> s5pv310/include/mach/irqs.h
> index e81332f..9faea58 100644
> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
> @@ -78,10 +78,32 @@
> 
>  #define IRQ_ONENAND_AUDI	COMBINER_IRQ(34, 0)
> 
> +#define IRQ_EINT4		COMBINER_IRQ(37, 0)
> +#define IRQ_EINT5		COMBINER_IRQ(37, 1)
> +#define IRQ_EINT6		COMBINER_IRQ(37, 2)
> +#define IRQ_EINT7		COMBINER_IRQ(37, 3)
> +#define IRQ_EINT8		COMBINER_IRQ(38, 0)
> +
> +#define IRQ_EINT9		COMBINER_IRQ(38, 1)
> +#define IRQ_EINT10		COMBINER_IRQ(38, 2)
> +#define IRQ_EINT11		COMBINER_IRQ(38, 3)
> +#define IRQ_EINT12		COMBINER_IRQ(38, 4)
> +#define IRQ_EINT13		COMBINER_IRQ(38, 5)
> +#define IRQ_EINT14		COMBINER_IRQ(38, 6)
> +#define IRQ_EINT15		COMBINER_IRQ(38, 7)
> +
> +#define IRQ_EINT16_31		COMBINER_IRQ(39, 0)
> +
> +#define IRQ_EINT_BASE		(IRQ_EINT16_31 + 1)
> +
>  /* Set the default NR_IRQS */
> +#define NR_IRQS			(IRQ_EINT_BASE + 32)
> +
> +#define EINT_NUMBER(x)		((x) + IRQ_EINT_BASE)
> 
> -#define NR_IRQS
> 	COMBINER_IRQ(MAX_COMBINER_NR, 0)
> +#define S5P_EINT_BASE1		EINT_NUMBER(0)
> +#define S5P_EINT_BASE2		EINT_NUMBER(16)
> 
No need to add EINT_NUMBER(x) macro?

#define S5P_EINT_BASE1	(IRQ_EINT_BASE + 0)
#define S5P_EINT_BASE1	(IRQ_EINT_BASE + 16)

> -#define MAX_COMBINER_NR		39
> +#define MAX_COMBINER_NR		40
> 
>  #endif /* __ASM_ARCH_IRQS_H */

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
