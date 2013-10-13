From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH RESEND 3/3] ARM: S3C24XX: add dma pdata for s3c2410,
 s3c2440 and s3c2442
Date: Sun, 13 Oct 2013 20:25:37 +0530
Message-ID: <20131013145537.GI2954@intel.com>
References: <201310111059.19791.heiko@sntech.de>
 <201310111101.33782.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64790 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754707Ab3JMPs1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 11:48:27 -0400
Content-Disposition: inline
In-Reply-To: <201310111101.33782.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Fri, Oct 11, 2013 at 11:01:33AM +0200, Heiko St=FCbner wrote:
> s3c2410 and s3c2442 share the same dma channels while s3c2440 has
> slight differences. But on all three the reachable sources per dma
> channel has constraints attached and thus encodes the usable
> combinations using the S3C24XX_DMA_CHANREQ macro.
>=20
> This also fixes the warning about s3c2410_dma_resource being unused
> as reported by Olof Johansson.
Perhpas you should have used Reported-by tag for that..

~Vinod
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/common.c            |  100 +++++++++++++++++++=
++++++++++
>  arch/arm/mach-s3c24xx/common.h            |    2 +
>  include/linux/platform_data/dma-s3c24xx.h |    3 +
>  3 files changed, 105 insertions(+)
>=20
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/c=
ommon.c
> index 16ac669..4cfe7a4 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -343,6 +343,50 @@ static struct resource s3c2410_dma_resource[] =3D=
 {
>  };
>  #endif
> =20
> +#if defined(CONFIG_CPU_S3C2410) || defined(CONFIG_CPU_S3C2442)
> +static struct s3c24xx_dma_channel s3c2410_dma_channels[DMACH_MAX] =3D=
 {
> +	[DMACH_XD0] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 0),=
 },
> +	[DMACH_XD1] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 1),=
 },
> +	[DMACH_SDI] =3D { S3C24XX_DMA_APB, false, S3C24XX_DMA_CHANREQ(2, 0)=
 |
> +						S3C24XX_DMA_CHANREQ(2, 2) |
> +						S3C24XX_DMA_CHANREQ(1, 3),
> +	},
> +	[DMACH_SPI0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3, 1)=
, },
> +	[DMACH_SPI1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2, 3)=
, },
> +	[DMACH_UART0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1, 0=
), },
> +	[DMACH_UART1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1, 1=
), },
> +	[DMACH_UART2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(0, 3=
), },
> +	[DMACH_TIMER] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3, 0=
) |
> +						 S3C24XX_DMA_CHANREQ(3, 2) |
> +						 S3C24XX_DMA_CHANREQ(3, 3),
> +	},
> +	[DMACH_I2S_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2, =
1) |
> +						  S3C24XX_DMA_CHANREQ(1, 2),
> +	},
> +	[DMACH_I2S_OUT] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(0,=
 2), },
> +	[DMACH_USB_EP1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 0), },
> +	[DMACH_USB_EP2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 1), },
> +	[DMACH_USB_EP3] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 2), },
> +	[DMACH_USB_EP4] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 3), },
> +};
> +
> +static struct s3c24xx_dma_platdata s3c2410_dma_platdata =3D {
> +	.num_phy_channels =3D 4,
> +	.channels =3D s3c2410_dma_channels,
> +	.num_channels =3D DMACH_MAX,
> +};
> +
> +struct platform_device s3c2410_device_dma =3D {
> +	.name		=3D "s3c2410-dma",
> +	.id		=3D 0,
> +	.num_resources	=3D ARRAY_SIZE(s3c2410_dma_resource),
> +	.resource	=3D s3c2410_dma_resource,
> +	.dev	=3D {
> +		.platform_data	=3D &s3c2410_dma_platdata,
> +	},
> +};
> +#endif
> +
>  #ifdef CONFIG_CPU_S3C2412
>  static struct s3c24xx_dma_channel s3c2412_dma_channels[DMACH_MAX] =3D=
 {
>  	[DMACH_XD0] =3D { S3C24XX_DMA_AHB, true, 17 },
> @@ -384,6 +428,62 @@ struct platform_device s3c2412_device_dma =3D {
>  };
>  #endif
> =20
> +#if defined(CONFIG_CPU_S3C2440)
> +static struct s3c24xx_dma_channel s3c2440_dma_channels[DMACH_MAX] =3D=
 {
> +	[DMACH_XD0] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 0),=
 },
> +	[DMACH_XD1] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 1),=
 },
> +	[DMACH_SDI] =3D { S3C24XX_DMA_APB, false, S3C24XX_DMA_CHANREQ(2, 0)=
 |
> +						S3C24XX_DMA_CHANREQ(6, 1) |
> +						S3C24XX_DMA_CHANREQ(2, 2) |
> +						S3C24XX_DMA_CHANREQ(1, 3),
> +	},
> +	[DMACH_SPI0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3, 1)=
, },
> +	[DMACH_SPI1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2, 3)=
, },
> +	[DMACH_UART0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1, 0=
), },
> +	[DMACH_UART1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1, 1=
), },
> +	[DMACH_UART2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(0, 3=
), },
> +	[DMACH_TIMER] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3, 0=
) |
> +						 S3C24XX_DMA_CHANREQ(3, 2) |
> +						 S3C24XX_DMA_CHANREQ(3, 3),
> +	},
> +	[DMACH_I2S_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2, =
1) |
> +						  S3C24XX_DMA_CHANREQ(1, 2),
> +	},
> +	[DMACH_I2S_OUT] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(5,=
 0) |
> +						   S3C24XX_DMA_CHANREQ(0, 2),
> +	},
> +	[DMACH_PCM_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(6, =
0) |
> +						  S3C24XX_DMA_CHANREQ(5, 2),
> +	},
> +	[DMACH_PCM_OUT] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(5,=
 1) |
> +						  S3C24XX_DMA_CHANREQ(6, 3),
> +	},
> +	[DMACH_MIC_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(6, =
2) |
> +						  S3C24XX_DMA_CHANREQ(5, 3),
> +	},
> +	[DMACH_USB_EP1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 0), },
> +	[DMACH_USB_EP2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 1), },
> +	[DMACH_USB_EP3] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 2), },
> +	[DMACH_USB_EP4] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4,=
 3), },
> +};
> +
> +static struct s3c24xx_dma_platdata s3c2440_dma_platdata =3D {
> +	.num_phy_channels =3D 4,
> +	.channels =3D s3c2440_dma_channels,
> +	.num_channels =3D DMACH_MAX,
> +};
> +
> +struct platform_device s3c2440_device_dma =3D {
> +	.name		=3D "s3c2410-dma",
> +	.id		=3D 0,
> +	.num_resources	=3D ARRAY_SIZE(s3c2410_dma_resource),
> +	.resource	=3D s3c2410_dma_resource,
> +	.dev	=3D {
> +		.platform_data	=3D &s3c2440_dma_platdata,
> +	},
> +};
> +#endif
> +
>  #if defined(CONFIG_CPUS_3C2443) || defined(CONFIG_CPU_S3C2416)
>  static struct resource s3c2443_dma_resource[] =3D {
>  	[0] =3D DEFINE_RES_MEM(S3C24XX_PA_DMA, S3C24XX_SZ_DMA),
> diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/c=
ommon.h
> index fe07189..e46c104 100644
> --- a/arch/arm/mach-s3c24xx/common.h
> +++ b/arch/arm/mach-s3c24xx/common.h
> @@ -109,7 +109,9 @@ extern void s3c2443_init_irq(void);
> =20
>  extern struct syscore_ops s3c24xx_irq_syscore_ops;
> =20
> +extern struct platform_device s3c2410_device_dma;
>  extern struct platform_device s3c2412_device_dma;
> +extern struct platform_device s3c2440_device_dma;
>  extern struct platform_device s3c2443_device_dma;
> =20
>  #endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
> diff --git a/include/linux/platform_data/dma-s3c24xx.h b/include/linu=
x/platform_data/dma-s3c24xx.h
> index 5a0cfff..89ba1b0 100644
> --- a/include/linux/platform_data/dma-s3c24xx.h
> +++ b/include/linux/platform_data/dma-s3c24xx.h
> @@ -9,6 +9,9 @@
>   * any later version.
>   */
> =20
> +/* Helper to encode the source selection constraints for early s3c s=
ocs. */
> +#define S3C24XX_DMA_CHANREQ(src, chan)	((BIT(3) | src) << chan * 4)
> +
>  enum s3c24xx_dma_bus {
>  	S3C24XX_DMA_APB,
>  	S3C24XX_DMA_AHB,
> --=20
> 1.7.10.4
>=20

--=20
