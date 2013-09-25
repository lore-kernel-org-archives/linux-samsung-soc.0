From: =?iso-8859-15?q?J=FCrgen_Beisert?= <jbe@pengutronix.de>
Subject: Re: ARM/Samsung/S3C24xx: Linux-3.11 crashes when using PWM
Date: Wed, 25 Sep 2013 11:40:36 +0200
Message-ID: <201309251140.36582.jbe@pengutronix.de>
References: <201309251029.44265.jbe@pengutronix.de> <5242AA7C.4010905@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5242AA7C.4010905@samsung.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On Wednesday 25 September 2013 11:18:52 Sylwester Nawrocki wrote:
> On 25/09/13 10:29, J=FCrgen Beisert wrote:
> > Change one single line:
> >
> > diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c
> > b/arch/arm/mach-s3c24xx/mach-mini2440.c index a83db46..d8273da 1006=
44
> > --- a/arch/arm/mach-s3c24xx/mach-mini2440.c
> > +++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
> > @@ -519,6 +519,7 @@ static struct platform_device *mini2440_devices=
[]
> > __initdata =3D { &s3c_device_iis,
> >         &uda1340_codec,
> >         &mini2440_audio,
> > +       &s3c_device_timer[0],
> >  };
>
> I think you need to add instead:
>
> 	&samsung_device_pwm,
>
> IIRC I had this working, can't verify at the moment as I don't
> have access to the board right now. Please see commit:
>
> 7fa33bdb4c44155e390c9ebbc5aa4c5cfc73f6fa
> ARM: SAMSUNG: Modify board files to use new PWM platform device

Seems valid for 3.12, but not for 3.11.

Regards,
Juergen

--=20
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| Juergen Beisert =A0 =A0 =A0 =A0 =A0 =A0 |
Linux Solutions for Science and Industry =A0 =A0 =A0| http://www.pengut=
ronix.de/  |
