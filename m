From: Felipe Balbi <balbi@ti.com>
Subject: Re: [RFC][PATCH 2/5] ARM: SAMSUNG: Changing the build condition of
 OTG platform device for samsung.
Date: Tue, 21 Jun 2011 14:51:37 +0300
Message-ID: <20110621115136.GC2531@legolas.emea.dhcp.ti.com>
References: <0LN4003LQZBUSGU0@mailout4.samsung.com>
 <BANLkTikPt=_KNpoJ4Xawz_PYMmZg3PnR9g@mail.gmail.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog114.obsmtp.com ([74.125.149.211]:41013 "EHLO
	na3sys009aog114.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752247Ab1FULvm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:51:42 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTikPt=_KNpoJ4Xawz_PYMmZg3PnR9g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: balbi@ti.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tmarri@apm.com, thomas.ab@samsung.com, a.kesavan@samsung.com


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 21, 2011 at 05:20:25PM +0530, Praveen Paneri wrote:
> > > @@ -37,7 +39,12 @@ static struct resource s3c_usb_hsotg_resources[] =
=3D {
> > >=A0=A0static u64 s3c_hsotg_dmamask =3D DMA_BIT_MASK(32);
> > >
> > >=A0=A0struct platform_device s3c_device_usb_hsotg =3D {
> > > +#ifdef CONFIG_S3C_DEV_USB_HSOTG
> > >=A0=A0 .name =3D "s3c-hsotg",
> > > +#endif
> > > +#ifdef CONFIG_S3C_DEV_DWC_OTG
> > > + .name =3D "dwc_otg",
> > > +#endif
> >
> > no, don't do that. See we're going through a big re-factor on the gadget
> > framework to allow multiple UDC drivers to be compiled as modules. The
> > idea is to be able to have distro-like kernels for embedded too.
> It can be build as a module but need to make necessary modifications in
> platform code. Will modify according to the gadget framework.

can't you do runtime detection of which platform you're running on ?
Then you add one or the other platform_device. But ifdeferry won't help
you in the long run.

--=20
balbi

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAIXIAAoJEAv8Txj19kN1vroH/R2J50mHxkKOcKM9Y2CZsIc+
D7yxqBVc3NB2yHPEA5UCdY8IdQnTjDd+3aB9n4l01+Fgqt6vuiKYSm2UveB2zime
3CLJyBPniAxChkGyKCJ69/2aSfafQ86Wyvzt9djGpBzT6V8lBHBEcPur7gdykgM0
vdzezLiAEP0EsmBYIDP6xgH02cxN2iEHys48DtnosYGCqbF88eytEZr+7Gj1fXam
pu7e7cJUBc2BlVtxg7LWApPf5u3l0WebttvyU/oyhAxnp2EG90wYdcVRVKBRqJhG
tpBZKVGSBC9TFPU3dXgZsnM+U8iuczt+bP4CfKAek9Jnmq8kuaRFNhe9LrCvDC4=
=0MVd
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
