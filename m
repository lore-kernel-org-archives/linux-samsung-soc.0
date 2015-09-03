From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v4 14/16] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Thu, 3 Sep 2015 11:04:40 +0200
Message-ID: <20150903090421.GC3784@ulmo.nvidia.com>
References: <1441086371-24838-1-git-send-email-ykk@rock-chips.com>
 <1441088079-25809-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqJDALnjVaVoEqGGsSLeE31m3MKOfbSoZ3M+g+zPZR2MFg@mail.gmail.com>
 <55E7CC43.7040608@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55E7CC43.7040608@rock-chips.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Rob Herring <robherring2@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Yao <mark.yao@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, djkurtz@chromium.com, dianders@chromium.com, seanpaul@chromium.com, Ajay kumar <ajaynumb@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Andy Yan <andy.yan@rock-chips.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, architt@codeaurora.org, dri-devel <dri-devel@>
List-Id: linux-samsung-soc@vger.kernel.org

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 12:27:47PM +0800, Yakir Yang wrote:
> Hi Rob,
>=20
> =E5=9C=A8 09/03/2015 04:17 AM, Rob Herring =E5=86=99=E9=81=93:
> >On Tue, Sep 1, 2015 at 1:14 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> >>Some edp screen do not have hpd signal, so we can't just return
> >>failed when hpd plug in detect failed.
> >This is a property of the panel (or connector perhaps), so this
> >property should be located there. At least, it is a common issue and
> >not specific to this chip. We could have an HDMI connector and failed
> >to hook up HPD for example. A connector node is also where hpd-gpios
> >should be located instead (and are already defined by
> >../bindings/video/hdmi-connector.txt). Perhaps we need a eDP connector
> >binding, too.
>=20
> Yep, I agree with your front point, it is a property of panel, not specif=
ic
> to eDP controller, so this code should handle in connector logic.

=46rom your description it sounds more like this is in fact a property of
the panel. Or maybe I should say "quirk". If the panel doesn't generate
the HPD signal, then that should be a property of the panel, not the
connector. The eDP specification mandates that connectors have a HPD
signal, though it allows the "HPD conductor in the connector cable" to
be omitted if not used by the source. I'd consider the cable to belong
to the panel rather than the connector, so absence of HPD, either
because the cable doesn't have the conductor or because the panel does
not generate the signal, should be a quirk of the panel.

That said you could have a panel that supports HPD connected via a cable
that doesn't transmit it, so this would be a per-board variant and hence
should be a device tree property rather than hard-coded in some panel
driver.

Conversely, if the panel isn't capable of generating an HPD signal, then
I don't think it would be appropriate to make it a DT property. It would
be better to hard-code it in the driver, lest someone forget to set the
property in DT and get stuck with a device that isn't operational.

Thierry

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV6A0fAAoJEN0jrNd/PrOhspAP/A7VKt1TDARJVctfAoMWcCT7
fn58nkkawMBcqWq7SaGCfzQjM2/XyrDVzlRTc9NexIh7VM0f0+QCEDRcCzjLYFpA
DCma0OXyiEFIwivSynJ3I67kO+Nf5QlgdLx8JVsm9k+xeRnlbmt1++nFDjQ2Zljq
9YZK5kJQy9nU49VUYLlOzm5LXPvu3oumnMPMx6EIhkmlu3J0N0EfnRHsd69wjMgD
I+e/8xxcYQaxC7gqAk6GqKMWIiXhBSrdvJR1BYiV+Gb+8x+AfcveicAVOt+27sAz
uwZRcZqYtvm77lEqFj9Fv2M19WeuWgX70zMA1RIBNxzjdEDoUpdFHXkFrWG6y4mX
no97fWAEnGbO0HJyRfLfsGt6QuMmIVQzszAaVU5NjKWsB1d5V4Nv91vjQ2ggJNGW
bNnDpp+VqCVoxhrsDKoiCk75G2WVmsb6uoW2Y0plZTm5tOQeEA6h5jdefVH2VgHL
jKxp0dybDjzHgi9Yp54B8bjUqATft7O9lC81FBbDJtksaI+MpxS6u1yIvZ53Rd20
5LujXqBiDUw+MC9hvDML/aF6zqAXix+Iies4MwUdW8oSlSrfBufB9MvA949KnUvv
7tIha/8WQGpXpM0kLZZs9TuwPduiiVHbO/8m24XDxcpD5v+E2oW2ce7r881A+hZG
vQV6bES6dJCG3eI/GcdO
=cXPI
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
