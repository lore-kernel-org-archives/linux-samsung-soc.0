From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] i2c: samsung: resume race fix
Date: Thu, 24 Jan 2013 17:44:03 +0100
Message-ID: <20130124164402.GC2603@pengutronix.de>
References: <1352284106-24988-1-git-send-email-ch.naveen@samsung.com>
 <20121107114437.0a563c7e@endymion.delvare>
 <20130124132759.GH12933@pengutronix.de>
 <CALiw-2F7tG9ogDHj4Yf47T47rBn6mAiH2XvK8jpWB1a3OhNJBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALiw-2F7tG9ogDHj4Yf47T47rBn6mAiH2XvK8jpWB1a3OhNJBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>    below setting suspended =3D 1. Upstream implementation of the same
>    functionality will be implemented differently, most likely.

Thanks, so I'll discard this patch.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlEBZNIACgkQD27XaX1/VRuMdACfVbOYr7sgitZ3mcmOYuPX4mQP
gaMAn0u20XAVknNcZobpLBCrMy7TCVmL
=gktr
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
