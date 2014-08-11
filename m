From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Mon, 11 Aug 2014 09:50:44 +0200
Message-ID: <20140811075043.GA31127@ulmo>
References: <20140807131713.GB1540@ulmo.nvidia.com>
 <53E38191.1050308@samsung.com>
 <20140807135500.GA27417@ulmo.nvidia.com>
 <53E42BCB.5090608@samsung.com> <20140808070311.GA5387@ulmo>
 <53E47E23.1050302@samsung.com> <20140808095507.GE15852@ulmo>
 <53E85259.2000204@samsung.com> <20140811072414.GA30762@ulmo>
 <53E87252.60700@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0204557137=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53E87252.60700@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, treding@nvidia.com, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============0204557137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 04:35:46PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 08=EC=9B=94 11=EC=9D=BC 16:24, Thierry Reding wrote:
> > On Mon, Aug 11, 2014 at 02:19:21PM +0900, Inki Dae wrote:
> >> On 2014=EB=85=84 08=EC=9B=94 08=EC=9D=BC 18:55, Thierry Reding wrote:
[...]
> >>> The above is actually more like this:
> >>>
> >>> 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
> >>> 		clear DSI_HS_CLK_CTRL;
> >>> 	else
> >>> 		set DSI_HS_CLK_CTRL;
> >>>
> >>> 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> >>> 		clear DSI_HIGH_SPEED_TRANS;
> >>> 	else
> >>> 		set DSI_HIGH_SPEED_TRANS;
> >>>
> >>> So for peripherals that don't support non-continuous clock mode, this
> >>> will result in the following for low-power transmissions:
> >>>
> >>> 	clear DSI_HS_CLK_CTRL; /* HS clock always on */
> >>> 	clear DSI_HIGH_SPEED_TRANS;
> >>
> >> Right, then how host driver should check it if peripheral doesn't
> >> support non-continuous clock mode? Or how the peripheral should notify
> >> it to host driver? It would need a new flag instead of
> >> MIPI_DSI_MODE_NON_CONTINUOUS.
> >
> > MIPI_DSI_MODE_NON_CONTINUOUS is exactly the flag that devices need to
> > set to signal that they support non-continuous mode. If devices don't
> > have that set, then the controller should always provide the HS clock.
> >
> > So, if MIPI_DSI_MODE_NON_CONTINUOUS is *not* set, then the peripheral
> > does *not* support non-continuous mode.
> >
>=20
> Again, assume that there is a peripheral that doesn't support
> non-continuous clock mode but host driver want to transmit data in low
> power. For this, you already mentioned like below,
>=20
> "So for peripherals that don't support non-continuous clock mode, this
> will result in the following for low-power transmissions:
>=20
>  	clear DSI_HS_CLK_CTRL; /* HS clock always on */
>  	clear DSI_HIGH_SPEED_TRANS;
> "
>=20
> In this case, how should host driver check it to clear above two flags?
> As you know, this is required to clear two flags same as non-continuous
> clock mode. Don't you think that we need a new flag to identify them -
> non-continuous clock mode or just for low-power transmission?

See what I wrote a little further up:

> >>> 	if ((flags & MIPI_DSI_MODE_NON_CONTINUOUS) =3D=3D 0)
> >>> 		clear DSI_HS_CLK_CTRL;
> >>> 	else
> >>> 		set DSI_HS_CLK_CTRL;
> >>>
> >>> 	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
> >>> 		clear DSI_HIGH_SPEED_TRANS;
> >>> 	else
> >>> 		set DSI_HIGH_SPEED_TRANS;
> >>>

MIPI_DSI_MODE_NON_CONTINUOUS specifies that a peripheral supports non-
continuous mode. When set, we clear DSI_HS_CLK_CTRL on Tegra because
that tells the controller to turn off the HS clock between high-speed
transmissions.

MIPI_DSI_MSG_USE_LPM specifies that a message is to be sent in low-power
mode.

With the above two flags we can cover four cases:

  1) non-continuous mode with messages transmitted in low-power mode
  2) non-continuous mode with messages transmitted in high-speed mode
  3) continuous mode with messages transmitted in low-power mode
  4) continuous mode with messages transmitted in high-speed mode

What other cases do you think we need to support?

Thierry

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT6HXTAAoJEN0jrNd/PrOhURcP/A403vLhSg+8ORQzOQ0OwcNa
J90wn778vvCjgilbtInu1e4ox4tPRr/J8RO82qy2kKSeeyJ9cdTONDdcIHpU3Urp
URPR/N4NjNBVPsO3t3yZKj65xF4tqaCqfliUjI0pldFnTkzN7nvT2C9V1Grn3tqV
xXDrslzeMW7UCtJCSMdse0QqOfz75nTLwN3sBKI6kA/MMiuUQ/PKzl/KA6LWzftX
KputBFMMbVHtCTJr84P4yTAQP5voSzE1wDstb+dE32WrKd88FR7+It9VYJe4pLbi
JTwx0FgS6/QzUHqtprKOoTkfABjzj1q/NjM5eDYnVSVBaynVLElBW1EC8CPcTilA
ynVnV1Adb/TeqvsHcgrDZuBCkX34+VOa0p6gSRZknFsWPy6te0uDJJ+PFdKJbLkh
x+Xcse64iLwOXIvI1Cs9eLBmxel5DPHyPInD2gT5vKnw5uGzygviBeDp8vKNhvPT
thD6y3fkxWPY14OyhHyxWdRJmNHL3Ma1Qh6K+uHLPMuZEnEAwOnMEWOoYOcusajQ
3AHXnosy2q+kMbYvWncZacrWSKF+1M54Lo5JXEw2ioH/iArBderQkb14NPLqupIN
OgkRuC6NfTqRXp7emV6UxCJTj20ag0mhfFgDIGuKmZZ6+nrUCjR757Lm8Ez5Z0mU
65LGAmVKJ8Oiy2xvSMw+
=sAQL
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

--===============0204557137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0204557137==--
