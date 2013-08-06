From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 07/22] ARM: dts: Remove '0x's from Exynos4210 DTSI file
Date: Tue, 6 Aug 2013 08:18:27 +0100
Message-ID: <20130806071827.GB5100@lee--X1>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
 <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
 <20130724150937.GO26801@laptop>
 <51FFE9F0.1000100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:45701 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755203Ab3HFHSd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 03:18:33 -0400
Received: by mail-wi0-f177.google.com with SMTP id hq12so34465wib.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 00:18:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51FFE9F0.1000100@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, arnd@arndb.de, linus.walleij@stericsson.com, linux-samsung-soc@vger.kernel.org

On Tue, 06 Aug 2013, Kukjin Kim wrote:

> On 07/25/13 00:09, Lee Jones wrote:
> >... for the sake of consistency and assumed convention.
> >
> >Cc: Kukjin Kim<kgene.kim@samsung.com>
> >Cc: linux-samsung-soc@vger.kernel.org
> >Signed-off-by: Lee Jones<lee.jones@linaro.org>
> >
> >diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/e=
xynos4210.dtsi
> >index b7f358a..53e2527 100644
> >--- a/arch/arm/boot/dts/exynos4210.dtsi
> >+++ b/arch/arm/boot/dts/exynos4210.dtsi
> >@@ -72,7 +72,7 @@
> >                 };
>    ^^^^^^^^^^^^^^^^
> >         };
>    ^^^^^^^^
> >
> >-       clock: clock-controller@0x10030000 {
>    ^^^^^^^^
> >+       clock: clock-controller@10030000 {
>    ^^^^^^^^
> >                 compatible =3D "samsung,exynos4210-clock";
>    ^^^^^^^^^^^^^^^^
> >                 reg =3D<0x10030000 0x20000>;
>    ^^^^^^^^^^^^^^^^
> >                 #clock-cells =3D<1>;
>    ^^^^^^^^^^^^^^^^
>=20
> BTW, should be tab at the mark '^' not white space :(

Agreed, but this should be a separate patch.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
