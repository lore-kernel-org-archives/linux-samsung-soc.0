From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 06/17] video: fbdev: s3c-fb: remove s5p64x0 related fimd
 codes
Date: Tue, 1 Jul 2014 09:25:59 +0300
Message-ID: <53B25477.4020902@ti.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com> <1404163947-3105-7-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="lq2rE6rxeR4ONDpOwP3txKWCmwSGX25Xt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:51886 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751164AbaGAG00 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 02:26:26 -0400
In-Reply-To: <1404163947-3105-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

--lq2rE6rxeR4ONDpOwP3txKWCmwSGX25Xt
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 01/07/14 00:32, Kukjin Kim wrote:
> This patch removes fimd codes for s5p6440 and s5p6450 SoCs.
>=20
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  .../devicetree/bindings/video/samsung-fimd.txt     |    1 -
>  drivers/video/fbdev/Kconfig                        |    2 +-
>  drivers/video/fbdev/s3c-fb.c                       |   30 ------------=
--------
>  3 files changed, 1 insertion(+), 32 deletions(-)

Shall I queue this and patch 15/17 via fbdev tree, or are there
dependencies and the whole series should go as one?

If the latter, for this and 15/17:

Acked-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi



--lq2rE6rxeR4ONDpOwP3txKWCmwSGX25Xt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTslR3AAoJEPo9qoy8lh71kRYP/RNYJ7R9Szv7OrWZaoZlEzEk
ZF5oGkJXn06RPzPsPcGr/HasqNNf/rsKi8CGcO+yOYG1QILjQIsYMGomijrQ1aTt
iqqogOZWYaJk2kx8nsTu/stSJfCh8omZ9Ws0zB9AfP5FMUH4sji/yNfid6hwNNDm
SsFTVabpFlcens2CaIjuUEHQXXS4P2EgjIZ8JrLfVjypuEOHMiNaI/Sw069NcTrj
ViIiZ5MDo9NYwkOqVi8JKoOdFeOmmjIT13kzgxWukxBEkueCpzw17h3pV7Gx3wEE
ctcP/OAOVmSnFTRH2KZfRWHRSNMw1jAaiKbFPwhur0HeErGEu8P9b4AfZLj02Aja
JpMDe+Gmg8T4QqpicOLfevxZO48ehANZzaR3B1jXXwIlppwWBI+h9PW23m7eUxY5
5N933hugaoVP2m0zINFqk66pw14CzmTkJveADsF/tAF1YXDGjguNc5FZRtVw60T1
sQgyd9ujXMmRywoORoSH38sy6td+ATnd8YIN/Cbpoavdf+zYmq8Qb/oJuOp5vvAP
/in1RBV5FLiaiFIUKaTo7q8iKE6GLWvtq0uJAX/QeMyNbmF0u42+7yMfl0fgEmGg
GRTQ+0hYM3NtKHXB2Yww3Z6TUg12GQvM9hpB+TsRWvMdXbEP2+4bI7uSoF7x8mhU
3vLcziNmDXCvYUUbaSVd
=mUik
-----END PGP SIGNATURE-----

--lq2rE6rxeR4ONDpOwP3txKWCmwSGX25Xt--
