From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 2/5] ARM: dts: Prepare exynos5410-odroidxu device tree
Date: Tue, 02 Jun 2015 21:43:16 +0900
Message-ID: <556DA4E4.1060303@samsung.com>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>	<1426456834-6308-3-git-send-email-afaerber@suse.de> <CABxcv==cnFQ75qaykfkOcFo8FNqkzVswu8iYOB3riZJT9=4U_Q@mail.gmail.com> <5506B02D.3000400@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:35675 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752948AbbFBMnX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 08:43:23 -0400
In-Reply-To: <5506B02D.3000400@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Javier Martinez Canillas <javier@dowhile0.org>
Cc: Humberto Naves <hsnaves@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Tomasz Figa <tomasz.figa@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?B?6rmA7ZWZ7KO8?= <ruppi.kim@hardkernel.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

W dniu 16.03.2015 o 19:27, Andreas F=C3=A4rber pisze:
> Hi Javier,
>=20
> Am 16.03.2015 um 08:56 schrieb Javier Martinez Canillas:
>> On Sun, Mar 15, 2015 at 11:00 PM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>>> Derived from exynos5410-smdk5410.dts.
>>>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>>  v1 -> v2 -> v3: Unchanged
>=20
> Forgot to update the in-patch changelogs: v4 is unchanged as well
>=20
>>>
>>>  arch/arm/boot/dts/Makefile                |  1 +
>>>  arch/arm/boot/dts/exynos5410-odroidxu.dts | 78 +++++++++++++++++++=
++++++++++++
>>>  2 files changed, 79 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/exynos5410-odroidxu.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefil=
e
>>> index a1c776b8dcec..b040737edcbc 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_EXYNOS5) +=3D \
>>>         exynos5250-snow.dtb \
>>>         exynos5250-spring.dtb \
>>>         exynos5260-xyref5260.dtb \
>>> +       exynos5410-odroidxu.dtb \
>>>         exynos5410-smdk5410.dtb \
>>>         exynos5420-arndale-octa.dtb \
>>>         exynos5420-peach-pit.dtb \
>>> diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/b=
oot/dts/exynos5410-odroidxu.dts
>>> new file mode 100644
>>> index 000000000000..97310bb727e2
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
>>> @@ -0,0 +1,78 @@
>>> +/*
>>> + * Hardkernel ODROID-XU device tree source
>>> + *
>>> + * Copyright (c) 2014 SUSE LINUX Products GmbH
>>> + *
>>> + * Based on exynos5410-smdk5410.dts:
>>> + *
>>> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
>>> + *             http://www.samsung.com
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License version 2 =
as
>>> + * published by the Free Software Foundation.
>>> +*/
>>> +
>>> +/dts-v1/;
>>> +#include "exynos5410.dtsi"
>>> +/ {
>>> +       model =3D "ODROID-XU based on EXYNOS5410";
>>> +       compatible =3D "hardkernel,odroid-xu", "samsung,exynos5410"=
, "samsung,exynos5";
>>> +
>>> +       memory {
>>> +               reg =3D <0x40000000 0x80000000>;
>>> +       };
>>> +
>>> +       chosen {
>>> +               bootargs =3D "console=3DttySAC2,115200";
>>> +       };
>>> +
>>
>> After commit a208ffd251d0 ("of: Enable console on serial ports
>> specified by /chosen/stdout-path") the kernel is able to know what
>> serial console to use if the DT defined an stdout-path property so
>> should be preferred instead of using a console=3D parameter.
>>
>> I'll post today a series to change that on all exynos5 boards so you
>> can base on that.
>=20
> Okay, if no one else does, I could update smdk5410 before splitting.

Could you do this? At least for new board if you cannot test it on SMDK=
5410.

>=20
>>> +       fin_pll: xxti {
>>> +               compatible =3D "fixed-clock";
>>> +               clock-frequency =3D <24000000>;
>>> +               clock-output-names =3D "fin_pll";
>>> +               #clock-cells =3D <0>;
>>> +       };
>>> +
>>
>> I think this should be defined in exynos5410.dtsi instead since is a=
n
>> IP block in the SoC and referenced in the .dts using a label to chan=
ge
>> the clock-frequency in the board.
>=20
> I hope you understood that this is a literal copy of smdk5410, so I'm
> not going to make random changes here. If the Samsung guys want to ma=
ke
> this change for smdk5410, then fine, but otherwise - like for Snow an=
d
> Spring - I want to keep the diff -u low between the two.

Moving the node to DTSI won't change the DTB for boards so the change i=
s
safe. However to me it looks unusual that exynos5410.dtsi references
fin_pll phandle which is defined in the board.

However Kukjin mentioned that it is fine so it is okay with me also.

The rest looks fine, so:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
