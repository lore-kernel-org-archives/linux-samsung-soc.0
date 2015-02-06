From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: samsung: MACH_SMDKC100 isn't supported anymore
Date: Sat, 7 Feb 2015 07:54:25 +0800
Message-ID: <20150206235425.GQ31311@finisterre.sirena.org.uk>
References: <1421664165.9655.54.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QLVwfW7TUsi22t4P"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1421664165.9655.54.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Valentin Rothberg <valentinrothberg@gmail.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--QLVwfW7TUsi22t4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2015 at 11:42:45AM +0100, Paul Bolle wrote:
> Commit b8529ec1c1b0 ("ARM: S5PC100: no more support S5PC100 SoC")
> removed Kconfig symbol MACH_SMDKC100. But there are still two references
> to that symbol left. These are now pointless. Remove them too.

This doesn't apply against current code.

--QLVwfW7TUsi22t4P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU1VQwAAoJECTWi3JdVIfQ/sQH/3V6jOq4LR2GQclP4RwmnEvd
ZOPAbl8x5J2pRkRFeSiiCe2DTHJD+aD7H+kS1QJJ/cBXJtEPFWoOUzFghWxicBWA
qCIrslr6f28ltn8gF4AQ5JEEflbRmnCGGH3kJrtjK1Ggj90nl4ZZ0b2acJ+1jQqA
FZKZeJXDu2BTY5l9Xh/EROU84sunIyDz0uK5rhuzPlxsH8hjPenjjy8VlTckKph+
lAZUXRp0imUO8ywOwIF4la9858gpy1rRg//5i2LQ3+QoCkA18mWXVzhyHwyhpn7o
uEqEVC05grpCgT/VBMnbVybaCpHZYvMj0NspXBlFVHbkSlvTGBJPhBgPXmjlysk=
=rWzJ
-----END PGP SIGNATURE-----

--QLVwfW7TUsi22t4P--
