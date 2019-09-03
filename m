From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 5/9] dt-bindings: arm: samsung: Convert Exynos PMU bindings
 to json-schema
Date: Tue, 3 Sep 2019 09:58:21 +0200
Message-ID: <CAJKOXPc0SY_8BHMsWLN=1M3VQh41+bdBiH21L4KQPA+iLPYy+A@mail.gmail.com>
References: <20190823145356.6341-1-krzk@kernel.org> <20190823145356.6341-5-krzk@kernel.org>
 <CAL_JsqJybT41cEqiTriLMywUQj1BtAG_9muJ4=84OkF23y53CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJybT41cEqiTriLMywUQj1BtAG_9muJ4=84OkF23y53CA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, notify@kernel.orgArnd Bergmann <ar>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 26 Aug 2019 at 13:54, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Aug 23, 2019 at 9:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert Samsung Exynos Power Management Unit (PMU) bindings to DT schema
> > format using json-schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/samsung/pmu.txt   | 72 --------------
> >  .../devicetree/bindings/arm/samsung/pmu.yaml  | 93 +++++++++++++++++++
> >  2 files changed, 93 insertions(+), 72 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/samsung/pmu.yaml
>
>
> > diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> > new file mode 100644
> > index 000000000000..818c6f3488ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
> > @@ -0,0 +1,93 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/samsung/pmu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos SoC series Power Management Unit (PMU)
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - samsung,exynos3250-pmu
> > +          - samsung,exynos4210-pmu
> > +          - samsung,exynos4412-pmu
> > +          - samsung,exynos5250-pmu
> > +          - samsung,exynos5260-pmu
> > +          - samsung,exynos5410-pmu
> > +          - samsung,exynos5420-pmu
> > +          - samsung,exynos5433-pmu
> > +          - samsung,exynos7-pmu
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clock-names:
> > +    description:
> > +      list of clock names for particular CLKOUT mux inputs
> > +    # TODO: what is the maximum number of elements (mux inputs)?
> > +    minItems: 1
> > +    maxItems: 32
> > +    items:
> > +      - enum:
>
> This isn't correct as you are only defining possible names for the
> first item. Drop the '-' (making items a schema instead of a list) and
> then it applies to all. However, doing that will cause a meta-schema
> error which I need to fix to allow. Or if there's a small set of
> possibilities of number of inputs, you can list them under a 'oneOf'
> list.

Mhmm, I cannot test it or I have an error in the schema. if I
understand correctly, this would be:

  clock-names:
    description:
      List of clock names for particular CLKOUT mux inputs
    minItems: 1
    maxItems: 16
    items:
      clkout0
      clkout1
      clkout2
      clkout3
      clkout4
      clkout5
      clkout6
      clkout7
      clkout8
      clkout9
      clkout10
      clkout11
      clkout12
      clkout13
      clkout14
      clkout15
      clkout16

Now it produces the error "ignoring, error in schema 'items'" but
maybe it is expected with current meta-schema?

Best regards,
Krzysztof
