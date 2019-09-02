From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 7/9] dt-bindings: rtc: s3c: Convert S3C/Exynos RTC bindings
 to json-schema
Date: Mon, 2 Sep 2019 14:47:55 +0200
Message-ID: <CAJKOXPddVJvpGgd1K_W63eho8tu+X_nr+0PYpjBafp+bw=-70w@mail.gmail.com>
References: <20190823145356.6341-1-krzk@kernel.org> <20190823145356.6341-7-krzk@kernel.org>
 <CAL_JsqKCpKuc=-4UyWFFv_RenKuSJcr9cdSKjbkL8F1ni+VODw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKCpKuc=-4UyWFFv_RenKuSJcr9cdSKjbkL8F1ni+VODw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, notify@kernel.orgArnd Bergmann <ar>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 26 Aug 2019 at 14:06, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Aug 23, 2019 at 9:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert Samsung S3C/Exynos Real Time Clock bindings to DT schema format
> > using json-schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/rtc/s3c-rtc.txt       | 31 ------
> >  .../devicetree/bindings/rtc/s3c-rtc.yaml      | 95 +++++++++++++++++++
> >  2 files changed, 95 insertions(+), 31 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> >  create mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
>
>
> > diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
> > new file mode 100644
> > index 000000000000..44b021812a83
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung S3C, S5P and Exynos Real Time Clock controller
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +
> > +# Select also deprecated compatibles (for finding deprecate usage)
> > +select:
> > +  properties:
> > +    compatible:
> > +      items:
> > +        - enum:
> > +            - samsung,s3c2410-rtc
> > +            - samsung,s3c2416-rtc
> > +            - samsung,s3c2443-rtc
> > +            - samsung,s3c6410-rtc
> > +            # Deprecated, use samsung,s3c6410-rtc
> > +            - samsung,exynos3250-rtc
>
> We've come up with a better way of doing this that doesn't need a
> custom 'select'. Add a 'oneOf' to compatible and add another entry:
>
> - const: samsung,exynos3250-rtc
>   deprecated: true
>
> It's not implemented yet in the tool, but we'll keep the compatible
> for 'select' and otherwise drop schema marked deprecated.

OK

>
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
>
> You can drop 'items' when there's only 1 entry.

Indeed.

>
> > +          - samsung,s3c2410-rtc
> > +          - samsung,s3c2416-rtc
> > +          - samsung,s3c2443-rtc
> > +          - samsung,s3c6410-rtc
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description:
> > +      Must contain a list of phandle and clock specifier for the rtc
> > +      clock and in the case of a s3c6410 compatible controller, also
> > +      a source clock.
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    description:
> > +      Must contain "rtc" and for a s3c6410 compatible controller,
> > +      a "rtc_src" sorted in the same order as the clocks property.
> > +    oneOf:
> > +      - items:
> > +          - const: rtc
> > +      - items:
> > +          # TODO: This can be in any order matching clocks, how to express it?
>
> It shouldn't be in any order. Fix the dts files.

I see, other schemas also require specific ordering.

>
> > +          - const: rtc
> > +          - const: rtc_src
>
> You should drop all this and add an else clause below.

Yes

>
> > +
> > +  interrupts:
> > +    description:
> > +      Two interrupt numbers to the cpu should be specified. First
> > +      interrupt number is the rtc alarm interrupt and second interrupt number
> > +      is the rtc tick interrupt. The number of cells representing a interrupt
> > +      depends on the parent interrupt controller.
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - samsung,s3c6410-rtc
> > +              - samsung,exynos3250-rtc
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 2
> > +        clock-names:
> > +          items:
> > +          - const: rtc
> > +          - const: rtc_src
>
> Should be indented 2 more spaces.

Thanks for feedback.

Best regards,
Krzysztof
