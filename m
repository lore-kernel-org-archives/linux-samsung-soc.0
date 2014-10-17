From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/9] usb: dwc2/gadget: report disconnect event from 'end
 session' irq
Date: Fri, 17 Oct 2014 14:20:39 -0500
Message-ID: <20141017192039.GB26260@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-2-git-send-email-m.szyprowski@samsung.com>
 <20141016133339.GF3480@saruman>
 <5440F0FB.609@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="avNtfD0ffNO6L/9g"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:60535 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753805AbaJQTUx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Oct 2014 15:20:53 -0400
Content-Disposition: inline
In-Reply-To: <5440F0FB.609@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--avNtfD0ffNO6L/9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2014 at 12:35:39PM +0200, Marek Szyprowski wrote:
> Hello,
>=20
> On 2014-10-16 15:33, Felipe Balbi wrote:
> >On Thu, Oct 16, 2014 at 02:57:57PM +0200, Marek Szyprowski wrote:
> >>This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> >>interrupt to correctly notify gadget subsystem about unplugged usb
> >>cable.
> >>
> >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>---
> >>  drivers/usb/dwc2/gadget.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >>diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> >>index 7b5856fadd93..119c8a3effc2 100644
> >>--- a/drivers/usb/dwc2/gadget.c
> >>+++ b/drivers/usb/dwc2/gadget.c
> >>@@ -2279,6 +2279,12 @@ irq_retry:
> >>  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> >>  		writel(otgint, hsotg->regs + GOTGINT);
> >>+
> >>+		if (otgint & GOTGINT_SES_END_DET) {
> >looks like this should be done for GINTSTS_DISCONNINT.
>=20
> I also would like to report it from that interrupt, but according to
> DWC2 databook (version 2.81a) and my observations on Samsung Exynos
> SoCs, DISCONNINT interrupt is asserted only in host mode, so in device
> mode we need to use something else.

If that's the case, then I withdraw my comments. I don't have access to
HW or docs about this IP, it just looked suspicious :-)

--=20
balbi

--avNtfD0ffNO6L/9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUQWwHAAoJEIaOsuA1yqREg2UP/2h7pu0Eo32wOeookiPhDo/q
3SNhR+s1ZA3JZEphJRSh8Km4uHlnhhWA9Vu/wprfwTX6CKJsEb95fzRCryz52ZI1
VeuBY/cQbFQcvhyxZNj6R/SqVMaAXyl2cG6vAlC/Z8wMX7jLegv53ULlT3ICmIHq
Opnje/sHf1e5ATL8cWCP/Han5FKOY4dxmd0LbjH7Hz3yVlPigPm9e6zlQp/NXx3j
5Uo+KcRpnlK2w36uOgvdn7BztT6Vi7DmHGsn9PotsFSXlHujdfLMD9Sdfiq/t2Ou
Riyzxb0GdWJm+AlPoXNJFi15z1mmfMcdRkgJAkqzKgxSloTWMT5z/CBc5w/Ds4MQ
0I2c7QVYEgfNlxYwgy4UHHzjPQC/5A3pJrGUECTz+RvHnl935u8PpPqB2DlEv67H
ZIUP017JWZ39kq2OZ256qkb6AmaBaZ7jd8T00GpsZpHmDnC0J3hazE7hM0DKwDtF
BFT7RKC1fuyFKgwSH6tsmFGcpyFK1psJ6ZLID/0MCcjFMUepm/lgFsaneRN1A1VL
FVQAICUsbqaZTF9D2ACb/PuUxWpFc9RHfI44HllWVh7+jyY9fVbpmEKRddS/lgRT
EWa1TjYUWfugMALQCcq9CBuAkq71iZfSgSVvtecFF3h/mESzC3fFY+VedOxd5g3o
jHxONdln6lgpMKZrg8Zq
=CPpy
-----END PGP SIGNATURE-----

--avNtfD0ffNO6L/9g--
