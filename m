From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] usb: gadget: s3c-hsotg: fix kernel panic
Date: Wed, 21 Mar 2012 11:56:23 +0200
Message-ID: <20120321095622.GK3092@arwen.pp.htv.fi>
References: <1331904920-19685-1-git-send-email-sangwook.lee@linaro.org>
 <20120319175208.274ca294@lmajewski.digital.local>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="37nyS7qXrnu4wN2o"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog105.obsmtp.com ([74.125.149.75]:48972 "HELO
	na3sys009aog105.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753660Ab2CUJ4o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 05:56:44 -0400
Received: by mail-lpp01m010-f53.google.com with SMTP id c1so756297lah.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Mar 2012 02:56:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20120319175208.274ca294@lmajewski.digital.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Sangwook Lee <sangwook.lee@linaro.org>, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, linaro-dev@lists.linaro.org, Felipe Balbi <balbi@ti.com>


--37nyS7qXrnu4wN2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
On Mon, Mar 19, 2012 at 05:52:08PM +0100, Lukasz Majewski wrote:
> On Fri, 16 Mar 2012 13:35:20 +0000
> Sangwook Lee <sangwook.lee@linaro.org> wrote:
>=20
> > Fix kernel panic from s3c_hsotg_udc_stop.
> > if udc_is_newstyle is true, s3c_hsotg_udc_stop should not
> > call disconnect, unbind.
> >=20
> > As running rmmod g_mass_storage, kernel panic happens.
> >=20
> > (composite_unbind+0x14/0x164 [g_mass_storage])
> > from [<c023e950>] (s3c_hsotg_udc_stop)
> >=20
> > This patch is based on Lukasz Majewski's patches:
> > [PATCH 0/9] USB: s3c-hsotg: USB S3C-HSOTG driver fixes and code cleanu
> >=20
> > in order to test g_mass_storage in Origen board:
> >=20
> > Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
> > ---
> >  drivers/usb/gadget/s3c-hsotg.c |   12 ++++++------
> >  1 files changed, 6 insertions(+), 6 deletions(-)
> >=20
>=20
> Hi Sangwook,
>=20
> Test HW: GONI S5PV210=20
> module: g_ether.ko
>=20
> Yes, this patch works. Thanks for spotting the error.
>=20
> Tested-by: Lukasz Majewski <l.majewski@samsung.com>

I don't seem to have the patch in my inbox, can someone re-send with
Lukasz Tested-by line already in place ?

--=20
balbi

--37nyS7qXrnu4wN2o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPaaXGAAoJEIaOsuA1yqREfUUP/iUIMYxZkhJu8rFz65h8qR5e
S4GUd51rdvrudde32YB2vYPn7XwEKjUp3EePoynIuO6ibZGSXlx9hME6OIMzTkO6
HbNMRDpETliv89H9UXSAqmUqOpeNUA6Ihi0M5DJOlB7SnmUi7SfGx7MCeMlIq1zT
Y4CsWWXoaJ1bGZHrzAOty6+BEdjzD21LUWfhw1rk7iHmX+/crAl6zga6RtX/D/1+
fhgB0eLMVvGDVUEGZv7bbSSVPn42MoTmAzl//g/dkJQqz9C9BbQvmCLY4pB2u7hk
w2Xy61hA+29RtzWzEH7bCQ6sEz4+6OGR03QdCUjnLw7s3MmVnKco4k2IfHvOJruq
XRT3AkD+Mm1s+RSH8CYWsxmogfTISDkT3zHewbRe1QoqZjhBF9w4fbln+wyf2ilA
cQTgohg+hWuNy6nBABg8pDjovzg3Ou+ezJUIliotmNIU2Uc0XNCFH6kcP6APoE1n
0D0tbpv5mj29fwXgzGdeqxrYxZ3L3JqAsYmPzbzMk970j9YhnhOjaRTSe+bwOO9R
a27XKg3mpAyLEluyt4x9OuSqIFchYKtTpssNj+ArKMCy3zBT5Ge/Ac8okKnEKByr
5dCjQeSuJtBzxiy1X2OEalRm114Dau7HtCOPqB1WWDAT93rl2GL9upNZGXHUT+Ed
3mh7QZvNHlRG6meoGKux
=Z84m
-----END PGP SIGNATURE-----

--37nyS7qXrnu4wN2o--
