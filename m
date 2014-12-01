From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: drm: exynos: mixer: fix using usleep() in atomic context
Date: Mon, 1 Dec 2014 16:54:49 +0100
Message-ID: <20141201155447.GE11943@ulmo.nvidia.com>
References: <1417307725-5975-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1314408158=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1417307725-5975-2-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: tjakobi@math.uni-bielefeld.de
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1314408158==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2014 at 01:35:25AM +0100, tjakobi@math.uni-bielefeld.de wro=
te:
> From: Tomasz Stanislawski <t.stanislaws@samsung.com>
>=20
> This patch fixes calling usleep_range() after taking reg_slock
> using spin_lock_irqsave(). The mdelay() is used instead.
> Waiting in atomic context is not the best idea in general.
> Hopefully, waiting occurs only when Video Processor fails
> to reset correctly.
>=20
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exyn=
os/exynos_mixer.c
> index a41c84e..cc7cccc 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -632,7 +632,7 @@ static void vp_win_reset(struct mixer_context *ctx)
>  		/* waiting until VP_SRESET_PROCESSING is 0 */
>  		if (~vp_reg_read(res, VP_SRESET) & VP_SRESET_PROCESSING)
>  			break;
> -		usleep_range(10000, 12000);
> +		mdelay(10);
>  	}
>  	WARN(tries =3D=3D 0, "failed to reset Video Processor\n");
>  }

I can't see a reason why you would need to hold the lock around this
code. Perhaps a better way to fix this would be to drop the lock before
calling vp_win_reset()?

Thierry

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfI9HAAoJEN0jrNd/PrOhtQcQAMLadjpNVUvm6qA3GLasGlP1
uteZ6YQ3i9cS4a6rpSApQ4V36g/Sf3h/sh1GCXXINRQL3vU8N3N98LQvJCvUqIOF
vE9/RUecSJ7R4+b2AKLp31NGpohXNXaGC1PvyYSn+MYgtmSAznTNr9PXHBKbwqz2
9U7IXTQDXDPL4aCXgNQbw0I8GZkXN5WemDfBOkeZ6WtiswO82cbVMLXJVf1rjpvA
8Sk3udH93hS2Zb1nQzpnyLyMZX63Y8TUU2Z1qPgGeEHt7KBFYH4QLcJN8ei9DXmc
kSRCYNpEoe9Zbk1GjdWqOWlHC+UT85JGIt6jXhaaVthD6upyFrEBLBemk41SRG4t
DdD1iU/RCtBbTW3zvsIUFpsOTJTxcKmsxKJSr+l85zOImIrJNFNzWdfGLIffeDXl
5/ZXSxPvfhXt1ZXjCNmsX3esfwGJhOhLTuqHdtmDqdfC8isK0xbw7Y6/5UJ2M/GK
sr1vtB3RsSNMnzCaEmhrb5qqZM68KqmmTh642WZmtAms5wIvp+UDUr94yDuhxfK6
B8sdHHWQZ/efuGpv+LwPkw1xi8gSizjMBnFAXJLkhc8WQ53/hd1q9h9McfxWLoQf
a52rdyls4DaOIGuNUsDSXEWC7WMEqx+VtZ+roKGWAeVtW4mG9Ls6YR7Askqm/w6L
U05+StY5YGFEch+p4BFN
=p9F8
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--

--===============1314408158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1314408158==--
