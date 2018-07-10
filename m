From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 5/9] drm/panel: add support for BOE HV070WSA-100 panel
 to simple-panel
Date: Tue, 10 Jul 2018 11:57:23 +0200
Message-ID: <20180710095723.GD1504@ulmo>
References: <1529396370-18761-1-git-send-email-m.purski@samsung.com>
 <CGME20180619082000eucas1p1ed44d7aea857b12ce2c92c240be4dedd@eucas1p1.samsung.com>
 <1529396370-18761-6-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0780996976=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529396370-18761-6-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============0780996976==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 10:19:26AM +0200, Maciej Purski wrote:
> From: Andrzej Hajda <a.hajda@samsung.com>
>=20
> The patch adds support for BOE HV070WSA-100 WSVGA 7.01 inch panel
> in panel-simple driver. The panel is used in Exynos5250-arndale boards.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Applied, thanks.

Thierry

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEgwMACgkQ3SOs138+
s6FJ+A//R3kB2aIQR/0l2UYT1W9bP/NUjtwBs1aAT9jkyxzVI3XtGJOxEWWBue8w
HH3lEbE1ybBOCQZPuuJ/RDou/NNJDFB/9ES1IkTse1CEC2bzvfgl7yl/hb/NOpZc
UrL88wC048OxM5B/3MHlDt4KFFELOc9SQyiqTdTqDd+rLjdlrSELsWAkGrFfnUa5
PMA5CTG27yMyYBIkZjw3M/C9VTfvXoLx2dtMmiwlGPuOlNHpZBSLK/1Dn6MRInAL
OaNjYCuuPSbeCSEEOpeIZ6tCMdgA459vqVTowyxPYPKB+TC4HM5Y/efdoGKbcVFl
lUwOk53X/1FHMsRq9AFYlTgoUzJJDgpJ7vN/tb8J4cy1NBw93Fs1ifof+N/tlx/E
OhrhxsdiRLDU6/RLCrLAUcJXIlcscYEfZVXO1NfHewNN9o0kXRKQf8KMRUIyTqxd
40V3TqLtkuScq/0sSZ/XsZsGAHRFtTemg015IfQPVabMgANKnVduOV+kEjQLAZos
vFo8BiFoJ87euUco0My9WSgoP5S4Lr4P0fXxeL7VeO4uSgRh6s6sXk7RCAixDPeq
hxoOQdrI55bZZ2ZvNpE9Avrn8Zaqj/izG46ahQ2/C0G0ai7w7vo1kb0HZqyUhYAs
zO2nVxl5fVuySfQKkClAVSleorVfF4N5ZgN5Hp/PzSVHx4+4qAY=
=uHWE
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--

--===============0780996976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0780996976==--
