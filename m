From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/5] ARM: S3C24XX: move plat-s3c24xx/dev-uart.c into
 common.c
Date: Tue, 08 May 2012 14:38:23 +0900
Message-ID: <017801cd2cdc$ca6ef8f0$5f4cead0$%kim@samsung.com>
References: <201205071939.37433.heiko@sntech.de>
 <201205071942.12082.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45784 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737Ab2EHFid convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 01:38:33 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3O00G1HVNX09Q0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:38:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3O00B0FVO25IG0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 May 2012 14:38:31 +0900 (KST)
In-reply-to: <201205071942.12082.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> The uart devices are used on all s3c24xx machines, so they can reside
> in the common code for all machines.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/common.c   |   73 +++++++++++++++++++++++++++
>  arch/arm/plat-s3c24xx/Makefile   |    1 -
>  arch/arm/plat-s3c24xx/dev-uart.c |  100 ----------------------------=
-----
> -----
>  3 files changed, 73 insertions(+), 101 deletions(-)
>  delete mode 100644 arch/arm/plat-s3c24xx/dev-uart.c
>=20
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-
> s3c24xx/common.c
> index 755d5f1..bf1cd36 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -876,3 +876,76 @@ struct syscore_ops s3c24xx_irq_syscore_ops =3D {
>  	.suspend	=3D s3c24xx_irq_suspend,
>  	.resume		=3D s3c24xx_irq_resume,
>  };
> +
> +/* Serial port registrations */
> +
> +static struct resource s3c2410_uart0_resource[] =3D {
> +	[0] =3D {
> +		.start =3D S3C2410_PA_UART0,
> +		.end   =3D S3C2410_PA_UART0 + 0x3fff,
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +	[1] =3D {
> +		.start =3D IRQ_S3CUART_RX0,
> +		.end   =3D IRQ_S3CUART_ERR0,
> +		.flags =3D IORESOURCE_IRQ,
> +	}

+	[0] =3D DEFINE_RES_MEM(S3C2410_PA_UART0, SZ_16K),
+	[1] =3D DEFINE_RES_NAMED(IRQ_S3CUART_RX0, \
+			IRQ_S3CUART_ERR0 - IRQ_S3CUART_RX0 + 1, \
+			NULL, IORESOURCE_IRQ)

Note, Tushar's patch updated so I will update when apply this.

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
