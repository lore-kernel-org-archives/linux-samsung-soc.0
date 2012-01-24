From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 15:07:56 +0200
Message-ID: <20120124130754.GR27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <201201241113.00387.heiko@sntech.de>
 <20120124101510.GH27414@legolas.emea.dhcp.ti.com>
 <201201241131.01437.heiko@sntech.de>
 <02ff01ccda98$4c424f40$e4c6edc0$%kim@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S5Olei2MlvlRk/sW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog126.obsmtp.com ([74.125.149.155]:41722 "EHLO
	na3sys009aog126.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754943Ab2AXNID (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 08:08:03 -0500
Content-Disposition: inline
In-Reply-To: <02ff01ccda98$4c424f40$e4c6edc0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Heiko =?iso-8859-1?Q?St=FCbner'?= <heiko@sntech.de>, balbi@ti.com, 'Ben Dooks' <ben-linux@fluff.org>, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--S5Olei2MlvlRk/sW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 24, 2012 at 10:01:33PM +0900, Kukjin Kim wrote:
> Heiko St=FCbner wrote:
> >=20
> > Am Dienstag, 24. Januar 2012, 11:15:11 schrieb Felipe Balbi:
> > > On Tue, Jan 24, 2012 at 11:13:00AM +0100, Heiko St=FCbner wrote:
> > > > sorry for mail spam :-)
> > > >
> > > > Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> > > > > On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner wrote:
> > > > > > Hi Felipe,
> > > > > >
> > > > > > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner wro=
te:
> > > > > > > > The phy-power-handling is common to S3C2443/2416/2450, so
> > > > > > > > introduce a s3c2443-pm-common.c to handle this for all of t=
hem.
> > > > > > > >
> > > > > > > > This makes it possible to remove the raw write to the
> > > > > > > > PWRCFG-register from the s3c-hsudc driver.
> > > > > > > >
> > > > > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > > > >
> > > > > > > I believe this doesn't really depend on previous patches (??)=
 In
> > > > > > > that
> > > > > >
> > > > > > > case, it can be carried with s3c's tree:
> > > > > > it does depend on the previous patch [2/3], as the device power
> > > > > > domain is controlled through the runtime-pm subsystem whose cal=
ls
> > > > > > were added in it.
> > > > >
> > > > > then I will need proper acks to carry this patch.
> > > >
> > > > another possibility would be to have patch 2 and 3 get in through t=
he
> > > > samsung tree, as the majority of the change lies on this side (i.e.
> > > > introducing a new file in plat-s3c24xx)
> > >
> > > yet another one, would be to defer patch 3/3 by one merge window ;-)
> >=20
> > also fine by me ;-)
> >=20
> > But let's see first what Kgene says.
>=20
> Hi all,
>=20
> Sorry for join lately on this.
>=20
> I think we need to implement more pm domain for s3c24xx as well
> usbphy. So if Felipe is ok, I'd like to handle Heiko's 2nd and 3rd
> patches in my tree. Of course, I need Felipe's ack before that.
> BTW, frankly, I'm not sure we can finish supporting pm domain for all
> of s3c24xx for v3.4 :)

In that case, how about we take things slow ? I can carry pm-runtime
patch (2/3) and by 3.5 or 3.6 you will only need to touch
arch/arm/-related code.

If you guarantee that it won't make it in 3.4, I'm ok carrying
pm-runtime patch as it won't break anything anyway (I suppose).

--=20
balbi

--S5Olei2MlvlRk/sW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHq0qAAoJEIaOsuA1yqRE5VoP/1RYekjXYooqMX+xXRf7wgXM
Ifuz6wIrXUWGZLQBbGD6jlvkK9d+V1D+hCwXx9AbG/a9km60LU65OQOdqmIgn4tM
KqKzZdcpzvUCRfUt+C3yD2KE27W46z3yYvpVob3g8uZPSBC1p/MaQ81N6T4v6B3n
HSQzVaxoaIyxZFebv6JNRLeVaz+pBVK1yq0uIiJA4vzk1ASvzTw/DVY9NYuFYHq6
PVjEhNTLWS01oYAgFA8CGmOvI8yLcVtBiCXZQ+8k0j0t7y+ZxucKZIsUP01IO+C8
v8wzcLL5Cm7vAVSalZDMZEjP7E9rcVy8GgikfYwzirzhR/5UmgfgkH6Nt2o8nx5t
SoGLIxWQKgNU0qm26nZqPGB/l3Q3lAXrSwT7cH3vWSMIzWWGqA/luY5Ko+S3d3AM
c5K0AGhH7sstfGs/YWrb+fRRgDxNUqKKmk2ALE++s+idCC3txgHbTj8UHvhAhG9Q
Qm4AqZGuCB7DPTICeXe7W/VLJaezqho6VDYmkPI+oa3tA0YZO3PVeqTOCO2tqc6j
d7AzH9+YpEbOxZ2ldmiJ+dOzbwMRtGdlmpdl2YX6tyZlsimCo1XFGFNB6QDksIEf
yZrvfkHK0gWVD1fd4xnSkv+6UGRcLKreTMtFF+aqLlHAgsjY4T30uPHj0S2ypp7T
bAUTvz3i4fneIR6d5Xkk
=rwOP
-----END PGP SIGNATURE-----

--S5Olei2MlvlRk/sW--
