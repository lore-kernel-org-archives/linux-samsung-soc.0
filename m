From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] S3C2443: Move i2s clock definitions to common code
Date: Tue, 23 Aug 2011 12:42:47 +0900
Message-ID: <06c001cc6146$b9f30be0$2dd923a0$%kim@samsung.com>
References: <201108201757.56483.heiko@sntech.de>
 <201108201801.29541.heiko@sntech.de>
 <20110821171332.GF28546@n2100.arm.linux.org.uk>
 <201108211925.05300.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65427 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863Ab1HWDmu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 23:42:50 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQD001ZS3NCGO80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 12:42:48 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQD00AQV3NCQD@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 12:42:48 +0900 (KST)
In-reply-to: <201108211925.05300.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=FCbner wrote:
>=20
> Am Sonntag 21 August 2011, 19:13:32 schrieb Russell King - ARM Linux:
> > On Sat, Aug 20, 2011 at 06:01:29PM +0200, Heiko St=FCbner wrote:
> > > +/* i2s-ref
> > > + *
> > > + * i2s bus reference clock, selectable from external, esysclk or
epllref
> > > + *
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
> >
> > Is there any reason not to make this static (have you run your patc=
h
> > through checkpatch.pl ?)
> Yep I did run all of them through checkpatch (after beeing scolded la=
st
time)
> and it didn't report anything.
>=20

Hmm...as a note, happened following with checkpatch.pl :(

ERROR: need consistent spacing around '*' (ctx:WxV)
#35: FILE: arch/arm/mach-s3c2416/clock.c:57:
+               .sources =3D (struct clk *[]) {
                                       ^

total: 1 errors, 0 warnings, 38 lines checked

PATCH 34 S3C2416 Add HSSPI clock sourced from EPLL.txt has style proble=
ms,
please review.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> But for this move of code I simply grabbed the code fragments and put=
 them
> into their new location (i.e. it was this way in mach-s3c2443/clock.c=
) and
> should have probably taken a closer look at what I'm moving.
>=20
> So it seems you are right, it should probably be static as everything=
 else
is
> also static.
>=20
> Heiko
