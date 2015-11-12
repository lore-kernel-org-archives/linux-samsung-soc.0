From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/exynos: only run atomic_check() if crtc is active
Date: Thu, 12 Nov 2015 14:49:29 +0100
Message-ID: <20151112134929.GC645@ulmo>
References: <1447333880-16555-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0856896468=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1447333880-16555-1-git-send-email-gustavo@padovan.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>
Cc: tjakobi@math.uni-bielefeld.de, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============0856896468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 11:11:20AM -0200, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>=20
> Fixes an regression added by 3ae2436 (drm/exynos/mixer: replace
> direct cross-driver call with drm mode). The whole atomic update
> was failing if the hdmi display is not present/active. Add a test
> to only run atomic_check() if the CRTC is active.
>=20
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/e=
xynos/exynos_drm_crtc.c
> index b3ba27f..1d3ca0a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -55,6 +55,9 @@ static int exynos_crtc_atomic_check(struct drm_crtc *cr=
tc,
>  {
>  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> =20
> +	if (!state->active)
> +		return 0;
> +
>  	if (exynos_crtc->ops->atomic_check)
>  		return exynos_crtc->ops->atomic_check(exynos_crtc, state);
> =20

This looks like something that the core should be doing.

Thierry

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRJjoAAoJEN0jrNd/PrOhOIsP/3wJ1kNourupyuTyaKPJcTpr
Xqeb5KMmaB2a6U6J32N3o6BzOygLCNySSLL8EyV/prlxkz1O30mXLfZl155+PTm2
CtV+NN7fPKORwEHvM/F8bh1h2R9jXjyjUvauBx/UNz8HFvIxYyXuF8h5jWbx26zH
RU9aAyikHc0ojdjdshxIT4QY/zScjw2cgO9WpvNKBw1iOriYJVPRSphGxP4QG44Z
SYAhH2k3x9K25yiPfrsPPo7gbCZ+V73AuvEqLliF7DaMeJ2eSv2OSbvc4amZuhXv
bMdG7osq1lxqJUvSJGysEAYGhTKaJnDv6VFzvcpD3y32Z357hw8hTJdCBBtdipSN
Py7IldoCDG9uyfwICnj+nxNrRakpBhwmzxDAQJZRGqibwPSONCghUqh6JqIgrFL1
oBCyiHELgrbd1DjrDIBlxo9+IU61O6Fiqj2g//CDc6U/Z8+1tQf+9hhzmHpQmauc
NnlsqtMT+yh+kExp0ss/5wGXW6gRS4zhaXxcfu2lLxu2x54akDdz2axQPwRcjACf
sOqBwir+/jIZ9YeV3ExWE/71GGdTpD2zh1Eaq+BhyiVVXl+jxC//tOSsH4vBE5v4
GjXTjsQHU9SBUPYsF1FIhr/Y5w3Tmwl03sZQHkojNVh7k+x5635Ph7XuIEcwBrGU
gpJ6uk1dqL+SRPIL8gqG
=dqRC
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--

--===============0856896468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0856896468==--
