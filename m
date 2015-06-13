From: Thomas-Karl Pietrowski <thopiekar@gmail.com>
Subject: Re: Feedback on hardware support for Odroid U3
Date: Sat, 13 Jun 2015 11:11:54 +0200
Message-ID: <16487700.5L20qaootX@home>
References: <CAE-5t2tKeYTjS_1qiQ4oAZS1g5yheA2G1g0CMHRaHdY3Z84NBw@mail.gmail.com> <557BC91C.10007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:35929 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbbFMJL7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Jun 2015 05:11:59 -0400
Received: by wigg3 with SMTP id g3so34253668wig.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2015 02:11:58 -0700 (PDT)
In-Reply-To: <557BC91C.10007@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

Am Samstag, 13. Juni 2015, 15:09:32 schrieb Krzysztof Kozlowski:
> W dniu 12.06.2015 o 22:53, Thomas Pietrowski pisze:
> > Hello again,
> >=20
> > first after fixing my booting problems I now get different warnings=
 after
> > boot. - config: http://pastebin.com/MHUu51pF
> > - log: http://pastebin.com/9YMgMmFL
> > - repo: arm-soc
> > I read the last days that you are still working on the clk drivers,=
 so
> > as these warnings appear to be related to that you might be interes=
ted
> > on them.
>=20
> You mean the warnings on clocks (starting from runtime PM and FIMC)? =
I
> hit them also on Trats2. Just need to find a person (or time) who wil=
l
> fix it...
>
Ok then. I just don't remember that I had them when using 3.19.x code b=
y=20
Tobias Jakobi before. I'll test his latest code later. The reason I wan=
ted to=20
use code from arm-soc is that I thought his changes/patches are already=
 here=20
after two linux releases. However, in the past the CPU fan wasn't worki=
ng at=20
all (0 RPM) and /sys/class/thermal/[...]/temp reported more than 70=B0C=
 (was=20
compiling a newer kernel code at this moment). Don't believe it was hea=
lthy.

> > Additionally my CPU fan it running at full RPM all the time. I chec=
ked
> > the temperature just to be sure and it says it's 20=B0C. Is this pr=
oblem
> > known or can I help debugging it?
>=20
> After quick look at DTS, I think that on Exynos4412 Odroid family the=
re
> is no fan defined. No fan so cooling is done only through CPU
> frequencies. The fan probably works on default setting from bootloade=
r
> or default register values.
>=20
Just something at this point which comes to my mind. Imagine we have th=
e fan=20
regulation/driver working. What happens when we simply disconnect the f=
an and=20
the CPU hits higher temperatures? Will it still work on high frequencie=
s or=20
will it self-protect by using lower CPU frequencies?
CPU throttling and CPU cooling should be two seperate processes, isn't =
it?

> The stock Odroid U3 has only passive cooler.
>=20
That's true, but they (hardkernel) also sell a optional fan and the soc=
ket for=20
is is still there when buying the board.
See,=20
http://www.hardkernel.com/main/products/prdt_info.php?g_code=3DG1387603=
58261 for=20
the optional fan.
Therefore, it is not a hardware hack or whatever.

> Probably support for fan could be added... If you would like to take
> care of it, go for it! :)
>=20
I just browsed Tobias Jakobi's "linux-odroid" repository at github and =
found=20
out, that work is already made on that by people at Samsung :)
https://github.com/tobiasjakobi/linux-odroid/commit/a2236c8f74321357e50=
5be0a054032325a7e3a5d
Hopefully both are also in this mailing list and interested in getting =
this=20
upstream. In the mean time I'll test it based on tobiasjakobi's codebas=
e=20
again.

Regards,
Thomas
