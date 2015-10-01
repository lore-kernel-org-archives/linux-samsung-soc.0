From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 4/4] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Thu, 1 Oct 2015 17:31:27 -0500
Message-ID: <20151001223127.GE32355@saruman.tx.rr.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
 <1442830572-6765-5-git-send-email-m.szyprowski@samsung.com>
 <20151001155018.GC4469@saruman.tx.rr.com>
 <2B3535C5ECE8B5419E3ECBE30077290901DC383B31@US01WEMBX2.internal.synopsys.com>
 <20151001220355.GB32355@saruman.tx.rr.com>
 <2B3535C5ECE8B5419E3ECBE30077290901DC383EFF@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:34479 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184AbbJAWbc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Oct 2015 18:31:32 -0400
Content-Disposition: inline
In-Reply-To: <2B3535C5ECE8B5419E3ECBE30077290901DC383EFF@US01WEMBX2.internal.synopsys.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: John Youn <John.Youn@synopsys.com>
Cc: "balbi@ti.com" <balbi@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2015 at 10:21:22PM +0000, John Youn wrote:
> On 10/1/2015 3:04 PM, Felipe Balbi wrote:
> > On Thu, Oct 01, 2015 at 09:04:59PM +0000, John Youn wrote:
> >> On 10/1/2015 8:50 AM, Felipe Balbi wrote:
> >>> On Mon, Sep 21, 2015 at 12:16:12PM +0200, Marek Szyprowski wrote:
> >>>> DWC2 module on some platforms needs three additional hardware
> >>>> resources: phy controller, clock and power supply. All of them must =
be
> >>>> enabled/activated to properly initialize and operate. This was initi=
ally
> >>>> handled in s3c-hsotg driver, which has been converted to 'gadget' pa=
rt
> >>>> of dwc2 driver. Unfortunately, not all of this code got moved to com=
mon
> >>>> platform code, what resulted in accessing DWC2 registers without
> >>>> enabling low-level hardware resources. This fails for example on Exy=
nos
> >>>> SoCs. This patch moves all the code for managing those resources to
> >>>> common platform.c file and provides convenient wrappers for controll=
ing
> >>>> them.
> >>>>
> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>
> >>> I just caught several build errors which this patch. I hope you can
> >>> send me a follow-up fix (which I can amend to $subject) otherwise
> >>> I'll have to drop this series
> >>>
> >>
> >> I forgot that this was initially part of a larger
> >> patch-set. Maybe that is causing issues? If this wasn't intended
> >> to go through Felipe's tree then my bad.
> >>
> >> Also, I noticed this patch causes deadlock warnings with lockdep
> >> enabled.
> >>
> >> Can you look into that also while you investigate this?
> >=20
> > John, do you want me to drop the series meanwhile ? I can do that no pr=
oblems.
> >=20
>=20
> You can drop this one. I think leaving in patch 1-3 is fine as
> they are small cleanup patches. Unless you or Marek prefer to
> drop all of them.

dropped this one for now. Thanks

--=20
balbi

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDbQ/AAoJEIaOsuA1yqREo48QALUvBhOmeKnYIwQIMKZgi2MC
dBk8SsB8lOZRQ6tIOTaB+FVfijmZ1DHiKfZuYwi5Ueo7gkpUVskVhalknd6Zk1oU
B9dZONGoWiWwT+sEi+yOxMit3MvNz5tZ2+ovJ9IyQ8/GdQqN71nJQ32xLNrQDBQ6
k9exhEVDvDAPYTHGblKjpbgSIaqBvwG05YadIoEf8eJFd3nXtNnyk1RsFmGvvR4A
DHcE/qzhmD89bm3neTqZqlRwYEeTj7v7JBxXc1vk0hMMPu1iyC/CkkZEi6jt3TYR
nLFOrcLgqpuPjou6DiXHJhj3ta/1NMxg/wDpVdC0BZhb1pf05dL1bdS1Y6zPKcgn
iYnxmHWzDSA6YdcHD0aOQQ0QGX8+uxiA602JwNrorzCSoIL6aKrWnznmgKZI3H3m
boGyXv/ifUBbPUA+b4xCaOt19a6IuyeVTzNrxqCBMHMJoZ9VEKiIbR1KgL05HdAv
fYL43oLv1ohlFP+EgrVTsa1/m0yuC1IHDcKEJCIJpq0MCQnTGJopbqiQ11Ewdyhr
hyQ4tSMLBHOaf8JHu1srUwqujeLiSLndZiXjfn9yfX4HsniAYiKuYvM31AylRcnq
e6sCcwZToVKn8glzy9hYWyRv+8IJTSZ/kyO4DdZmvnQG6+orlxupD/U5evgHsbzY
6NWUrEIZfgWcGOQHI9MT
=drU+
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
