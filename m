From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Wed, 22 Jun 2011 12:49:24 +0300
Message-ID: <20110622094923.GA23598@legolas.emea.dhcp.ti.com>
References: <0LN400HTOZEQDIL0@mailout1.samsung.com>
 <BANLkTikDDBQjE2RCeeBB50vokSTcnCO46A@mail.gmail.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikDDBQjE2RCeeBB50vokSTcnCO46A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 22, 2011 at 01:56:25PM +0530, Praveen Paneri wrote:
> > > diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/M=
akefile
> > > index ae6bf6f..611fb3a 100644
> > > --- a/arch/arm/mach-s5p64x0/Makefile
> > > +++ b/arch/arm/mach-s5p64x0/Makefile
> > > @@ -28,3 +28,4 @@ obj-y +=3D dev-audio.o
> > >=A0=A0obj-$(CONFIG_S3C64XX_DEV_SPI) +=3D dev-spi.o
> > >
> > >=A0=A0obj-$(CONFIG_S5P64X0_SETUP_I2C1) +=3D setup-i2c1.o
> > > +obj-$(CONFIG_S3C_DEV_DWC_OTG) +=3D setup-otg-phy.o
> > > diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach=
-s5p64x0/include/mach/map.h
> > > index 95c9125..717c279 100644
> > > --- a/arch/arm/mach-s5p64x0/include/mach/map.h
> > > +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
> > > @@ -44,6 +44,8 @@
> > >=A0=A0#define S5P64X0_PA_SPI1 0xEC500000
> > >
> > >=A0=A0#define S5P64X0_PA_HSOTG 0xED100000
> > > +#define S5P64X0_PA_USB_HSPHY 0xED200000
> > > +#define S5P64X0_VA_USB_HSPHY S3C_ADDR_CPU(0x00100000)
> > >
> > >=A0=A0#define S5P64X0_PA_HSMMC(x) (0xED800000 + ((x) * 0x100000))
> > >
> > > @@ -71,6 +73,8 @@
> > >=A0=A0#define S5P_PA_TIMER S5P64X0_PA_TIMER
> > >
> > >=A0=A0#define SAMSUNG_PA_ADC S5P64X0_PA_ADC
> > > +#define S3C_PA_USB_HSOTG S5P64X0_PA_HSOTG
> > > +#define S3C_VA_USB_HSPHY=A0=A0=A0=A0=A0=A0=A0=A0S5P64X0_VA_USB_HSPHY
> > >
> > >=A0=A0/* UART */
> > >
> > > diff --git a/arch/arm/mach-s5p64x0/setup-otg-phy.c b/arch/arm/mach-s5=
p64x0/setup-otg-phy.c
> >
> > drivers should not live in arch/arm/*, why don't you move this to
> > drivers/usb/otg where the PHYs are staying right now ?
> PHY init/exit code can vary across SoCs. Wouldn't it be better to have it=
 in the
> SoC specific location?

It will vary how ? If it's only regarding e.g. a different GPIO pin or a
different IRQ number, you handle that by passing data down to driver
(via platform_data or struct resource), now if it varies because a
different board uses a different PHY, then another driver should be
written (well, as long as it's really different from the one you have
now, otherwise you should see if it's worth making the existing driver
more flexible).

--=20
balbi

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAbqjAAoJEAv8Txj19kN16z0H/2dPC4mttrWM1JP/yr+Tiyuo
/lX+Y9LKhcRHi0Sd19ussICm0BLDVfnMid9ycQ94qYbFBRU7lQRr7fgagEtTwQvB
aqA9FnDobmlGcikR+7OlCHEAGLF13t14PuKWviR3xx7j/2rUw0d22ljLL+Oy0Yj8
jXLTD9kG0OpxTkI7qg//MoV2Yq6ROAxWNCw7Cs/zgoUFE/OT1vkSZnnV3GD84+7B
ngSG3EydQ5GE/InTsgwMoz75RrSFiAL+BzH1tfE+QB11N/Xut6PNAdCYiYcgt3w5
oGhih0AfYTDP6pZi55w3XcTJbzGDEvcNeVI+ZiCuBn4MVk9FATEa6yan3OFZI5k=
=0W5Y
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
