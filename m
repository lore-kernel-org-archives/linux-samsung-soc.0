From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 07/22] ARM: dts: Remove '0x's from Exynos4210 DTSI file
Date: Thu, 25 Jul 2013 08:52:15 +0100
Message-ID: <20130725075215.GA3403@laptop>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
 <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
 <20130724150937.GO26801@laptop>
 <5075798.2aqxtybhC8@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:52901 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755061Ab3GYHwV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 03:52:21 -0400
Received: by mail-ea0-f172.google.com with SMTP id q10so741559eaj.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2013 00:52:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5075798.2aqxtybhC8@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Wed, 24 Jul 2013, Tomasz Figa wrote:

> On Wednesday 24 of July 2013 16:09:37 Lee Jones wrote:
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
> Acked-by: Tomasz Figa <t.figa@samsung.com>

Thanks Tomasz.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
