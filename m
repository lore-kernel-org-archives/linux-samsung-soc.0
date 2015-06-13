From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: Re: Feedback on hardware support for Odroid U3
Date: Sat, 13 Jun 2015 18:58:02 +0900
Message-ID: <557BFEAA.1090802@gmail.com>
References: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com> <557BC91C.10007@gmail.com> <16487700.5L20qaootX@home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:34707 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751300AbbFMJ6G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Jun 2015 05:58:06 -0400
Received: by pacgb13 with SMTP id gb13so5705758pac.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2015 02:58:06 -0700 (PDT)
In-Reply-To: <16487700.5L20qaootX@home>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas-Karl Pietrowski <thopiekar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

W dniu 13.06.2015 o 18:11, Thomas-Karl Pietrowski pisze:
> Am Samstag, 13. Juni 2015, 15:09:32 schrieb Krzysztof Kozlowski:
>> W dniu 12.06.2015 o 22:53, Thomas Pietrowski pisze:
>>> Hello again,
>>>
>>> first after fixing my booting problems I now get different warnings=
 after
>>> boot. - config: http://pastebin.com/MHUu51pF
>>> - log: http://pastebin.com/9YMgMmFL
>>> - repo: arm-soc
>>> I read the last days that you are still working on the clk drivers,=
 so
>>> as these warnings appear to be related to that you might be interes=
ted
>>> on them.
>>
>> You mean the warnings on clocks (starting from runtime PM and FIMC)?=
 I
>> hit them also on Trats2. Just need to find a person (or time) who wi=
ll
>> fix it...
>>
> Ok then. I just don't remember that I had them when using 3.19.x code=
 by=20
> Tobias Jakobi before. I'll test his latest code later. The reason I w=
anted to=20
> use code from arm-soc is that I thought his changes/patches are alrea=
dy here=20
> after two linux releases. However, in the past the CPU fan wasn't wor=
king at=20
> all (0 RPM) and /sys/class/thermal/[...]/temp reported more than 70=B0=
C (was=20
> compiling a newer kernel code at this moment). Don't believe it was h=
ealthy.
>=20
>>> Additionally my CPU fan it running at full RPM all the time. I chec=
ked
>>> the temperature just to be sure and it says it's 20=B0C. Is this pr=
oblem
>>> known or can I help debugging it?
>>
>> After quick look at DTS, I think that on Exynos4412 Odroid family th=
ere
>> is no fan defined. No fan so cooling is done only through CPU
>> frequencies. The fan probably works on default setting from bootload=
er
>> or default register values.
>>
> Just something at this point which comes to my mind. Imagine we have =
the fan=20
> regulation/driver working. What happens when we simply disconnect the=
 fan and=20
> the CPU hits higher temperatures? Will it still work on high frequenc=
ies or=20
> will it self-protect by using lower CPU frequencies?

I do not know how the thermal/cooler driver works. I suppose it depends
whether cooling device (the pwm-fan) reports non-working fan. You shoul=
d
rather ask on linux-pm@vger.kernel.org mailing list. That is the place
for thermal framework.

> CPU throttling and CPU cooling should be two seperate processes, isn'=
t it?

Although cpu frequency driver is a separate thing but for cooling it
behaves like a cooling device. A fan can be a cooling device. CPU
frequency as well.

>=20
>> The stock Odroid U3 has only passive cooler.
>>
> That's true, but they (hardkernel) also sell a optional fan and the s=
ocket for=20
> is is still there when buying the board.
> See,=20
> http://www.hardkernel.com/main/products/prdt_info.php?g_code=3DG13876=
0358261 for=20
> the optional fan.
> Therefore, it is not a hardware hack or whatever.

Right.

>=20
>> Probably support for fan could be added... If you would like to take
>> care of it, go for it! :)
>>
> I just browsed Tobias Jakobi's "linux-odroid" repository at github an=
d found=20
> out, that work is already made on that by people at Samsung :)
> https://github.com/tobiasjakobi/linux-odroid/commit/a2236c8f74321357e=
505be0a054032325a7e3a5d
> Hopefully both are also in this mailing list and interested in gettin=
g this=20
> upstream. In the mean time I'll test it based on tobiasjakobi's codeb=
ase=20
> again.


I wonder why this is not in mainline... Or maybe it is?

Best regards,
Krzysztof
