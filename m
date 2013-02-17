From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] ARM:plat-s3c24xx: for memcpy, reading more things out
 of boundary
Date: Sun, 17 Feb 2013 11:57:29 +0800
Message-ID: <51205529.60601@asianux.com>
References: <5100C643.5010101@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:45914 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755362Ab3BQD5h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Feb 2013 22:57:37 -0500
In-Reply-To: <5100C643.5010101@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hello relative members:

  please give a glance for this patch, when you have time.

  thanks.

  :-)


gchen.


=D3=DA 2013=C4=EA01=D4=C224=C8=D5 13:27, Chen Gang =D0=B4=B5=C0:
>=20
>   the size is made by "plls_no + 1".
>   so when copy from original buffer, need dec 1, or reading out of bo=
undary.
>=20
> additional info:
>   plls_no is ARRARY_SIZE(plls).
>=20
>=20
> Signed-off-by: Chen Gang <gang.chen@asianux.com>
> ---
>  arch/arm/plat-s3c24xx/cpu-freq.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/plat-s3c24xx/cpu-freq.c b/arch/arm/plat-s3c24xx=
/cpu-freq.c
> index 4680799..df093b2 100644
> --- a/arch/arm/plat-s3c24xx/cpu-freq.c
> +++ b/arch/arm/plat-s3c24xx/cpu-freq.c
> @@ -700,7 +700,8 @@ int __init s3c_plltab_register(struct cpufreq_fre=
quency_table *plls,
> =20
>  	vals =3D kmalloc(size, GFP_KERNEL);
>  	if (vals) {
> -		memcpy(vals, plls, size);
> +		memcpy(vals, plls,
> +			size - sizeof(struct cpufreq_frequency_table));
>  		pll_reg =3D vals;
> =20
>  		/* write a terminating entry, we don't store it in the
>=20


--=20
Chen Gang

Asianux Corporation
