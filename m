From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Map SYSRAM through generic SRAM bindings
Date: Fri, 2 May 2014 10:38:47 +0530
Message-ID: <CAK9yfHy++XcfhVat78s48f7-Lojo6mW=pvG58-CwsatVH84g4g@mail.gmail.com>
References: <1398941085-10224-1-git-send-email-sachin.kamat@linaro.org>
	<11106990.1tS5A7pf5r@diego>
	<045301cf65ad$c95badd0$5c130970$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:62306 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751100AbaEBFIr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 01:08:47 -0400
Received: by mail-oa0-f49.google.com with SMTP id o6so4582686oag.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 May 2014 22:08:47 -0700 (PDT)
In-Reply-To: <045301cf65ad$c95badd0$5c130970$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>

On 2 May 2014 07:55, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Heiko St=C3=BCbner wrote:
>>
>> Hi Sachin,
>>
>> Am Donnerstag, 1. Mai 2014, 16:14:44 schrieb Sachin Kamat:
>> > Instead of hardcoding the SYSRAM details for each SoC,
>> > pass this information through device tree (DT) and make
>> > the code SoC agnostic. Generic SRAM bindings are used
>> > for achieving this.
>> >
>> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> > Cc: Heiko Stuebner <heiko@sntech.de>
>> > Cc: Arnd Bergmann <arnd@arndb.de>
>>
>> very cool :-).
>>
>> I've found one little thing I do not understand, which I describe be=
low.
>> Otherwise
>> Acked-by: Heiko Stuebner <heiko@sntech.de>
>>
>> > ---
>> > This patch is based on linux next (next-20140501) on top of
>> > my Kconfig consolidation patch
>> > http://comments.gmane.org/gmane.linux.kernel.samsung-soc/28642
>> >
>> > Tested on 4210/4412 Origen, 5250/5420 Arndale and SMDK5420 boards.
>> > ---
>> >  arch/arm/Kconfig                                |    1 +
>> >  arch/arm/boot/dts/exynos4210-universal_c210.dts |   17 ++++++
>> >  arch/arm/boot/dts/exynos4210.dtsi               |   18 +++++++
>> >  arch/arm/boot/dts/exynos4x12.dtsi               |   18 +++++++
>> >  arch/arm/boot/dts/exynos5250.dtsi               |   18 +++++++
>> >  arch/arm/boot/dts/exynos5420.dtsi               |   18 +++++++
>> >  arch/arm/mach-exynos/common.h                   |    1 +
>> >  arch/arm/mach-exynos/exynos.c                   |   64
>> > ----------------------- arch/arm/mach-exynos/firmware.c
> |
>> >  5 +-
>> >  arch/arm/mach-exynos/include/mach/map.h         |    7 ---
>> >  arch/arm/mach-exynos/platsmp.c                  |   39 ++++++++++=
+++-
>> >  11 files changed, 133 insertions(+), 73 deletions(-)
>> >
>> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> > index a6aaaad19b1a..f66ea9453df9 100644
>> > --- a/arch/arm/Kconfig
>> > +++ b/arch/arm/Kconfig
>> > @@ -855,6 +855,7 @@ config ARCH_EXYNOS
>> >     select S5P_DEV_MFC
>> >     select SAMSUNG_DMADEV
>> >     select SPARSE_IRQ
>> > +   select SRAM
>> >     select USE_OF
>> >     help
>> >       Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
>> > diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> > b/arch/arm/boot/dts/exynos4210-universal_c210.dts index
>> > 63e34b24b04f..8d4de5c0d0c7 100644
>> > --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> > +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> > @@ -28,6 +28,23 @@
>> >             bootargs =3D "console=3DttySAC2,115200N8 root=3D/dev/m=
mcblk0p5 rw
>> rootwait
>> > earlyprintk panic=3D5 maxcpus=3D1"; };
>> >
>> > +   sram@02020000 {
>> > +           status =3D "disabled";
>> > +   };
>> > +
>> > +   sram@02025000 {
>> > +           compatible =3D "mmio-sram";
>> > +           reg =3D <0x02025000 0x1000>;
>> > +           #address-cells =3D <1>;
>> > +           #size-cells =3D <1>;
>> > +           ranges =3D <0 0x02025000 0x1000>;
>> > +
>> > +           smp-sram@0 {
>> > +                   compatible =3D "samsung,exynos4210-sram";
>> > +                   reg =3D <0x0 0x1000>;
>> > +           };
>> > +   };
>>
>> exynos_smp_prepare_sram returns -ENODEV if it can't find
>> samsung,exynos4210-sram-ns, so are you sure your universal_c210 will=
 run
>> without it? I didn't dig to deep into this, so it can also simply be
>> something
>> I overlooked :-)
>>
> Hi Andrzej and Tomasz,
>
> Can you please check above?

Please test v2 of this series.

--=20
With warm regards,
Sachin
