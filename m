From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 02/20] clocksource: samsung_pwm_timer: Correct definition
 of AUTORELOAD bit
Date: Mon, 22 Jul 2013 23:28:10 +0200
Message-ID: <51EDA3EA.9020502@linaro.org>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <9612221.r4mx9bHE64@flatron> <51ED9C8C.10803@linaro.org> <1658534.7nG6RFjcTc@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:47186 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932897Ab3GVV2O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 17:28:14 -0400
Received: by mail-wi0-f174.google.com with SMTP id k10so2402471wiv.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 14:28:13 -0700 (PDT)
In-Reply-To: <1658534.7nG6RFjcTc@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/22/2013 11:11 PM, Tomasz Figa wrote:
> On Monday 22 of July 2013 22:56:44 Daniel Lezcano wrote:
>> On 07/22/2013 09:43 AM, Tomasz Figa wrote:
>>> On Monday 22 of July 2013 05:50:09 Daniel Lezcano wrote:
>>>> On 07/20/2013 02:04 AM, Tomasz Figa wrote:
>>>>> PWM channel 4 has its autoreload bit located at different positio=
n.
>>>>> This patch fixes the driver to account for that.
>>>>>
>>>>> This fixes a problem with the clocksource hanging after it overfl=
ows
>>>>> because it is not reloaded any more.
>>>>>
>>>>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>>>>> ---
>>>>>
>>>>>  drivers/clocksource/samsung_pwm_timer.c | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/clocksource/samsung_pwm_timer.c
>>>>> b/drivers/clocksource/samsung_pwm_timer.c index 3fa5b07..e238fb0
>>>>> 100644
>>>>> --- a/drivers/clocksource/samsung_pwm_timer.c
>>>>> +++ b/drivers/clocksource/samsung_pwm_timer.c
>>>>> @@ -47,7 +47,8 @@
>>>>>
>>>>>  #define TCON_START(chan)		(1 << (4 * (chan) + 0))
>>>>>  #define TCON_MANUALUPDATE(chan)		(1 << (4 * (chan) + 1))
>>>>>  #define TCON_INVERT(chan)		(1 << (4 * (chan) + 2))
>>>>>
>>>>> -#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) + 3))
>>>>> +#define TCON_AUTORELOAD(chan)		(1 << (4 * (chan) \
>>>>> +						+ (((chan) < 5) ? 3 : 2)))
>>>>
>>>> This macro is not readable. Please, fix it up with a comment pleas=
e.
>>>
>>> /*
>>>
>>>  * Channel 4 (logically 5 in TCON register) has different position
>>>  * of autoreload bit.
>>>  */
>>>
>>> #define _TCON_AUTORELOAD(chan)			(1 << (4 * (chan)=20
> + 3))
>>> #define _TCON_AUTORELOAD4(chan)			(1 << (4 * (chan)=20
> + 2))
>>> #define TCON_AUTORELOAD(chan)			((chan < 5) ?
>>>
>>> 		_TCON_AUTORELOAD(chan) : _TCON_AUTORELOAD4(chan))
>>>
>>> What do you think?
>>
>> I don't get the arithmetic here and the code is poor in comment. A n=
ice
>> comment would valuable here.
>=20
> Each channel occupies 4 bits in TCON register, but there is a gap of =
4=20
> bits after channel 0. In addition for channel 4 the location of autor=
eload=20
> bit in its set of bits is 2 as opposed to 3 for other channels. Here'=
s the=20
> layout of the register, for reference:
>=20
> Timer 4 Auto Reload on/off	[22]
> Timer 4 Manual Update		[21]
> Timer 4 Start/Stop		[20]
>=20
> Timer 3 Auto Reload on/off	[19]
> Reserved			[18]
> Timer 3 Manual Update		[17]
> Timer 3 Start/Stop		[16]
>=20
> Timer 2 Auto Reload on/off	[15]
> Reserved			[14]
> Timer 2 Manual Update		[13]
> Timer 2 Start/Stop		[12]
>=20
> Timer 1 Auto Reload on/off	[11]
> Timer 1 Output Inverter on/off	[10]
> Timer 1 Manual Update		[9]
> Timer 1 Start/Stop		[8]
>=20
> Reserved			[7:5]
> Dead zone enable/disable	[4]
>=20
> Timer 0 Auto Reload on/off	[3]
> Timer 0 Output Inverter on/off	[2]
> Timer 0 Manual Update		[1]
> Timer 0 Start/Stop		[0]

Ok, I understand now. Thanks for the clarification.

IMHO, the description you gave above (without layout) will fit well for
a comment :)

>> May be you can replace 1 << bla by BIT(bla) ?
>=20
> Yes, BIT() would be nice here, but IMHO this is material for separate=
=20
> patch as all the macros in this driver already use 1 << bla.

Yes, I agree.

Thanks
  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
