From: Praveen Paneri <p.paneri@samsung.com>
Subject: Re: [RFC][PATCH 4/5] ARM: S5P64x0: Adding OTG PHY control code
Date: Wed, 6 Jul 2011 11:03:10 +0530
Message-ID: <CAD6zSYOYUPpnovsxGWxiazKr3QnHhG78dfkctp3huvuNzdT4aw@mail.gmail.com>
References: <0LN400HTOZEQDIL0@mailout1.samsung.com>
	<BANLkTikDDBQjE2RCeeBB50vokSTcnCO46A@mail.gmail.com>
	<20110622094923.GA23598@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:37863 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673Ab1GFFdM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 01:33:12 -0400
In-Reply-To: <20110622094923.GA23598@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tmarri@apm.com, thomas.ab@samsung.com, a.kesavan@samsung.com

Hi Felipe,

Sorry for a delayed response to your comment. I have been addressing
all the comment given
by you, following two points remain where I need your suggestion.

On Wed, Jun 22, 2011 at 3:19 PM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> On Wed, Jun 22, 2011 at 01:56:25PM +0530, Praveen Paneri wrote:
>> > > diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p6=
4x0/Makefile
>> > > index ae6bf6f..611fb3a 100644
>> > > --- a/arch/arm/mach-s5p64x0/Makefile
>> > > +++ b/arch/arm/mach-s5p64x0/Makefile
>> > > @@ -28,3 +28,4 @@ obj-y +=3D dev-audio.o
>> > >=A0=A0obj-$(CONFIG_S3C64XX_DEV_SPI) +=3D dev-spi.o
>> > >
>> > >=A0=A0obj-$(CONFIG_S5P64X0_SETUP_I2C1) +=3D setup-i2c1.o
>> > > +obj-$(CONFIG_S3C_DEV_DWC_OTG) +=3D setup-otg-phy.o
>> > > diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm=
/mach-s5p64x0/include/mach/map.h
>> > > index 95c9125..717c279 100644
>> > > --- a/arch/arm/mach-s5p64x0/include/mach/map.h
>> > > +++ b/arch/arm/mach-s5p64x0/include/mach/map.h
>> > > @@ -44,6 +44,8 @@
>> > >=A0=A0#define S5P64X0_PA_SPI1 0xEC500000
>> > >
>> > >=A0=A0#define S5P64X0_PA_HSOTG 0xED100000
>> > > +#define S5P64X0_PA_USB_HSPHY 0xED200000
>> > > +#define S5P64X0_VA_USB_HSPHY S3C_ADDR_CPU(0x00100000)
>> > >
>> > >=A0=A0#define S5P64X0_PA_HSMMC(x) (0xED800000 + ((x) * 0x100000))
>> > >
>> > > @@ -71,6 +73,8 @@
>> > >=A0=A0#define S5P_PA_TIMER S5P64X0_PA_TIMER
>> > >
>> > >=A0=A0#define SAMSUNG_PA_ADC S5P64X0_PA_ADC
>> > > +#define S3C_PA_USB_HSOTG S5P64X0_PA_HSOTG
>> > > +#define S3C_VA_USB_HSPHY=A0=A0=A0=A0=A0=A0=A0=A0S5P64X0_VA_USB_=
HSPHY
>> > >
>> > >=A0=A0/* UART */
>> > >
>> > > diff --git a/arch/arm/mach-s5p64x0/setup-otg-phy.c b/arch/arm/ma=
ch-s5p64x0/setup-otg-phy.c
>> >
>> > drivers should not live in arch/arm/*, why don't you move this to
>> > drivers/usb/otg where the PHYs are staying right now ?
>> PHY init/exit code can vary across SoCs. Wouldn't it be better to ha=
ve it in the
>> SoC specific location?
>
> It will vary how ? If it's only regarding e.g. a different GPIO pin o=
r a
> different IRQ number, you handle that by passing data down to driver
> (via platform_data or struct resource), now if it varies because a
> different board uses a different PHY, then another driver should be
> written (well, as long as it's really different from the one you have
> now, otherwise you should see if it's worth making the existing drive=
r
> more flexible).
We have only 4 registers which are used for phy control. The bit struct=
ure
of these registers vary across the SoCs.
1) PHY power control
2) PHY clock control
3) OTG reset control
4) PHY tune

To init/de-init the phy we just need to set the above 4 registers appro=
priately.
Do you still think there is a necessity for a separate driver ?

I have gone through the reference drivers suggested by you.
=46unctionality of this PHY
control remains very less relative to those drivers.

I have removed a lot of ifdefery from the initial patches. The only
problem I am facing is
in implementing a generic register I/O method which can work for both
ARM and PPC.
Existing code for PPC was using following funtions
in_le32, in_be32, out_le32, out_be32
while in ARM readl and writel functions are used.
kindly suggest a way out of it.
>
> --
> balbi
>
