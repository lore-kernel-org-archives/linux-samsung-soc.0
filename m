From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: enable pwm backlight on exynos5250-snow
Date: Thu, 08 May 2014 18:08:36 +0200
Message-ID: <536BAC04.4000203@samsung.com>
References: <1399467371-12242-1-git-send-email-ajaykumar.rs@samsung.com>
 <536A98E7.9030007@gmail.com>
 <CAEC9eQPeGSw0xEdmq2GkVVhC7cTGSEvkM_CHRxTw__aFrvzvbw@mail.gmail.com>
 <536A9C82.6090704@gmail.com> <536BA90A.60406@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38562 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755044AbaEHQIk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 12:08:40 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5900DAXJIEWG40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 May 2014 17:08:38 +0100 (BST)
In-reply-to: <536BA90A.60406@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Tomasz Figa <tomasz.figa@gmail.com>, Ajay kumar <ajaynumb@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olof@lixom.net>

On 08.05.2014 17:55, Andreas F=C3=A4rber wrote:
> Hi,
>=20
> Am 07.05.2014 22:50, schrieb Tomasz Figa:
>> On 07.05.2014 22:47, Ajay kumar wrote:
>>> On Thu, May 8, 2014 at 2:04 AM, Tomasz Figa <tomasz.figa@gmail.com>
>>> wrote:
>>>> On 07.05.2014 14:56, Ajay Kumar wrote:
>>>>>
>>>>> Add PWM backlight node for exynos5250 and enable the same on exyn=
os5250
>>>>> based snow board.
>>>>>
>>>>> Signed-off-by: Olof Johansson <olof@lixom.net>
>>>>> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
>>>>> ---
>>>>>    arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
>>>>>    arch/arm/boot/dts/exynos5250-snow.dts     |    5 +++++
>>>>>    arch/arm/boot/dts/exynos5250.dtsi         |   10 ++++++++++
>>>>>    3 files changed, 22 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>>> b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>>> index 9a49e68..2a4680c 100644
>>>>> --- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>>> +++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
>>>>> @@ -351,6 +351,13 @@
>>>>>                          samsung,pin-drv =3D <0>;
>>>>>                  };
>>>>>
>>>>> +               backlight_pwm: backlight-pwm {
>>>>> +                       samsung,pins =3D "gpb2-0";
>>>>> +                       samsung,pin-function =3D <2>;
>>>>> +                       samsung,pin-pud =3D <0>;
>>>>> +                       samsung,pin-drv =3D <0>;
>>>>> +               };
>>>>
>>>>
>>>> This looks like a generic PWM output function, not specific to
>>>> backlight in
>>>> any way.
>>>>
>>>> Please see patch [1] adding PWM output pin groups for Exynos5420 f=
or
>>>> reference.
>>>>
>>>> [1]
>>>> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg=
29869.html
>>>>
>>> Right! I just referred to the manual again, and it actually reads T=
OUT_0.
>>> So, I should be probably renaming this as "pwm0_out" like in the ot=
her
>>> patch?
>>
>> Yes, please. You should also add remaining ones, while at it. Basica=
lly
>> same patch as [1] but for Exynos5250.
>=20
> Don't we also need patches to exynos_defconfig? linux.git only has
> CONFIG_S3C24XX_PWM=3Dy but for snow I've seen github.com/linux-exynos=
 add:
> CONFIG_PWM=3Dy
> CONFIG_PWM_SAMSUNG=3Dy
> CONFIG_BACKLIGHT_PWM=3Dy

Right. The current exynos_defconfig lacks many other options as well.
But this should be fixed by separate patch. Feel free to send a patch t=
o
enable what you need on your hardware.

Best regards,
Tomasz
