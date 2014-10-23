From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v2 04/10] usb: dwc2/gadget: disable phy before turning
 off power regulators
Date: Thu, 23 Oct 2014 13:58:27 -0500
Message-ID: <20141023185827.GF21407@saruman>
References: <1413801940-31086-1-git-send-email-m.szyprowski@samsung.com>
 <1413801940-31086-5-git-send-email-m.szyprowski@samsung.com>
 <20141023150116.GH13573@saruman>
 <A2CA0424C0A6F04399FB9E1CD98E0304844E546E@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:48252 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062AbaJWS6s (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Oct 2014 14:58:48 -0400
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304844E546E@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: "balbi@ti.com" <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2014 at 06:15:57PM +0000, Paul Zimmerman wrote:
> > From: Felipe Balbi [mailto:balbi@ti.com]
> > Sent: Thursday, October 23, 2014 8:01 AM
> >=20
> > On Mon, Oct 20, 2014 at 12:45:34PM +0200, Marek Szyprowski wrote:
> > > This patch fixes probe function to match the pattern used elsewhere in
> > > the driver, where power regulators are turned off as the last element=
 in
> > > the device shutdown procedure.
> > >
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >=20
> > Paul, can I have your Acked-by here so I can send this to v3.18-rc1 ?
>=20
> Sorry, I've been working on a really hot issue at $work and didn't have
> time yet to review this series.

don't worry, we've all been there :-)

thanks

--=20
balbi

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUSU/TAAoJEIaOsuA1yqREOxEP/iYIjx8ZrV0i5NS5XMEr45rZ
2/GUIRZ3DPjIHUIikbymb1H8+7xkVOOjcXb+5FAojOAIBnI6uzkFVjJdyVFUWrab
AXS1oBF7f205H6fXFXKnvRRnlOCzlRs7lVaaCp4y2Ij5pJh0VoXKWJlQJ+8qc013
jtdjSBCg7y+Yb5WID9QjCcRNZAXh4cGCL7MFpCfRlTKZprgBnHlRpwr28G0VYwq3
Fiz38rrdq0giwLZ8NbNyBjF1H3nZOhO1/9aF7JDp4tIiiglLJT2P8x7aHZ+QC+wz
9UM5N4OfWD510YMqg+tfYfiGXxtEOME3xhFwocezIqKc0I/5+WG7eOPWkPmwVgJQ
9r3lhTWODJhBRh2CzvN4GB2lPpzPiM4IC7SiHey6f25GBew9QrngfkNn3KWEkzfR
XmVvSmokm8Zc0ywnWYlkOAdjHMrAM+WhEAVtvHmeMNtFIMoGctpZ2JPFVMOCPRG2
Bw11byrdwCQkg65FLz0kpXStbVa/XOCbNe/iXHv5vvM5Y87CZ9j5Yt0q8qt4XDLd
Mh8ExKf0S7yN3fjnedROKK2ZKixYARLLDPDWEyF7gLJblMdb4r0N9Zhv8z7N8AZL
xaWFo3lsOM4BIvGsB+EVtnuEcw1xSo+VfVzog2xg+fP+0M2nQ45bql88L+LMqXPv
eO5RLYfzLOYHELcWl+nF
=IFiz
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
