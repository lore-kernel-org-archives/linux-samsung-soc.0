From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4] usb: dwc2/gadget: rework disconnect event handling
Date: Fri, 14 Nov 2014 13:04:57 -0600
Message-ID: <20141114190457.GA16388@saruman>
References: <5465EEF3.7060902@samsung.com>
 <1415967607-6174-1-git-send-email-m.szyprowski@samsung.com>
 <A2CA0424C0A6F04399FB9E1CD98E0304844EBBFF@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:53895 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1161184AbaKNTEi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Nov 2014 14:04:38 -0500
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E0304844EBBFF@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Felipe Balbi <balbi@ti.com>

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 07:01:37PM +0000, Paul Zimmerman wrote:
> > -----Original Message-----
> > From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
> > Sent: Friday, November 14, 2014 4:20 AM
> >=20
> > This patch adds a call to s3c_hsotg_disconnect() from 'end session'
> > interrupt (GOTGINT_SES_END_DET) to correctly notify gadget subsystem
> > about unplugged usb cable. DISCONNINT interrupt cannot be used for this
> > purpose, because it is asserted only in host mode.
> >=20
> > To avoid reporting disconnect event more than once, a disconnect call h=
as
> > been moved from USB_REQ_SET_ADDRESS handling function to SESSREQINT
> > interrupt. This way driver ensures that disconnect event is reported
> > either when usb cable is unplugged or every time the host starts a new
> > session.
> >=20
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  drivers/usb/dwc2/core.h   |  1 +
> >  drivers/usb/dwc2/gadget.c | 13 +++++++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> > index 55c90c53f2d6..78b9090ebf71 100644
> > --- a/drivers/usb/dwc2/core.h
> > +++ b/drivers/usb/dwc2/core.h
> > @@ -210,6 +210,7 @@ struct s3c_hsotg {
> >  	u8                      ctrl_buff[8];
> >=20
> >  	struct usb_gadget       gadget;
> > +	unsigned int		session:1;
> >  	unsigned int            setup;
> >  	unsigned long           last_rst;
> >  	struct s3c_hsotg_ep     *eps;
> > diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> > index fcd2bb55ccca..c7f68dc1cf6b 100644
> > --- a/drivers/usb/dwc2/gadget.c
> > +++ b/drivers/usb/dwc2/gadget.c
> > @@ -1029,7 +1029,6 @@ static int s3c_hsotg_process_req_feature(struct s=
3c_hsotg *hsotg,
> >  }
> >=20
> >  static void s3c_hsotg_enqueue_setup(struct s3c_hsotg *hsotg);
> > -static void s3c_hsotg_disconnect(struct s3c_hsotg *hsotg);
> >=20
> >  /**
> >   * s3c_hsotg_stall_ep0 - stall ep0
> > @@ -1107,7 +1106,6 @@ static void s3c_hsotg_process_control(struct s3c_=
hsotg *hsotg,
> >  	if ((ctrl->bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD) {
> >  		switch (ctrl->bRequest) {
> >  		case USB_REQ_SET_ADDRESS:
> > -			s3c_hsotg_disconnect(hsotg);
> >  			dcfg =3D readl(hsotg->regs + DCFG);
> >  			dcfg &=3D ~DCFG_DEVADDR_MASK;
> >  			dcfg |=3D (le16_to_cpu(ctrl->wValue) <<
> > @@ -2031,6 +2029,10 @@ static void s3c_hsotg_disconnect(struct s3c_hsot=
g *hsotg)
> >  {
> >  	unsigned ep;
> >=20
> > +	if (!hsotg->session)
> > +		return;
> > +
> > +	hsotg->session =3D 0;
> >  	for (ep =3D 0; ep < hsotg->num_of_eps; ep++)
> >  		kill_all_requests(hsotg, &hsotg->eps[ep], -ESHUTDOWN, true);
> >=20
> > @@ -2290,11 +2292,18 @@ irq_retry:
> >  		dev_info(hsotg->dev, "OTGInt: %08x\n", otgint);
> >=20
> >  		writel(otgint, hsotg->regs + GOTGINT);
> > +
> > +		if (otgint & GOTGINT_SES_END_DET) {
> > +			s3c_hsotg_disconnect(hsotg);
>=20
> I think you should clear hsotg->session here, shouldn't you?
> Otherwise I think s3c_hsotg_disconnect() will be called twice, once
> here and once when the next GINTSTS_SESSREQINT comes.

the best way to avoid that would be fiddle with hsotg->session inside
s3c_hsotg_disconnect() only.

--=20
balbi

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZlJZAAoJEIaOsuA1yqREy+4P/0e6t7zaVoIL6nNeTkH4PbBk
MUH1v6NW+HXOoovX5zTf02IzULGXCpE2OhnYmAREkF5xGufxIkTgqXt2QpO7aA9w
VEsXF0+xJsy8N4WRzZR4BDzVOHJQiPjiu11bpgHjzGldJ5QmgQEPpr6v7k3yJ3vB
O0hBWyawjGwlZOhYOxe2VwHDHZQeNkBdS34Zl+MqFp2au4Zjsj+tgjKIxU51MxFS
T3oo0VwG/SxnnOM3EjqIItvxO8PqkTNY+OvglM+BdFNrNopn5eeSxPYHXjGCWas+
fc1wK3qCpTRfapVJ/BjA4JVWyZsIHE54OVL6F4v90UsEfDrdpP4VNwfI/s0uOlF0
DEsJpGpQd6mcn1B2NuD+e3WzyoE1bm8jcY6RAlY8mMibdQZbuSxCa2yaOPY0y/Jg
UnoPsJFhl+n11F46KpqwNXiArV9ygbRTEEsDVvRtJnvU8eltjtO8NCNMcRER88XC
I6Z0xqXjmpaDb9E2o6aOPRkLs2yfJeIbj80DUgyhFsUm3sE8Xr8AtU2h78Td+0wy
HrNNINrRTl6vLKW2ikdcmQHuHcb7MwqhlcSCU4ck2r797yGYrSny2334I8Buj4Tn
LNSQIL4IYiF0tUbDJdBhcB0pMiDx6cDDL2wCDEyKTi0yiHRd4eSago6gPq182coX
aMzmbaRQ4BOXAiCtUjyV
=1GUh
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
