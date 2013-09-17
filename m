From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3 v5] usb: phy-samsung-usb: Simplify PMU register
 handling
Date: Tue, 17 Sep 2013 10:36:16 -0500
Message-ID: <20130917153616.GG15645@radagast>
References: <1375812017-6287-1-git-send-email-jwerner@chromium.org>
 <20130808092615.GF14648@e106331-lin.cambridge.arm.com>
 <CAODwPW-j=JjunZU3zewrE1_-WoW-RXLmKVQypzxmo_BOYjc3VA@mail.gmail.com>
 <1729120.r596vOTlMW@flatron>
 <CAODwPW_W9gu+nwNzpq3sfcOCDkyppu6K8C9+S8OZt_A0qHqNEg@mail.gmail.com>
 <CAODwPW8KG2ZxOFf936H233g35KVPjDp+f8e3qgkd4Z7NN9RAtQ@mail.gmail.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAODwPW8KG2ZxOFf936H233g35KVPjDp+f8e3qgkd4Z7NN9RAtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 27, 2013 at 01:27:48PM -0700, Julius Werner wrote:
> *Ping!*
>=20
> Are there still unanswered concerns left with this patch? I hope my
> prior mails could clear up why I think that the PMU register
> description in the device tree for a specific PHY is represents the
> hardware more accurately after my patch, and my analysis of the
> Exynos4 situation currently not being implemented (and therefore not
> needing to be addressed by this patch) was correct. Please let me know
> if you have further objections... and if not, could we agree to have
> this picked up somewhere?

I need acks for DTS part...

--=20
balbi

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSOHbwAAoJEIaOsuA1yqRERCAP/jeaTKdJ4KGpEjMQLRUgeNuF
tiQ9FPviR1dIq+nL7FITOmjt9uiS5uojgZOt6c1BX4RyxJySm2cAfKYKVK1LSCN4
AC44lEAzHaCtLazV0WmGnMIjXfvxMe6bb6uxXxVBCOGwwrKGG8WZXPeTxW+VNIeJ
FQN1UpPckdDGhFbGNjmf4LBi7N0dof9Nkk0d4e/bRZGcPrJgHNlDCuY9d8AlenL0
j9HUn/xd60y8+QCGKCpYqwcboD4AevlGopNG612BhWmBcquS4ejnDiwk37iX7pUf
5RET7HqNRYCYWdi0aPVteC4Db1fPYpBfTUpaevgorEbyr06/JejyuIrNiGkEPv+Q
FWfGcJPNcFc2d09yrXUnCn2vzEFZ6o5uLlLuCYnn6E4ZbsqRK4yMzV2pXTc5At8+
Iu3fLoSmJhGverc7W/uyX8Y2NXQTR8aNgn4kG2FYQfnlthR6a7glQzkRq8Q5ciyC
+Cp89Qa7PhqLwz8ZBKxxULxGIvMXdjrUAfHP9c40FAT9qhJJZR4Jeb3kWkybGuFS
BmwdqqMMH9BdZUjEVcEvrTAyaBBKE/n8EfsDFokgNotrXdpM6nKMuezji2+NaqQm
aUxjXBOqYbJvXDzKGkHLSxgtrS+GQ6hdIg8xYujLzPaeAtA/eaNlqxP7kKSHfLE3
R/8TMRjDlzay4OgsyzPt
=2p3m
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
