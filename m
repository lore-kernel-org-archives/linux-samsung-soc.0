From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/4] S3C2443: Move i2s clock definitions to common code
Date: Tue, 23 Aug 2011 22:28:49 +0200
Message-ID: <201108232228.49647.heiko@sntech.de>
References: <201108201757.56483.heiko@sntech.de> <201108211925.05300.heiko@sntech.de> <06c001cc6146$b9f30be0$2dd923a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:49650 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752130Ab1HWU25 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 16:28:57 -0400
In-Reply-To: <06c001cc6146$b9f30be0$2dd923a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Dienstag 23 August 2011, 05:42:47 schrieb Kukjin Kim:
> Heiko St=FCbner wrote:
> > Am Sonntag 21 August 2011, 19:13:32 schrieb Russell King - ARM Linu=
x:
> > > On Sat, Aug 20, 2011 at 06:01:29PM +0200, Heiko St=FCbner wrote:
> > > > +/* i2s-ref
> > > > + *
> > > > + * i2s bus reference clock, selectable from external, esysclk =
or
>=20
> epllref
>=20
> > > > + *
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
>=20
> time)
>=20
> > and it didn't report anything.
>=20
> Hmm...as a note, happened following with checkpatch.pl :(
>=20
> ERROR: need consistent spacing around '*' (ctx:WxV)
> #35: FILE: arch/arm/mach-s3c2416/clock.c:57:
> +               .sources =3D (struct clk *[]) {
>                                        ^
>=20
> total: 1 errors, 0 warnings, 38 lines checked
>=20
> PATCH 34 S3C2416 Add HSSPI clock sourced from EPLL.txt has style prob=
lems,
> please review.
will do.

Today I also saw, that my definition of the hsspi pclk would have cause=
d a=20
conflict with the hsspi sclk definition of s3c2443.

So, as nobody uses the s3c2443's hsspi controller yet, I would also ren=
ame it=20
to hsspi-if with the next patch iteration.


Heiko
