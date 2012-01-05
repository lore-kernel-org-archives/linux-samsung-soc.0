From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] rtc-s3c: Fix breakage introduced by S3C2443/S3C2416 support
Date: Thu, 05 Jan 2012 11:32:28 +0900
Message-ID: <00f701cccb52$446af9c0$cd40ed40$%kim@samsung.com>
References: <201112211014.30695.heiko@sntech.de>
 <201201041251.42509.heiko@sntech.de> <201201041512.55126.heiko@sntech.de>
 <201201041514.16813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50056 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754014Ab2AECc3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 21:32:29 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXB00BAQ0CRKMB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Jan 2012 11:32:28 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXB00BL00E49W10@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 05 Jan 2012 11:32:28 +0900 (KST)
In-reply-to: <201201041514.16813.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com

Heiko St=FCbner wrote:
>=20
> Commits 7006ee4f (rtc-s3c: make room for more variants in devicetree
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

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Arnd,
Could you please pick this up in your next/driver2 for samsung-rtc?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/rtc/rtc-s3c.c |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index bb0f320..2b4feb8 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -449,7 +449,7 @@ static inline int s3c_rtc_get_driver_data(struct
> platform_device *pdev)
>  	if (pdev->dev.of_node) {
>  		const struct of_device_id *match;
>  		match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.of_node);
> -		return match->data;
> +		return (int)match->data;
>  	}
>  #endif
>  	return platform_get_device_id(pdev)->driver_data;
> @@ -667,17 +667,17 @@ static int s3c_rtc_resume(struct platform_devic=
e
> *pdev)
>  #ifdef CONFIG_OF
>  static const struct of_device_id s3c_rtc_dt_match[] =3D {
>  	{
> -		.compatible =3D "samsung,s3c2410-rtc"
> -		.data =3D TYPE_S3C2410,
> +		.compatible =3D "samsung,s3c2410-rtc",
> +		.data =3D (void *)TYPE_S3C2410,
>  	}, {
> -		.compatible =3D "samsung,s3c2416-rtc"
> -		.data =3D TYPE_S3C2416,
> +		.compatible =3D "samsung,s3c2416-rtc",
> +		.data =3D (void *)TYPE_S3C2416,
>  	}, {
> -		.compatible =3D "samsung,s3c2443-rtc"
> -		.data =3D TYPE_S3C2443,
> +		.compatible =3D "samsung,s3c2443-rtc",
> +		.data =3D (void *)TYPE_S3C2443,
>  	}, {
> -		.compatible =3D "samsung,s3c6410-rtc"
> -		.data =3D TYPE_S3C64XX,
> +		.compatible =3D "samsung,s3c6410-rtc",
> +		.data =3D (void *)TYPE_S3C64XX,
>  	},
>  	{},
>  };
> --
> 1.7.5.4
