From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Fri, 01 Aug 2014 01:26:34 +0200
Message-ID: <53DAD0AA.7040105@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com> <53DA9709.10602@suse.de> <53DA9BA9.60808@gmail.com> <53DACE73.8080009@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DACE73.8080009-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan van Schaik <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 01.08.2014 01:17, Andreas F=C3=A4rber wrote:
> Am 31.07.2014 21:40, schrieb Tomasz Figa:
>> On 31.07.2014 21:20, Andreas F=C3=A4rber wrote:
>>> Am 31.07.2014 21:05, schrieb Tomasz Figa:
>>>> On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
[snip]
>>>>> +&dp_hpd {
>>>>> +	samsung,pins =3D "gpc3-0";
>>>>> +	samsung,pin-function =3D <0>;
>>>>> +	samsung,pin-pud =3D <3>;
>>>>> +	samsung,pin-drv =3D <0>;
>>>>> +};
>>>>
>>>> Hmm, what node is this referencing? I believe this should rather
>>>> reference the pin controller and add a new board-specific pinconf/=
pinmux
>>>> group instead....
>>>
>>> It's a -pinctrl node. See v3->v4 change log and discussion on v3.
>>>
>>
>> Well, this is clearly a board specific node anyway, because it does =
not
>> refer to a special function, but simply an input/interrupt GPIO. If =
it
>> somehow has landed in generic pinctrl dtsi then it should be removed
>> from there and this patch should simply introduce its own instance o=
f
>> dp_hpd node, so you did the right thing in v3.
>=20
> Well, my point was that the 3.8 tree contains only one dp-hpd node, n=
ot
> two as we would get by adding a new node here.
>=20
> Apart from Spring, it's used in Snow and SMDK5250, so moving it there
> seems feasible and the cleanest solution to me.
>=20

What I mean is that in exynos5250-pinctrl.dtsi only generic SoC pin
groups should be defined and those more or less correspond to groups
with samsung,pin-function set to something other than 0 (input) or 1
(output). Now here hpd_gpio is just a normal GPIO input used as
interrupt source to detect when a cable is plugged or unplugged. This i=
s
by no means generic to the SoC, because any GPIO with interrupt
capability can be used for this purpose. This means that the whole
pin{conf,mux} group should be defined on board level.

Best regards,
Tomasz

>>>> [snip]
>>>>
>>>>> +/*
>>>>> + * Disabled pullups since external part has its own pullups and
>>>>> + * double-pulling gets us out of spec in some cases.
>>>>> + */
>>>>> +&i2c2_bus {
>>>>> +	samsung,pin-pud =3D <0>;
>>>>> +};
>>>>
>>>> OK, here overriding a generic pinconf group is justified and nicel=
y
>>>> explained by a comment.
>>>
>>> You seem to assume that I actually understand these things. ;)
>>> Just copied from -cros-common/-snow.
>>>
>>
>> It is good if those things are being done with some level of
>> understanding. The DT mechanics are quite well documented in
>> Documentation/devicetree/bindings, while for HW-specific bits I beli=
eve
>> Chromium guys could give you a hand.
>=20
> I did read and even fix documentation for those bindings that I added
> myself in Spring, just not for those that were already in common code=
,
> like this one here.

My intention was that if there is something not clear, rather than
blindly copy-pasting it, it might be worth to ask people that might
know. Although any issues should generally be found at review stage, so
I don't really have any objections, assuming that Chromium people assur=
e
that this patch adds valid data indeed.

>=20
> A tps65090 patch has been ignored since being asked to extend the com=
mit
> message, v3 was recently sent. Help getting that in appreciated.

Will take a look if time allows. Thanks for your work on this.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
