From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH RESEND 3/3] ARM: S3C24XX: add dma pdata for s3c2410, s3c2440 and s3c2442
Date: Sun, 13 Oct 2013 20:15:28 +0200
Message-ID: <201310132015.28849.heiko@sntech.de>
References: <201310111059.19791.heiko@sntech.de> <201310111101.33782.heiko@sntech.de> <20131013145537.GI2954@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:49637 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755067Ab3JMSPi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Oct 2013 14:15:38 -0400
In-Reply-To: <20131013145537.GI2954@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Am Sonntag, 13. Oktober 2013, 16:55:37 schrieb Vinod Koul:
> On Fri, Oct 11, 2013 at 11:01:33AM +0200, Heiko St=FCbner wrote:
> > s3c2410 and s3c2442 share the same dma channels while s3c2440 has
> > slight differences. But on all three the reachable sources per dma
> > channel has constraints attached and thus encodes the usable
> > combinations using the S3C24XX_DMA_CHANREQ macro.
> >=20
> > This also fixes the warning about s3c2410_dma_resource being unused
> > as reported by Olof Johansson.
>=20
> Perhpas you should have used Reported-by tag for that..

yep, I should've, if I hadn't forgotten.


Maybe Kgene, who will most likely apply the patches, can add a

Reported-by: Olof Johansson <olof@lixom.net>

at the time.



>=20
> ~Vinod
>=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >=20
> >  arch/arm/mach-s3c24xx/common.c            |  100
> >  +++++++++++++++++++++++++++++ arch/arm/mach-s3c24xx/common.h      =
    =20
> >  |    2 +
> >  include/linux/platform_data/dma-s3c24xx.h |    3 +
> >  3 files changed, 105 insertions(+)
> >=20
> > diff --git a/arch/arm/mach-s3c24xx/common.c
> > b/arch/arm/mach-s3c24xx/common.c index 16ac669..4cfe7a4 100644
> > --- a/arch/arm/mach-s3c24xx/common.c
> > +++ b/arch/arm/mach-s3c24xx/common.c
> > @@ -343,6 +343,50 @@ static struct resource s3c2410_dma_resource[] =
=3D {
> >=20
> >  };
> >  #endif
> >=20
> > +#if defined(CONFIG_CPU_S3C2410) || defined(CONFIG_CPU_S3C2442)
> > +static struct s3c24xx_dma_channel s3c2410_dma_channels[DMACH_MAX] =
=3D {
> > +	[DMACH_XD0] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 0=
), },
> > +	[DMACH_XD1] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 1=
), },
> > +	[DMACH_SDI] =3D { S3C24XX_DMA_APB, false, S3C24XX_DMA_CHANREQ(2, =
0) |
> > +						S3C24XX_DMA_CHANREQ(2, 2) |
> > +						S3C24XX_DMA_CHANREQ(1, 3),
> > +	},
> > +	[DMACH_SPI0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3, =
1), },
> > +	[DMACH_SPI1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2, =
3), },
> > +	[DMACH_UART0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1,=
 0),=20
},
> > +	[DMACH_UART1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1,=
 1),=20
},
> > +	[DMACH_UART2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(0,=
 3),=20
},
> > +	[DMACH_TIMER] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3,=
 0) |
> > +						 S3C24XX_DMA_CHANREQ(3, 2) |
> > +						 S3C24XX_DMA_CHANREQ(3, 3),
> > +	},
> > +	[DMACH_I2S_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2=
, 1) |
> > +						  S3C24XX_DMA_CHANREQ(1, 2),
> > +	},
> > +	[DMACH_I2S_OUT] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(=
0, 2),
> > }, +	[DMACH_USB_EP1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANR=
EQ(4,
> > 0), }, +	[DMACH_USB_EP2] =3D { S3C24XX_DMA_APB, true,
> > S3C24XX_DMA_CHANREQ(4, 1), }, +	[DMACH_USB_EP3] =3D { S3C24XX_DMA_A=
PB,
> > true, S3C24XX_DMA_CHANREQ(4, 2), }, +	[DMACH_USB_EP4] =3D {
> > S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(4, 3), }, +};
> > +
> > +static struct s3c24xx_dma_platdata s3c2410_dma_platdata =3D {
> > +	.num_phy_channels =3D 4,
> > +	.channels =3D s3c2410_dma_channels,
> > +	.num_channels =3D DMACH_MAX,
> > +};
> > +
> > +struct platform_device s3c2410_device_dma =3D {
> > +	.name		=3D "s3c2410-dma",
> > +	.id		=3D 0,
> > +	.num_resources	=3D ARRAY_SIZE(s3c2410_dma_resource),
> > +	.resource	=3D s3c2410_dma_resource,
> > +	.dev	=3D {
> > +		.platform_data	=3D &s3c2410_dma_platdata,
> > +	},
> > +};
> > +#endif
> > +
> >=20
> >  #ifdef CONFIG_CPU_S3C2412
> >  static struct s3c24xx_dma_channel s3c2412_dma_channels[DMACH_MAX] =
=3D {
> > =20
> >  	[DMACH_XD0] =3D { S3C24XX_DMA_AHB, true, 17 },
> >=20
> > @@ -384,6 +428,62 @@ struct platform_device s3c2412_device_dma =3D =
{
> >=20
> >  };
> >  #endif
> >=20
> > +#if defined(CONFIG_CPU_S3C2440)
> > +static struct s3c24xx_dma_channel s3c2440_dma_channels[DMACH_MAX] =
=3D {
> > +	[DMACH_XD0] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 0=
), },
> > +	[DMACH_XD1] =3D { S3C24XX_DMA_AHB, true, S3C24XX_DMA_CHANREQ(0, 1=
), },
> > +	[DMACH_SDI] =3D { S3C24XX_DMA_APB, false, S3C24XX_DMA_CHANREQ(2, =
0) |
> > +						S3C24XX_DMA_CHANREQ(6, 1) |
> > +						S3C24XX_DMA_CHANREQ(2, 2) |
> > +						S3C24XX_DMA_CHANREQ(1, 3),
> > +	},
> > +	[DMACH_SPI0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3, =
1), },
> > +	[DMACH_SPI1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2, =
3), },
> > +	[DMACH_UART0] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1,=
 0),=20
},
> > +	[DMACH_UART1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(1,=
 1),=20
},
> > +	[DMACH_UART2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(0,=
 3),=20
},
> > +	[DMACH_TIMER] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(3,=
 0) |
> > +						 S3C24XX_DMA_CHANREQ(3, 2) |
> > +						 S3C24XX_DMA_CHANREQ(3, 3),
> > +	},
> > +	[DMACH_I2S_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(2=
, 1) |
> > +						  S3C24XX_DMA_CHANREQ(1, 2),
> > +	},
> > +	[DMACH_I2S_OUT] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(=
5, 0)=20
|
> > +						   S3C24XX_DMA_CHANREQ(0, 2),
> > +	},
> > +	[DMACH_PCM_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(6=
, 0) |
> > +						  S3C24XX_DMA_CHANREQ(5, 2),
> > +	},
> > +	[DMACH_PCM_OUT] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(=
5, 1)=20
|
> > +						  S3C24XX_DMA_CHANREQ(6, 3),
> > +	},
> > +	[DMACH_MIC_IN] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(6=
, 2) |
> > +						  S3C24XX_DMA_CHANREQ(5, 3),
> > +	},
> > +	[DMACH_USB_EP1] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANREQ(=
4, 0),
> > }, +	[DMACH_USB_EP2] =3D { S3C24XX_DMA_APB, true, S3C24XX_DMA_CHANR=
EQ(4,
> > 1), }, +	[DMACH_USB_EP3] =3D { S3C24XX_DMA_APB, true,
> > S3C24XX_DMA_CHANREQ(4, 2), }, +	[DMACH_USB_EP4] =3D { S3C24XX_DMA_A=
PB,
> > true, S3C24XX_DMA_CHANREQ(4, 3), }, +};
> > +
> > +static struct s3c24xx_dma_platdata s3c2440_dma_platdata =3D {
> > +	.num_phy_channels =3D 4,
> > +	.channels =3D s3c2440_dma_channels,
> > +	.num_channels =3D DMACH_MAX,
> > +};
> > +
> > +struct platform_device s3c2440_device_dma =3D {
> > +	.name		=3D "s3c2410-dma",
> > +	.id		=3D 0,
> > +	.num_resources	=3D ARRAY_SIZE(s3c2410_dma_resource),
> > +	.resource	=3D s3c2410_dma_resource,
> > +	.dev	=3D {
> > +		.platform_data	=3D &s3c2440_dma_platdata,
> > +	},
> > +};
> > +#endif
> > +
> >=20
> >  #if defined(CONFIG_CPUS_3C2443) || defined(CONFIG_CPU_S3C2416)
> >  static struct resource s3c2443_dma_resource[] =3D {
> > =20
> >  	[0] =3D DEFINE_RES_MEM(S3C24XX_PA_DMA, S3C24XX_SZ_DMA),
> >=20
> > diff --git a/arch/arm/mach-s3c24xx/common.h
> > b/arch/arm/mach-s3c24xx/common.h index fe07189..e46c104 100644
> > --- a/arch/arm/mach-s3c24xx/common.h
> > +++ b/arch/arm/mach-s3c24xx/common.h
> > @@ -109,7 +109,9 @@ extern void s3c2443_init_irq(void);
> >=20
> >  extern struct syscore_ops s3c24xx_irq_syscore_ops;
> >=20
> > +extern struct platform_device s3c2410_device_dma;
> >=20
> >  extern struct platform_device s3c2412_device_dma;
> >=20
> > +extern struct platform_device s3c2440_device_dma;
> >=20
> >  extern struct platform_device s3c2443_device_dma;
> > =20
> >  #endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
> >=20
> > diff --git a/include/linux/platform_data/dma-s3c24xx.h
> > b/include/linux/platform_data/dma-s3c24xx.h index 5a0cfff..89ba1b0
> > 100644
> > --- a/include/linux/platform_data/dma-s3c24xx.h
> > +++ b/include/linux/platform_data/dma-s3c24xx.h
> > @@ -9,6 +9,9 @@
> >=20
> >   * any later version.
> >   */
> >=20
> > +/* Helper to encode the source selection constraints for early s3c=
 socs.
> > */ +#define S3C24XX_DMA_CHANREQ(src, chan)	((BIT(3) | src) << chan =
* 4)
> > +
> >=20
> >  enum s3c24xx_dma_bus {
> > =20
> >  	S3C24XX_DMA_APB,
> >  	S3C24XX_DMA_AHB,
