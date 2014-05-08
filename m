From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: dts: enable pwm backlight on exynos5250-snow
Date: Thu, 08 May 2014 17:55:54 +0200
Message-ID: <536BA90A.60406@suse.de>
References: <1399467371-12242-1-git-send-email-ajaykumar.rs@samsung.com>	<536A98E7.9030007@gmail.com> <CAEC9eQPeGSw0xEdmq2GkVVhC7cTGSEvkM_CHRxTw__aFrvzvbw@mail.gmail.com> <536A9C82.6090704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58214 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751776AbaEHPz4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 11:55:56 -0400
In-Reply-To: <536A9C82.6090704@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olof@lixom.net>

Hi,

Am 07.05.2014 22:50, schrieb Tomasz Figa:
> On 07.05.2014 22:47, Ajay kumar wrote:
>> On Thu, May 8, 2014 at 2:04 AM, Tomasz Figa <tomasz.figa@gmail.com>
>> wrote:
>>> On 07.05.2014 14:56, Ajay Kumar wrote:
>>>>
>>>> Add PWM backlight node for exynos5250 and enable the same on exyno=
s5250
>>>> based snow board.
>>>>
>>>> Signed-off-by: Olof Johansson <olof@lixom.net>
>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>> ---
>>>>    arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
>>>>    arch/arm/boot/dts/exynos5250-snow.dts     |    5 +++++
>>>>    arch/arm/boot/dts/exynos5250.dtsi         |   10 ++++++++++
>>>>    3 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> index 9a49e68..2a4680c 100644
>>>> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>> @@ -351,6 +351,13 @@
>>>>                          samsung,pin-drv =3D <0>;
>>>>                  };
>>>>
>>>> +               backlight_pwm: backlight-pwm {
>>>> +                       samsung,pins =3D "gpb2-0";
>>>> +                       samsung,pin-function =3D <2>;
>>>> +                       samsung,pin-pud =3D <0>;
>>>> +                       samsung,pin-drv =3D <0>;
>>>> +               };
>>>
>>>
>>> This looks like a generic PWM output function, not specific to
>>> backlight in
>>> any way.
>>>
>>> Please see patch [1] adding PWM output pin groups for Exynos5420 fo=
r
>>> reference.
>>>
>>> [1]
>>> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg2=
9869.html
>>>
>> Right! I just referred to the manual again, and it actually reads TO=
UT_0.
>> So, I should be probably renaming this as "pwm0_out" like in the oth=
er
>> patch?
>=20
> Yes, please. You should also add remaining ones, while at it. Basical=
ly
> same patch as [1] but for Exynos5250.

Don't we also need patches to exynos_defconfig? linux.git only has
CONFIG_S3C24XX_PWM=3Dy but for snow I've seen github.com/linux-exynos a=
dd:
CONFIG_PWM=3Dy
CONFIG_PWM_SAMSUNG=3Dy
CONFIG_BACKLIGHT_PWM=3Dy

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
