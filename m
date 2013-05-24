From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: fix software reset logic for EXYNOS5440
 SOC
Date: Sat, 25 May 2013 06:42:28 +0900
Message-ID: <519FDEC4.60909@samsung.com>
References: <003001ce57af$435c0340$ca1409c0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:43963 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755520Ab3EXVmc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 17:42:32 -0400
Received: by mail-pd0-f174.google.com with SMTP id 3so2788860pdj.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 14:42:31 -0700 (PDT)
In-Reply-To: <003001ce57af$435c0340$ca1409c0$%lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?EUC-KR?B?wMzBpLyu?= <jays.lee@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On 05/23/13 21:15, =C0=CC=C1=A4=BC=AE wrote:
>=20
> This patch fixes software reset logic. Software reset applies only to
> powered-on domains in SOC because software reset to all domains cause=
s
> reboot failure.
>=20
> Signed-off-by: Jungseok Lee<jays.lee@samsung.com>
> ---
>   arch/arm/mach-exynos/common.c |    6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/com=
mon.c
> index 7f431dd..a22615d 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -317,9 +317,13 @@ void exynos5_restart(char mode, const char *cmd)
>   		val =3D 0x1;
>   		addr =3D EXYNOS_SWRESET;
>   	} else if (of_machine_is_compatible("samsung,exynos5440")) {
> +		u32 status;
>   		np =3D of_find_compatible_node(NULL, NULL,
> "samsung,exynos5440-clock");

line wrapped?

> +		addr =3D of_iomap(np, 0) + 0xbc;
> +		status =3D __raw_readl(addr);
>   		addr =3D of_iomap(np, 0) + 0xcc;
> -		val =3D (0xfff<<  20) | (0x1<<  16);
> +		val =3D __raw_readl(addr);
> +		val =3D (val&  0xffff0000) | (status&  0xffff);
>   	} else {
>   		pr_err("%s: cannot support non-DT\n", __func__);
>   		return;

Looks good to me, applied after fixing line wrapped.

Thanks.

- Kukjin
