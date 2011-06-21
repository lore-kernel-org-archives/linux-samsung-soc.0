From: Praveen Paneri <p.paneri@samsung.com>
Subject: Re: [RFC][PATCH 2/5] ARM: SAMSUNG: Changing the build condition of
 OTG platform device for samsung.
Date: Tue, 21 Jun 2011 17:20:25 +0530
Message-ID: <BANLkTikPt=_KNpoJ4Xawz_PYMmZg3PnR9g@mail.gmail.com>
References: <0LN4003LQZBUSGU0@mailout4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:36496 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab1FULu0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jun 2011 07:50:26 -0400
In-Reply-To: <0LN4003LQZBUSGU0@mailout4.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com, linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tmarri@apm.com, thomas.ab@samsung.com, a.kesavan@samsung.com

Hi,

On Tue, Jun 21, 2011 at 4:17 PM, PRAVEEN PANERI <p.paneri@samsung.com> =
wrote:
>
> Hi,
>
> On Tue, Jun 21, 2011 at 12:33:44PM +0530, p.paneri@samsung.com wrote:
> > From: Praveen Paneri
> >
> > Adding dwc driver name in existing platform device
> > to probe DWC OTG driver.
> > Introduced otg_set_platdata function to pass platform data
> > Added selectable config option to add DWC OTG driver for different
> > machines.
> >
> > Signed-off-by: Praveen Paneri
> > ---
> >=A0=A0arch/arm/plat-samsung/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=
=A06 ++++++
> >=A0=A0arch/arm/plat-samsung/Makefile=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A0=A0=
=A01 +
> >=A0=A0arch/arm/plat-samsung/dev-usb-hsotg.c |=A0=A0 20 +++++++++++++=
+++++++
> >=A0=A03 files changed, 27 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/=
Kconfig
> > index 4d79519..58ed8b1 100644
> > --- a/arch/arm/plat-samsung/Kconfig
> > +++ b/arch/arm/plat-samsung/Kconfig
> > @@ -227,6 +227,12 @@ config S3C_DEV_USB_HSOTG
> >=A0=A0 help
> >=A0=A0 =A0=A0Compile in platform device definition for USB high-spee=
d OtG
> >
> > +config S3C_DEV_DWC_OTG
> > + bool
> > + help
> > + =A0=A0Compile in platform device definition for DWC OTG. This
> > + =A0=A0will make it selectable for different machines.
> > +
> >=A0=A0config S3C_DEV_WDT
> >=A0=A0 bool
> >=A0=A0 default y if ARCH_S3C2410
> > diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung=
/Makefile
> > index 53eb15b..785ca79 100644
> > --- a/arch/arm/plat-samsung/Makefile
> > +++ b/arch/arm/plat-samsung/Makefile
> > @@ -49,6 +49,7 @@ obj-$(CONFIG_S3C_DEV_FB) +=3D dev-fb.o
> >=A0=A0obj-y +=3D dev-uart.o
> >=A0=A0obj-$(CONFIG_S3C_DEV_USB_HOST) +=3D dev-usb.o
> >=A0=A0obj-$(CONFIG_S3C_DEV_USB_HSOTG) +=3D dev-usb-hsotg.o
> > +obj-$(CONFIG_S3C_DEV_DWC_OTG) +=3D dev-usb-hsotg.o
> >=A0=A0obj-$(CONFIG_S3C_DEV_WDT) +=3D dev-wdt.o
> >=A0=A0obj-$(CONFIG_S3C_DEV_NAND) +=3D dev-nand.o
> >=A0=A0obj-$(CONFIG_S3C_DEV_ONENAND) +=3D dev-onenand.o
> > diff --git a/arch/arm/plat-samsung/dev-usb-hsotg.c b/arch/arm/plat-=
samsung/dev-usb-hsotg.c
> > index 33a844a..7e6228b 100644
> > --- a/arch/arm/plat-samsung/dev-usb-hsotg.c
> > +++ b/arch/arm/plat-samsung/dev-usb-hsotg.c
> > @@ -20,6 +20,8 @@
> >=A0=A0#include
> >
> >=A0=A0#include
> > +#include
> > +#include
> >
> >=A0=A0static struct resource s3c_usb_hsotg_resources[] =3D {
> >=A0=A0 [0] =3D {
> > @@ -37,7 +39,12 @@ static struct resource s3c_usb_hsotg_resources[]=
 =3D {
> >=A0=A0static u64 s3c_hsotg_dmamask =3D DMA_BIT_MASK(32);
> >
> >=A0=A0struct platform_device s3c_device_usb_hsotg =3D {
> > +#ifdef CONFIG_S3C_DEV_USB_HSOTG
> >=A0=A0 .name =3D "s3c-hsotg",
> > +#endif
> > +#ifdef CONFIG_S3C_DEV_DWC_OTG
> > + .name =3D "dwc_otg",
> > +#endif
>
> no, don't do that. See we're going through a big re-factor on the gad=
get
> framework to allow multiple UDC drivers to be compiled as modules. Th=
e
> idea is to be able to have distro-like kernels for embedded too.
It can be build as a module but need to make necessary modifications in
platform code. Will modify according to the gadget framework.
Thanks for the comment.
paneri
>
> Take a look at my gadget branch [1] and see how the gadget controller=
s
> are modified to start allowing that.
>
> I also have patch to the Kconfig allowing all controllers to be enabl=
ed
> as modules, I just need some more time to figure out one warning on t=
he
> renenesas controller.
>
> IOW, it's best to add both platform devices. Or move to device tree.
>
> --
> balbi
>
>
>
>
>
>
