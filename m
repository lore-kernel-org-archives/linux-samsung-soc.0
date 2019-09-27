From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: Use defines instead of numbers in
 Exynos MCT examples
Date: Fri, 27 Sep 2019 08:52:29 +0200
Message-ID: <20190927065229.GA18923@pi3>
References: <CGME20190926183707epcas3p350fe17bc738540b37f1130d967c31a62@epcas3p3.samsung.com>
 <20190926183643.7118-1-krzk@kernel.org>
 <fc0809b0-1e6a-0564-75d9-0ccb14d2826c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fc0809b0-1e6a-0564-75d9-0ccb14d2826c@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 27, 2019 at 08:36:47AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
 >   
> >       timer@10050000 {
> >           compatible = "samsung,exynos4412-mct";
> >           reg = <0x10050000 0x800>;
> >   
> > -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> > -                     <0 42 0>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> 
> the last one should be GIC_PPI
> 
> >       };
> >   
> >     - |
> >       // In this example, the IP contains four local timers, but using
> >       // a per-processor interrupt to handle them. All the local timer
> >       // interrupts are specified.
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   
> >       timer@10050000 {
> >           compatible = "samsung,exynos4412-mct";
> >           reg = <0x10050000 0x800>;
> >   
> > -        interrupts = <0 57 0>, <0 69 0>, <0 70 0>, <0 71 0>,
> > -                     <0 42 0>, <0 42 0>, <0 42 0>, <0 42 0>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> 
> again, last 4 entries should use GIC_PPI

Indeed, thanks for noticing it.

Best regards,
Krzysztof
