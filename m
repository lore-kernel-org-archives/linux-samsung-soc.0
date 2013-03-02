From: Lonsn <lonsn2005@gmail.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix PL330 DMA controller clkdev entries
Date: Sat, 02 Mar 2013 22:56:38 +0800
Message-ID: <51321326.6050800@gmail.com>
References: <1362227906-13921-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:52471 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751962Ab3CBO4n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Mar 2013 09:56:43 -0500
Received: by mail-pb0-f48.google.com with SMTP id wy12so2264126pbc.21
        for <linux-samsung-soc@vger.kernel.org>; Sat, 02 Mar 2013 06:56:43 -0800 (PST)
In-Reply-To: <1362227906-13921-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Inderpal Singh <inderpal.singh@linaro.org>, Boojin Kim <boojin.kim@samsung.com>

=E4=BA=8E 2013/3/2 20:38, Sylwester Nawrocki =E5=86=99=E9=81=93:
> Since the DMA controller clocks are managed at amba bus level,
> the PL330 device clocks handling has been removed from the driver
> in commit 7c71b8eb268ee38235f7e924d943ea9d90e59469
> DMA: PL330: Remove redundant runtime_suspend/resume functions
>
> However, this left the S5PV210 platform with only clkdev entries
> linking "apb_pclk" clock conn_id to a dummy clock, rather than
> to corresponding platform PL330 DMAC clock.
> As a result the DMA controller is now attempted to be used on
> S5PV210 with the clock disabled and the driver fails with an
> error:
>
> dma-pl330 dma-pl330.0: PERIPH_ID 0x0, PCELL_ID 0x0 !
> dma-pl330: probe of dma-pl330.0 failed with error -22
> dma-pl330 dma-pl330.1: PERIPH_ID 0x0, PCELL_ID 0x0 !
> dma-pl330: probe of dma-pl330.1 failed with error -22
>
> Fix this by adding "apb_pclk" clkdev entries for the Peripheral
> DMA controllers 0/1 and removing the dummy apb_pclk clock.
>
> Reported-by: Lonsn <lonsn2005@gmail.com>
> Cc: Inderpal Singh <inderpal.singh@linaro.org>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>
> Lonsn, could you check if this patch solves the problem for you,
> please ? Any Tested-by are welcome.
> I didn't test this patch on any hardware yet. Once it is confirmed
> I would resend it, also for stable kernels. It seems this issue is
> present since v3.7.
>
Sylwester, I have tested this patch and confirmed it's OK in my S5PV210=
=20
platform.

> Thanks.
> ---
>   arch/arm/mach-s5pv210/clock.c |   36 ++++++++++++++++++------------=
------
>   1 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/cl=
ock.c
> index fcdf52d..f051f53 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -214,11 +214,6 @@ static struct clk clk_pcmcdclk2 =3D {
>   	.name		=3D "pcmcdclk",
>   };
>
> -static struct clk dummy_apb_pclk =3D {
> -	.name		=3D "apb_pclk",
> -	.id		=3D -1,
> -};
> -
>   static struct clk *clkset_vpllsrc_list[] =3D {
>   	[0] =3D &clk_fin_vpll,
>   	[1] =3D &clk_sclk_hdmi27m,
> @@ -305,18 +300,6 @@ static struct clk_ops clk_fout_apll_ops =3D {
>
>   static struct clk init_clocks_off[] =3D {
>   	{
> -		.name		=3D "dma",
> -		.devname	=3D "dma-pl330.0",
> -		.parent		=3D &clk_hclk_psys.clk,
> -		.enable		=3D s5pv210_clk_ip0_ctrl,
> -		.ctrlbit	=3D (1 << 3),
> -	}, {
> -		.name		=3D "dma",
> -		.devname	=3D "dma-pl330.1",
> -		.parent		=3D &clk_hclk_psys.clk,
> -		.enable		=3D s5pv210_clk_ip0_ctrl,
> -		.ctrlbit	=3D (1 << 4),
> -	}, {
>   		.name		=3D "rot",
>   		.parent		=3D &clk_hclk_dsys.clk,
>   		.enable		=3D s5pv210_clk_ip0_ctrl,
> @@ -573,6 +556,20 @@ static struct clk clk_hsmmc3 =3D {
>   	.ctrlbit	=3D (1<<19),
>   };
>
> +static struct clk clk_pdma0 =3D {
> +	.name		=3D "pdma0",
> +	.parent		=3D &clk_hclk_psys.clk,
> +	.enable		=3D s5pv210_clk_ip0_ctrl,
> +	.ctrlbit	=3D (1 << 3),
> +};
> +
> +static struct clk clk_pdma1 =3D {
> +	.name		=3D "pdma1",
> +	.parent		=3D &clk_hclk_psys.clk,
> +	.enable		=3D s5pv210_clk_ip0_ctrl,
> +	.ctrlbit	=3D (1 << 4),
> +};
> +
>   static struct clk *clkset_uart_list[] =3D {
>   	[6] =3D &clk_mout_mpll.clk,
>   	[7] =3D &clk_mout_epll.clk,
> @@ -1075,6 +1072,8 @@ static struct clk *clk_cdev[] =3D {
>   	&clk_hsmmc1,
>   	&clk_hsmmc2,
>   	&clk_hsmmc3,
> +	&clk_pdma0,
> +	&clk_pdma1,
>   };
>
>   /* Clock initialisation code */
> @@ -1333,6 +1332,8 @@ static struct clk_lookup s5pv210_clk_lookup[] =3D=
 {
>   	CLKDEV_INIT(NULL, "spi_busclk0", &clk_p),
>   	CLKDEV_INIT("s5pv210-spi.0", "spi_busclk1", &clk_sclk_spi0.clk),
>   	CLKDEV_INIT("s5pv210-spi.1", "spi_busclk1", &clk_sclk_spi1.clk),
> +	CLKDEV_INIT("dma-pl330.0", "apb_pclk", &clk_pdma0),
> +	CLKDEV_INIT("dma-pl330.1", "apb_pclk", &clk_pdma1),
>   };
>
>   void __init s5pv210_register_clocks(void)
> @@ -1361,6 +1362,5 @@ void __init s5pv210_register_clocks(void)
>   	for (ptr =3D 0; ptr < ARRAY_SIZE(clk_cdev); ptr++)
>   		s3c_disable_clocks(clk_cdev[ptr], 1);
>
> -	s3c24xx_register_clock(&dummy_apb_pclk);
>   	s3c_pwmclk_init();
>   }
>
