From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: git pre-commit hook running checkpatch.pl
Date: Wed, 20 Jan 2010 16:30:27 +0100
Message-ID: <20100120153027.GB20271@pengutronix.de>
References: <20100120020202.GE26562@trinity.fluff.org> <20100120100155.GA851@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:50364 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753285Ab0ATPab (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 10:30:31 -0500
Content-Disposition: inline
In-Reply-To: <20100120100155.GA851@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Wed, Jan 20, 2010 at 10:01:55AM +0000, Mark Brown wrote:
> On Wed, Jan 20, 2010 at 02:02:02AM +0000, Ben Dooks wrote:
>=20
> > I've written a git pre-commit[1] hook which stops any commits happe=
ning if
> > checkpatch.pl reports problems with the patch. Any comments?
>=20
> > [1] http://www.fluff.org/ben/linux/githooks/pre-commit
>=20
> Checkpatch does sometimes generate the occasional false positive whic=
h
> can be annoying when they trigger.  It can also be a problem when doi=
ng
> bugfixes IME - if an existing file has lots of checkpatch issues then=
 a
> fix which maintains the same coding style as the surrounding code can
> trigger checkpatch issues which would if fixed make the code not fit =
in
> with the rest of the file.  Obviously it'd be desirable to fix the fi=
le
> but that's a bit unreasonable for people submitting bug fixes,
> especially when pushing fixes to Linus and stable.
>=20
> That said, monitoring for checkpatch issues is useful.
Maybe only print the warnings instead of stopping a commit?  I'd not
like me stopping here not only for the reasons pointed out by Mark and
Russell, but also as I frequently do wip-commits that not necessarily
are checkpatch-clean.

Best regards
Uwe

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig     =
       |
Industrial Linux Solutions                    | http://www.pengutronix.=
de/  |
