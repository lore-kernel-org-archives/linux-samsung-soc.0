From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/6] ARM: S3C24XX: Add forgotten clock lookup table to
 S3C2443
Date: Mon, 02 Apr 2012 14:08:10 -0700
Message-ID: <4F7A153A.5070701@samsung.com>
References: <201203121959.32966.heiko@sntech.de> <201203122000.31216.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:40652 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742Ab2DBVIK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Apr 2012 17:08:10 -0400
Received: by dake40 with SMTP id e40so2894594dak.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Apr 2012 14:08:10 -0700 (PDT)
In-Reply-To: <201203122000.31216.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
> When the hsmmc clock lookup was changed to be lookup tables based,
> it seems the S3C2443 was forgotten.
>
> As subsequent patches will want to add more lookups to it, this
> patch adds the base table with the missing hsmmc lookup.
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> ---
>   arch/arm/mach-s3c24xx/clock-s3c2443.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s3c24xx/clock-s3c2443.c b/arch/arm/mach-s3=
c24xx/clock-s3c2443.c
> index efb3ac3..bce1cd3 100644
> --- a/arch/arm/mach-s3c24xx/clock-s3c2443.c
> +++ b/arch/arm/mach-s3c24xx/clock-s3c2443.c
> @@ -179,6 +179,10 @@ static struct clk *clks[] __initdata =3D {
>   	&clk_hsmmc,
>   };
>
> +static struct clk_lookup s3c2443_clk_lookup[] =3D {
> +	CLKDEV_INIT("s3c-sdhci.1", "mmc_busclk.2",&clk_hsmmc),
> +};
> +
>   void __init s3c2443_init_clocks(int xtal)
>   {
>   	unsigned long epllcon =3D __raw_readl(S3C2443_EPLLCON);
> @@ -210,6 +214,7 @@ void __init s3c2443_init_clocks(int xtal)
>
>   	s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
>   	s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_clocks_off));
> +	clkdev_add_table(s3c2443_clk_lookup, ARRAY_SIZE(s3c2443_clk_lookup)=
);
>
>   	s3c_pwmclk_init();
>   }

Uhm..how about mach-s3c24xx/common-s3c2443.c?

I think, we need to sort out some files in mach-s3c24xx/ and some=20
remained mach-s3c24.. directories, actually, as you know, we didn't hav=
e=20
much time to do it last time :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
