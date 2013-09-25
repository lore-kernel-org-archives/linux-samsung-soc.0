From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: ARM/Samsung/S3C24xx: Linux-3.11 crashes when using PWM
Date: Wed, 25 Sep 2013 11:18:52 +0200
Message-ID: <5242AA7C.4010905@samsung.com>
References: <201309251029.44265.jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38542 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751253Ab3IYJS4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Sep 2013 05:18:56 -0400
In-reply-to: <201309251029.44265.jbe@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?J=FCrgen_Beisert?= <jbe@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

Hi J=FCrgen,

On 25/09/13 10:29, J=FCrgen Beisert wrote:
> Change one single line:
>=20
> diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3=
c24xx/mach-mini2440.c
> index a83db46..d8273da 100644
> --- a/arch/arm/mach-s3c24xx/mach-mini2440.c
> +++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
> @@ -519,6 +519,7 @@ static struct platform_device *mini2440_devices[]=
 __initdata =3D {
>         &s3c_device_iis,
>         &uda1340_codec,
>         &mini2440_audio,
> +       &s3c_device_timer[0],
>  };

I think you need to add instead:

	&samsung_device_pwm,

IIRC I had this working, can't verify at the moment as I don't
have access to the board right now. Please see commit:

7fa33bdb4c44155e390c9ebbc5aa4c5cfc73f6fa
ARM: SAMSUNG: Modify board files to use new PWM platform device

--
Regards,
Sylwester
