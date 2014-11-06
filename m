From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Add AUO B116XW03 panel support
Date: Thu, 6 Nov 2014 10:10:35 +0100
Message-ID: <20141106091034.GF26297@ulmo>
References: <1409566202-7946-1-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0742848459=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1409566202-7946-1-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0742848459==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 01, 2014 at 03:40:02PM +0530, Ajay Kumar wrote:
> The AUO B116XW03 is a 11.6" HD TFT LCD panel connecting to a LVDS
> interface and with an integrated LED backlight unit.
>=20
> This panel is used on the Samsung Chromebook(XE303C12).
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/panel/auo,b116xw03.txt     |    7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               |   25 ++++++++++++++=
++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b116xw03.=
txt

Applied after adding the missing .bpc field in the panel descriptor. I
set it to 6 according to the datasheet.

Thierry

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUWzsKAAoJEN0jrNd/PrOh56YP/2wbdvrBQG4qUai5OuSOpbL/
M3EYXSklKBH7aG5urF4zKVG2FO3NWBo5jHTFJ4KUVMxRaGbisnF+mBIp8EO/cTUf
bC5/wxQVpo3hQBV8XhpuOGDCCWuVZ+MmWPYj7uvxU8UlRBEqN+Kgk24mUO7gJghy
DyhMMSbnXWROrbMA/yIAWjty1VD4O568kHeFDKTb79mDLXHRkA0hmJ/ELJTwlxFU
mzz7FHTgOEtaZfzgv0elOXOw1awYbwAbJAr4XqrHfaqkxmgE3jIbFT8xphMWkxiH
+xBeVVrTSFFGZq89a5PuU3srU3+Giz3FzYV8j3q8eeGbY1TBK3xE1gf//hiAd50Y
mSUiwMNyUuyOBM2+Pcf6YNxIQQTpgCuSKDE+KGGlTXhm1EQ9V8NtGfQMj6CJwGmo
KWjm1qB1p1BpCQAfDoC9mbtm6FCWFgw9W9nJ5oza1bfE8cyRxUYyKWjTufuV17e1
R0bj67+4nJR0Neu3nkhbUK6fFZGSq7kuYzjSvbSaygbWxTKzcurwxyjpjzLVFwEg
48Rrg6dwGYsMNkGQLN/oQ5NsMf4ucgBkKCtcvuMVdJmkzgS04FA0vW9mofbgIJT9
u2KRiNe8GfA0KMzNUAOUqJ7DdSENJh1CyXXg4kCYiT83OShsFsc2Nyy2+5dph2HP
O/K0XLQmlPNhQKLcttFM
=o+nO
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--

--===============0742848459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0742848459==--
