From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH RESEND 2/3] dmaengine: s3c24xx-dma: add support for the
 s3c2410 type of controller
Date: Wed, 16 Oct 2013 07:34:45 +0530
Message-ID: <20131016020445.GS2954@intel.com>
References: <201310111059.19791.heiko@sntech.de>
 <201310111101.04721.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:62603 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753073Ab3JPC5s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Oct 2013 22:57:48 -0400
Content-Disposition: inline
In-Reply-To: <201310111101.04721.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Fri, Oct 11, 2013 at 11:01:04AM +0200, Heiko St=FCbner wrote:
> The earliest variants of the dma controller did not contain support f=
or
> controlling clocks.
Acked-by: Vinod Koul <vinod.koul@intel.com>

>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/dma/s3c24xx-dma.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
> index 56c9253..4cb1279 100644
> --- a/drivers/dma/s3c24xx-dma.c
> +++ b/drivers/dma/s3c24xx-dma.c
> @@ -1078,6 +1078,13 @@ static void s3c24xx_dma_free_virtual_channels(=
struct dma_device *dmadev)
>  		list_del(&chan->vc.chan.device_node);
>  }
> =20
> +/* s3c2410, s3c2440 and s3c2442 have a 0x40 stride without separate =
clocks */
> +static struct soc_data soc_s3c2410 =3D {
> +	.stride =3D 0x40,
> +	.has_reqsel =3D false,
> +	.has_clocks =3D false,
> +};
> +
>  /* s3c2412 and s3c2413 have a 0x40 stride and dmareqsel mechanism */
>  static struct soc_data soc_s3c2412 =3D {
>  	.stride =3D 0x40,
> @@ -1094,6 +1101,9 @@ static struct soc_data soc_s3c2443 =3D {
> =20
>  static struct platform_device_id s3c24xx_dma_driver_ids[] =3D {
>  	{
> +		.name		=3D "s3c2410-dma",
> +		.driver_data	=3D (kernel_ulong_t)&soc_s3c2410,
> +	}, {
>  		.name		=3D "s3c2412-dma",
>  		.driver_data	=3D (kernel_ulong_t)&soc_s3c2412,
>  	}, {
> --=20
> 1.7.10.4
>=20

--=20
