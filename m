From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 06/33] ARM: S3C24XX: dev-uart: Use common macro to
 define resources
Date: Wed, 09 May 2012 21:44:32 +0900
Message-ID: <01b001cd2de1$7b32a2e0$7197e8a0$%kim@samsung.com>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
 <1335327163-11794-7-git-send-email-tushar.behera@linaro.org>
 <201205082040.20900.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54866 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687Ab2EIMod convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 May 2012 08:44:33 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3R000TMA256740@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:44:32 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3R00887A278D40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 21:44:31 +0900 (KST)
In-reply-to: <201205082040.20900.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, patches@linaro.org, 'Ben Dooks' <ben-linux@fluff.org>

Heiko St=FCbner wrote:
>=20
> From: Tushar Behera <tushar.behera@linaro.org>
>=20
> CC: Ben Dooks <ben-linux@fluff.org>
> CC: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes since v1: update the patch to apply against the moved dev-uar=
t
> devices
> As this patch does not touch anything else apart from the uart device=
s it
> could
> also be applied on top of the movement patches directly
>=20
>  arch/arm/mach-s3c24xx/common.c |   56
+++++++++++-------------------------
> ---
>  1 files changed, 16 insertions(+), 40 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-
> s3c24xx/common.c
> index d42423a..56cdd34 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -241,55 +241,31 @@ void __init s3c24xx_init_io(struct map_desc
> *mach_desc, int size)
>  /* Serial port registrations */
>=20
>  static struct resource s3c2410_uart0_resource[] =3D {
> -	[0] =3D {
> -		.start =3D S3C2410_PA_UART0,
> -		.end   =3D S3C2410_PA_UART0 + 0x3fff,
> -		.flags =3D IORESOURCE_MEM,
> -	},
> -	[1] =3D {
> -		.start =3D IRQ_S3CUART_RX0,
> -		.end   =3D IRQ_S3CUART_ERR0,
> -		.flags =3D IORESOURCE_IRQ,
> -	}
> +	[0] =3D DEFINE_RES_MEM(S3C2410_PA_UART0, SZ_16K),
> +	[1] =3D DEFINE_RES_NAMED(IRQ_S3CUART_RX0, \
> +			IRQ_S3CUART_ERR0 - IRQ_S3CUART_RX0 + 1, \
> +			NULL, IORESOURCE_IRQ)
>  };
>=20
>  static struct resource s3c2410_uart1_resource[] =3D {
> -	[0] =3D {
> -		.start =3D S3C2410_PA_UART1,
> -		.end   =3D S3C2410_PA_UART1 + 0x3fff,
> -		.flags =3D IORESOURCE_MEM,
> -	},
> -	[1] =3D {
> -		.start =3D IRQ_S3CUART_RX1,
> -		.end   =3D IRQ_S3CUART_ERR1,
> -		.flags =3D IORESOURCE_IRQ,
> -	}
> +	[0] =3D DEFINE_RES_MEM(S3C2410_PA_UART1, SZ_16K),
> +	[1] =3D DEFINE_RES_NAMED(IRQ_S3CUART_RX1, \
> +			IRQ_S3CUART_ERR1 - IRQ_S3CUART_RX1 + 1, \
> +			NULL, IORESOURCE_IRQ)
>  };
>=20
>  static struct resource s3c2410_uart2_resource[] =3D {
> -	[0] =3D {
> -		.start =3D S3C2410_PA_UART2,
> -		.end   =3D S3C2410_PA_UART2 + 0x3fff,
> -		.flags =3D IORESOURCE_MEM,
> -	},
> -	[1] =3D {
> -		.start =3D IRQ_S3CUART_RX2,
> -		.end   =3D IRQ_S3CUART_ERR2,
> -		.flags =3D IORESOURCE_IRQ,
> -	}
> +	[0] =3D DEFINE_RES_MEM(S3C2410_PA_UART2, SZ_16K),
> +	[1] =3D DEFINE_RES_NAMED(IRQ_S3CUART_RX2, \
> +			IRQ_S3CUART_ERR2 - IRQ_S3CUART_RX2 + 1, \
> +			NULL, IORESOURCE_IRQ)
>  };
>=20
>  static struct resource s3c2410_uart3_resource[] =3D {
> -	[0] =3D {
> -		.start =3D S3C2443_PA_UART3,
> -		.end   =3D S3C2443_PA_UART3 + 0x3fff,
> -		.flags =3D IORESOURCE_MEM,
> -	},
> -	[1] =3D {
> -		.start =3D IRQ_S3CUART_RX3,
> -		.end   =3D IRQ_S3CUART_ERR3,
> -		.flags =3D IORESOURCE_IRQ,
> -	},
> +	[0] =3D DEFINE_RES_MEM(S3C2443_PA_UART3, SZ_16K),
> +	[1] =3D DEFINE_RES_NAMED(IRQ_S3CUART_RX3, \
> +			IRQ_S3CUART_ERR3 - IRQ_S3CUART_RX3 + 1, \
> +			NULL, IORESOURCE_IRQ)
>  };
>=20
>  struct s3c24xx_uart_resources s3c2410_uart_resources[] __initdata =3D=
 {
> --
> 1.7.5.4

OK, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
