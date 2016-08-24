From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: simple-panel: add the delay timing for
 Sharp LQ123P1JX31
Date: Wed, 24 Aug 2016 16:29:42 +0200
Message-ID: <20160824142942.GF3714@ulmo.ba.sec>
References: <1469151750-7130-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1478415572=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1469151750-7130-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Yao <yzq@rock-chips.com>, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>, linux-rockchip@lists.infradead.org, daniel.vetter@ffwll.ch, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1478415572==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2016 at 09:42:30AM +0800, Yakir Yang wrote:
> According to page 16 of Sharp LQ123P1JX31 datasheet, we need to add the
> missing delay timing. Panel prepare time should be t1 (0.5ms~10ms) plus
> t3 (0ms~100ms), and panel enable time should equal to t7 (0ms~50ms), and
> panel unprepare time should be t11 (1ms~50ms) plus t12 (500ms~).
>=20
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> ---
> Changes in v2:
> - Add the reviewed tag from Sean.
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thierry

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXva9TAAoJEN0jrNd/PrOh8xwQALA/TCFPF3Vy7px3+TSOjGSp
tIjk3SYLQC1jNS6t1VoIu6LqfHp3/2Tg/2GLx/B8q12iNgexNDVoEorw6xjlg2U/
h7Lpn3WaOhbGEdgNo94trv9Kh7C8uV2AR9nkULvCyAn0Crhy8ZcggrnpMz6FJeZK
Q2q45nj2DgAx8o7c8g+WVGay4ESntU6r1saBMfdVa+AzEq/SPuQq8xEDlbIB53BX
ToPorbT6ux2+gDP2AWiJ6YMMnXo8JitfNGl84r8P8N5wQPIfsHB8s6nDVsqTugvu
06nOINtn8NGzi34ma8XDcubk/bWu98MGxE5DezMg08daPsIzX5f3pbndaR3LZKzi
vjog5cYR+dJjZ9Vrcztyv8jTeDTZgMz6M9BVLzDaIej3tA3+J5VL5MsbhK1Ebbcf
Do85CEHzu9W9PDmAt/ciOUlJlsNqHRXdgIKhQ3SxZRjcXNb3pgaqexdSbFGxuTjS
/8hTzEhpMZxU6p9ufTrjPpW3hKqLYdBkRUzPsmJUQAC2HNJNCh2MFrVlaeiyTpTR
sRJeL+AJQta+b1qXfTnrSHL79w47bV77+KTswhU8oSLxdSe+mf2Fl/wOQwkafxtc
my9MGEL9dscLZO+RJCltzOfDKn0kjMb+Th3MDZffMXLx+Wf8pnVptlqrG/0IaO6a
T7jLxoYvbqSn4EmezVpa
=gz67
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--

--===============1478415572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1478415572==--
