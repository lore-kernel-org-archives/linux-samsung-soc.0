From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] i2c: samsung: resume race fix
Date: Thu, 24 Jan 2013 14:27:59 +0100
Message-ID: <20130124132759.GH12933@pengutronix.de>
References: <1352284106-24988-1-git-send-email-ch.naveen@samsung.com>
 <20121107114437.0a563c7e@endymion.delvare>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgApRN/oydYDdnYz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51893 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753269Ab3AXN2J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 08:28:09 -0500
Content-Disposition: inline
In-Reply-To: <20121107114437.0a563c7e@endymion.delvare>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean Delvare <khali@linux-fr.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, olofj@chromium.org


--OgApRN/oydYDdnYz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 07, 2012 at 11:44:37AM +0100, Jean Delvare wrote:
> On Wed, 07 Nov 2012 15:58:26 +0530, Naveen Krishna Chatradhi wrote:
> > Don't unmark the device as suspended until after it's been re-setup.
> >=20
> > The main race would be w.r.t. an i2c driver that gets resumed at the sa=
me
> > time (asyncronously), that is allowed to do a transfer since suspended
> > is set to 0 before reinit, but really should have seen the -EIO return
> > instead.
>=20
> I thought that the suspend order was children first and the resume
> order was parent first?

Same here, why does it not work this way?

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--OgApRN/oydYDdnYz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEBNt8ACgkQD27XaX1/VRtiggCgrNIHvOu0QP3EddBIjEhvTavN
3GIAn2o9/th62ACplEoFn7EkAINdsfTL
=aomI
-----END PGP SIGNATURE-----

--OgApRN/oydYDdnYz--
