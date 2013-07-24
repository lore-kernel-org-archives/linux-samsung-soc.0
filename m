From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 07/22] ARM: Exynos4210: Remove '0x's from Exynos4110
 DTSI file
Date: Wed, 24 Jul 2013 16:05:00 +0100
Message-ID: <20130724150500.GN26801@laptop>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
 <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
 <20130724123931.GL26801@laptop>
 <6156493.tCYrm4xD5A@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:62243 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752882Ab3GXPFG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 11:05:06 -0400
Received: by mail-ee0-f43.google.com with SMTP id l10so307175eei.30
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 08:05:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <6156493.tCYrm4xD5A@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Wed, 24 Jul 2013, Tomasz Figa wrote:

> On Wednesday 24 of July 2013 13:39:31 Lee Jones wrote:
> > ... for the sake of consistency and assumed convention.
> >=20
> > Cc: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >=20
> > diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> > b/arch/arm/boot/dts/exynos4210.dtsi index b7f358a..53e2527 100644
> > --- a/arch/arm/boot/dts/exynos4210.dtsi
> > +++ b/arch/arm/boot/dts/exynos4210.dtsi
> > @@ -72,7 +72,7 @@
> >                 };
> >         };
> >=20
> > -       clock: clock-controller@0x10030000 {
> > +       clock: clock-controller@10030000 {
> >                 compatible =3D "samsung,exynos4210-clock";
> >                 reg =3D <0x10030000 0x20000>;
> >                 #clock-cells =3D <1>;
>=20
> Looks good to me, except the subject which is still wrong -=20
> s/Exynos4110/Exynos4210/.

Ah, I get you know. My bad, will fix.

> I guess it might be fixed when applying, though.


--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
