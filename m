From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: SAMSUNG: remove unneeded s3c24xx_init_cpu()
Date: Wed, 12 Feb 2014 01:20:04 +0100
Message-ID: <1740860.STngzZgRLl@phil>
References: <3865198.Kyn1P03kbU@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54782 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978AbaBLAU7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 19:20:59 -0500
In-Reply-To: <3865198.Kyn1P03kbU@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Am Sonntag, 12. Januar 2014, 21:34:29 schrieb Heiko St=FCbner:
> The function is nearly empty and samsung_cpu_rev is static so already=
 0
> making the function obsolete, therefore remove it.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

ping :-)


> ---
>  arch/arm/mach-s3c24xx/common.c           |    1 -
>  arch/arm/plat-samsung/cpu.c              |    7 -------
>  arch/arm/plat-samsung/include/plat/cpu.h |    1 -
>  3 files changed, 9 deletions(-)
>=20
> diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/c=
ommon.c
> index bf57d4c..97edd4d 100644
> --- a/arch/arm/mach-s3c24xx/common.c
> +++ b/arch/arm/mach-s3c24xx/common.c
> @@ -232,7 +232,6 @@ void __init s3c24xx_init_io(struct map_desc *mach=
_desc,
> int size) } else {
>  		samsung_cpu_id =3D s3c24xx_read_idcode_v4();
>  	}
> -	s3c24xx_init_cpu();
>=20
>  	s3c_init_cpu(samsung_cpu_id, cpu_ids, ARRAY_SIZE(cpu_ids));
>=20
> diff --git a/arch/arm/plat-samsung/cpu.c b/arch/arm/plat-samsung/cpu.=
c
> index 46b426e..364963a 100644
> --- a/arch/arm/plat-samsung/cpu.c
> +++ b/arch/arm/plat-samsung/cpu.c
> @@ -28,13 +28,6 @@ unsigned int samsung_rev(void)
>  }
>  EXPORT_SYMBOL(samsung_rev);
>=20
> -void __init s3c24xx_init_cpu(void)
> -{
> -	/* nothing here yet */
> -
> -	samsung_cpu_rev =3D 0;
> -}
> -
>  void __init s3c64xx_init_cpu(void)
>  {
>  	samsung_cpu_id =3D __raw_readl(S3C_VA_SYS + 0x118);
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h
> b/arch/arm/plat-samsung/include/plat/cpu.h index 8f09488..262ef86 100=
644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -207,7 +207,6 @@ extern void s5p_init_irq(u32 *vic, u32 num_vic);
>=20
>  extern void s3c24xx_init_io(struct map_desc *mach_desc, int size);
>=20
> -extern void s3c24xx_init_cpu(void);
>  extern void s3c64xx_init_cpu(void);
>  extern void s5p_init_cpu(void __iomem *cpuid_addr);
