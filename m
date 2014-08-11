From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Mon, 11 Aug 2014 11:11:53 +0200
Message-ID: <20140811091151.GA25512@ulmo.nvidia.com>
References: <20140807135500.GA27417@ulmo.nvidia.com>
 <53E42BCB.5090608@samsung.com>
 <20140808070311.GA5387@ulmo>
 <53E47E23.1050302@samsung.com>
 <20140808095507.GE15852@ulmo>
 <53E85259.2000204@samsung.com>
 <20140811072414.GA30762@ulmo>
 <53E87252.60700@samsung.com>
 <20140811075043.GA31127@ulmo>
 <53E87BA7.2040208@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:56799 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528AbaHKJL7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 05:11:59 -0400
Received: by mail-pd0-f174.google.com with SMTP id fp1so10525119pdb.33
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Aug 2014 02:11:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53E87BA7.2040208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: treding@nvidia.com, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 05:15:35PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 11=EC=9D=BC 16:50, Thierry Reding wrote:
> > On Mon, Aug 11, 2014 at 04:35:46PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 11=EC=9D=BC 16:24, Thierry Reding wrote:
> >>> On Mon, Aug 11, 2014 at 02:19:21PM +0900, Inki Dae wrote:
> >>>> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 18:55, Thierry Reding wrote:
> > [...]
> >>>>> The above is actually more like this:
> >>>>>
> >>>>> 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
> >>>>> 		clear DSI_HS_CLK_CTRL;
> >>>>> 	else
> >>>>> 		set DSI_HS_CLK_CTRL;
> >>>>>
> >>>>> 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> >>>>> 		clear DSI_HIGH_SPEED_TRANS;
> >>>>> 	else
> >>>>> 		set DSI_HIGH_SPEED_TRANS;
> >>>>>
> >>>>> So for peripherals that don't support non-continuous clock mode, th=
is
> >>>>> will result in the following for low-power transmissions:
> >>>>>
> >>>>> 	clear DSI_HS_CLK_CTRL; /* HS clock always on */
> >>>>> 	clear DSI_HIGH_SPEED_TRANS;
> >>>>
> >>>> Right, then how host driver should check it if peripheral doesn't
> >>>> support non-continuous clock mode? Or how the peripheral should noti=
fy
> >>>> it to host driver? It would need a new flag instead of
> >>>> MIPI_DSI_MODE_NON_CONTINUOUS.
> >>>
> >>> MIPI_DSI_MODE_NON_CONTINUOUS is exactly the flag that devices need to
> >>> set to signal that they support non-continuous mode. If devices don't
> >>> have that set, then the controller should always provide the HS clock.
> >>>
> >>> So, if MIPI_DSI_MODE_NON_CONTINUOUS is *not* set, then the peripheral
> >>> does *not* support non-continuous mode.
> >>>
> >>
> >> Again, assume that there is a peripheral that doesn't support
> >> non-continuous clock mode but host driver want to transmit data in low
> >> power. For this, you already mentioned like below,
> >>
> >> "So for peripherals that don't support non-continuous clock mode, this
> >> will result in the following for low-power transmissions:
> >>
> >>  	clear DSI_HS_CLK_CTRL; /* HS clock always on */
> >>  	clear DSI_HIGH_SPEED_TRANS;
> >> "
> >>
> >> In this case, how should host driver check it to clear above two flags?
> >> As you know, this is required to clear two flags same as non-continuous
> >> clock mode. Don't you think that we need a new flag to identify them -
> >> non-continuous clock mode or just for low-power transmission?
> >
> > See what I wrote a little further up:
> >
> >>>>> 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
> >>>>> 		clear DSI_HS_CLK_CTRL;
> >>>>> 	else
> >>>>> 		set DSI_HS_CLK_CTRL;
> >>>>>
> >>>>> 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> >>>>> 		clear DSI_HIGH_SPEED_TRANS;
> >>>>> 	else
> >>>>> 		set DSI_HIGH_SPEED_TRANS;
> >>>>>
> >
> > MIPI_DSI_MODE_NON_CONTINUOUS specifies that a peripheral supports non-
> > continuous mode. When set, we clear DSI_HS_CLK_CTRL on Tegra because
> > that tells the controller to turn off the HS clock between high-speed
> > transmissions.
> >
> > MIPI_DSI_MSG_USE_LPM specifies that a message is to be sent in low-power
> > mode.
> >
> > With the above two flags we can cover four cases:
> >
> >   1) non-continuous mode with messages transmitted in low-power mode
> >   2) non-continuous mode with messages transmitted in high-speed mode
> >   3) continuous mode with messages transmitted in low-power mode
>=20
> In case of 3), it would mean "set DSI_HS_CLK_CTRL" and "clear
> DSI_HIGH_SPEED_TRANS". However, msg->flags has MIPI_DSI_MSG_USE_LPM but
> dsi->mode_flags has no MIPI_DSI_MODE_NON_CONTINOUS flag..... Ah, right.
> You mean that continuous mode is set by default implicitly?

Yes, if the MIPI_DSI_MODE_NON_CONTINUOUS flag is not specified, then it
means the peripheral supports only continuous mode.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT6IjXAAoJEN0jrNd/PrOhwI8P/0LJFuZnv73F5xBodietm/j6
I1lKJGz0tTg736JohVZKXzTRAxieieLOO7HcDn6vbV7uYd/+eVX7/yvP6sJ7eeX7
AiEiUZ0JcKb0z5ibhyy8ho/BrkEXsVbU1QDEizgHbDoNQ2/1z5vglet67ZVE3Uea
ZYAQWTp7Z+oPN09NRywGboO0Yo/DpV89DMZNEjM/iX2xaxleq/jAEixEfDH7+XCJ
6LoOIEL5tjS+Z5ankFKqKbVZI1fP9dHL9ZUoCDQx1CYrhEfffzYeW4ctNQb8fD3T
dXhfUcwG7YDHGghs9XI7sSD8tN2odSBmRtZO/9cwm0mI/ES7WPu4y2kcbChM/lla
WXq93oz48obaknpQQoF9qpqzAd14LSKnXFlgZ4k/2niqsyBoZSHLcKqA6DXQYlpC
x7IN+s9u/pNliRR6jPr4g766azBXH5rr63abZGsXAl8TjHHW9woVlD01oFpCVJiN
aQefrfLy3Y2FmIma0ChOQj6SBPbulSyTzVfQKlmQpzi4PstNDpjf4JsgjnxOIQqR
mD/eFuBzhQSpCsGcFQvSVyXDtd3cYcOvQJEgZYros3PNZl2he1uHnDj1d7eGQy0F
S/wrD+gRIMsymAIG5Qi+CrfSdD3kOUYyDGbCykwhhk5s2fjwxrmMVZz8KTzfCXGE
/zL+pOy5lS0pt2zGD2zi
=ASSK
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
