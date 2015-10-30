From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 2/4] ARM: dts: Add SROMc to Exynos 5410
Date: Fri, 30 Oct 2015 09:41:15 +0300
Message-ID: <009f01d112dd$fab40830$f01c1890$@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <eafa355058ff500a72ff2e3408ab635954467a76.1446122247.git.p.fedin@samsung.com>
 <CAGcde9EXfe0amqoTOwgKi-Y6=4mRcEbZrA=as-BxzfMv3ntAhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:49669 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485AbbJ3GlU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 02:41:20 -0400
In-reply-to: <CAGcde9EXfe0amqoTOwgKi-Y6=4mRcEbZrA=as-BxzfMv3ntAhQ@mail.gmail.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <pankaj.dubey@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Kukjin Kim' <kgene@kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>

 Hello!

> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-owner@vger.kernel.org]
> On Behalf Of Pankaj Dubey
> Sent: Thursday, October 29, 2015 8:28 PM
> To: Pavel Fedin
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-soc;
> linux-kernel@vger.kernel.org; Rob Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala;
> Kukjin Kim; Krzysztof Kozlowski
> Subject: Re: [PATCH v4 2/4] ARM: dts: Add SROMc to Exynos 5410
> 
> Hi Pavel,
> 
> On 29 October 2015 at 18:12, Pavel Fedin <p.fedin@samsung.com> wrote:
> > This machine uses own SoC device tree file, add missing part.
> >
> > Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> > ---
> >  arch/arm/boot/dts/exynos5410.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
> > index 4603356..da6a8fa0e 100644
> > --- a/arch/arm/boot/dts/exynos5410.dtsi
> > +++ b/arch/arm/boot/dts/exynos5410.dtsi
> > @@ -101,6 +101,15 @@
> >                         reg = <0x10000000 0x100>;
> >                 };
> >
> > +               sromc: sromc@12250000 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       ranges;
> > +
> 
> We do not need to specify these three properties as they are already
> present in parent node "soc".

 We do, otherwise dtc complains about defaults of #address-cells = 2 and #size-cells=1, and without empty "ranges" subnode's resources are not correctly translated.

> 
> > +                       compatible = "samsung,exynos-srom";
> > +                       reg = <0x12250000 0x14>;
> > +               };
> > +
> >                 pmu_system_controller: system-controller@10040000 {
> >                         compatible = "samsung,exynos5410-pmu", "syscon";
> >                         reg = <0x10040000 0x5000>;
> > @@ -133,6 +142,12 @@
> >                                                 <10 &gic 0 130 0>,
> >                                                 <11 &gic 0 131 0>;
> >                         };
> > +
> > +                       arch_timer {
> > +                               compatible = "arm,armv7-timer";
> > +                               clock-frequency = <24000000>;
> > +                       };
> > +
> 
> This change should not be part of this patch.

 Ooops, thank you very much, this should not have been here at all. This is a leftover from my experiments, i was tracing DT parsing code and added it just for test, to see why timer gets probed as a subnode.
 Just forgot to remove it afterwards and it slipped into the patch.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
