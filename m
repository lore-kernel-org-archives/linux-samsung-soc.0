From: Chanho Park <chanho61.park@samsung.com>
Subject: RE: [PATCHv2 2/4] ARM: dts: exynos4: add exynos_usbphy node
Date: Tue, 29 Apr 2014 19:21:10 +0900
Message-ID: <012c01cf6394$bdb4dc10$391e9430$@samsung.com>
References: <1398409152-14770-1-git-send-email-chanho61.park@samsung.com>
 <1398409152-14770-3-git-send-email-chanho61.park@samsung.com>
 <CAK9yfHx-m0+znU+pt7emqNtop4Y4wKEOcCQBXmw2akusavtUzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16457 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757373AbaD2KVM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Apr 2014 06:21:12 -0400
In-reply-to: <CAK9yfHx-m0+znU+pt7emqNtop4Y4wKEOcCQBXmw2akusavtUzA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Kamil Debski' <k.debski@samsung.com>, devicetree@vger.kernel.org

Hi Sachin,

> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Tuesday, April 29, 2014 6:23 PM
> To: Chanho Park
> Cc: Kukjin Kim; linux-samsung-soc; Tomasz Figa; Kamil Debski;
> devicetree@vger.kernel.org
> Subject: Re: [PATCHv2 2/4] ARM: dts: exynos4: add exynos_usbphy node
> 
> Hi Chanho,
> 
> On 25 April 2014 12:29, Chanho Park <chanho61.park@samsung.com> wrote:
> > This patch enables a exynos_usbphy node for exynos4 SoCs.
> > A exynos4x12 usb phy node is almost same with 4210's one
> > except compatible string and pmu syscon.
> >
> > Cc: Tomasz Figa <t.figa@samsung.com>
> > Cc: Kamil Debski <k.debski@samsung.com>
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos4.dtsi    | 10 ++++++++++
> >  arch/arm/boot/dts/exynos4x12.dtsi |  5 +++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4.dtsi
> b/arch/arm/boot/dts/exynos4.dtsi
> > index 264066f..5f9b23b 100644
> > --- a/arch/arm/boot/dts/exynos4.dtsi
> > +++ b/arch/arm/boot/dts/exynos4.dtsi
> > @@ -278,6 +278,16 @@
> >                 status = "disabled";
> >         };
> >
> > +       exynos_usbphy: exynos-usbphy@125B0000 {
> > +               compatible = "samsung,exynos4210-usb2-phy";
> > +               reg = <0x125B0000 0x100>;
> > +               samsung,pmureg-phandle = <&pmu_system_controller>;
> > +               clocks = <&clock CLK_USB_DEVICE>, <&clock CLK_XUSBXTI>;
> > +               clock-names = "phy", "ref";
> > +               status = "disabled";
> 
> For readability it is better if status line is the last entry of the
> node.

Yes. It could be more readable it is in the last line. I'll update it in next patch.
Thanks.

Best Regards,
Chanho Park
