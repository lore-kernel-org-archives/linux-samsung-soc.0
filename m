From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add MFC device tree support
Date: Thu, 23 Aug 2012 17:16:11 +0900
Message-ID: <1d4801cd8107$8e5769e0$ab063da0$%kim@samsung.com>
References: <22088923.161871345179014012.JavaMail.weblogic@epml10>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38965 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933655Ab2HWIQN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Aug 2012 04:16:13 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M97003HU8AY9930@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 17:16:11 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M97004BT8AZR940@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Aug 2012 17:16:11 +0900 (KST)
In-reply-to: <22088923.161871345179014012.JavaMail.weblogic@epml10>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arun.kk@samsung.com, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'Kamil Debski' <k.debski@samsung.com>, 'Jeongtae Park' <jtp.park@samsung.com>, 'NAVEEN KRISHNA CHATRADHI' <ch.naveen@samsung.com>, 'SUNIL JOSHI' <joshi@samsung.com>

Arun Kumar K wrote:
> 
> Hi Thomas,
> Thank you for the comments.
> Please find my response inline.
> 
> ------- Original Message -------
> Sender : Thomas Abraham<thomas.abraham@linaro.org>
> Date   : Aug 16, 2012 17:12 (GMT+05:30)
> Title  : Re: [PATCH] ARM: EXYNOS: Add MFC device tree support
> 
> On 16 August 2012 18:01, Arun Kumar K <arun.kk@samsung.com> wrote:
> > From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> >
> > This patch adds device tree entry for MFC in the Exynos
> > machines. Exynos4 SoCs support MFC v5 version and Exynos5 has
> > MFC v6.x version. So making the required changes in the clock

Since v6.1 is not used anywhere so just MFC v6 should be ok.

> > files and adds MFC to the DT device list.
> >
> > Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> > Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> > ---
> >  .../devicetree/bindings/media/s5p-mfc.txt          |   24
> ++++++++++++++++++++
> >  arch/arm/boot/dts/exynos4210.dtsi                  |   10 ++++++++
> >  arch/arm/boot/dts/exynos5250.dtsi                  |   10 ++++++++
> >  arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
> >  arch/arm/mach-exynos/mach-exynos4-dt.c             |   22
> ++++++++++++++++++
> >  arch/arm/mach-exynos/mach-exynos5-dt.c             |   22
> ++++++++++++++++++
> >  6 files changed, 89 insertions(+), 1 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt
> b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> > new file mode 100644
> > index 0000000..b9bd266
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
> > @@ -0,0 +1,24 @@
> > +* Samsung Multi Format Codec (MFC)
> > +
> > +Mult Format Codec (MFC) is the IP present in Samsung SoCs which
> > +supports high resolution decoding and encoding functionalities.
> >
> > In addition to this, specifying that mfc is used for video
> > encode/decode would be informative.
> 
> Ok. I will make it more descriptive.
> 
> > +
> > +Required properties:
> > +  - compatible : value should be either one among the following
> > +       (a) "samsung,s5p-mfc-v5" for MFC v5 present in Exynos4 SoCs
> > +       (b) "samsung,s5p-mfc-v6" for MFC v6.x present in Exynos5 SoCs
> >
> > "s5p" should be dropped from the compatible values. For example, it
> > should be "samsung,mfc-v5", which is sufficient to identify the
> > version of the mfc controller.
> 
> Ok will remove s5p.
> 
Yeah, I agree, just 'mfc-vX' is enough.

> > +
> > +  - reg : Physical base address of the IP registers and length of
> memory
> > +         mapped region.
> > +
> > +  - interrupts : MFC interupt number to the CPU.
> > +
> > +  - samsung,mfc-r : Base address of the first memory bank used by MFC
> > +                   for DMA contiguous memory allocation.
> > +
> > +  - samsung,mfc-r-size : Size of the first memory bank.
> >
> > It is not allowed to pass buffer base address and size from device
> > tree. Device tree node should describe only the MFC controller
> > hardware. Any memory management related information should be handled
> > outside of device tree. This helps the bindings to be reusable across
> > multiple operating systems.
> 
> The mfc-l and mfc-r base address and size is board specific info which has
> to
> be passed to the driver. This is used for DMA contiguous allocation by
> driver and this value
> can change on a different board.
> So in that case, i will pass it as platform data to the driver from mach-
> exynos5-dt.c file.
> I hope that would be ok.
> 
I don't think so. The mach-exynos5-dt is for all EXYNOS5 SoCs not
platform_data. As I know, the addresses and sizes for buffer passed via
platform data before, so it can be passed via device tree for board(.dtsi)?
not SoC. In addition, it depends on board.

> > +
> > +  - samsung,mfc-l : Base address of the second memory bank used by MFC
> > +                   for DMA contiguous memory allocation.
> > +
> > +  - samsung,mfc-l-size : Size of the second memory bank.
> >
> > Same comment as above. And the bindings documentation is usually
> > included in the same patch that adds device tree support for the
> > driver.
> 
> Ok
> 
> > diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi
> > index 02891fe..b5ee43d 100644
> > --- a/arch/arm/boot/dts/exynos4210.dtsi
> > +++ b/arch/arm/boot/dts/exynos4210.dtsi
> > @@ -56,6 +56,16 @@
> >                 interrupts = <0 43 0>;
> >         };
> >
> > +       mfc {
> > +               compatible = "samsung,s5p-mfc";

Maybe
+	compatible = "samsung,mfc-v5"; ?

> > +               reg = <0x13400000 0x10000>;
> > +               interrupts = <0 94 0>;
> > +               samsung,mfc-r = <0x43000000>;
> > +               samsung,mfc-r-size = <8388608>;
> > +               samsung,mfc-l = <0x51000000>;
> > +               samsung,mfc-l-size = <8388608>;

As I commented, the size depends on each board not SoC. So should be removed
here.

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
