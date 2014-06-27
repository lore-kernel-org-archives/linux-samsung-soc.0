From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos
 EHCI/OHCI
Date: Fri, 27 Jun 2014 10:59:00 -0500
Message-ID: <20140627155900.GN8069@saruman.home>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
 <20140627154608.GI8069@saruman.home>
 <CAD=FV=Xaf-vH79a88q94vOgc+nDhxhtnFdnRMxi1pmLd-mKYBg@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UExESr5xZTMxdOWv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:38597 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751874AbaF0P7L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 11:59:11 -0400
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xaf-vH79a88q94vOgc+nDhxhtnFdnRMxi1pmLd-mKYBg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Felipe Balbi <balbi@ti.com>, Sachin Kamat <sachin.kamat@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vivek Gautam <gautam.vivek@samsung.com>, Sachin Kamat <spk.linux@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>

--UExESr5xZTMxdOWv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2014 at 08:55:31AM -0700, Doug Anderson wrote:
> Felipe,
>=20
> On Fri, Jun 27, 2014 at 8:46 AM, Felipe Balbi <balbi@ti.com> wrote:
> > On Thu, Jun 26, 2014 at 11:09:37AM +0530, Sachin Kamat wrote:
> >> EHCI and OHCI drivers on Exynos platforms do not work without their
> >> corresponding SoC specific phy drivers. Hence it makes no sense to
> >> keep these phy drivers as user selectable. Instead select them from
> >> the respective USB configs to make things easier for the end user.
> >> While at it enable 5250 phy for Exynos 5420 SoC too.
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> >> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> >
> > no more selects, please. We've already had way too many issues because
> > of misused selects.
>=20
> I'll admit to not having been involved with the previous discussions,
> but this seems strange to me.  Are we throwing in the towel and
> deciding that it's too hard to get the Kconfigs right and that we'll
> just rely on individual users to figure out the right answer for
> themselves?

no. select prevents a driver from be built as a dynamically linked
module and distro-kernels might want to enable everything as modules.

> Certainly the Exynos USB driver is not useful without the Exynos USB
> Phy driver, so it seems awfully strange to allow the user to select
> one without getting the other...  ...and if including an extra USB Phy
> driver will break something then it seems like we have bigger problems
> (aren't we supposed to have one kernel that works across a wide
> variety of boards?)

yeah, but for the kernel to "work" it doesn't depend on the PHY driver,
does it ? The USB parts of the SoC depend on the PHY, but even PHY
drivers should be allowed to be built as modules. Find another way

--=20
balbi

--UExESr5xZTMxdOWv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTrZTEAAoJEIaOsuA1yqREk3cP/jGpKB17nBOVnQwWQY+76tiE
+U964LJVHXJve+PG5mdlcroxar4T7F4PgQDZuOAlg3dPRoB46FzKyod54kdMA72l
+hBqLeAZ9X46g8UGOnf3TMDc8ecG2x80PJ5fia/h5T5fJ4w+EEm6sRsQ6/grxK2q
9f16bNeZGFd5OopwVAbUJzY3fLnxKTJfpAC+myeILfZ7nWJWZFs4jUdZ7Nu4niHI
bWhaTJ4szM34Yz13Pc01fem0bSnZwwPbx4JVcVKV4R5OmzUKstYlcUIthQTrr3QL
HedNzh81Epbkc0hwFzwlg0VS4SSWyZp+Y4TcGgxepsGcsPbi5fid9eNa6X53aSNY
Ej5oXbprmth2c0KiFBfr6P6fnJwcK/cpWd8lfUpTMpOeyAMNb/4Uc9KPtTsYEevV
WRimlqzLu1C/iD6/wUBt7Cqg0N4tnalS52xipQ5tsKCgd3oplWutgpG7pCFtKl5q
oGSIOo0c+zVpL4zpjFMICZB2ddYfEUV+raOQBVusnzub8TCGewVXBTgj+f7MOIuL
HGSimS2rVgur72XEgAPmRXzjDujoEA5hsoO2e758pmZcREa4G4GynkcbAaZU0lK7
sYXhsxWf/s8HiiSdta69bsue9X+XYsq0O8vRmdehP9Sb3tCh0QC6AJrFXRsKrcuB
RMy0MeGiejqhOSVc/SFF
=8eFc
-----END PGP SIGNATURE-----

--UExESr5xZTMxdOWv--
