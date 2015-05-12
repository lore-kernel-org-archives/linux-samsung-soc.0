From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: s3c2410: fix oops in suspend callback for non-dt
 platforms
Date: Tue, 12 May 2015 18:15:03 +0200
Message-ID: <20150512161503.GD6805@schokonusskuchen.bad>
References: <1430676790-30500-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430676790-30500-1-git-send-email-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2015 at 09:13:10PM +0300, Vasily Khoruzhick wrote:
> Initialize sysreg by default, otherwise driver will crash in suspend call=
back.
>=20
> Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to for-current, thanks!
Added stable and the fixes tag, too.


--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJVUicHAAoJEBQN5MwUoCm262wP/iVENEKtodfC3wqRRB06teIr
hLrXVMS7iBoNozqx5HE7+hrPd7HjG0iPgxsdni1B94fXGH5Gd95KNomymTYNVnwN
e0k2FkZCSoK5X2xs2V6GayuvEWpwTebc8lSue/SSsCLd11tZro4jzFDxX3JiWAKi
idptA6jcXUkQrtA6TVrN2xDL5o7L7/3mGq3Pg/fDPAwCOciTBSXg/1fTd+opZQ1i
VFdc/CMHeN8IlqjjU7E7ObCMDxvLtmzfQ1FscX7um7wiKkRlbF9VbfQlhbSCqtAK
7GWande0jo6CTgys66Dy/YeMIfAqJ+LWeglOzsVWpyQY5MtO+SU8xSqKYhhI9V2Q
pWXepqSWD1r1Zac5XIutV6GJSkB9+6SovdXFN0kqEr1lCaJlN1kjiEBedksW7ofd
otnNp6ogGb+6SMx1cTCvTpc9TGBt4Ss+M5WVpWndQgB2pKhpoC8L1dsg6oBVcBBg
hpJ4WLbYs6GzRmCWWZk8CdCQ2hPdMJ24Lzh87kGDncbmDBkkWNIaixonoVG1OUEY
VsHGeOR3d+ecpqpa+ssh7z8YESWqap2boen5tF2ft+gAi/QxorZeZWXXFsu9IWrY
NoFhoJiR7uOsP9jChi6asEsUZDZGoKjOAwOf9LM3KXGvfgZFsrKb/WC2K8uJZYYo
/neRUT4ieATUz6DVSW27
=gsPy
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
