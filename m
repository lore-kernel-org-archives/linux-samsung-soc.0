From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 4/4] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Thu, 1 Oct 2015 17:03:55 -0500
Message-ID: <20151001220355.GB32355@saruman.tx.rr.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
 <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
 <20151001155018.GC4469@saruman.tx.rr.com>
 <2B3535C5ECE8B5419E3ECBE30077290901DC383B31@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2B3535C5ECE8B5419E3ECBE30077290901DC383B31@US01WEMBX2.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <John.Youn@synopsys.com>
Cc: "balbi@ti.com" <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 09:04:59PM +0000, John Youn wrote:
> On 10/1/2015 8:50 AM, Felipe Balbi wrote:
> > On Mon, Sep 21, 2015 at 12:16:12PM +0200, Marek Szyprowski wrote:
> >> DWC2 module on some platforms needs three additional hardware
> >> resources: phy controller, clock and power supply. All of them must be
> >> enabled/activated to properly initialize and operate. This was initial=
ly
> >> handled in s3c-hsotg driver, which has been converted to 'gadget' part
> >> of dwc2 driver. Unfortunately, not all of this code got moved to common
> >> platform code, what resulted in accessing DWC2 registers without
> >> enabling low-level hardware resources. This fails for example on Exynos
> >> SoCs. This patch moves all the code for managing those resources to
> >> common platform.c file and provides convenient wrappers for controlling
> >> them.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >=20
> > I just caught several build errors which this patch. I hope you can
> > send me a follow-up fix (which I can amend to $subject) otherwise
> > I'll have to drop this series
> >=20
>=20
> I forgot that this was initially part of a larger
> patch-set. Maybe that is causing issues? If this wasn't intended
> to go through Felipe's tree then my bad.
>=20
> Also, I noticed this patch causes deadlock warnings with lockdep
> enabled.
>=20
> Can you look into that also while you investigate this?

John, do you want me to drop the series meanwhile ? I can do that no proble=
ms.

--=20
balbi

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDa3LAAoJEIaOsuA1yqREXaEP/Rg2gGuh8WEfXd5DOLwPEcG9
T8510rrx8of9b5HZZTqMgTuuebFrmENXS4oG1Y9Cva/ZFXtZ4bZ7DcQg1IeV1c9G
V4vB2WaQ8cfvtofR4w6GTNLPuMukK+aEIBRjVZOs/09y0p6Bxnqv36UpXtyiYslK
aIobJWL79rrN91RNYuvQSu/AGBRjoHWVQb4By3y/ZxxRM/C6L6YMRwtNP75UV0YH
JbYlN7JGMnZXv5N9hkn+262t1RPu8/8WMKf+s8Sh8OTq0LeYD9SkgU1lhzNJroha
lGhiQ7IAihEJgI0sHz8JkqtBHsfQQvI0iSzPZ0HEi3Uuit7VQr3jphgQpthDNfs5
hTmT5ETypmqg5alpTv7TikRdpZNr83Sbue4yfR9MLVBfwNjKUmJSLIpRpZ3iDmu1
Zo2UHdlC9VIMlfjHBhVR3H9TwBsDAWquvMds4SWlnv8U3ohLAaFCEJrlphtV4F67
Wwb2OUTtnZbOiXIavdB+cw4OgrAzptR4qzqiSa70klXsDg+Sk1LKzTGNAF5segHQ
xcZq6kGb5TQPvjOV7ICTEq7mUjEW09P8bX9R9EAkMDortPL5UuctScKxD+SITfe2
V9EL8n4YVZkbQE30gBJzOWNwBvcip0QykvmX5hc78DKxpDC/dLgom3Pbucqi/cqD
pJGDBqi6fqjdtEx+Kza/
=uIL9
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
