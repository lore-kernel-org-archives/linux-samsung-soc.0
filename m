From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/4] S3C2443: Move i2s clock definitions to common code
Date: Sun, 21 Aug 2011 23:11:55 +0200
Message-ID: <201108212311.56046.heiko@sntech.de>
References: <201108201757.56483.heiko@sntech.de> <201108211925.05300.heiko@sntech.de> <201108212226.16669.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:46276 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752419Ab1HUVMG convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 17:12:06 -0400
In-Reply-To: <201108212226.16669.marek.vasut@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>

Am Sonntag 21 August 2011, 22:26:16 schrieb Marek Vasut:
> On Sunday, August 21, 2011 07:25:04 PM Heiko St=FCbner wrote:
> > Am Sonntag 21 August 2011, 19:13:32 schrieb Russell King - ARM Linu=
x:
> > > On Sat, Aug 20, 2011 at 06:01:29PM +0200, Heiko St=FCbner wrote:
> > > > +/* i2s-ref
> > > > + *
> > > > + * i2s bus reference clock, selectable from external, esysclk =
or
> > > > epllref + *
> > > > + * Note, this used to be two clocks, but was compressed into o=
ne.
> > > > +*/
> > > > +
> > > > +struct clk *clk_i2s_srclist[] =3D {
> > > > +	[0] =3D &clk_i2s_eplldiv.clk,
> > > > +	[1] =3D &clk_i2s_ext,
> > > > +	[2] =3D &clk_epllref.clk,
> > > > +	[3] =3D &clk_epllref.clk,
> > > > +};
> > >=20
> > > Is there any reason not to make this static (have you run your pa=
tch
> > > through checkpatch.pl ?)
> >=20
> > Yep I did run all of them through checkpatch (after beeing scolded =
last
> > time) and it didn't report anything.
> >=20
> > But for this move of code I simply grabbed the code fragments and p=
ut
> > them into their new location (i.e. it was this way in
> > mach-s3c2443/clock.c) and should have probably taken a closer look =
at
> > what I'm moving.
> >=20
> > So it seems you are right, it should probably be static as everythi=
ng
> > else is also static.
>=20
> And you don't really understand why everything else is static, right =
? ;-)
yep :-) - until now

But a quick lookup did help [lifetime of the variable extends across th=
e=20
entire run of the program, i.e. a global variable and local to the sour=
ce file=20
it's defined in].=20

> (don't take it as an offense)
none taken ... in fact it was a welcome push to reread variable storage=
=20
classes and lifetime again [last time was some years ago] :-).

Heiko
