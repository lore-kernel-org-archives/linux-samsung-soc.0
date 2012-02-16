From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] cpufreq: Add S3C2416/S3C2450 cpufreq driver
Date: Thu, 16 Feb 2012 13:42:16 +0100
Message-ID: <201202161342.17657.heiko@sntech.de>
References: <201202161142.32485.heiko@sntech.de> <4F3CF1D9.5030109@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:38947 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828Ab2BPMmh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 07:42:37 -0500
In-Reply-To: <4F3CF1D9.5030109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Andrey Gusakov <dron0gus@gmail.com>

Hi Kgene,

Am Donnerstag, 16. Februar 2012, 13:08:57 schrieben Sie:
> On 02/16/12 19:42, Heiko St=FCbner wrote:
> > The S3C2416/S3C2450 SoCs support two sources for the armclk.
> >=20
> > The first source is the so called armdiv which divides the msysclk =
down
> > to provide necessary cpu rates. In this mode the core voltage must =
be
> > always at 1.3V. The frequency from the armdiv is not allowed to be
> > lower than the hclk frequency.
> >=20
> > In the second mode the armclk can be sourced directly from the hclk=
 in
> > the so called "dynamic voltags scaling" (dvs) mode. Here the armdiv
> > isn't used at all. Also in this mode the core voltage may be lowere=
d.
> > Existing hardware and tests with it suggest 1.0V as sufficient.
> >=20
> > When changing the clock source to the armdiv from the hclk, the SoC
> > shows stability issues if the new frequency is higher than the curr=
ent
> > hclk frequency. Hence the driver always forces the armdiv to the hc=
lk
> > frequency before the source change and lets the cpufreq issue anoth=
er
> > set_target call for higher frequencies.
> >=20
> > To mark the hclk frequency as lower as the corresponding armdiv
> > frequency it is set 1MHz below the real frequency. This lets the cp=
ufreq
> > framework change between 133MHz based on hclk and 133MHz based on a=
rmdiv
> > at will.
> >=20
> > Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> > Tested-by: Andrey Gusakov<dron0gus@gmail.com>
> > ---
> > changes since v1: correct the frequencies of the S3C2450 variant
> > changes since RFC: reboot-notifier to leave dvs mode on reboot
> > and a lot of cleanups
> >=20
> >   drivers/cpufreq/Kconfig.arm       |   22 ++
> >   drivers/cpufreq/Makefile          |    1 +
> >   drivers/cpufreq/s3c2416-cpufreq.c |  542
> >   +++++++++++++++++++++++++++++++++++++ 3 files changed, 565
> >   insertions(+), 0 deletions(-)
> >   create mode 100644 drivers/cpufreq/s3c2416-cpufreq.c
>=20
> As you know, I'm working on move cpufreq drivers of s3c2410, s3c2412 =
and
> s3c2440 into drivers/cpufreq/.
>=20
> Now I'm not sure some common function can be used for them and this a=
s
> well. But I think, if so, would be better to us.
>=20
> So please wait for some time to finish my working. Maybe next week?
>=20
> Then, let me back on this.

With most components there is a dividing line between the SoCs before a=
nd=20
after S3C2443.

On the SoCs before S3C2443 the fclk comes directly from the pll. Hence =
when=20
one wants to change its frequency the pll has to be reset and frequenci=
es of=20
the depending periphal clocks also have to be recalculated.

On SoCs starting from S3C2443 the msysclk (from the mpll) feeds a compl=
ete=20
separate divider (called armdiv) which supplies exclusivly the armclk. =
The=20
periphal clocks don't need to be touched normally.

Therefore the cpufreq functionality of S3C2416/S3C2443/S3C2450 is more =
in line=20
with the S3C64xx and shows no real commonalities with earlier S3C-SoCs,=
 as the=20
clock structure is vastly different and can also do with a much simpler=
 driver=20
than the earlier S3C SoCs.


Heiko
