From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/3] S3C2443: add power domain for usb phy
Date: Tue, 24 Jan 2012 15:30:15 +0200
Message-ID: <20120124133013.GS27414@legolas.emea.dhcp.ti.com>
References: <201201082156.44142.heiko@sntech.de>
 <02ff01ccda98$4c424f40$e4c6edc0$%kim@samsung.com>
 <20120124130754.GR27414@legolas.emea.dhcp.ti.com>
 <201201241427.21939.heiko@sntech.de>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bPyaW7MGXh1mijq1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog126.obsmtp.com ([74.125.149.155]:40870 "HELO
	na3sys009aog126.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1754513Ab2AXNaZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 08:30:25 -0500
Content-Disposition: inline
In-Reply-To: <201201241427.21939.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Linux USB Mailing List' <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--bPyaW7MGXh1mijq1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 02:27:21PM +0100, Heiko St=FCbner wrote:
> Am Dienstag, 24. Januar 2012, 14:07:56 schrieb Felipe Balbi:
> > Hi,
> >=20
> > On Tue, Jan 24, 2012 at 10:01:33PM +0900, Kukjin Kim wrote:
> > > Heiko St=FCbner wrote:
> > > > Am Dienstag, 24. Januar 2012, 11:15:11 schrieb Felipe Balbi:
> > > > > On Tue, Jan 24, 2012 at 11:13:00AM +0100, Heiko St=FCbner wrote:
> > > > > > sorry for mail spam :-)
> > > > > >=20
> > > > > > Am Dienstag, 24. Januar 2012, 10:51:31 schrieb Felipe Balbi:
> > > > > > > On Tue, Jan 24, 2012 at 10:50:14AM +0100, Heiko St=FCbner wro=
te:
> > > > > > > > Hi Felipe,
> > > > > > > >=20
> > > > > > > > Am Dienstag, 24. Januar 2012, 10:38:32 schrieb Felipe Balbi:
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > On Sun, Jan 08, 2012 at 09:59:02PM +0100, Heiko St=FCbner=
 wrote:
> > > > > > > > > > The phy-power-handling is common to S3C2443/2416/2450, =
so
> > > > > > > > > > introduce a s3c2443-pm-common.c to handle this for all =
of
> > > > > > > > > > them.
> > > > > > > > > >=20
> > > > > > > > > > This makes it possible to remove the raw write to the
> > > > > > > > > > PWRCFG-register from the s3c-hsudc driver.
> > > > > > > > > >=20
> > > > > > > > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > > > > > >=20
> > > > > > > > > I believe this doesn't really depend on previous patches =
(??)
> > > > > > > > > In that
> > > > > > > >=20
> > > > > > > > > case, it can be carried with s3c's tree:
> > > > > > > > it does depend on the previous patch [2/3], as the device p=
ower
> > > > > > > > domain is controlled through the runtime-pm subsystem whose
> > > > > > > > calls were added in it.
> > > > > > >=20
> > > > > > > then I will need proper acks to carry this patch.
> > > > > >=20
> > > > > > another possibility would be to have patch 2 and 3 get in throu=
gh
> > > > > > the samsung tree, as the majority of the change lies on this si=
de
> > > > > > (i.e. introducing a new file in plat-s3c24xx)
> > > > >=20
> > > > > yet another one, would be to defer patch 3/3 by one merge window =
;-)
> > > >=20
> > > > also fine by me ;-)
> > > >=20
> > > > But let's see first what Kgene says.
> > >=20
> > > Hi all,
> > >=20
> > > Sorry for join lately on this.
> > >=20
> > > I think we need to implement more pm domain for s3c24xx as well
> > > usbphy. So if Felipe is ok, I'd like to handle Heiko's 2nd and 3rd
> > > patches in my tree. Of course, I need Felipe's ack before that.
> > > BTW, frankly, I'm not sure we can finish supporting pm domain for all
> > > of s3c24xx for v3.4 :)
> >=20
> > In that case, how about we take things slow ? I can carry pm-runtime
> > patch (2/3) and by 3.5 or 3.6 you will only need to touch
> > arch/arm/-related code.
> >=20
> > If you guarantee that it won't make it in 3.4, I'm ok carrying
> > pm-runtime patch as it won't break anything anyway (I suppose).
>=20
> Seems reasonable to me. The pm-runtime patch does not break anything - it=
=20
> simply does nothing without either some runtime-pm functions or the power=
=20
> domain work.
>=20
> So I would second that we handle the power domain stuff after Kgene got t=
he=20
> mach directories merged for 3.4, i.e. drop the patch (3/3) for now and I =
will=20
> resubmit it when the time comes.

sounds great to me :-) Thanks guys

--=20
balbi

--bPyaW7MGXh1mijq1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHrJlAAoJEIaOsuA1yqREo4gP/2YNo348gdOWeiW/E5FnPOfR
U9QKH0J9DMSC3rgj94EmM2xPbeDl3nTuBO82HraTROxM2hbvQofuc2mUDnxV8x1X
clQWvgOcZm+LPYYZshUtOTDTLJQGAuuLIApqnGDxO855sbBiPEuN3Y5WfMNIo3JV
G8Do8nL4ht58Qfe23G9m+LUMbKw+yHqd4C9A0nKD0+VrL7FpZGYvT6+kPQWorj9K
FX2q7ic76E+wK0BRyo0jS1GtmVeO2JBm++bwmTcCHeVECeReml/qqjGeKHwLazWH
kVkfaKn93Mrx0kOJgHXfIZLJY4IsIDJR0r6dTBDzKfOv1YGOiufTua7CchN4Quuu
+ZNPXzY5gb5VX+wQ8wQBkkF3NvDy9g5W5mXwwtEmrqfKombLCX0IYJ/XOhMzjXQi
4dxnq+00nhojeXFBYHHX8gbDg6ENfpwRnw3jIYZDAR8CyyETKHAlPVWkJ7z46tDa
OgJqpG01JH20Gch1tO5tlL/WwQ6upArazLYwGcbAMDbd9ao0hJ/3GcvnpQ/m+SNq
amOMF1FfsvaKpLP6q/LqZ5CjGj7OrBwrM7QHwQKLdTnxh5rsc3j444Icgl5DqhPx
i3SNLs2VVRDMkRqjeglQ25hJ4JSqdLDydOJZVJx9L3IqYN8HZIQtWW3oZ+L7hp5t
NZE9edvqPKOne5EH2b9X
=DkNg
-----END PGP SIGNATURE-----

--bPyaW7MGXh1mijq1--
