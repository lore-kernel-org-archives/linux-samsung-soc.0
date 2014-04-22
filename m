From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 7/9] drm/bridge: ptn3460: add drm_panel controls
Date: Tue, 22 Apr 2014 10:55:19 +0200
Message-ID: <20140422085513.GF17275@ulmo>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
 <1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0072282637=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1398119958-32005-8-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0072282637==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Content-Disposition: inline


--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2014 at 04:09:16AM +0530, Ajay Kumar wrote:
[...]
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/ex=
ynos/exynos_dp_core.c
[...]
> @@ -1012,9 +1013,16 @@ static int exynos_dp_create_connector(struct exyno=
s_drm_display *display,
>  	dp->encoder =3D encoder;
> =20
>  	/* Pre-empt DP connector creation if there's a bridge */
> -	ret =3D exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder);
> -	if (ret)
> +	ret =3D exynos_drm_attach_lcd_bridge(dp->drm_dev, encoder, dp->drm_pane=
l);
> +	if (ret) {
> +		/*
> +		 * Also set "dp->drm_panel =3D NULL" so that we don't end up
> +		 * controlling panel power both in exynos_dp and bridge
> +		 * DPMS routines.
> +		 */
> +		dp->drm_panel =3D NULL;
>  		return 0;
> +	}

This kind of hack should set off an alarm that you're doing something
wrong. I'm not sure integration of bridges and panels has been thought
about or discussed a lot, but this doesn't look right to me at all.

Thierry

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTVi51AAoJEN0jrNd/PrOh1VQP/AyyuW4rFFw/XIqgEvEFFuq+
4HL8UJTkm5dQetbw1EPZI3bmY3caLeoJtexnG8fsg9G5IEjCLcSAHy3jNyjGBSce
fOljqB9RDyOFpdQqKONG+BnRKfc7D6VJzAQeLqVwPjWvXtqHOs3lwbj/QyQNHuP/
x7Z8P/gyAtnx+uJPzRoj8MYaELHM40YKAAFtnzlii4hKONS2zngAhfHRbR2Vi1sQ
bhyd/xCp8yPEjroV+cJmVC9Lr/ct6cf/IVIhmI98wMTdXKhnHkrYTX6+6PD8g4sa
+wspcMWDx3N/CE1n7aAKfqNPpxRbIXF1XqaPnRCZvuopcRgBpdURs0s/ZrWjm1eY
dYY3QhRVF4Od8ZqrUmrOy/F0AGUJoSrlUD4M702syB4c4s8yBD2wWUuhy7efAOlH
DhV73Quz6Iee33UCossKRnyNrMVmTW+Qp9fYAcJKp+AhVcRsjHsBWDcLgEskiY6e
9TgzuGnYTbedNCBX3SdTlYwQESKTkvHTsfdPHvPUYb+idsU5JQWXI8kgUrGgZ6+o
hQTt8CD77hWJx64WX8+63oxI/4KOulYcs3K6g4SC5N25ypjjGNR/wV80EZa1UNC5
ZB6N/WoR9fBl9tC1UjFXGcS0DqCHfHcSWVEjbxJ24siFcU0M/l+DTFK40kx+fKGC
Ow5rGskl3UCzTdCEtKqy
=jYTj
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--

--===============0072282637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0072282637==--
