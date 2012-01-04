From: Heiko =?windows-1252?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree block
Date: Wed, 4 Jan 2012 12:51:41 +0100
Message-ID: <201201041251.42509.heiko@sntech.de>
References: <201112211014.30695.heiko@sntech.de> <201112211016.51956.heiko@sntech.de> <4F042D61.2070309@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:47829 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752785Ab2ADLwD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 06:52:03 -0500
In-Reply-To: <4F042D61.2070309@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com

Hi Sylwester,

Am Mittwoch, 4. Januar 2012, 11:43:45 schrieb Sylwester Nawrocki:
> Hello,
>=20
> On 12/21/2011 10:16 AM, Heiko St=FCbner wrote:
> > Use the data field of of_device_id to hold the type for
> > s3c_cpu_type.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> > ---
> >=20
> This patch makes compilation with CONFIG_OF enabled fail with errors
> and warnings:
>=20
> drivers/rtc/rtc-s3c.c: In function =91s3c_rtc_get_driver_data=92:
> drivers/rtc/rtc-s3c.c:454: warning: return makes integer from pointer
> without a cast
> drivers/rtc/rtc-s3c.c: At top level:
> drivers/rtc/rtc-s3c.c:674: error: request for member =91data=92 in so=
mething
> not a structure or union
> drivers/rtc/rtc-s3c.c:677: error: request for member =91data=92 in so=
mething
> not a structure or union
> drivers/rtc/rtc-s3c.c:680: error: request for member =91data=92 in so=
mething
> not a structure or union
> drivers/rtc/rtc-s3c.c:683: error: request for member =91data=92 in so=
mething
> not a structure or union
> make[2]: *** [drivers/rtc/rtc-s3c.o] Error 1
thanks for spotting this.

@kgene: Should this go on top of the rtc series, or should I prepare a =
v4 with=20
these fixes included?


> And the following patch fixes this:
>=20
> 8<------------
>=20
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 4498053..9a0d388 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -451,7 +451,7 @@ static inline int s3c_rtc_get_driver_data(struct
> platform_device *pdev)
>         if (pdev->dev.of_node) {
>                 const struct of_device_id *match;
>                 match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.o=
f_node);
> -               return match->data;
> +               return (int)match->data;
>         }
>  #endif
>         return platform_get_device_id(pdev)->driver_data;
> @@ -670,17 +670,17 @@ static int s3c_rtc_resume(struct platform_devic=
e
> *pdev) #ifdef CONFIG_OF
>  static const struct of_device_id s3c_rtc_dt_match[] =3D {
>         {
> -               .compatible =3D "samsung,s3c2410-rtc"
> -               .data =3D TYPE_S3C2410,
> +               .compatible =3D "samsung,s3c2410-rtc",
> +               .data =3D (void*)TYPE_S3C2410,
>         }, {
> -               .compatible =3D "samsung,s3c2443-rtc"
> -               .data =3D TYPE_S3C2443,
> +               .compatible =3D "samsung,s3c2443-rtc",
> +               .data =3D (void*)TYPE_S3C2443,
>         }, {
> -               .compatible =3D "samsung,s3c2416-rtc"
> -               .data =3D TYPE_S3C2416,
> +               .compatible =3D "samsung,s3c2416-rtc",
> +               .data =3D (void*)TYPE_S3C2416,
>         }, {
> -               .compatible =3D "samsung,s3c6410-rtc"
> -               .data =3D TYPE_S3C64XX,
> +               .compatible =3D "samsung,s3c6410-rtc",
> +               .data =3D (void*)TYPE_S3C64XX,
>         },
>         {},
>  };
>=20
> 8<-----------------

Heiko
