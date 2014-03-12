From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 2/2 v4] i2c: exynos5: configure fifo_depth based on HSI2C
 module variant
Date: Wed, 12 Mar 2014 20:20:37 +0100
Message-ID: <20140312192037.GC28891@katana>
References: <1385100851-32254-1-git-send-email-ch.naveen@samsung.com>
 <1391748195-12490-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391748195-12490-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2014 at 10:13:15AM +0530, Naveen Krishna Chatradhi wrote:
> fifo_depth of the HSI2C is not constant
> Exynos5420 and Exynos5250 supports fifo_depth of 64bytes
> Exynos5260 supports fifo_depth of 16bytes.
>=20
> This patch configures the fifo_depth based on HSI2C modules version.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ich.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> [For finding out the difference and initial contribution]
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

I know Tomasz said differently, but I prefer the patches squashed (and
the commit message extended).


--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTILOEAAoJEBQN5MwUoCm2SJ0QAJSPkdYOcxMYaMIWG+1/uDQs
+XlFCEn8V8WGIHGgSCZVAWvVXSzNz51+2gAhO5+yzUs5zdqqBCHCc7P28Gabcv8z
227qskI0K9TA+s3Ekv1m5fWE9/TIvfK9X/z6n8ZE3VE400Ww0cyw4gvitqcZRyRL
ShEKxjXk++XpPV3jdePI2JTa+GDmLkvHKTMzDG6PBPqCiusxKBcp3kw9jYofwEKj
RVVuL2pE9a5Gpt1SECzP8rMFw8K3k5rCngG0551QRtp2gZ+5MRXN/0Pxx/bNkaJM
j5PncySeky65AsnehaZQLMcR1IWAuK2wY2HW+aY58+W3Q93q7gFcpIO37aWfITAg
bU8k52Pu63Mp+61oNBnaO/bwdBzwNSArIbJQRBOwz9tnztuDYlWVMraXXz7QcCmw
xCOa7fA4QYSozy8TEBZ/29pfIbOdbFkSI3zGvjog1TRk6iQ6q+o89GHFD5uoYkv1
H75r3sr0kDMtLj6Ry6LQE6eAbH3Mkkmz9u+TbsAaRF7ScXjLiZehKAI76iua0T8q
9WJRyuQhK7V+eEWqLW3oSR8TTmrEjH+2zPa6TEIoYKyFWlvheH+U7RJkuhnCkOO3
A57P/XQ1n9E1WQaY5FasgxpslpuHZa46KnO20jK4MFUB9Ug3Pdg9eUvsWXqS7alQ
guubUUmFqvFell4G+Au0
=m3+Z
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
