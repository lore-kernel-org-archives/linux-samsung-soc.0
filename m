From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] usb: phy: samsung: let it be built as a module
Date: Wed, 27 Feb 2013 14:24:53 +0200
Message-ID: <20130227122453.GJ8016@arwen.pp.htv.fi>
References: <CAFp+6iEfVSbyGVNhDFc2wW7w=ZMGwVpcc28GAGOgHffCWQRLMQ@mail.gmail.com>
 <1361962133-21296-1-git-send-email-balbi@ti.com>
 <CAFp+6iHx0-UX4g3BVwFM1V=4JuJHe0VRE=CTLmEY5qEt1YqNjg@mail.gmail.com>
 <20130227121334.GF8016@arwen.pp.htv.fi>
 <CAFp+6iG18xWLY3Z77LUfCBrGhNMm5iHFE7xMCjo-TeJxhoT6jg@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiQKDdln2jY//0TJ"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:38271 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756721Ab3B0MZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Feb 2013 07:25:01 -0500
Content-Disposition: inline
In-Reply-To: <CAFp+6iG18xWLY3Z77LUfCBrGhNMm5iHFE7xMCjo-TeJxhoT6jg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: balbi@ti.com, Linux USB Mailing List <linux-usb@vger.kernel.org>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

--YiQKDdln2jY//0TJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2013 at 05:47:29PM +0530, Vivek Gautam wrote:
> On Wed, Feb 27, 2013 at 5:43 PM, Felipe Balbi <balbi@ti.com> wrote:
> > Hi,
> >
> > On Wed, Feb 27, 2013 at 05:31:53PM +0530, Vivek Gautam wrote:
> >> Hi Felipe,
> >>
> >>
> >> On Wed, Feb 27, 2013 at 4:18 PM, Felipe Balbi <balbi@ti.com> wrote:
> >> > There's no reason not to allow samsung PHY
> >> > drivers be built as modules. This patch changes
> >> > Kconfig to allow that.
> >> >
> >> > Signed-off-by: Felipe Balbi <balbi@ti.com>
> >> > ---
> >> >
> >> > Hi,
> >> >
> >> > I will take your patches but I'm planning to add this on top
> >> > as there is no reason not to allow these drivers being built
> >> > as modules.
> >> >
> >>
> >> aargh !! my bad :-(
> >> actually missed exporting the symbols in drivers/usb/phy/samsung-usbph=
y.c
> >> Getting compile errors.
> >> Shall i just update the patch [PATCH v5 0/2] Adding USB 3.0 DRD-phy
> >> support for exynos5250
> >> or send a separate patch on top so that you can squash this change
> >> along with. ;-)
> >
> > there's still time to update the original. I'll drop all 3 patches for
> > now (both of yours and mine).
> >
>=20
> Alright, i shall update the original patches and resend them after
> adding this change for
> EXPORT_SYMBOL_GPL() and also squashing your change for "modules".

k, thanks

--=20
balbi

--YiQKDdln2jY//0TJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRLfsVAAoJEIaOsuA1yqRE3ZcP/3QETYC54Ps/nP8wJXjp0Ne5
GKfQ2UYAssKpM2fF9m66G9NqspwOSCmFsgL1dgnu8A9wt57nZyLHyrA1qlTF8QOD
TV9kXVMLDQ4uwCGeyMjW3x1qWPMktn/3e4qOn2OAdfRFu7vmqB9ywv1ueHyyOqG0
AChEHoxaXnOTNquHGZt73T6jPPX1+4l3xFZAKyf+yTq/vbgmi+keVXXS3Zjj9B8W
g3o6M2QY4lNYtnL58Pn6L8SX3m0uSvNM23H021nLzxPR1IpNpaHzGvYx2KlJWKgV
wGeq6Mbx310XhITUx0x55onB/ZDvFQVxSMpruT4QyFDVNfTwmYwQJt2o1crBr3Uh
tvKzswO4zkK/uEREiDUOrAR6pOYNquuUtEO+wD43OhOWcAFa+ik0hlQCtQp74n9l
+L/8bNB1adr2O8IZsNZVxSQwrdrfkk11qeIqECi10lRSx8wWBncm397wB9fnezNt
LXegr6tk64XzNYh8D57mzKV4f7q+AXR9/qBtnGaohr02FehqKWO2cXB5R3rnkngE
A7Vk3XxTKnHd+1zFWyLDkkV2K8yu3t+LQrUrg9ioQhBHwZ2rRBNV4aDVy8ViYNfN
M0cS1OwSKjymMgBEBdlUJQ/VPidMSSjkYcpGwAbCtzyGZPmvZdG8zNf3TtwWtVUM
yZvU7aNH+qJ9UlbbPUvm
=fwCx
-----END PGP SIGNATURE-----

--YiQKDdln2jY//0TJ--
