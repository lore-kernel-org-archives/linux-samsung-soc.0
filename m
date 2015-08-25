From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 16:16:43 +0200
Message-ID: <20150825141642.GA3820@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150825091534.GB14034@ulmo.nvidia.com>
 <CAL_Jsq++RLZo4gvEUTKO8MfEPwSqT2R+bqG22Jsgb2qLgDQFpw@mail.gmail.com>
 <55DC7211.9080601@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DC7211.9080601@rock-chips.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Rob Herring <robherring2@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+>
List-Id: linux-samsung-soc@vger.kernel.org

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 09:48:01PM +0800, Yakir Yang wrote:
> Hi Thierry & Rob,
>=20
> =E5=9C=A8 2015/8/25 21:27, Rob Herring =E5=86=99=E9=81=93:
> >On Tue, Aug 25, 2015 at 4:15 AM, Thierry Reding <treding@nvidia.com> wro=
te:
> >>On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
> >>>On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> >>[...]
> >>>>+       -analogix,link-rate:
> >>>>+               max link rate supported by the eDP controller.
> >>>>+                       LINK_RATE_1_62GBPS =3D 0x6, LINK_RATE_2_70GBP=
S =3D 0x0A,
> >>>>+                       LINK_RATE_5_40GBPS =3D 0x14
> >>>Same here. I'd rather see something like "link-rate-mbps" and use the
> >>>actual rate.
> >>There is no need whatsoever to hard-code this in DT. (e)DP provides the
> >>means to detect what rate the link supports and the specification
> >>provides guidance on how to select an appropriate one.
> >Good, even better.
>=20
> I do think we still need keep this DT prop yet.
>=20
> I think drm_dp_help.c could get the "panel" max link-rate and lane-count,
> but it's not enough, we still need knew the "eDP controller" max link-rate
> and lane-count.
>=20
> Let me show the exact example that happened in my side. When I connect
> my board to my 2K DP-1.2 TV. Analogix dp driver would get the max link-ra=
te
> from dpcd, and the max link-rate is 5.4Gbps. So if I just set eDP control=
ler
> link-rate
> to 5.4Gbps, the DP TV just broken, do not light up normally.
>=20
> This reason why TV broken is the max link-rate which support by RK3288 eDP
> controller is 2.7Gbps. Here are the exact words that RK3288 eDP TRM said:
>=20
> *=EF=81=AC=EF=80=A0Compliant with DisplayPortTM Specification, Version 1.=
2.
> =EF=81=AC=EF=80=A0Compliant with eDPTM Specification, Version 1.3.
> =EF=81=AC=EF=80=A0HDCP v1.3 amendment for DisplayPortTM Revision 1.0.
> =EF=81=AC=EF=80=A0Main link containing 4 physical lanes of 2.7/1.62 Gbps/=
lane
> *
> **
>=20
>=20
> Beside I haven't found there are some registers would indicate the eDP
> controller
> max link-rate and lane-count, so this is why I still instance that we need
> this DT
> prop to indicata "Max rate controller support".
>=20
> So, I wish you could agree with me on this point.

Your driver should know what link rates it supports and restrict itself
to use those. This is implied by the compatible string and doesn't need
to be duplicated into device tree.

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3HjHAAoJEN0jrNd/PrOhJPYQAKC+a7DiNA+K0xsI5x9gYCKL
Rm/912fSdoiLOORV5g+wrHn8rkNcqdZmTiyWsvYOslvVNXmF5Ue+3/ZrcsSEaKr+
cE5BIzH7GU+nmn2a0+gVOsxPSnJAJEdOv2sJRA5qE7eXKzCCptEtfKUDvZz7/D44
G4aGNc/X0UG0OgjCvNd2cI4qZc4zyBwMdV8VIveOAkZHV2Srz6T2HiDA+z9fPJUh
WrXjgXxlLwIHsArDrFejAY/iFIG3VrWb9OmQJJbBNh0+Ug07vfhPd575Le0U/I2V
CBoC33aAUg4Ox+3xn8v/EvFsYBhh/Ed4e8GFrHy/AHiOwoqedb75de3PgCebbvCW
yg+cTbLxEPd9ZS6EFY8njNKEZV4/Vwf4WzdMIOCeY87OEcjIYmf5vZKOGSpg03VD
bWAVWiE1EjG9QfnzQqnuXbfguHmmmtOGeytnnQUBJVxq1vQ2BTzYcd3LEsnV0f6k
D4/3mndGrVETdsXXTPrMMf1ME6GgD4Z7jT7O+VaUZlp8K74V2LxrW8LDDo3PJMK/
derMU9VSEimFFRIDp6shnF2I0v+0R2c7gyWXS5F1cszjPCD4lIlwdboZEb7kBde+
VuBsVPjHAmo8g3Mr5CQ57/gtC1ofxzuHtFTbWXEzdFq/5ImAlx8zKSojEtp0Zj6E
LdNf/878swCnHl9QxxnH
=awNK
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
