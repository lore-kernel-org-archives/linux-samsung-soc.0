From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: display: add DT bindings for BOE
 HV070WSA-100 panel
Date: Tue, 10 Jul 2018 11:56:56 +0200
Message-ID: <20180710095656.GC1504@ulmo>
References: <1529396370-18761-1-git-send-email-m.purski@samsung.com>
 <CGME20180619082000eucas1p1c5cc2b526583c3fd5e9fc13656ed4858@eucas1p1.samsung.com>
 <1529396370-18761-5-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0801863380=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529396370-18761-5-git-send-email-m.purski@samsung.com>
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


--===============0801863380==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 10:19:25AM +0200, Maciej Purski wrote:
> From: Andrzej Hajda <a.hajda@samsung.com>
>=20
> The patch adds bindings to BOE HV070-WSA WSVGA panel.
> Bindings are compatible with simple panel bindings.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  .../bindings/display/panel/boe,hv070wsa-100.txt    | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/boe,h=
v070wsa-100.txt

Applied with the fix as requested by Rob.

Thierry

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEguYACgkQ3SOs138+
s6HZrhAAwDrVJHDJbCjP2R/KXrA7cniY8jw6fAygWwoUlGECBeaWQu0VobHQ16ac
0qSlmbqOLtJFFSvctj6mROz91fD0wL6TvDp1rIfz3LTOChI9JzRxJ6LBFnsXixZi
t8g4FFZpBPwh1giklLHF1kUSoZJ/IYIm1mNYEPHUdYaTWVsF7GVpCmu6xCq1ob8a
Ov2nO2B6BpNPAuMgfj3bJk8PjeUsnodTuid8LINc4ImC1SQXa8P/UZ3kypYs+cQo
Pm31zMOGWK+vJDJ0pgSyXWLDyJWmUheozmqR7l+MipfosJ6n0sqWQrF4/kM0xMDr
xfG17jdDMVUGLxn9sk4L4JSrQgvALe5AUFWsjHjxfcg8aaztvZr5tv7MJ5fQCMNK
c9FuX1gNh3Bub8l55QnUxOjQLQac9A1FNHd5FaNHFkxRqn4or++e6+Z8DvYu/7xb
OrJI/PG8l3CEoWt99Seq9VRz+pu6USWAf4TMGvO81qeEoeKOEa22VoS2Ydod6f3W
A805C7y9kUpCjeuqsxOcgSoSntV+sSzealNMGK0Oqc932iIpi4SqXTla/XU8w24Z
HafIlMzviFvi8MMssCEuJGFLIr8u4QjnVCDWZVkDT+NpT7Y/E/VmhQWbAZiroufC
9g0Q5bVb06s1GQeuB6uoJu/U5xq+/gTSOyVrbXFmsNwhTSi2y9w=
=FB6J
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--

--===============0801863380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0801863380==--
