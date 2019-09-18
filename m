From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: Convert Samsung Exynos
 SROM bindings to json-schema
Date: Wed, 18 Sep 2019 14:25:12 +0200
Message-ID: <CAJKOXPeCH-hp40gnC4W5Fn8Z0OWqF74H4r1RQOJTCnu72wmrZQ@mail.gmail.com>
References: <20190907144442.16788-1-krzk@kernel.org> <5d7ba95e.1c69fb81.bba41.66c2@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d7ba95e.1c69fb81.bba41.66c2@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 13 Sep 2019 at 16:36, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Sep 07, 2019 at 04:44:42PM +0200, Krzysztof Kozlowski wrote:
> > Convert Samsung Exynos SROM controller bindings to DT schema format
> > using json-schema.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../memory-controllers/exynos-srom.txt        |  79 ----------
> >  .../memory-controllers/exynos-srom.yaml       | 136 ++++++++++++++++++
> >  2 files changed, 136 insertions(+), 79 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.txt
> >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
>
>
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
> > new file mode 100644
> > index 000000000000..9573bcfd68bf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.yaml
> > @@ -0,0 +1,136 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/memory-controllers/exynos-srom.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Samsung Exynos SoC SROM Controller driver
> > +
> > +maintainers:
> > +  - Krzysztof Kozlowski <krzk@kernel.org>
> > +
> > +description: |+
> > +  The SROM controller can be used to attach external peripherals. In this case
> > +  extra properties, describing the bus behind it, should be specified.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: samsung,exynos4210-srom
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges:
> > +    description: |
> > +      Reflects the memory layout with four integer values per bank. Format:
> > +      <bank-number> 0 <parent address of bank> <size>
> > +
> > +patternProperties:
> > +  "^.*@[0-9]+,[0-9]+$":
>
> How many chip selects? Can be a single digit?

Currently up to four banks, so I can limit the pattern.

>
> Also, these should be hex values.

Sure.

>
> > +    type: object
> > +    description:
> > +      The actual device nodes should be added as subnodes to the SROMc node.
> > +      These subnodes, in addition to regular device specification, should
> > +      contain the following properties, describing configuration
> > +      of the relevant SROM bank.
> > +
> > +    properties:
> > +      reg:
> > +        description:
> > +          Bank number, base address (relative to start of the bank) and size
> > +          of the memory mapped for the device. Note that base address will be
> > +          typically 0 as this is the start of the bank.
> > +        maxItems: 1
> > +
> > +      reg-io-width:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32
> > +          - enum: [1, 2]
> > +        description:
> > +          Data width in bytes (1 or 2). If omitted, default of 1 is used.
> > +
> > +      samsung,srom-page-mode:
> > +        description:
> > +          If page mode is set, 4 data page mode will be configured,
> > +          else normal (1 data) page mode will be set.
> > +        type: boolean
> > +
> > +      samsung,srom-timing:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +          - items:
> > +              minItems: 6
> > +              maxItems: 6
> > +        description: |
> > +          Array of 6 integers, specifying bank timings in the following order:
> > +          Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs.
> > +          Each value is specified in cycles and has the following meaning
> > +          and valid range:
> > +          Tacp: Page mode access cycle at Page mode (0 - 15)
> > +          Tcah: Address holding time after CSn (0 - 15)
> > +          Tcoh: Chip selection hold on OEn (0 - 15)
> > +          Tacc: Access cycle (0 - 31, the actual time is N + 1)
> > +          Tcos: Chip selection set-up before OEn (0 - 15)
> > +          Tacs: Address set-up before CSn (0 - 15)
> > +
> > +    required:
> > +      - reg
> > +      - samsung,srom-timing
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      anyOf:
> > +        - required: [ "#address-cells" ]
> > +        - required: [ ranges ]
> > +        - required: [ "#size-cells" ]
> > +    then:
> > +      required:
> > +        - "#address-cells"
> > +        - ranges
> > +        - "#size-cells"
>
> I don't think this is necessary as the core schema should take care of
> it. This can also be expressed using 'dependencies'.

I'll skip it then.

Best regards,
Krzysztof
