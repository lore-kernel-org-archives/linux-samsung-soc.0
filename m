From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 2/5] ARM: dts: Prepare exynos5410-odroidxu device tree
Date: Mon, 16 Mar 2015 11:27:57 +0100
Message-ID: <5506B02D.3000400@suse.de>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>	<1426456834-6308-3-git-send-email-afaerber@suse.de> <CABxcv==cnFQ75qaykfkOcFo8FNqkzVswu8iYOB3riZJT9=4U_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53375 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750736AbbCPK2B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 06:28:01 -0400
In-Reply-To: <CABxcv==cnFQ75qaykfkOcFo8FNqkzVswu8iYOB3riZJT9=4U_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Javier,

Am 16.03.2015 um 08:56 schrieb Javier Martinez Canillas:
> On Sun, Mar 15, 2015 at 11:00 PM, Andreas F=C3=A4rber <afaerber@suse.=
de> wrote:
>> Derived from exynos5410-smdk5410.dts.
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> ---
>>  v1 -> v2 -> v3: Unchanged

=46orgot to update the in-patch changelogs: v4 is unchanged as well

>>
>>  arch/arm/boot/dts/Makefile                |  1 +
>>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 78 ++++++++++++++++++++=
+++++++++++
>>  2 files changed, 79 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/exynos5410-odroidxu.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index a1c776b8dcec..b040737edcbc 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_EXYNOS5) +=3D \
>>         exynos5250-snow.dtb \
>>         exynos5250-spring.dtb \
>>         exynos5260-xyref5260.dtb \
>> +       exynos5410-odroidxu.dtb \
>>         exynos5410-smdk5410.dtb \
>>         exynos5420-arndale-octa.dtb \
>>         exynos5420-peach-pit.dtb \
>> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/bo=
ot/dts/exynos5410-odroidxu.dts
>> new file mode 100644
>> index 000000000000..97310bb727e2
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
>> @@ -0,0 +1,78 @@
>> +/*
>> + * Hardkernel ODROID-XU device tree source
>> + *
>> + * Copyright (c) 2014 SUSE LINUX Products GmbH
>> + *
>> + * Based on exynos5410-smdk5410.dts:
>> + *
>> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
>> + *             http://www.samsung.com
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +/dts-v1/;
>> +#include "exynos5410.dtsi"
>> +/ {
>> +       model =3D "ODROID-XU based on EXYNOS5410";
>> +       compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410",=
 "samsung,exynos5";
>> +
>> +       memory {
>> +               reg =3D <0x40000000 0x80000000>;
>> +       };
>> +
>> +       chosen {
>> +               bootargs =3D "console=3DttySAC2,115200";
>> +       };
>> +
>=20
> After commit a208ffd251d0 ("of: Enable console on serial ports
> specified by /chosen/stdout-path") the kernel is able to know what
> serial console to use if the DT defined an stdout-path property so
> should be preferred instead of using a console=3D parameter.
>=20
> I'll post today a series to change that on all exynos5 boards so you
> can base on that.

Okay, if no one else does, I could update smdk5410 before splitting.

>> +       fin_pll: xxti {
>> +               compatible =3D "fixed-clock";
>> +               clock-frequency =3D <24000000>;
>> +               clock-output-names =3D "fin_pll";
>> +               #clock-cells =3D <0>;
>> +       };
>> +
>=20
> I think this should be defined in exynos5410.dtsi instead since is an
> IP block in the SoC and referenced in the .dts using a label to chang=
e
> the clock-frequency in the board.

I hope you understood that this is a literal copy of smdk5410, so I'm
not going to make random changes here. If the Samsung guys want to make
this change for smdk5410, then fine, but otherwise - like for Snow and
Spring - I want to keep the diff -u low between the two.

>> +       firmware@02037000 {
>> +               compatible =3D "samsung,secure-firmware";
>> +               reg =3D <0x02037000 0x1000>;
>> +       };
>> +
>> +};
>> +
>> +&mmc_0 {
>> +       status =3D "okay";
>> +       num-slots =3D <1>;
>> +       cap-mmc-highspeed;
>> +       broken-cd;
>> +       card-detect-delay =3D <200>;
>> +       samsung,dw-mshc-ciu-div =3D <3>;
>> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
>> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
>> +       bus-width =3D <8>;
>> +};
>> +
>> +&mmc_2 {
>> +       status =3D "okay";
>> +       num-slots =3D <1>;
>> +       cap-sd-highspeed;
>> +       card-detect-delay =3D <200>;
>> +       samsung,dw-mshc-ciu-div =3D <3>;
>> +       samsung,dw-mshc-sdr-timing =3D <2 3>;
>> +       samsung,dw-mshc-ddr-timing =3D <1 2>;
>> +       bus-width =3D <4>;
>> +       disable-wp;
>> +};
>> +
>> +&uart0 {
>> +       status =3D "okay";
>> +};
>> +
>> +&uart1 {
>> +       status =3D "okay";
>> +};
>> +
>> +&uart2 {
>> +       status =3D "okay";
>> +};
>> --
>=20
> With those two changes:
>=20
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>

Thanks, first review after posting for the third time... ;)

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Jennifer Guild, Dilip Upmany=
u,
Graham Norton; HRB 21284 (AG N=C3=BCrnberg)
