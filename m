From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: ARM: s3c2410: remove dead mach-s3c2410 directory
Date: Tue, 17 Jul 2012 09:01:16 +0900
Message-ID: <144301cd63af$49c53520$dd4f9f60$%kim@samsung.com>
References: <1340619112.1773.155.camel@x61.thuisdomein>
 <201206251806.28081.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <201206251806.28081.heiko@sntech.de>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, 'Paul Bolle' <pebolle@tiscali.nl>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
> Am Montag 25 Juni 2012, 12:11:52 schrieb Paul Bolle:
> > Commit 85fd6d63bf2927b9da7ab1b0d46723bfdb13808c ("ARM: S3C2410: mov=
e
> > mach-s3c2410/* into mach-s3c24xx/") orphaned
> > arch/arm/mach-s3c2410/Kconfig: currently no other Kconfig file sour=
ces
> > that file. This means that the Kconfig symbols S3C2410_CPUFREQ and
> > S3C2410_PLLTABLE will never be set, which in turns means that the m=
acros
> > CONFIG_S3C2410_CPUFREQ and CONFIG_S3C2410_PLLTABLE will never be
> > defined.
> >
> > All this makes that all four files in the mach-directory (Kconfig,
> > Makefile, cpu-freq.c, and pll.c) are effectively dead files since v=
3.4:
> > none of them can lead to any code in someones kernel. This director=
y can
> > safely be removed.
>=20
> I don't think so. CPU-frequency-scaling on the earlier S3C architectu=
res
> was
> probably working before the beginning of the directory merge.
>=20
Yeah, maybe. But I think, sourcing mach-s3c2410/Kconfig is enough to fi=
x working s3c24xx cpufreq.

> If I recall correctly Kgene was working on completing these missing p=
ieces
> of
> the move to mach-s3c24xx.
>=20
Yes, Heiko's memory is correct. But mainly my colleague is working it i=
nstead and I'm just helping him. As I know he needs more time probably =
it's not possible for upcoming merge window but next time, it's ok.

> The reason for noone complaining about the missing cpufreq support ye=
t,
> might
> be that projects using the early S3C architectures hae not made it to=
 the
> most
> recent kernel releases.
>=20
Yeah, maybe. Anyway we should fix it as soon as possible...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
