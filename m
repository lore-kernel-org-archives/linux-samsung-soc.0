From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device instance
 to non-dt build
Date: Mon, 19 Sep 2011 19:26:20 +0900
Message-ID: <001801cc76b6$92d65ff0$b8831fd0$%kim@samsung.com>
References: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-2-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-3-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-4-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-5-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-6-git-send-email-thomas.abraham@linaro.org>
 <1314867882-11755-7-git-send-email-thomas.abraham@linaro.org>
 <001901cc6b8b$0f450730$2dcf1590$%kim@samsung.com>
 <CAJuYYwSB3f8BPQx1jgsSykKKMMGsbeCCj7zSLp2-+gtonBrdVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39486 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755197Ab1ISK0W convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 06:26:22 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR00M4EMBWEU60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 19:26:21 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRR00AH0MBW5X@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 19:26:21 +0900 (KST)
In-reply-to: <CAJuYYwSB3f8BPQx1jgsSykKKMMGsbeCCj7zSLp2-+gtonBrdVw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

Thomas Abraham wrote:
>=20
> Dear Mr. Kim,
>=20
> On 5 September 2011 10:47, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >> Subject: [PATCH v2 6/6] ARM: EXYNOS4: Limit usage of pl330 device
instance
> > to
> >> non-dt build
> >>
> >> The pl330 device instances and associated platform data is require=
d
only
> >> for non-device-tree builds. With device tree, all of this informat=
ion
is
> >> obtained from the device tree.
> >>
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >> ---
> >> =A0arch/arm/mach-exynos4/Kconfig =A0| =A0 =A07 +++++++
> >> =A0arch/arm/mach-exynos4/Makefile | =A0 =A03 ++-
> >> =A02 files changed, 9 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/arch/arm/mach-exynos4/Kconfig
b/arch/arm/mach-exynos4/Kconfig
> >> index d4d401c..3edbf37 100644
> >> --- a/arch/arm/mach-exynos4/Kconfig
> >> +++ b/arch/arm/mach-exynos4/Kconfig
> >> @@ -21,6 +21,13 @@ config EXYNOS4_MCT
> >> =A0 =A0 =A0 help
> >> =A0 =A0 =A0 =A0 Use MCT (Multi Core Timer) as kernel timers
> >>
> >> +config EXYNOS4_DEV_DMA
> >> + =A0 =A0 bool
> >> + =A0 =A0 default y if !OF
> >> + =A0 =A0 help
> >> + =A0 =A0 =A0 Compile in amba device definitions for DMA controlle=
r if OF
> >> + =A0 =A0 =A0 is not enabled.
> >> +
> >> =A0config EXYNOS4_DEV_AHCI
> >> =A0 =A0 =A0 bool
> >> =A0 =A0 =A0 help
> >> diff --git a/arch/arm/mach-exynos4/Makefile
> > b/arch/arm/mach-exynos4/Makefile
> >> index d2bf5bf..a2f33dc 100644
> >> --- a/arch/arm/mach-exynos4/Makefile
> >> +++ b/arch/arm/mach-exynos4/Makefile
> >> @@ -13,7 +13,8 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0:=3D
> >> =A0# Core support for EXYNOS4 system
> >>
> >> =A0obj-$(CONFIG_CPU_EXYNOS4210) +=3D cpu.o init.o clock.o irq-comb=
iner.o
> >> -obj-$(CONFIG_CPU_EXYNOS4210) +=3D setup-i2c0.o irq-eint.o dma.o
> >> pmu.o
> >> +obj-$(CONFIG_CPU_EXYNOS4210) +=3D setup-i2c0.o irq-eint.o pmu.o
> >> +obj-$(CONFIG_EXYNOS4_DEV_DMA) =A0 =A0 =A0 =A0+=3D dma.o
> >
> > Do we need _really_ EXYNOS4_DEV_DMA here?
> > How about to use like following?
> >
> > +obj-$(!CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D dma.o
> >
> > If any problems, let me know.
>=20
> While trying out your suggestion, I found a issue with this patch
> related to compiling a kernel with both dt and non-dt board files
> included in the build.
>=20
> When compiling a single kernel image with mach-smdkv310.c file and
> exynos4 device tree enabled machine file, since CONFIG_OF is enabled,
> dma platform data does not get compiled which is required for
> mach-smdkv310. So, I would like to resubmit this patch and the update=
d
> diff is listed below. Could you please review the following diff.
>=20

Hi Thomas,

Oops, you're right...so following is ok to me but you need to rebase th=
is
based on latest my tree.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>=20
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index d4d401c..953ead7 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -21,6 +21,11 @@ config EXYNOS4_MCT
>  	help
>  	  Use MCT (Multi Core Timer) as kernel timers
>=20
> +config EXYNOS4_DEV_DMA
> +	bool
> +	help
> +	  Compile in amba device definitions for DMA controller
> +
>  config EXYNOS4_DEV_AHCI
>  	bool
>  	help
> @@ -129,6 +134,7 @@ config MACH_SMDKC210
>  	select EXYNOS4_SETUP_FIMD0
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_SDHCI
> +	select EXYNOS4_DEV_DMA
>  	help
>  	  Machine support for Samsung SMDKC210
>=20
> @@ -153,6 +159,7 @@ config MACH_SMDKV310
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_KEYPAD
>  	select EXYNOS4_SETUP_SDHCI
> +	select EXYNOS4_DEV_DMA
>  	help
>  	  Machine support for Samsung SMDKV310
>=20
> @@ -191,6 +198,7 @@ config MACH_UNIVERSAL_C210
>  	select EXYNOS4_SETUP_I2C3
>  	select EXYNOS4_SETUP_I2C5
>  	select EXYNOS4_SETUP_SDHCI
> +	select EXYNOS4_DEV_DMA
>  	help
>  	  Machine support for Samsung Mobile Universal S5PC210 Reference
>  	  Board.
> @@ -215,6 +223,7 @@ config MACH_NURI
>  	select EXYNOS4_SETUP_USB_PHY
>  	select SAMSUNG_DEV_PWM
>  	select SAMSUNG_DEV_ADC
> +	select EXYNOS4_DEV_DMA
>  	help
>  	  Machine support for Samsung Mobile NURI Board.
>=20
> diff --git a/arch/arm/mach-exynos4/Makefile
b/arch/arm/mach-exynos4/Makefile
> index 929262a..a2f33dc 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -14,7 +14,8 @@ obj-				:=3D
>=20
>  obj-$(CONFIG_CPU_EXYNOS4210)	+=3D cpu.o init.o clock.o irq-combiner.=
o
> -obj-$(CONFIG_CPU_EXYNOS4210)	+=3D setup-i2c0.o irq-eint.o dma.o
> pmu.o
> +obj-$(CONFIG_CPU_EXYNOS4210)	+=3D setup-i2c0.o irq-eint.o pmu.o
> +obj-$(CONFIG_EXYNOS4_DEV_DMA)	+=3D dma.o
>  obj-$(CONFIG_PM)		+=3D pm.o sleep.o
>  obj-$(CONFIG_CPU_IDLE)		+=3D cpuidle.o
>=20
>=20
>=20
> Thanks,
> Thomas.
