From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add WM1811A audio CODEC to Arndale bindings
Date: Mon, 1 Jul 2013 23:38:49 +0100
Message-ID: <20130701223849.GR27646@sirena.org.uk>
References: <1372714599-17588-1-git-send-email-broonie@kernel.org>
 <1372714599-17588-3-git-send-email-broonie@kernel.org>
 <CAOMZO5DZb1wWu93eEHkEqNORhm_hn6qy_LdiRSumP7UODJ3uMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDmPiU/dG5K4hm3H"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56899 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755601Ab3GAWjN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Jul 2013 18:39:13 -0400
Content-Disposition: inline
In-Reply-To: <CAOMZO5DZb1wWu93eEHkEqNORhm_hn6qy_LdiRSumP7UODJ3uMw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--KDmPiU/dG5K4hm3H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 01, 2013 at 06:47:00PM -0300, Fabio Estevam wrote:
> On Mon, Jul 1, 2013 at 6:36 PM, Mark Brown <broonie@kernel.org> wrote:

> >         i2c@12C90000 {
> > -               status = "disabled";
> > +               wm1811a@11 {
> > +                       compatible = "wlf,wm1811";
> > +                       reg = <0x1a>;

> Shouldn't it be reg = <0x11> ? Or wm1811a@1a ?

The @ should change.  Though since it's one of the bits of ornamental
noise DT has rules for :/

--KDmPiU/dG5K4hm3H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR0gT1AAoJELSic+t+oim9wkIP/iJCStIY2lkb3hkXNejyxThw
IzBerTSTMRj6LWBbup9rhLQQMpE+7i7EAopF7igIPB2fqaKNe7Ykp61Te8n0mFql
IG0KABA0YEnX70+X7MP//IxnDMuXEqisPZs5k3hyhlso4tX21RxNsWK6LCVRiDla
sirnInnNqcO4ciprZEmpIlfXrtCn8KTV45fmGbtGJebPysRVempPc5P9FljGx90X
oKsAMY1DhN/ls32yS9KIZ2qzVYiyCS1NIeqG4YQcz9Z4St9lnHBSJPUayVyGaxfO
0IBYeB8RG2UCjDWZ5SlfUQF9nYWxyobu4RI5JFlBPhtyWI9rSyLW4gsOXif610R0
e2voJRosXbiC5sMTHWGhsFGJaBdNigfj1FTe4vbFGA3M2kzVyOV0kMyoI/V0VE7s
EYEyrwXTLZHTqfEyNsYtYk6LFnYzjDlbRCsjpdzFtWkZx1xrVsVrDGL35NBHaLB+
Vy+PJZfqqAorJOlrxy9WbQDVtg+OWVzYlE0x0BtH+QCYJvi6/tOoZI3M21QG+Ay7
J1acpsqvJA/tPxjM1RSRrLtkTunbXEJ9ytPDNJm4wpfcEYVRcybSCccNjz1Uhwiq
QNziqiwJWLwB682SZsMATNkkHNPxJ4xiaeb8e8sEzy/4tq6Cu2aW1ljmzwJEHgGx
a12DcE84LA+iqlbQC/vK
=oWFD
-----END PGP SIGNATURE-----

--KDmPiU/dG5K4hm3H--
