From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 5/6] ASoC: samsung: Extend Snow driver to
	support max98089
Date: Thu, 19 Feb 2015 18:44:25 +0900
Message-ID: <20150219094425.GB3198@finisterre.sirena.org.uk>
References: <1424283959-16289-1-git-send-email-afaerber@suse.de>
 <1424283959-16289-6-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6861968169231599671=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1424283959-16289-6-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============6861968169231599671==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3uo+9/B/ebqu+fSQ"
Content-Disposition: inline


--3uo+9/B/ebqu+fSQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 07:25:58PM +0100, Andreas F=E4rber wrote:

>  static const struct of_device_id snow_of_match[] =3D {
> +	{ .compatible =3D "google,snow-audio-max98089", },
>  	{ .compatible =3D "google,snow-audio-max98090", },
>  	{ .compatible =3D "google,snow-audio-max98091", },
>  	{ .compatible =3D "google,snow-audio-max98095", },

Since we completely ignore the CODEC in the property might it not be
better to just add a plain old snow-audio compatible and bind to that,
that way we don't need these driver updates?  Just the "snow" bit should
be enough to know it's one of this class of machines.

--3uo+9/B/ebqu+fSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU5bB5AAoJECTWi3JdVIfQrvMH/jQFZat83HOXGQ6uN6UfGyOp
EL/5IynL/XJOM9WRGk/9LCH2BITnrIECC4k2zIOflnzaCe0aLspAY9cdC2XjZroM
iiRrOAC0a8OM9GmshJt1uatdoIdAJF+Xs2zaxqXzEgqaIdDtUJSG0rjlo/xA0+gU
ITpKI9u5fOTO6GpEskBCbs28EL9zW1lAXciMm2aiEbRdPlhHBywmroBQzjuI3RlE
hkehhi2xSWrMqbN9gbEks3kRB/2AUvCjeCFDwlp4Fuid3DsP7QEKAYR2rLvCU8IN
ZpJ+7cqgzvK3l/lSlkJ9RAeKHIYxsux9U/OZWFm2873BJ/MhFs1jigTko67W36s=
=o+MI
-----END PGP SIGNATURE-----

--3uo+9/B/ebqu+fSQ--

--===============6861968169231599671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6861968169231599671==--
