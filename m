From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Define stdout-path property for Spring
 board
Date: Wed, 18 Mar 2015 00:29:12 +0900
Message-ID: <55084848.1000207@kernel.org>
References: <1426501710-24177-1-git-send-email-javier.martinez@collabora.co.uk>	<1426501710-24177-4-git-send-email-javier.martinez@collabora.co.uk>	<5506B908.1060007@suse.de> <CABxcv=mmr-WWXY7-KUJe-3EP8FHRBzv-SabJma9VwGRPiHio3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:32977 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754179AbbCQP3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 11:29:17 -0400
In-Reply-To: <CABxcv=mmr-WWXY7-KUJe-3EP8FHRBzv-SabJma9VwGRPiHio3Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 03/16/15 20:28, Javier Martinez Canillas wrote:
> Hello Andreas,
>=20
Hi,

>>> index f02775487cd4..b9ec763a5602 100644
>>> --- a/arch/arm/boot/dts/exynos5250-spring.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
>>> @@ -25,6 +25,7 @@
>>>
>>>       chosen {
>>>               bootargs =3D "console=3Dtty1";
>>> +             stdout-path =3D "serial3:115200n8";
>>
>> Is this a guess or did you verify that against some schematics?
>>
>=20
> I don't have access to the Spring schematics but it is based on what
> is defined in the vendor u-boot for Spring [0].
>=20
> There isn't a Spring specific configuration file but only a
> chromeos_daisy.h which is shared by Snow, Spring and Kate (not yet in
> mainline):
>=20
> #define CONFIG_DIRECT_BOOTARGS \
> "console=3DttySAC3," STRINGIFY(CONFIG_BAUDRATE) " debug earlyprintk"
>=20
> So I assumed that all daisy-based Chromebooks use the same UART for d=
ebug.
>=20
>>>       };
>>>
>>>       gpio-keys {
>>
>> Assuming that bootargs still work,
>>
>=20
> Yes, the semantics are not changed. The std-out property is only used
> as a default if no console=3D parameter is passed so if you already a=
re
> passing one in your bootloader or using the one defined in the /chose=
n
> bootargs by enabling CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND, that
> will be used instead of std-out.
>=20
>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>
>> I do wonder why this mechanism could not point to the same location =
as
>> bootargs? ("dp-controller"?) The device does not even have screws fo=
r
>=20
> I did wonder the same indeed but I don't know if you can use a displa=
y
> as std-out or only works for serial consoles.
>=20
>> opening it, so accessing the serial port is highly theoretical.
>>
>=20
> I see, in that case I think we could just drop this patch if is not
> possible to have a serial console even with some soldering like is th=
e
> case in Snow, Peach Pit and Peach Pi.
>=20
I've applied this whole series so if you guys find any problem on this,
please let me know ;)

Thanks,
Kukjin
