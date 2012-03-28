From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/2] Fixes related to rtc-s3c
Date: Wed, 28 Mar 2012 17:38:05 +0530
Message-ID: <4F72FF25.3030702@linaro.org>
References: <1332931837-3819-1-git-send-email-tushar.behera@linaro.org> <201203281328.41802.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39958 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab2C1MIL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 08:08:11 -0400
Received: by pbcun15 with SMTP id un15so1703400pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 05:08:11 -0700 (PDT)
In-Reply-To: <201203281328.41802.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, patches@linaro.org

On 03/28/2012 04:58 PM, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 28. M=C3=A4rz 2012, 12:50:35 schrieb Tushar Behera:
>> The patches are based on Kukjin's for-next branch and they fix a cou=
ple
>> of compile-time errors and warnings.
> There was also a fixup patch for these problems posted on 2012-01-04.=
 But it seems
> to have been forgotten somehow.
>=20
> I think either solution is fine.
>=20
>=20
> Heiko
>=20
I must have missed this patch too. We can go ahead with Heiko's patch.

>=20
> For reference the original patch was:
>=20
> ---- 8< ----------------------------------- >8 ----
> Subject: [PATCH] rtc-s3c: Fix breakage introduced by S3C2443/S3C2416 =
support
>=20
> Commits 7006ee4f (rtc-s3c: make room for more variants in devicetree =
block)
> and 6c0a2365 (rtc-s3c: add variants for S3C2443 and S3C2416)
> introduced build-failures with enabled CONFIG_USE_OF option.
>=20
> This patch fixes missing "," in s3c_rtc_dt_match and wrong handling o=
f
> the of_device_id.data property.
>=20
> Reported-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/rtc/rtc-s3c.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index bb0f320..2b4feb8 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(struct =
platform_device *pdev)
>         if (pdev->dev.of_node) {
>                 const struct of_device_id *match;
>                 match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.o=
f_node);
> -               return match->data;
> +               return (int)match->data;
>         }
>  #endif
>         return platform_get_device_id(pdev)->driver_data;
> @@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_devic=
e *pdev)
>  #ifdef CONFIG_OF
>  static const struct of_device_id s3c_rtc_dt_match[] =3D {
>         {
> -               .compatible =3D "samsung,s3c2410-rtc"
> -               .data =3D TYPE_S3C2410,
> +               .compatible =3D "samsung,s3c2410-rtc",
> +               .data =3D (void *)TYPE_S3C2410,
>         }, {
> -               .compatible =3D "samsung,s3c2416-rtc"
> -               .data =3D TYPE_S3C2416,
> +               .compatible =3D "samsung,s3c2416-rtc",
> +               .data =3D (void *)TYPE_S3C2416,
>         }, {
> -               .compatible =3D "samsung,s3c2443-rtc"
> -               .data =3D TYPE_S3C2443,
> +               .compatible =3D "samsung,s3c2443-rtc",
> +               .data =3D (void *)TYPE_S3C2443,
>         }, {
> -               .compatible =3D "samsung,s3c6410-rtc"
> -               .data =3D TYPE_S3C64XX,
> +               .compatible =3D "samsung,s3c6410-rtc",
> +               .data =3D (void *)TYPE_S3C64XX,
>         },
>         {},
>  };


--=20
Tushar Behera
