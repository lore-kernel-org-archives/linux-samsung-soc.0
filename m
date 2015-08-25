From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 06/14] Documentation: drm/bridge: add document for
 analogix_dp
Date: Tue, 25 Aug 2015 12:40:01 +0200
Message-ID: <20150825104000.GE14034@ulmo.nvidia.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995834-18363-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLz+8RtBucctUj4euXZ3Ac0DvB52N9ONpAerh5T9BiTJg@mail.gmail.com>
 <20150824125758.GA7557@n2100.arm.linux.org.uk>
 <CAL_JsqKZYMMzV9Sc2r3K_rnM0FNuyb1TyJEhjGq1Hf7dTiWFKQ@mail.gmail.com>
 <20150825091246.GA14034@ulmo.nvidia.com>
 <20150825092939.GM7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15111 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754657AbbHYKlZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 06:41:25 -0400
In-Reply-To: <20150825092939.GM7557@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robherring2@gmail.com>, Yakir Yang <ykk@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Sean Paul <seanpaul@google.com>, Takashi Iwai <tiwai@suse.de>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Doug Anderson <dianders@google.com>, Rob Herring <robh+dt@ker>

--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2015 at 10:29:39AM +0100, Russell King - ARM Linux wrote:
> On Tue, Aug 25, 2015 at 11:12:48AM +0200, Thierry Reding wrote:
> > On Mon, Aug 24, 2015 at 09:48:27AM -0500, Rob Herring wrote:
> > > It goes beyond bindings IMO. The use of the component framework or not
> > > has been at the whim of driver writers as well. It is either used or
> > > private APIs are created. I'm using components and my need for it
> > > boils down to passing the struct drm_device pointer to the encoder.
> > > Other components like panels and bridges have different ways to attach
> > > to the DRM driver.
> >=20
> > I certainly support unification, but it needs to be reasonable. There
> > are cases where a different structure for the binding work better than
> > another and I think this always needs to be evaluated on a case by case
> > basis.
>=20
> It can't be a case-by-case basis.
>=20
> The TDA998x encoder/connector is going to be component only.  This is
> a generic chip, which can be attached to the output of any parallel
> RGB+sync+clock bus.  In other words, it could appear anywhere.
>=20
> Are you really saying that we need to support multiple schemes of
> attaching the driver to DRM?  That's totally insane IMHO.

No, what I'm saying is that we should have a single scheme, but one
that doesn't put any restrictions on what kind of DT binding you use or
how your driver is architected.

> The problem with the drm_encoder_slave stuff is that you can't sanely
> attach of-nodes to the drm-created i2c device.  Yes, you can parse
> them from the DT file as a sub-node of the upper device, but that
> then goes against the principle of the I2C bindings, which is to
> list the I2C devices as a child below the I2C adapter node.  If you
> try and put the DT node there, then the OF code will create the I2C
> device for you, and the drm_encoder_slave stuff won't have the
> control it needs to communicate through the wrapped i2c_driver
> stuff.
>=20
> So, tda998x is going component-only, as that's the _only_ sane solution
> for it.

Has anyone ever considered turning it into a DRM bridge driver? I had
always envisioned component/master to be primarily useful to glue
together various SoC components to form one componentized device. Now
if tda998x is an I2C slave it is external to the SoC (auxiliary), so
in my opinion much better off as a bridge driver.

Bridge drivers don't come with any of the disadvantages that the
drm_encoder_slave stuff has. They are regular drivers that are probed
via their parent busses (I2C, platform, SPI, ...) and hook into DRM via
an abstract interface. The DT aspect is taken care of automatically
because they get instantiated by their parent bus like any other device.

> Now, what happens when some other DRM driver wants to use the tda998x
> driver, and its bindings are not compatible with the component helpers?
> They're pretty much stuck up the creek without a paddle.

I'm sure that will be very helpful response for whoever's going to end
up having to deal with that situation.

> Case by case doesn't work unless you're talking about truely isolated
> hardware where no one shares anything.

There are two different things here. The inter-driver interface, which,
in my opinion, it makes a lot of sense to standardize. Like I mentioned
above I think it unwise to make this interface depend upon a framework
or the firmware description such as DT in order to avoid unnecessary
restrictions. The second, orthogonal, issue, is the DT bindings. Those
I think should absolutely be designed case by case and select whatever
most accurately describes the hardware.

Thierry

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3EX9AAoJEN0jrNd/PrOhD2QP/jtwv3RVheZOgzp+TqnLPHL+
tNq1fp4ie1caKGwwTs+iMWQCkB2Q2EAb7CXjWXdeYLhIJpplWeksJCZ3OR4cDvYA
M6zwCD8T8mADMiKvPAdtNnp3AKAo3yjBoVV22V+pM1KJxDOP/m/ngW0ePRD/iwSc
DJxCr/XMZi4hP0sTbWPVY+AsNvzJw/eaTpANmqO82+h5C2b67LNe2c+usiegQlwn
r8HBKbHXd++mVyI7OwbAsZcbG0ML50Q7GDgzEvM6+G3xjWyXhp382bg9waC5kzWW
AJ2CGjXs3STGx53DDZ7XAarM/mm/AzZlNIjDQumcX2oBCzPwmMLTm7L+lQkgQKPo
k9ZzslA5jET8N8GA00Sbvtl+wIg0Ga1n29Lfp7whuE7bdaMkMXANxg+sUnYg/1r+
1Fc2fV4uSYF2rgpTTWPZfjyxnDS53YrTTVcttpQvVMtU6Q9XdWYu7+KSZJ6hT1pT
J6kiFjjkKtVMwSoUlHVHcijNTVBoHwbkdXl6HFelhzHo1wORxx438Cc9uXgnCPt5
jHsGC2XtOzNOH4EWV8uFljTB1Tq4H+RQTN9kOD0D/jEFJIgvAqeDQ+NQtm4c3iVS
QHUuFXPjZR3dqqcTQZoV0nSl1t9xPU3w/1J9PazwEfCiKjorHKCkfqFJ/BZcdNiE
AZNIuZ3ilzqoml6kV5LD
=Ildr
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
