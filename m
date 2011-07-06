From: Felipe Balbi <balbi@ti.com>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Wed, 6 Jul 2011 10:18:36 +0300
Message-ID: <20110706071834.GB10729@legolas.emea.dhcp.ti.com>
References: <0LN400HTOZEQDIL0@mailout1.samsung.com>
 <BANLkTikDDBQjE2RCeeBB50vokSTcnCO46A@mail.gmail.com>
 <20110622094923.GA23598@legolas.emea.dhcp.ti.com>
 <CAD6zSYOYUPpnovsxGWxiazKr3QnHhG78dfkctp3huvuNzdT4aw@mail.gmail.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog111.obsmtp.com ([74.125.149.205]:58656 "EHLO
	na3sys009aog111.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753129Ab1GFHSm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 03:18:42 -0400
Content-Disposition: inline
In-Reply-To: <CAD6zSYOYUPpnovsxGWxiazKr3QnHhG78dfkctp3huvuNzdT4aw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tmarri@apm.com, thomas.ab@samsung.com, a.kesavan@samsung.com


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 06, 2011 at 11:03:10AM +0530, Praveen Paneri wrote:
> >> > drivers should not live in arch/arm/*, why don't you move this to
> >> > drivers/usb/otg where the PHYs are staying right now ?
> >> PHY init/exit code can vary across SoCs. Wouldn't it be better to have=
 it in the
> >> SoC specific location?
> >
> > It will vary how ? If it's only regarding e.g. a different GPIO pin or a
> > different IRQ number, you handle that by passing data down to driver
> > (via platform_data or struct resource), now if it varies because a
> > different board uses a different PHY, then another driver should be
> > written (well, as long as it's really different from the one you have
> > now, otherwise you should see if it's worth making the existing driver
> > more flexible).
> We have only 4 registers which are used for phy control. The bit structure
> of these registers vary across the SoCs.
> 1) PHY power control
> 2) PHY clock control
> 3) OTG reset control
> 4) PHY tune
>=20
> To init/de-init the phy we just need to set the above 4 registers appropr=
iately.
> Do you still think there is a necessity for a separate driver ?

well, we do have the otg utilities on drivers/usb/otg/ ;-)

> I have gone through the reference drivers suggested by you.
> Functionality of this PHY
> control remains very less relative to those drivers.

on OMAP4 we have one "PHY" which actually only handle VBUS and ID pin
detection :-p

> I have removed a lot of ifdefery from the initial patches. The only
> problem I am facing is
> in implementing a generic register I/O method which can work for both
> ARM and PPC.
> Existing code for PPC was using following funtions
> in_le32, in_be32, out_le32, out_be32
> while in ARM readl and writel functions are used.
> kindly suggest a way out of it.

Can you use the versions on include/asm-generic/io.h ?
ioread8(addr), ioread16(addr), ioread32(addr)

--=20
balbi

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOFAxKAAoJEAv8Txj19kN1HFEIAJolCvBY+uSu3OEEnpTgJvke
HXz5v2w5es2O5Nw/LZaAskKnjFCI7PRWzSlJXaYYER5qOzNyRvf/AcS8uKirs/nD
QbZCUp9+m37b9OpJoZg2gMci+tMreEhYxup5eHgCu0T/Sfwurra2T3Cv5z8CyTa1
m1v9t43RHOytwdInvccoGczjC9JAcDgJm4EMT4HYNY9mnAUQufLTl2qvkbapbZ7m
fNiOCanl855oHSRc3XHbC4AUpBF/h80RmgQOUqvFk6WjJFI0ctgq2hg68CoKW5X7
ZIOYYDrod/Z1C1Qnz9cg8JXCw1z+HEHoEon1Q4wkjwOttoY1/WT+J/D84wLWhAM=
=O7WO
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
