From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/7] ARM: S5PC110: Fix wrong interrupt I2C2 number
Date: Thu, 07 Oct 2010 10:35:22 +0900
Message-ID: <004401cb65bf$ec00b7a0$c40226e0$%kim@samsung.com>
References: <20100930044827.GA16901@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62586 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754388Ab0JGBfJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 21:35:09 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9W00I1ICEJZU40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:35:07 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9W00M9XCEIOX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:35:07 +0900 (KST)
In-reply-to: <20100930044827.GA16901@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> It's I2C2 interrupt number instead of CAN0.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/irqs.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/irqs.h b/arch/arm/mach-
> s5pv210/include/mach/irqs.h
> index cdb8ae4..5ab1833 100644
> --- a/arch/arm/mach-s5pv210/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv210/include/mach/irqs.h
> @@ -55,8 +55,8 @@
>  #define IRQ_SPI1		S5P_IRQ_VIC1(16)
>  #define IRQ_SPI2		S5P_IRQ_VIC1(17)
>  #define IRQ_IRDA		S5P_IRQ_VIC1(18)
> -#define IRQ_CAN0		S5P_IRQ_VIC1(19)
> -#define IRQ_CAN1		S5P_IRQ_VIC1(20)
> +#define IRQ_IIC2		S5P_IRQ_VIC1(19)
> +#define IRQ_I2C_HDMI_PHY	S5P_IRQ_VIC1(20)
>  #define IRQ_HSIRX		S5P_IRQ_VIC1(21)
>  #define IRQ_HSITX		S5P_IRQ_VIC1(22)
>  #define IRQ_UHOST		S5P_IRQ_VIC1(23)
> --

Please refer to my other comments.

Hmm...I think, no need to change to IRQ_I2C_HDMI_PHY...in here.
If required, we can do it later...and how about IRQ_IIC_HDMI_PHY like other
IRQ_IIC?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
