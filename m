From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH V2] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri, 03 Jun 2011 15:25:02 +0200
Message-ID: <000f01cc21f1$a4ee3010$eeca9030$%szyprowski@samsung.com>
References: <1307084654-22052-1-git-send-email-tushar.behera@linaro.org>
 <BANLkTimyRFHgfk_CnVDbny5w8jaJ5qq8hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15377 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755136Ab1FCNZS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 09:25:18 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LM7001IDUM46W40@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jun 2011 14:25:17 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LM7004NSUM3R4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Jun 2011 14:25:16 +0100 (BST)
In-reply-to: <BANLkTimyRFHgfk_CnVDbny5w8jaJ5qq8hA@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Tushar Behera' <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, jy0922.shim@samsung.com, samsung@lists.linaro.org

Hello,

On Friday, June 03, 2011 1:52 PM Thomas Abraham wrote:

> On 3 June 2011 12:34, Tushar Behera <tushar.behera@linaro.org> wrote:
> > Added Kconfig entry for setup-usb-phy.c on which EHCI support is
> > dependent on.
> >
> > Following the naming convention of other setup files, we have follo=
wing
> > renaming.
> > =A0 =A0 =A0 =A0usb-phy.c =3D=3D> setup-usb-phy.c
> >
> > Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> > ---
> > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A06 ++++++
> > =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> > =A0.../mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} =A0 =A0| =A0 =A0=
0
> > =A03 files changed, 7 insertions(+), 1 deletions(-)
> > =A0rename arch/arm/mach-exynos4/{usb-phy.c =3D> setup-usb-phy.c} (1=
00%)
> >
> > diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-
> exynos4/Kconfig
> > index b92c1e5..a45a022 100644
> > --- a/arch/arm/mach-exynos4/Kconfig
> > +++ b/arch/arm/mach-exynos4/Kconfig
> > @@ -91,6 +91,11 @@ config EXYNOS4_SETUP_FIMC
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Common setup code for the camera interfaces.
> >
> > +config EXYNOS4_SETUP_USB_PHY
> > + =A0 =A0 =A0 bool
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 Common setup code for USB PHY controller
> > +
> > =A0# machine support
> >
> > =A0menu "EXYNOS4 Machines"
> > @@ -176,6 +181,7 @@ config MACH_NURI
> > =A0 =A0 =A0 =A0select EXYNOS4_SETUP_I2C3
> > =A0 =A0 =A0 =A0select EXYNOS4_SETUP_I2C5
> > =A0 =A0 =A0 =A0select EXYNOS4_SETUP_SDHCI
> > + =A0 =A0 =A0 select EXYNOS4_SETUP_USB_PHY
> > =A0 =A0 =A0 =A0select SAMSUNG_DEV_PWM
> > =A0 =A0 =A0 =A0help
> > =A0 =A0 =A0 =A0 =A0Machine support for Samsung Mobile NURI Board.
> > diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-
> exynos4/Makefile
> > index a9bb94f..60fe5ec 100644
> > --- a/arch/arm/mach-exynos4/Makefile
> > +++ b/arch/arm/mach-exynos4/Makefile
> > @@ -56,4 +56,4 @@ obj-$(CONFIG_EXYNOS4_SETUP_KEYPAD) =A0 =A0+=3D se=
tup-keypad.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_SDHCI) =A0 =A0 =A0+=3D setup-sdhci.o
> > =A0obj-$(CONFIG_EXYNOS4_SETUP_SDHCI_GPIO) +=3D setup-sdhci-gpio.o
> >
> > -obj-$(CONFIG_USB_SUPPORT) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D usb-phy.=
o
> > +obj-$(CONFIG_EXYNOS4_SETUP_USB_PHY) =A0 =A0+=3D setup-usb-phy.o
>=20
> Since plat-s5p/dev-ehci.c is the only consumer of setup-usb-phy.c,
> could setup-usb-phy.o be made dependent on the S5P_DEV_USB_EHCI confi=
g
> option? Any particular reason to create a new EXYNOS4_SETUP_USB_PHY
> config option in this case? Will there be a case where usb phy
> configuration code would be used irrespective of dev-ehci being used?

I suggested this solution to keep the consistence in the style. The oth=
er reason
is the fact that USB PHY control functions should be also added to usb =
hs otg=20
driver so these function will be used by 2 different devices.

Best regards
--=20
Marek Szyprowski
Samsung Poland R&D Center
