From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Sat, 24 Nov 2012 13:32:03 +0100
Message-ID: <201211241332.04142.heiko@sntech.de>
References: <201211240116.44494.heiko@sntech.de> <50B08CEB.70308@mail.ru> <201211241224.50845.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39933 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751197Ab2KXMcL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 07:32:11 -0500
In-Reply-To: <201211241224.50845.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org

Am Samstag, 24. November 2012, 12:24:49 schrieb Heiko St=C3=BCbner:
> Am Samstag, 24. November 2012, 10:01:31 schrieb Alexander Varnin:
> > I've done it within another function, because otherwise users of ot=
her
> > chips would pay for a one more runtime check, which they don't need=
=2E On
> > the other hand, this function get called not so frequently, to make=
 it
> > valueable. The first version of my patch i've used internally worke=
d as
> > you said, so i can resend it.
>=20
> that would be cool, because as you said, this function isn't called t=
his
> often and adding another function here seems kinda counter-productive=
 to
> all the consolidation effort.
>=20
> Your could even do a
>=20
> #ifdef CONFIG_CPU_S3C2443
> if (samsung_cpu_id =3D=3D ...)
> 	the fix
> #endif

or alternatively introduce a soc_is_s3c2443 macro (plat-
samsung/include/plat/cpu.h) for the conditional, like the other Samsung=
 SoCs=20
have.

if (soc_is_s3c2443())
 	the fix

If done like the other SoCs, it would evaluate to 0, when CONFIG_CPU_S3=
C2443=20
is not set and otherwise check the cpu_id.


> so only people building multi-platform kernels will be affected.
>=20
> > I want to ask more experienced users of s3c2443. If this problem oc=
cures
> > on all s3c2443 chips, or only with some series of it? Maybe we need=
 some
> > more checks, not to break working cases.
>=20
> Finding other s3c2443 mainline-users seems kinda hard - you're the fi=
rst
> one I see :-) . In all the things I did to the s3c2416 I tried to pul=
l the
> s3c2443 along (blindly) most of the time, because both SoCs are so si=
milar
> [0]. And during all the changes no-one ever complained or spoke up.
>=20
>=20
> @Kgene do you have anybody near you, who can tell us if the problem o=
f the
> swapped EXTINT bits is common to all s3c2443 SoCs or how to identify
> affected ones?
>=20
>=20
> Heiko
>=20
> [0] for example, you should be able to use the s3c2416 cpufreq driver=
 also
> on the s3c2443, as the armdiv etc structure is the same.
>=20
> > 24.11.2012 04:16, Heiko St=C3=BCbner =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
> > >>> What does this do or what should it do? Also it gets calculated=
 but
> > >>> never used?
> > >>>=20
> > >>> And please use scripts/checkpatch.pl to verify your patch follo=
ws
> > >>> coding guidelines, as this block is especially hard to read.
> > >=20
> > > So essentially register-reads somehow returned transformed data, =
but
> > > the write is done according to the datasheet.
> > >=20
> > >=20
> > > It would definitely be better to integrate it into the existing
> > > _irqext_type function instead of introducing a second one.
> > >=20
> > > The cpu_id is present in the samsung_cpu_id var and the list of c=
pus
> > > including the s3c2443 can be found in common.c. With this it woul=
d be
> > > possible to identify when the irq code is run on a s3c2443 machin=
e and
> > > the original _irqext_type function could change the behaviour
> > > accordingly.
> > >=20
> > > Not sure if it would make sense to introduce soc_is_s3c2443() etc
> > > macros for this.
> > >=20
> > > And of course the actual block doing the transformation on read w=
ould
> > > need a more elaborate comment on the why and how, because in 3 ye=
ars
> > > someone might not directly see what this does and why it was nece=
ssary.
