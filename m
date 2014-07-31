From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Fri, 01 Aug 2014 01:31:18 +0200
Message-ID: <53DAD1C6.9070102@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com> <53DA9709.10602@suse.de> <53DA9BA9.60808@gmail.com> <53DACE73.8080009@suse.de> <53DAD0AA.7040105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43535 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750906AbaGaXbe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 19:31:34 -0400
In-Reply-To: <53DAD0AA.7040105@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>

Am 01.08.2014 01:26, schrieb Tomasz Figa:
> On 01.08.2014 01:17, Andreas F=C3=A4rber wrote:
>> Am 31.07.2014 21:40, schrieb Tomasz Figa:
>>> On 31.07.2014 21:20, Andreas F=C3=A4rber wrote:
>>>> Am 31.07.2014 21:05, schrieb Tomasz Figa:
>>>>> On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
> [snip]
>>>>>> +&dp_hpd {
>>>>>> +	samsung,pins =3D "gpc3-0";
>>>>>> +	samsung,pin-function =3D <0>;
>>>>>> +	samsung,pin-pud =3D <3>;
>>>>>> +	samsung,pin-drv =3D <0>;
>>>>>> +};
>>>>>
>>>>> Hmm, what node is this referencing? I believe this should rather
>>>>> reference the pin controller and add a new board-specific pinconf=
/pinmux
>>>>> group instead....
>>>>
>>>> It's a -pinctrl node. See v3->v4 change log and discussion on v3.
>>>>
>>>
>>> Well, this is clearly a board specific node anyway, because it does=
 not
>>> refer to a special function, but simply an input/interrupt GPIO. If=
 it
>>> somehow has landed in generic pinctrl dtsi then it should be remove=
d
>>> from there and this patch should simply introduce its own instance =
of
>>> dp_hpd node, so you did the right thing in v3.
>>
>> Well, my point was that the 3.8 tree contains only one dp-hpd node, =
not
>> two as we would get by adding a new node here.
>>
>> Apart from Spring, it's used in Snow and SMDK5250, so moving it ther=
e
>> seems feasible and the cleanest solution to me.
>>
>=20
> What I mean is that in exynos5250-pinctrl.dtsi only generic SoC pin
> groups should be defined and those more or less correspond to groups
> with samsung,pin-function set to something other than 0 (input) or 1
> (output). Now here hpd_gpio is just a normal GPIO input used as
> interrupt source to detect when a cable is plugged or unplugged. This=
 is
> by no means generic to the SoC, because any GPIO with interrupt
> capability can be used for this purpose. This means that the whole
> pin{conf,mux} group should be defined on board level.

Exactly what I meant! :)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
