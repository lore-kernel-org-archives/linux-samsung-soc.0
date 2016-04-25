From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 3/3] i2c: s3c2410: Cleanup indentation and comment
 style
Date: Tue, 26 Apr 2016 00:28:03 +0200
Message-ID: <20160425222802.GN1550@katana>
References: <1461222291-5642-1-git-send-email-k.kozlowski@samsung.com>
 <1461222291-5642-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O27Gs9jTTFWz3gAR"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461222291-5642-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--O27Gs9jTTFWz3gAR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2016 at 09:04:51AM +0200, Krzysztof Kozlowski wrote:
> Improve the readability by:
>  - fixing indentation,
>  - switching to proper block comments,
>  - removing spurious blank lines,
>  - checkpatch: void function return statements are not generally useful,
>  - checkpatch: braces {} are not necessary for any arm of this
>    statement,
>  - checkpatch: missing a blank line after declarations.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20

Applied to for-next, thanks!


--O27Gs9jTTFWz3gAR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHpnyAAoJEBQN5MwUoCm2vYAQAJkLViqlnlS0mGlOAIS1Z5wX
PDwuiwegGqIsOCrIwOJOBPusam+UDJETpL3jAyaVyP6E+NsIzfUGvurPlWb3ZEeP
knW8ky8XC+00sT4MqZY4fetLPO4xGIA8S3mBTtwYV4/79GU6IVEFmgu0jmWO+p00
7/3TPyVtcyi6uwJXAC+w3wRt18OWtc8oPAIBwxKrRwQN6Vj1K+2jHqWsa9Hh2VRm
KQw+PEHK13rqDeGcoAqGmKfkYkeTX3uVFumHtpFEAFHDaXobn8bvokV9X8PqKBD+
DBopr7MdEUfuTKlZ9Nsc46Z8mTzM0tTlKfFRVV3b01uh8DIB9efkIS0QxpNijX+0
DQhVrPav8zYt0rcTh/0UokG7aYVjGsXS0SRgzGtQs5nDdLjGVVROXqeEpjK7PNvb
uAomizrYeMwRkjp8S7YoMyvGuyKHXl2+m5vPBfoJa5wLcy4g+iPz+NeD+ozitMOh
TqQqvJkBzTd/9GtEyOKdEqPkBpAeHWjsoLaHNpLeYxL1NqoUFjYtPmiKsns5V+EE
gJHukzVGop3Rac40xtHNQtc0win4gcVsWxxVn1Yklx3iHHYZOk4axXBubYbO6GNx
yi2FSbLRGzuHzNL/I+KrUJk2QXmHq1WTKjTjDtysvgufs0TFPif3BZXaxtpBNBMP
9sahNmtyiuF8gA+SeAWY
=4rDx
-----END PGP SIGNATURE-----

--O27Gs9jTTFWz3gAR--
