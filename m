From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/4] S3C2443: Move i2s clock definitions to common code
Date: Sun, 21 Aug 2011 22:26:16 +0200
Message-ID: <201108212226.16669.marek.vasut@gmail.com>
References: <201108201757.56483.heiko@sntech.de> <20110821171332.GF28546@n2100.arm.linux.org.uk> <201108211925.05300.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:49663 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685Ab1HUU0V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Aug 2011 16:26:21 -0400
Received: by fxh19 with SMTP id 19so2910664fxh.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Aug 2011 13:26:20 -0700 (PDT)
In-Reply-To: <201108211925.05300.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>

On Sunday, August 21, 2011 07:25:04 PM Heiko St=FCbner wrote:
> Am Sonntag 21 August 2011, 19:13:32 schrieb Russell King - ARM Linux:
> > On Sat, Aug 20, 2011 at 06:01:29PM +0200, Heiko St=FCbner wrote:
> > > +/* i2s-ref
> > > + *
> > > + * i2s bus reference clock, selectable from external, esysclk or
> > > epllref + *
> > > + * Note, this used to be two clocks, but was compressed into one=
=2E
> > > +*/
> > > +
> > > +struct clk *clk_i2s_srclist[] =3D {
> > > +	[0] =3D &clk_i2s_eplldiv.clk,
> > > +	[1] =3D &clk_i2s_ext,
> > > +	[2] =3D &clk_epllref.clk,
> > > +	[3] =3D &clk_epllref.clk,
> > > +};
> >=20
> > Is there any reason not to make this static (have you run your patc=
h
> > through checkpatch.pl ?)
>=20
> Yep I did run all of them through checkpatch (after beeing scolded la=
st
> time) and it didn't report anything.
>=20
> But for this move of code I simply grabbed the code fragments and put=
 them
> into their new location (i.e. it was this way in mach-s3c2443/clock.c=
) and
> should have probably taken a closer look at what I'm moving.
>=20
> So it seems you are right, it should probably be static as everything=
 else
> is also static.

And you don't really understand why everything else is static, right ? =
;-)

(don't take it as an offense)
>=20
> Heiko
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
