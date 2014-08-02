From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Sat, 02 Aug 2014 09:49:53 +0200
Message-ID: <53DC9821.3010108@suse.de>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de>	<1406822910-6255-5-git-send-email-afaerber@suse.de>	<53DA936E.9060004@gmail.com>	<53DA9709.10602@suse.de>	<53DA9BA9.60808@gmail.com> <CAD=FV=XVM4FUMxjindZGXku5DZ1MkTWq=Smmt_Fs7=_i4MBFKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36074 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751099AbaHBHuB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 03:50:01 -0400
In-Reply-To: <CAD=FV=XVM4FUMxjindZGXku5DZ1MkTWq=Smmt_Fs7=_i4MBFKw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>

Am 02.08.2014 07:15, schrieb Doug Anderson:
> On Thu, Jul 31, 2014 at 12:40 PM, Tomasz Figa <tomasz.figa@gmail.com>=
 wrote:
>> On 31.07.2014 21:20, Andreas F=C3=A4rber wrote:
>>> Am 31.07.2014 21:05, schrieb Tomasz Figa:
>>>> On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
>>>>> +&sd1_clk {
>>>>> +   samsung,pin-drv =3D <0>;
>>>>> +};
>>>>> +
>>>>> +&sd1_cmd {
>>>>> +   samsung,pin-pud =3D <3>;
>>>>> +   samsung,pin-drv =3D <0>;
>>>>> +};
>>>>> +
>>>>> +&sd1_cd {
>>>>> +   samsung,pin-drv =3D <0>;
>>>>> +};
>>>>> +
>>>>> +&sd1_bus4 {
>>>>> +   samsung,pin-drv =3D <0>;
>>>>> +};
>>>>
>>>> Here generic settings are being overridden, so it might be a good =
idea
>>>> to explain why, like with i2c pull-up above.
>>>
>>> Snow does not have an explanation either, so please suggest what co=
mment
>>> you'd like to see. Consider me just a user with no specs. :)
>>
>> Doug, Vincent, someone else?
>=20
> The comment is just in a different place--it's in the dw_mmc node.
> Probably belongs here, though:
>=20
>                 /*
>                  * Wifi is a SiP, so can keep drive strengths low
>                  * to reduce EMI.
>                  */
>=20

I did copy such a comment for the MMC node in v5, still present in v6.

Andreas

> I guess the cmd line isn't documented.  There is no external pull on
> the command line and on most boards there is one.  Our hardware guys
> thought we didn't need it and apparently we don't...

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
