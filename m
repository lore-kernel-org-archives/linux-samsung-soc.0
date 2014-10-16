From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 2/9] usb: dwc2/gadget: fix enumeration issues
Date: Thu, 16 Oct 2014 08:34:25 -0500
Message-ID: <20141016133425.GG3480@saruman>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
 <1413464285-24172-3-git-send-email-m.szyprowski@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0qt3EE9wi45a2ZFX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:38066 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752296AbaJPNej (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Oct 2014 09:34:39 -0400
Content-Disposition: inline
In-Reply-To: <1413464285-24172-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Paul Zimmerman <paulz@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

--0qt3EE9wi45a2ZFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2014 at 02:57:58PM +0200, Marek Szyprowski wrote:
> Excessive debug messages might cause timing issues that prevent correct
> usb enumeration. This patch hides information about USB bus reset to let
> driver enumerate fast enough to avoid making host angry. This fixes
> endless enumeration and usb reset loop observed with some Linux hosts.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 119c8a3effc2..8870e38c1d82 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2333,7 +2333,7 @@ irq_retry:
> =20
>  		u32 usb_status =3D readl(hsotg->regs + GOTGCTL);
> =20
> -		dev_info(hsotg->dev, "%s: USBRst\n", __func__);
> +		dev_dbg(hsotg->dev, "%s: USBRst\n", __func__);

considering this is inside an IRQ handler, I'd rather use dev_vdbg() but
no strong feelings:

Reviewed-by: Felipe Balbi <balbi@ti.com>

--=20
balbi

--0qt3EE9wi45a2ZFX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUP8lhAAoJEIaOsuA1yqREA+oQAKrpbPBroqyjNFk2cCWmvGZT
WYmu5Ekasyd4pvhZhs/Go9AwQmjgtdTi1xrHkKi6kq+BN8WiRdf/5d3i/Z5V+sNu
DXB/OPjKS5wc+dceBCHW/7083/y0xRg0C8tyuFRpry7qupzKylIZeojCzRko/dnE
UX8Y/AkRzJJPwVxvQIuoOWDHqOwzuZKuy48JFZCfFCUCN3AkCU5xyXRLJRPv7t+j
0lhPktrevJC4a9jOyxAZquFD+8EfnEBkr22Lx7TUtPL2frNz03XoH3O7MHKiDDi3
i4Srq13gLwf831SsCnVnUHZcX8qA1tiyrhtKmchXZmlOcLSDEac52DLfLnkdYakU
3T0PRTLfB8sYCHKb6lsOUnbhpQkmQkinASSXF/5qtIrIG8Vw6LBVdrYUBaKsCNEg
ZEyJn+HKrSResrBNlYeMMFQY0CgIQawAXKd4qk4enw04t/dFIFjpkKOGVbJw00f0
7LduD9+Df2bEACTvqc3mwd3IRd/j8VybqEoyrH838NQML2ui3Y+ktXqvAidQkeXu
k7EcTUAPaRkvPkU2YMhf1tgvORXs7pILMwUwy0ptwU8Ki3IyWoMDlMgVCKvPV1I3
YBGMbqHxCZE2IMcZ8a7YS1b5i7RCecJId+VrGrAn4xqXT88PzlnuPXR4c02S6e/c
gE+fQNFcgY3T9p/1Jx3K
=1ISQ
-----END PGP SIGNATURE-----

--0qt3EE9wi45a2ZFX--
