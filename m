From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/7] ARM: S5PC210: Define the more I2C{3,4,5,6,7} address &
	interrupt
Date: Thu, 07 Oct 2010 10:59:03 +0900
Message-ID: <004e01cb65c3$3c1469f0$b43d3dd0$%kim@samsung.com>
References: <20100930044853.GA16918@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39352 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757586Ab0JGB6v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 21:58:51 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9W007NFDI15OB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:58:49 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9W00C53DI1LK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:58:50 +0900 (KST)
In-reply-to: <20100930044853.GA16918@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> S5PC210 supports total 8 (+ 1 dedicated for HDMI) I2C devices.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv310/include/mach/irqs.h |    5 +++++
>  arch/arm/mach-s5pv310/include/mach/map.h  |    5 +++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-
> s5pv310/include/mach/irqs.h
> index aa17ec7..67abe1e 100644
> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
> @@ -72,6 +72,11 @@
>  #define IRQ_IIC			COMBINER_IRQ(27, 0)
>  #define IRQ_IIC1		COMBINER_IRQ(27, 1)
>  #define IRQ_IIC2		COMBINER_IRQ(27, 2)
> +#define IRQ_I2C3		COMBINER_IRQ(27, 3)
> +#define IRQ_I2C4		COMBINER_IRQ(27, 4)
> +#define IRQ_I2C5		COMBINER_IRQ(27, 5)
> +#define IRQ_I2C6		COMBINER_IRQ(27, 6)
> +#define IRQ_I2C7		COMBINER_IRQ(27, 7)
> 
>  #define IRQ_HSMMC0		COMBINER_IRQ(29, 0)
>  #define IRQ_HSMMC1		COMBINER_IRQ(29, 1)
> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-
> s5pv310/include/mach/map.h
> index 118ad48..8d34d96 100644
> --- a/arch/arm/mach-s5pv310/include/mach/map.h
> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
> @@ -86,6 +86,11 @@
>  #define S3C_PA_IIC			S5PV310_PA_I2C(0)
>  #define S3C_PA_IIC1			S5PV310_PA_I2C(1)
>  #define S3C_PA_IIC2			S5PV310_PA_I2C(2)
> +#define S3C_PA_I2C3			S5PV310_PA_I2C(3)
> +#define S3C_PA_I2C4			S5PV310_PA_I2C(4)
> +#define S3C_PA_I2C5			S5PV310_PA_I2C(5)
> +#define S3C_PA_I2C6			S5PV310_PA_I2C(6)
> +#define S3C_PA_I2C7			S5PV310_PA_I2C(7)
>  #define S3C_PA_RTC			S5PV310_PA_RTC
>  #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
> 
> --

Hi,

To keep the same format is helpful to understand codes like IRQ_IICX.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
