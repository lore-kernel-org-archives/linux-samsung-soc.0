From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 11:12:48 +0200
Message-ID: <20150825091246.GA14034@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150824125758.GA7557@n2100.arm.linux.org.uk>
 <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh>
List-Id: linux-samsung-soc@vger.kernel.org

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2015 at 09:48:27AM -0500, Rob Herring wrote:
> On Mon, Aug 24, 2015 at 7:57 AM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Sun, Aug 23, 2015 at 06:23:14PM -0500, Rob Herring wrote:
> >> On Wed, Aug 19, 2015 at 9:50 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> >> > +       -analogix,color-depth:
> >> > +               number of bits per colour component.
> >> > +                       COLOR_6 =3D 0, COLOR_8 =3D 1, COLOR_10 =3D 2=
, COLOR_12 =3D 3
> >>
> >> This seems pretty generic. Just use 6, 8, 10, or 12 for values. And
> >> drop the vendor prefix.
> >
> > Please think about this some more.  What does "color-depth" mean?  Does=
 it
> > mean the number of bits per colour _component_, or does it mean the tot=
al
> > number of bits to represent a particular colour.  It's confusing as it
> > stands.
>=20
> Then "component-color-bpp" perhaps?

There should be no need to have this in DT at all. The BPC is a property
of the attached panel and it should come from the panel (either the
panel driver or parsed from EDID if available).

> > When we adopted the graph bindings for iMX DRM, I thought exactly at th=
at
> > time "it would be nice if this could become the standard for binding DRM
> > components together" but I don't have the authority from either the DT
> > perspective or the DRM perspective to mandate that.  Neither does anyone
> > else.  That's the _real_ problem here.
> >
> > I've seen several DRM bindings go by which don't use the of-graph stuff,
> > which means that they'll never be compatible with generic components
> > which do use the of-graph stuff.
>=20
> It goes beyond bindings IMO. The use of the component framework or not
> has been at the whim of driver writers as well. It is either used or
> private APIs are created. I'm using components and my need for it
> boils down to passing the struct drm_device pointer to the encoder.
> Other components like panels and bridges have different ways to attach
> to the DRM driver.

I certainly support unification, but it needs to be reasonable. There
are cases where a different structure for the binding work better than
another and I think this always needs to be evaluated on a case by case
basis.

Because of that I think it makes sense to make all these framework bits
opt-in, otherwise we could easily end up in a situation where drivers
have to be rearchitected (or even DT bindings altered!) in order to be
able to reuse code.

Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3DGKAAoJEN0jrNd/PrOhqWYP/3FRXe2MSV8sTOWQTSyYsUJI
OoBNmVhZ4V1bRtgeCX5gO2pqWMDeRIjm0Z/s8o0YhyVBoantkrcpdvaj/+1ek3iy
vS6qOuhwZi5lw4api9pxEsq0qBk55JFWPlRmAs33M8ZUt/6vfGilPXfjYXO7M5L6
uj3iUgv3ALNW8FBx0JJ6Pgq/AcXMHa/hov+DmmlpD0EboGcrE2E9kqkc4eQu+p74
n+kX32xEfR6H2OAeQhjXhnJzqeHRtCjGAVvrigyUtRBfFi+0WiguVxZMUGyzgtLm
4CTHRNfTYtBjfe1arqeRA/LCOqk3d5yT/6eeuoPgPc5Yf1Ew2gQi3V7XVMVHSvdE
Ie34FcCrsJM/GEbiTHPzXniEvbNtCzFEAjd4FlUjYRcyW3KAHjS7zLqqdomO54kV
nT2SpaF0QIPCFLD9h/6AM0e3fpEwUm3n66XktgAnWb94FzsP6KA7REhMM8X046aw
omTjjRsy5HWScdICMDlXLVKjJ5/nOVpphY2UzYY4yD3IJ62tlH7q3J8KjbZAgeym
Yjd7uRA+x1RWwz/jcGG37EG4vGW/dsQfNlmXT+x70kypKO171wbcVG93f6gKraGu
YVK9sXXxwd1wdRR2Uwj2ybuaLZqm9KAwVF/vgME4Kke5veWffFddp373e2i4UGGW
nkFvaNNFwlZhuW07YruI
=74cw
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
