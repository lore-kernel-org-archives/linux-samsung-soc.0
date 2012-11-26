From: Alexander Varnin <fenixk19@mail.ru>
Subject: Re: [PATCH 2/2] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Mon, 26 Nov 2012 12:44:49 +0400
Message-ID: <50B32C01.6050708@mail.ru>
References: <1353919203-24798-1-git-send-email-fenixk19@mail.ru> <1353919203-24798-2-git-send-email-fenixk19@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1251;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp10.mail.ru ([94.100.176.152]:44617 "EHLO smtp10.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753747Ab2KZIox (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 03:44:53 -0500
In-Reply-To: <1353919203-24798-2-git-send-email-fenixk19@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org, kgene@kernel.org, heiko@sntech.de

Sorry, an old version.

26.11.2012 12:40, Alexander Varnin =EF=E8=F8=E5=F2:
> S3C2443 CPU has a problem with incorrect reading from EXTINTn
> registers. So s3c_irqext_type function wrongly modifies them.
> So add special check to s3c_irqext_type, to handle this case.
>
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
> ---
>   arch/arm/plat-s3c24xx/irq.c |   15 +++++++++++++++
>   1 files changed, 15 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.=
c
> index fe57bbb..bb36fc9 100644
> --- a/arch/arm/plat-s3c24xx/irq.c
> +++ b/arch/arm/plat-s3c24xx/irq.c
> @@ -219,6 +219,21 @@ s3c_irqext_type(struct irq_data *data, unsigned =
int type)
>   	}
>  =20
>   	value =3D __raw_readl(extint_reg);
> +
> +	if( (samsung_cpu_id & 0xfffff) =3D=3D 0x43001) //Hack for 2443 erro=
r workaround
> +	{
> +	    int i;
> +	    int fixed =3D 0;
> +	    if(extint_reg =3D=3D S3C24XX_EXTINT1 || extint_reg =3D=3D S3C24=
XX_EXTINT2)
> +		for(i=3D0; i<7;i++)
> +		    fixed |=3D (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7-i)*4=
-3)) & 8)) << i*4;
> +	    else
> +		for(i=3D0; i<7;i++)
> +		    fixed |=3D ( (value >> (7-i)*4) & 0xf )  << i*4;
> +	    fixed |=3D (((value>>1) & 7) | ((value<<3) & 8)) << 27;
> +	    value =3D fixed;
> +	}
> +
>   	value =3D (value & ~(7 << extint_offset)) | (newvalue << extint_of=
fset);
>   	__raw_writel(value, extint_reg);
>  =20
