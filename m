From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 16:21:51 +0200
Message-ID: <20150825142150.GB3820@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <20150825095817.GC14034@ulmo.nvidia.com>
 <55DC75C8.209@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DC75C8.209@rock-chips.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@google.com, dianders@google.com, seanpaul@google.com, Takashi Iwai <tiwai@suse.de>, ajaynumb@gmail.com, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Vincent Palatin <vpalatin@chromium.org>, Mark Yao <mark.yao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 10:03:52PM +0800, Yakir Yang wrote:
> Hi Thierry,
>=20
> =E5=9C=A8 2015/8/25 17:58, Thierry Reding =E5=86=99=E9=81=93:
> >On Wed, Aug 19, 2015 at 09:50:34AM -0500, Yakir Yang wrote:
> >[...]
> >>+	-analogix,color-space:
> >>+		input video data format.
> >>+			COLOR_RGB =3D 0, COLOR_YCBCR422 =3D 1, COLOR_YCBCR444 =3D 2
> >I don't think DT is an appropriate place to set this. To my knowledge
> >this depends on the display and/or mode, so I don't think hard-coding
> >it here is the right thing to do.
>=20
> Yeah, same question with my previous reply ;)

I don't have an answer for you, unfortunately. But like I said,
hard-coding isn't going to work. What if, for example, you set this to a
fixed value and then you connect a monitor that doesn't support the
specific one you set?

You cited code from dw_hdmi.c earlier, it looks like it might be correct
even though it doesn't cite a reference for why this was done. Perhaps
someone on this thread, or someone involved with dw_hdmi can answer
where that code came from.

Thierry

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3Hn+AAoJEN0jrNd/PrOhbPAP/1Rx4u6nZSOZ/yoN/W2UFIz7
PopFb8M8CRa6ETxMok+uGnmi4VOW/nTWqwXDKAp/c4diJizU3IzRw/RXlZgN25/t
Jp/q3q7YjBV2/bPz4QNbvBT1gBlOrKlY+b4ZfOP2w16NWUAwe0aTT3koqvseAKX/
8gCGGAnJS4P2uq5exxFwBdtkuOpMX1SH5NphPVQRY1hz0clr5OL7ZS+8VyILxaKC
PblgLGbOEp0+Byh3cHui9Ncq1I1GqDPiqFWa+XCChLFMD+G5q+DqeV4sHDk35jEz
7vwdsNHrhLmaQ+qasQY1bOMe/G0m41s7cbNLoUGL7atfOc5/Um7YbNt32sTMJNv0
+BFWKdMZDlKV0QW+J86YEfSQz525SZm2Spx0RiyTTWlXqZR+Nj1QwsPIAV0Nx4vm
klpf2c86BZWWRtogh5hKzzoFAiJusQsmNZA6AwhgtAC5jzh37UoCVjdf9Y6zALLk
ASSf0EsImg4IDjsBOeK33tnKraSDdjmtyIckLHmks8u7bkEaL/pivCb4oj+LLINP
q8EQOUdojYy3HTEn3CtAGtG1CUc4ZeNDbXspHdrT25b/r+MYP+mYO7tncJFyfcQn
BU7JNhQhlYXOO5q7Bs+k7pIpVdVBC4sqDMl0EDCSXseb9cL58m7s0bQ5eSWbSe3w
2u/ygbFdIZ53hj9WQF8F
=pEnJ
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
