From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree
 block
Date: Wed, 04 Jan 2012 11:43:45 +0100
Message-ID: <4F042D61.2070309@samsung.com>
References: <201112211014.30695.heiko@sntech.de>
 <201112211016.51956.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:63782 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab2ADKnt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 05:43:49 -0500
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LX900M54SGZRV@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Jan 2012 10:43:47 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LX9004DOSGYT9@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Jan 2012 10:43:46 +0000 (GMT)
In-reply-to: <201112211016.51956.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com

Hello,

On 12/21/2011 10:16 AM, Heiko St=FCbner wrote:
> Use the data field of of_device_id to hold the type for
> s3c_cpu_type.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c |   31 ++++++++++++++++++++++---------
>  1 files changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 175067a..2885b25 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -428,6 +428,20 @@ static int __devexit s3c_rtc_remove(struct platf=
orm_device *dev)
>  	return 0;
>  }
> =20
> +static const struct of_device_id s3c_rtc_dt_match[];
> +
> +static inline int s3c_rtc_get_driver_data(struct platform_device *pd=
ev)
> +{
> +#ifdef CONFIG_OF
> +	if (pdev->dev.of_node) {
> +		const struct of_device_id *match;
> +		match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.of_node);
> +		return match->data;
> +	}
> +#endif
> +	return platform_get_device_id(pdev)->driver_data;
> +}
> +
>  static int __devinit s3c_rtc_probe(struct platform_device *pdev)
>  {
>  	struct rtc_device *rtc;
> @@ -508,13 +522,7 @@ static int __devinit s3c_rtc_probe(struct platfo=
rm_device *pdev)
>  		goto err_nortc;
>  	}
> =20
> -#ifdef CONFIG_OF
> -	if (pdev->dev.of_node)
> -		s3c_rtc_cpu_type =3D of_device_is_compatible(pdev->dev.of_node,
> -			"samsung,s3c6410-rtc") ? TYPE_S3C64XX : TYPE_S3C2410;
> -	else
> -#endif
> -		s3c_rtc_cpu_type =3D platform_get_device_id(pdev)->driver_data;
> +	s3c_rtc_cpu_type =3D s3c_rtc_get_driver_data(pdev);
> =20
>  	/* Check RTC Time */
> =20
> @@ -638,8 +646,13 @@ static int s3c_rtc_resume(struct platform_device=
 *pdev)
> =20
>  #ifdef CONFIG_OF
>  static const struct of_device_id s3c_rtc_dt_match[] =3D {
> -	{ .compatible =3D "samsung,s3c2410-rtc" },
> -	{ .compatible =3D "samsung,s3c6410-rtc" },
> +	{
> +		.compatible =3D "samsung,s3c2410-rtc"
> +		.data =3D TYPE_S3C2410,
> +	}, {
> +		.compatible =3D "samsung,s3c6410-rtc"
> +		.data =3D TYPE_S3C64XX,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);

This patch makes compilation with CONFIG_OF enabled fail with errors
and warnings:

drivers/rtc/rtc-s3c.c: In function =91s3c_rtc_get_driver_data=92:
drivers/rtc/rtc-s3c.c:454: warning: return makes integer from pointer w=
ithout a
cast
drivers/rtc/rtc-s3c.c: At top level:
drivers/rtc/rtc-s3c.c:674: error: request for member =91data=92 in some=
thing not a
structure or union
drivers/rtc/rtc-s3c.c:677: error: request for member =91data=92 in some=
thing not a
structure or union
drivers/rtc/rtc-s3c.c:680: error: request for member =91data=92 in some=
thing not a
structure or union
drivers/rtc/rtc-s3c.c:683: error: request for member =91data=92 in some=
thing not a
structure or union
make[2]: *** [drivers/rtc/rtc-s3c.o] Error 1

And the following patch fixes this:

8<------------

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 4498053..9a0d388 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -451,7 +451,7 @@ static inline int s3c_rtc_get_driver_data(struct
platform_device *pdev)
        if (pdev->dev.of_node) {
                const struct of_device_id *match;
                match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.of_=
node);
-               return match->data;
+               return (int)match->data;
        }
 #endif
        return platform_get_device_id(pdev)->driver_data;
@@ -670,17 +670,17 @@ static int s3c_rtc_resume(struct platform_device =
*pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id s3c_rtc_dt_match[] =3D {
        {
-               .compatible =3D "samsung,s3c2410-rtc"
-               .data =3D TYPE_S3C2410,
+               .compatible =3D "samsung,s3c2410-rtc",
+               .data =3D (void*)TYPE_S3C2410,
        }, {
-               .compatible =3D "samsung,s3c2443-rtc"
-               .data =3D TYPE_S3C2443,
+               .compatible =3D "samsung,s3c2443-rtc",
+               .data =3D (void*)TYPE_S3C2443,
        }, {
-               .compatible =3D "samsung,s3c2416-rtc"
-               .data =3D TYPE_S3C2416,
+               .compatible =3D "samsung,s3c2416-rtc",
+               .data =3D (void*)TYPE_S3C2416,
        }, {
-               .compatible =3D "samsung,s3c6410-rtc"
-               .data =3D TYPE_S3C64XX,
+               .compatible =3D "samsung,s3c6410-rtc",
+               .data =3D (void*)TYPE_S3C64XX,
        },
        {},
 };

8<-----------------

--

Regards,
Sylwester
