From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v4 14/19] ARM: remove unneeded vic.h includes
Date: Fri, 4 Jan 2013 19:59:49 +0000
Message-ID: <20130104195948.GO4627@opensource.wolfsonmicro.com>
References: <1357235668-9450-1-git-send-email-robherring2@gmail.com>
 <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y6PvmTFIYclVmRST"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56924 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754486Ab3ADT7x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jan 2013 14:59:53 -0500
Content-Disposition: inline
In-Reply-To: <1357235668-9450-15-git-send-email-robherring2@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, thomas.petazzoni@free-electrons.com, Rob Herring <rob.herring@calxeda.com>, Hartley Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>, Hubert Feurstein <hubert.feurstein@contec.at>, Alessandro Rubini <rubini@unipv.it>, Linus Walleij <linus.walleij@linaro.org>, STEricsson <STEricsson_nomadik_linux@list.st.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com


--y6PvmTFIYclVmRST
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 03, 2013 at 11:54:23AM -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>=20
> Numerous includes of asm/hardware/vic.h aren't needed, so remove them.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--y6PvmTFIYclVmRST
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ5zSeAAoJELSic+t+oim9SOcP/1ol0TwKaYtJBNO0H6ikK4pr
7yfHW4sP1vcEGBVo4/S7Q8KfCZWerBI6Q4I66nkZChphgbzcyyrXXrylArSSh5Rz
pKjPw63EowSFhUOujlxn2GWTDsRT3hkvgiDqFdhwM+nuJMQoV5Qv8EYCajuF50Jq
Tk8KV7gp4rTZoeOtDPyk7fIx1os/N1nkPku5QRqKr5b2z6T+HeJ3qWfakvB/9ZiC
JoQval/cMgPpaTS66SvlDBYlbVFPD+j4n0oWOCDzVn6OySntTfJrhTKSdMA+ENBa
FaU0jJ0bWle4Ns1YTKoR92+gqWzHKqwj+mg/mYMykSV0fYw5besK9rkKHYy82FBG
MBE0nYMp7w0L44W6sSk1w2O4D9gO0Ooq4pCPnqW9ALTksKKJZETx9MfMnkscIjav
vJ1eHtSKmd8qB47qlivgSHygQfWFFPCG2kffsF0LBxkY1m26nM9THElyzrHWZqk7
sA0mRLLxhWKeEh+our6Err4IiRvQikehGHDc84W9kjXF3tAaYn+xN62il8nf3l94
CAJE9RSeYTCGO9dq8G62Zj+JPMLeers06Jh11cqKyfS84QjxBPFeH/byxhA6MfyS
Ie5h5KXtLUv4vi1SB7N0le5IvutPJPgLuoGYOjUUNK1x0PuKQC3iFBglp4cERAj7
781MIsq8XOYuJf/WZTsV
=MfhO
-----END PGP SIGNATURE-----

--y6PvmTFIYclVmRST--
