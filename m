From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/3] Add support for the S6E3HF2 panel on TM2e board
Date: Wed, 14 Jun 2017 20:19:34 +0200
Message-ID: <20170614181934.GF14971@ulmo>
References: <CGME20170418084047epcas5p493261a4cb9204e682f60cde8d659565c@epcas5p4.samsung.com>
 <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0616236222=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, andi.shyti@samsung.com, catalin.marinas@arm.com, dri-devel@lists.freedesktop.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, krzk@kernel.org, javier@osg.samsung.com, robh+dt@kernel.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============0616236222==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Content-Disposition: inline


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 05:40:33PM +0900, Hoegeun Kwon wrote:
> Hi all,
>=20
> The purpose of this patch is add support for s6e3hf2 AMOLED panel on
> the TM2e board. The panel has 1600x2560 resolution in 5.65" physical
> panel in the TM2e device.
>=20
> The s6e3hf2 panel(5.65") is simliar to the previous s6e3ha2 panel(5.7"),
> but resolution and some command message are different. So it can be
> distinguished as a compatiblitiy string.
>=20
> Best regards,
> Hoegeun
>=20
> Changes for V3:
> - Remove te-gpios property in dts.
> - Added Reviewed-by: Andrzej Hajda <a.hajda@samsung.com> on all patches.
> - Added Reviewed-by: Inki Dae <inki.dae@samsung.com> on patch (2/3).
>=20
> Changes for V2:
> - Add new compatible string to "samsung,s6e3ha2.txt binding with comments.
> - Fix the panel name from s6e3ha2-e to s6e3hf2
>=20
> Hoegeun Kwon (3):
>   dt-bindings: Add support for samsung s6e3hf2 panel
>   drm/panel: s6e3ha2: Add support for s6e3hf2 panel on TM2e board
>   arm64: dts: exynos: Add support for s6e3hf2 panel device on TM2e board
>=20
>  .../bindings/display/panel/samsung,s6e3ha2.txt     |  5 +-
>  arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 11 ++++
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 64 ++++++++++++++++=
+++---
>  3 files changed, 72 insertions(+), 8 deletions(-)

Applied patches 1/3 and 2/3 to drm-misc-next, thanks.

Thierry

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAllBfjYACgkQ3SOs138+
s6GbhA/+JCGP5yoo1KtohnPnK3M5JYxtwmCM8EJ0I+3EGhRqi6NegRKPzo72Zrfv
I3JK8MRLYWdOULVjutSdjkkBSHf23Zdd4/5ry2X4kJcyYo6bR1H7zNitlWcwPaW7
CZSFX6cm+Yh/Smr46r4vjnd0xqusjdpyX5H1zJc/rkVQ5PLGL4Vl2gPI3+pJpgAo
RP1F7K/g2fQzrfA62N9KIyFRKRBT5CpHgGk1+rwrCKtTmJ6LE+iqXIEV8O4vtrN9
gr7z7u846sdFDH7be7QG4PBx3GHRj+oOB7wTSw94LJ8CIDSxfeUGZCCPBK8RtwW0
xnWPsupg9P7uMFNm8XBkGX945aaGPHokPs2owtYhxJE6sVndvlFK8C2Nx6952MOz
1TLETPbnE8wwvD8g6VFgBejhhk7CmYvnHBSUHl0Wqs1pwA7szmYbmE7RdVETcbtd
bNT0Gqpg18hkRe6gGiNcIUIXm2I0nIFUJRZVUfolivns8tZe2eLQTAm5Df/6/hRK
VUIMcwCNvqL9LoJjVQaX1o7MNSDbZqo+J1yWOHFcR80mIl5TTCUhOL4b7oPoxodE
d/rGGj91SCgmk5KeZStb0bt5QoeOUHnKUAvQqEoRbMdvOLsBbKDn3tOpXaMv/ZCr
q3oJUfy49FJG0/aNuBWvYbdeeZ/sW16fAvVae5nB9uDWtedvdAQ=
=fyeu
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--

--===============0616236222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0616236222==--
