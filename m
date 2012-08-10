From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/5] usb: phy: samsung: Introducing usb phy driver for
 samsung SoCs
Date: Fri, 10 Aug 2012 09:16:17 +0300
Message-ID: <20120810061616.GC1689@arwen.pp.htv.fi>
References: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
 <502464FE.3000908@samsung.com>
 <CAD6zSYP33PDrXwifQM=7q+Esk1X7m5+DNG_=A2a-qTENk4zq8w@mail.gmail.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAD6zSYP33PDrXwifQM=7q+Esk1X7m5+DNG_=A2a-qTENk4zq8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI,

On Fri, Aug 10, 2012 at 11:17:29AM +0530, Praveen Paneri wrote:
> On Fri, Aug 10, 2012 at 7:03 AM, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>=
 wrote:
> > Hi, Praveen.
> >
> >
> > On 08/08/2012 04:40 PM, Praveen Paneri wrote:
> >>
> >> Changes from v2:
> >> Changed the driver filenames to samsung-usbphy
> >> Changed 's3c' to 'samsung' for platform device as well as platform data
> >> Moved platform data structure to a separate file
> >> Rectified coding style related errors
> >>
> >> Changes from v1:
> >> Rebased patches to latest usb-next branch
> >> Changed the name 'sec_usbphy' to 'samsung_usbphy'
> >>
> >> This patch set introduces a phy driver for samsung SoCs. It uses the
> >> existing
> >> transceiver infrastructure to provide phy control functions. Use of th=
is
> >> driver
> >> can be extended for usb host phy as well.
> >
> >
> > How can you support usb host phy? I cannot choose to use which phy when
> > call init or shutdown of phy at current phy framework.

correct. Curretly that's not supported. We are trying to come up with
proper DeviceTree bindings to allow that. Kishon has been working on
providing devm_usb_get_phy_by_phandle() would should help achieving what
you need.

> If you are talking about choosing between PHY0 (for device) and PHY1
> (for host), I think you can make use of the flags available in usb_phy
> to pass that information to phy driver and that can be handled there.

I rather you didn't do it that way. Those flags are used to pass
features to the PHY. See drivers/usb/otg/ulpi.c, for instance.

> This is just one way I have successfully implement two different phy
> control. There might be a better way to do that.

I guess using DT phandles is the way to go here.

--=20
balbi

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQJKcwAAoJEIaOsuA1yqREwpUP/jgZ9fCw+IKaJ5J8os0uf+/E
eqn0E7/54jFF71MacEZdIm+5zhXUrDguz7WIcxFntkTg3q1/zfe33Z742gUMZ2FU
UexuDuxG2lHna6fS6WVe/QKmf78cL23jJfhf9EBZJAbS1Nas2yvpJ2mwtWYeSN/I
MrVZhP2YlMW5x5zRUyMpV3e57yAdo8TVcexvNGtxyZ7Qyc0kiD5LVOhKtyTVMqoJ
ixTtppLH2yZPFb0cHOfs0m4gdeiuzVGOya8wHJUGkH3l+/AbmC34l9/77/Q8iFzH
9xgkYY1dU37RABFyle9P3rCEKDnQq91889FCXSRdOsZZC1KQT1Qo6kB3XlHpTopj
0HKRojQ/a4m07Rn25qVvkQ7V9Vu35AVwa1oeCiIaeuMYnWqo71nk71iNbbvLwh2Q
87mflhhSNisDSJFYZGu41xoctWtCI6GLdqZIAwlawraXQkg9qH+yiuiaR+Ng+XLy
1RMeVPGIk3zU9n3C17JqbpckL59bnCrVH2KbhwpGjZBIqO8nVLEU0i6RpsCtf3T1
cQW7ZsjlCEQdZ7LKaYkarGawHSIl6Y8m73KTYzVyGrsMpPc5eNt4jPHa/AzlfNpS
l2vW49Kr0Uy7FHLHjm1L+Co9Y6M7+NoTAI9hunIwfo1wCwzj4znCAJyt/stijiMO
NGmQtRomFGyhhdHFTlxj
=1O2f
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
