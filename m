From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: dts: Add USB host node for Exynos4
Date: Wed, 24 Jul 2013 15:49:41 +0900
Message-ID: <000001ce8839$f97faa90$ec7effb0$@samsung.com>
References: <1374600763-19466-1-git-send-email-tobetter@gmail.com>
 <CAK9yfHz10ao32Y4VRsvjNLe+zaq+hYk4KVgtwFgSLDsN-9Pfpw@mail.gmail.com>
 <CADoNuNdqF0Y=3pdBCE26AQgkv6uqZQ4uE+BfPSSNxAvuuR+kvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27812 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751710Ab3GXGtp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 02:49:45 -0400
In-reply-to: <CADoNuNdqF0Y=3pdBCE26AQgkv6uqZQ4uE+BfPSSNxAvuuR+kvg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Dongjin Kim' <tobetter@gmail.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

On Wednesday, July 24, 2013 3:29 PM, Dongjin Kim wrote:
> 
> +Jingoo Han
> 
> Sorry, its my bad. Typo problem.
> 
> I found another patch same with mine,
> https://patchwork.kernel.org/patch/2628451, submitted by Jingoo Han
> and tested on Exynos4210. Mine is tested on Exynos4412. Both SoC have
> same USB host address space, so I think USB host device nodes can be
> placed in exynos4.dtsi.

OK, USB host device nodes can be placed in exynos4.dtsi.

However, next time, please leave comment on earlier patch.
The patch for Exynos4210 USB was already submitted 2 months ago.


> 
> Regards,
> Dongjin.
> 
> On Wed, Jul 24, 2013 at 12:38 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > On 23 July 2013 23:02, Dongjin Kim <tobetter@gmail.com> wrote:
> >> This patch adds EHCI and OHCI host device nodes for Exynos4.
> >>
> >> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
> >> ---
> >>  arch/arm/boot/dts/exynos4.dtsi |   20 ++++++++++++++++++++
> >>  1 file changed, 20 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
> >> index 3f94fe8..1cdbf89 100644
> >> --- a/arch/arm/boot/dts/exynos4.dtsi
> >> +++ b/arch/arm/boot/dts/exynos4.dtsi
> >> @@ -155,6 +155,26 @@
> >>                 status = "disabled";
> >>         };
> >>
> >> +       ehci@12580000 {
> >> +               compatible = "samsung,exynos4210-ehci";
> >> +               reg = <0x12580000 0x100>;
> >> +               interrupts = <0 70 0>;
> >> +               status = "disabled";
> >> +
> >> +               clocks = <&clock 304>;
> >> +               clock-names = "usbhost";
> >> +       };
> >> +
> >> +       ohci@12590000 {
> >> +               compatible = "samsung,exynos4210-ohci";
> >> +               reg = <0x12580000 0x100>;
> >
> > Register value and node name do not match. Typo?
> >
> >
> >> +               interrupts = <0 70 0>;
> >> +               status = "disabled";
> >> +
> >> +               clocks = <&clock 304>;
> >> +               clock-names = "usbhost";
> >> +       };
> >> +
> >>         mfc: codec@13400000 {
> >>                 compatible = "samsung,mfc-v5";
> >>                 reg = <0x13400000 0x10000>;
> >> --
> >> 1.7.9.5
