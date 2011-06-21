From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC][PATCH 2/5] ARM: SAMSUNG: Changing the build condition of
 OTG platform device for samsung.
Date: Tue, 21 Jun 2011 12:16:33 +0300
Message-ID: <20110621091632.GJ28225@legolas.emea.dhcp.ti.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com>
 <1308639827-2121-3-git-send-email-p.paneri@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgLLobvf7eP6VP5c"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1308639827-2121-3-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--bgLLobvf7eP6VP5c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 21, 2011 at 12:33:44PM +0530, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org wrote:
> From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>=20
> Adding dwc driver name in existing platform device
> to probe DWC OTG driver.
> Introduced otg_set_platdata function to pass platform data
> Added selectable config option to add DWC OTG driver for different
> machines.
>=20
> Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/plat-samsung/Kconfig         |    6 ++++++
>  arch/arm/plat-samsung/Makefile        |    1 +
>  arch/arm/plat-samsung/dev-usb-hsotg.c |   20 ++++++++++++++++++++
>  3 files changed, 27 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 4d79519..58ed8b1 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -227,6 +227,12 @@ config S3C_DEV_USB_HSOTG
>  	help
>  	  Compile in platform device definition for USB high-speed OtG
> =20
> +config S3C_DEV_DWC_OTG
> +	bool
> +	help
> +	  Compile in platform device definition for DWC OTG. This
> +	  will make it selectable for different machines.
> +
>  config S3C_DEV_WDT
>  	bool
>  	default y if ARCH_S3C2410
> diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makef=
ile
> index 53eb15b..785ca79 100644
> --- a/arch/arm/plat-samsung/Makefile
> +++ b/arch/arm/plat-samsung/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_S3C_DEV_FB)	+=3D dev-fb.o
>  obj-y				+=3D dev-uart.o
>  obj-$(CONFIG_S3C_DEV_USB_HOST)	+=3D dev-usb.o
>  obj-$(CONFIG_S3C_DEV_USB_HSOTG)	+=3D dev-usb-hsotg.o
> +obj-$(CONFIG_S3C_DEV_DWC_OTG)	+=3D dev-usb-hsotg.o
>  obj-$(CONFIG_S3C_DEV_WDT)	+=3D dev-wdt.o
>  obj-$(CONFIG_S3C_DEV_NAND)	+=3D dev-nand.o
>  obj-$(CONFIG_S3C_DEV_ONENAND)	+=3D dev-onenand.o
> diff --git a/arch/arm/plat-samsung/dev-usb-hsotg.c b/arch/arm/plat-samsun=
g/dev-usb-hsotg.c
> index 33a844a..7e6228b 100644
> --- a/arch/arm/plat-samsung/dev-usb-hsotg.c
> +++ b/arch/arm/plat-samsung/dev-usb-hsotg.c
> @@ -20,6 +20,8 @@
>  #include <mach/map.h>
> =20
>  #include <plat/devs.h>
> +#include <plat/otg.h>
> +#include <plat/usb-phy.h>
> =20
>  static struct resource s3c_usb_hsotg_resources[] =3D {
>  	[0] =3D {
> @@ -37,7 +39,12 @@ static struct resource s3c_usb_hsotg_resources[] =3D {
>  static u64 s3c_hsotg_dmamask =3D DMA_BIT_MASK(32);
> =20
>  struct platform_device s3c_device_usb_hsotg =3D {
> +#ifdef CONFIG_S3C_DEV_USB_HSOTG
>  	.name		=3D "s3c-hsotg",
> +#endif
> +#ifdef CONFIG_S3C_DEV_DWC_OTG
> +	.name		=3D "dwc_otg",
> +#endif

no, don't do that. See we're going through a big re-factor on the gadget
framework to allow multiple UDC drivers to be compiled as modules. The
idea is to be able to have distro-like kernels for embedded too.

Take a look at my gadget branch [1] and see how the gadget controllers
are modified to start allowing that.

I also have patch to the Kconfig allowing all controllers to be enabled
as modules, I just need some more time to figure out one warning on the
renenesas controller.

IOW, it's best to add both platform devices. Or move to device tree.

--=20
balbi

--bgLLobvf7eP6VP5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAGFwAAoJEAv8Txj19kN11WIH/0rLg1SxKkN2pfh3yU266l4Z
bLJCOulqeyNX3XLUdxL9EJ/rcZC03vX3I/TzkhWFoIIStTbAOHFN7UqDs+sz9IUR
f50n3vFWlkGDeVld2qFO98Q/iAkoYeV412uEWICtXgaXxY6R71uwPEQs3xtw5OFZ
nw97qRm8TNLUyb+wQdZhKw2laYumEjkdRkuyOszqjlAyXTq5baKtumYOCK/exzuF
tUqrguv/k/aK8bY8rIiWzlW6XtfZ47mHTSwxQFZSRLe9yJODVFBOLiOu31JCMXNY
QPxnXMR80UMFHKDUcmkZ4t9Rbo8onFNOvPFAUWE/pRmEYFGwzJ1AjsvaCM72XAo=
=xToe
-----END PGP SIGNATURE-----

--bgLLobvf7eP6VP5c--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
