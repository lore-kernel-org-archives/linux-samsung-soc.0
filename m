From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/7] ARM: Samsung: Use the correct I2C2 interrupt
Date: Thu, 07 Oct 2010 10:29:44 +0900
Message-ID: <004301cb65bf$225c62f0$671528d0$%kim@samsung.com>
References: <20100930044832.GA16905@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59913 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756371Ab0JGB3a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 21:29:30 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9W00FF5C54HI50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:29:28 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9W0017HC53UM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:29:28 +0900 (KST)
In-reply-to: <20100930044832.GA16905@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Use the correct I2C2 interrupt.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/dev-i2c2.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/dev-i2c2.c
b/arch/arm/plat-samsung/dev-i2c2.c
> index 07036de..ff4ba69 100644
> --- a/arch/arm/plat-samsung/dev-i2c2.c
> +++ b/arch/arm/plat-samsung/dev-i2c2.c
> @@ -32,8 +32,8 @@ static struct resource s3c_i2c_resource[] = {
>  		.flags = IORESOURCE_MEM,
>  	},
>  	[1] = {
> -		.start = IRQ_CAN0,
> -		.end   = IRQ_CAN0,
> +		.start = IRQ_IIC2,
> +		.end   = IRQ_IIC2,
>  		.flags = IORESOURCE_IRQ,
>  	},
>  };
> --

Hi,

Looks ok...
In my opinion, could you please merge your 2nd and this patch to one,
changing I2C2 interrupt name?
And need to add s5pc100's I2C2 interrupt name changing in there.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
