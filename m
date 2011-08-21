From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/4] S3C2443: Move i2s clock definitions to common code
Date: Sun, 21 Aug 2011 19:25:04 +0200
Message-ID: <201108211925.05300.heiko@sntech.de>
References: <201108201757.56483.heiko@sntech.de> <201108201801.29541.heiko@sntech.de> <20110821171332.GF28546@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:55637 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752092Ab1HURZP convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 13:25:15 -0400
In-Reply-To: <20110821171332.GF28546@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Sonntag 21 August 2011, 19:13:32 schrieb Russell King - ARM Linux:
> On Sat, Aug 20, 2011 at 06:01:29PM +0200, Heiko St=FCbner wrote:
> > +/* i2s-ref
> > + *
> > + * i2s bus reference clock, selectable from external, esysclk or e=
pllref
> > + *
> > + * Note, this used to be two clocks, but was compressed into one.
> > +*/
> > +
> > +struct clk *clk_i2s_srclist[] =3D {
> > +	[0] =3D &clk_i2s_eplldiv.clk,
> > +	[1] =3D &clk_i2s_ext,
> > +	[2] =3D &clk_epllref.clk,
> > +	[3] =3D &clk_epllref.clk,
> > +};
>=20
> Is there any reason not to make this static (have you run your patch
> through checkpatch.pl ?)
Yep I did run all of them through checkpatch (after beeing scolded last=
 time)=20
and it didn't report anything.

But for this move of code I simply grabbed the code fragments and put t=
hem=20
into their new location (i.e. it was this way in mach-s3c2443/clock.c) =
and=20
should have probably taken a closer look at what I'm moving.

So it seems you are right, it should probably be static as everything e=
lse is=20
also static.

Heiko
