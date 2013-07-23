From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 07/22] ARM: exynos: Remove '0x's from Exynos4110 DTSI file
Date: Tue, 23 Jul 2013 09:55:52 +0100
Message-ID: <20130723085552.GF26801@laptop>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
 <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
 <2350088.9z671SCjFz@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:41709 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754918Ab3GWIz6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 04:55:58 -0400
Received: by mail-ea0-f175.google.com with SMTP id z7so4338444eaf.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jul 2013 01:55:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <2350088.9z671SCjFz@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2013, Tomasz Figa wrote:

> Hi Lee,
>=20
> On Monday 22 of July 2013 11:52:26 Lee Jones wrote:
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  arch/arm/boot/dts/exynos4210.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> > b/arch/arm/boot/dts/exynos4210.dtsi index b7f358a..53e2527 100644
> > --- a/arch/arm/boot/dts/exynos4210.dtsi
> > +++ b/arch/arm/boot/dts/exynos4210.dtsi
> > @@ -72,7 +72,7 @@
> >  		};
> >  	};
> >=20
> > -	clock: clock-controller@0x10030000 {
> > +	clock: clock-controller@10030000 {
> >  		compatible =3D "samsung,exynos4210-clock";
> >  		reg =3D <0x10030000 0x20000>;
> >  		#clock-cells =3D <1>;
>=20
> This looks fine, but please fix commit message - it should be Exynos4=
210.=20
> Also some explanation why this change is needed would be good, even i=
f=20
> it's obvious.

Hi Tomasz,

I'm happy to fixup the $SUBJECT line, but do we really have to enter
an explanation if it's obvious? Seems a little belt and braces.

Kind regards,
Lee

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
