From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 12:06:30 +0200
Message-ID: <20150825100628.GD14034@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150824125758.GA7557@n2100.arm.linux.org.uk>
 <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
 <20150825091246.GA14034@ulmo.nvidia.com>
 <55DC383F.4000103@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DC383F.4000103@rock-chips.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Rob Herring <robherring2@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>
List-Id: linux-samsung-soc@vger.kernel.org

--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 05:41:19PM +0800, Yakir Yang wrote:
> Hi Thierry,
>=20
> =E5=9C=A8 2015/8/25 17:12, Thierry Reding =E5=86=99=E9=81=93:
> >On Mon, Aug 24, 2015 at 09:48:27AM -0500, Rob Herring wrote:
> >>On Mon, Aug 24, 2015 at 7:57 AM, Russell King - ARM Linux
> >><linux@arm.linux.org.uk> wrote:
> >>>On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
> >>>>On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wrot=
e:
> >>>>>+       -analogix,color-depth:
> >>>>>+               number of bits per colour component.
> >>>>>+                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =3D 2=
, COLOR_12 =3D 3
> >>>>This seems pretty generic. Just use 6, 8, 10, or 12 for values. And
> >>>>drop the vendor prefix.
> >>>Please think about this some more.  What does "color-depth" mean?  Doe=
s it
> >>>mean the number of bits per colour _component_, or does it mean the to=
tal
> >>>number of bits to represent a particular colour.  It's confusing as it
> >>>stands.
> >>Then "component-color-bpp" perhaps?
> >There should be no need to have this in DT at all. The BPC is a property
> >of the attached panel and it should come from the panel (either the
> >panel driver or parsed from EDID if available).
>=20
> Actually I have send an email about this one to you in version 2, just pa=
st
> from that email:
>=20
> "samsung,color_space" and "samsung,color-depth"
>=20
> The drm_display_info's color_formats and bpc indicate the monitor display
> ability, but
> the edp driver could not take it as input video format directly.
>=20
> For example, with my DP TV I would found "RGB444 & YCRCB422 & & YCRCB444"
> support in drm_display_info.color_formats and 16bit bpc support, but RK32=
88
> crtc
> driver could only output RGB & ITU formats, so finally analogix_dp-rockch=
ip
> driver
> config crtc to RGBaaa 10bpc mode.
>=20
> In this sutiation, the analogix_dp core driver would pazzled by the
> drm_display_info,
> can't chose the right color_space and bpc.
>=20
> And this is the place that confused me, wish you could give some ideas ab=
out
> this one :-)

Your display driver should choose whatever it is capable of outputting.
If the display reports that it can do 16 bits-per-color, but your
display driver can't do it, then it should choose a configuration that
it supports. Similarily for the color encodings. If you can't generate
YCrCb444 with your hardware, then it's the driver's job to know about
that and select the next appropriate configuration.

But hard-coding this is not the right solution because the value in DT
may end up conflicting with what the display reports.

Thierry

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3D4kAAoJEN0jrNd/PrOhqPcQAJSGUCn4e+nkhR0y81v5wv1i
iQxQoqVEs6zze7Ye890IXGt+Ke2XI/Iy3nFibZ8pJfLn1jwb8/EktH4GgoMe0Cy/
PvnaAB5eKekS0Q93ZcB22wGVcPxBBrpiyX0mT2nEwz/pYoceuSTquOwOMWqIHyK+
66tbPyzo2JLisl3x2ifUxnzUXjnthCVpniFfYUoKYal8rqrPt7/jLpjiMrI/hvWb
vAZDadtguHpuJG7dIQupr9LYZIlNvG4dNdHzsgGShxvP9BbIgG0QRW1YbKCE1K9T
HUUK35lnevqsSXE2kJHJsNkUYAjbLiOEFcklmuohuDQa5YzCXNleOrYKs2W5Sbej
PNRFykK81IGemuXTPrsj2Lrj+V66A8TuIsyxsfuHaVxhIZAMXzA7mCNnmEIEQ87/
PsMrfypl2JUWrZ2fd3BkdwhmnT/NDu9rQlCjuzGMIciyMERgp9HUYGZHBAeUI7Kj
GWAmam2HVq6t1BIUH4mA3Kx+cc3beVsmPVNS2JcWt84ZXSLqR7Hjc3BAuBPdtmlI
4jtxxzQb16UWtOWlD89aO9Csym3Fn3eJik0WCyhJyJNRM7856qUU/yEYC3fYVH3I
uyR2IEJaUhVYXzduP9I8gusutcwais5z06cZg+Pegz9ny9jHqgAsxSI5R1fWIhfe
jzImZIST8U/jk3Yn5xfX
=zxwc
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--
