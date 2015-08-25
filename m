From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 11:15:36 +0200
Message-ID: <20150825091534.GB14034@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+d>
List-Id: linux-samsung-soc@vger.kernel.org

--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wrote:
[...]
> > +       -analogix,link-rate:
> > +               max link rate supported by the eDP controller.
> > +                       LINK_RATE_1_62GBPS =3D 0x6, LINK_RATE_2_70GBPS =
=3D 0x0A,
> > +                       LINK_RATE_5_40GBPS =3D 0x14
>=20
> Same here. I'd rather see something like "link-rate-mbps" and use the
> actual rate.

There is no need whatsoever to hard-code this in DT. (e)DP provides the
means to detect what rate the link supports and the specification
provides guidance on how to select an appropriate one.

>=20
> > +       -analogix,lane-count:
> > +               max number of lanes supported by the eDP contoller.
> > +                       LANE_COUNT1 =3D 1, LANE_COUNT2 =3D 2, LANE_COUN=
T4 =3D 4
>=20
> And drop the vendor prefix here.

Same as for the link rate.

Thierry

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3DI2AAoJEN0jrNd/PrOheHcQAL+hYy/6ngJeDtGcRbKZ9G/p
67283GWjCncy/MFcGvKFQIVUZQ4xlug14Uh5ngFc6dlBDIEphnCHDbiwqSEB8Jgy
fcs1g09QS3fWsoiYuxGTTC5dEFRr90QtnR6H/Y5//2+GiLHYmhjNoXpWcU7nmRtV
0+w/XqJyBVXJe4XYx/xpJbDn7IO6vsFLcahrytAu9duVFy69R6y4h5D2PfCm0qHx
Rj20lN17LzLmcLFj2Mupwl1H8NP4ilFMWdXdO9KFb78LCXKif3fl4cyQA7QfEG5T
/cfogIGuvw6SdsrJJ8DwdIUwTDRli51ngkGiXaNlhVhXubYptuKEU/I/yREMoZBU
pN5WSZv3Z3kUykvPi09schEQvP6p3rJNyg3WPO1QsXcxMYU6XeHNmTRxuDl2tH1y
UO3XXusZ4XbyJa/zjKvkIIt2cHgNGev+zrdlPdZAClsUIjnSQH+StJEglozD5vqY
3VF58LGw5nBzO87ivUl406dIJS4COW0ChKO6SVDAA7OdD4DN4a5qYiB1OlMc5lCc
JaNkKPFG3X5mBRAYxC1KgWpyNGwb/XKb1WYLX7WiyzstTSTycSRxIqPUC9tiexn/
PpTU2axWiq4pE2ugJm1kJP4hPhFnQYVPqUgN6fI0ip8xmVLCCTC4UhijIlPGchCz
xu5j5PdWAfzHUeNwx4KB
=Sage
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
