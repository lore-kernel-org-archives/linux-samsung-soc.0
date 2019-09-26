From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Scaler to dt-schema
Date: Thu, 26 Sep 2019 14:19:41 -0500
Message-ID: <CAL_Jsq+yWL3ZSnvHbGb4B0zHptQtFXjvOUJe0pNSHmH05GN-PA@mail.gmail.com>
References: <CGME20190926125619eucas1p249ac149ef1e1a3eb975dae94b08cd7be@eucas1p2.samsung.com>
 <20190926125614.10408-1-m.szyprowski@samsung.com> <20190926140315.GA16002@pi3>
 <0d3831ae-e33d-774d-02f7-fba45a95d25c@samsung.com> <CAL_JsqL4LZdkWkDkZdEpv4Sh840GywfHhLgmWjYCm9z+QPxrLg@mail.gmail.com>
 <f06da64d-58de-1d51-48d4-95a6efd417d0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f06da64d-58de-1d51-48d4-95a6efd417d0@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 11:54 AM Maciej Falkowski
<m.falkowski@samsung.com> wrote:
>
>
> On 9/26/19 5:35 PM, Rob Herring wrote:
> > On Thu, Sep 26, 2019 at 9:47 AM Maciej Falkowski
> > <m.falkowski@samsung.com> wrote:
> >>
> >> On 9/26/19 4:03 PM, Krzysztof Kozlowski wrote:
> >>> On Thu, Sep 26, 2019 at 02:56:14PM +0200, Marek Szyprowski wrote:
> >>>> From: Maciej Falkowski <m.falkowski@samsung.com>
> >>>>
> >>>> Convert Samsung Image Scaler to newer dt-schema format.
> >>>>
> >>>> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> >>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>> ---
> >>>> v2:
> >>>> - Removed quotation marks from string in 'compatible' property
> >>>> - Added if-then statement for 'clocks' and 'clock-names' property
> >>>> - Added include directive to example
> >>>> - Added GIC_SPI macro to example
> >>>>
> >>>> Best regards,
> >>>> Maciej Falkowski
> >>>> ---
> >>>>    .../bindings/gpu/samsung-scaler.txt           | 27 -------
> >>>>    .../bindings/gpu/samsung-scaler.yaml          | 71 +++++++++++++++++++
> >>>>    2 files changed, 71 insertions(+), 27 deletions(-)
> >>>>    delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
> >>>>    create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.txt b/Documentation/devicetree/bindings/gpu/samsung-scaler.txt
> >>>> deleted file mode 100644
> >>>> index 9c3d98105dfd..000000000000
> >>>> --- a/Documentation/devicetree/bindings/gpu/samsung-scaler.txt
> >>>> +++ /dev/null
> >>>> @@ -1,27 +0,0 @@
> >>>> -* Samsung Exynos Image Scaler
> >>>> -
> >>>> -Required properties:
> >>>> -  - compatible : value should be one of the following:
> >>>> -    (a) "samsung,exynos5420-scaler" for Scaler IP in Exynos5420
> >>>> -    (b) "samsung,exynos5433-scaler" for Scaler IP in Exynos5433
> >>>> -
> >>>> -  - reg : Physical base address of the IP registers and length of memory
> >>>> -      mapped region.
> >>>> -
> >>>> -  - interrupts : Interrupt specifier for scaler interrupt, according to format
> >>>> -             specific to interrupt parent.
> >>>> -
> >>>> -  - clocks : Clock specifier for scaler clock, according to generic clock
> >>>> -         bindings. (See Documentation/devicetree/bindings/clock/exynos*.txt)
> >>>> -
> >>>> -  - clock-names : Names of clocks. For exynos scaler, it should be "mscl"
> >>>> -              on 5420 and "pclk", "aclk" and "aclk_xiu" on 5433.
> >>>> -
> >>>> -Example:
> >>>> -    scaler@12800000 {
> >>>> -            compatible = "samsung,exynos5420-scaler";
> >>>> -            reg = <0x12800000 0x1294>;
> >>>> -            interrupts = <0 220 IRQ_TYPE_LEVEL_HIGH>;
> >>>> -            clocks = <&clock CLK_MSCL0>;
> >>>> -            clock-names = "mscl";
> >>>> -    };
> >>>> diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..af19930d052e
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> >>>> @@ -0,0 +1,71 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: https://protect2.fireeye.com/url?k=1ffa720fd467d028.1ffbf940-9a5a550397b4da2b&u=http://devicetree.org/schemas/gpu/samsung-scaler.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Samsung Exynos SoC Image Scaler
> >>>> +
> >>>> +maintainers:
> >>>> +  - Inki Dae <inki.dae@samsung.com>
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - samsung,exynos5420-scaler
> >>>> +      - samsung,exynos5433-scaler
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  interrupts:
> >>>> +    maxItems: 1
> >>>> +
> >> Hi Krzysztof,
> > Please work on your quoting. Reply below what you are replying to.
> >
> >> By "Midgard" I assume that you referred to
> >> 'Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml'.
> >>
> >> I think that 'clocks' and 'clock-names' properties before if statement
> >> serve different purpose in this schema.
> >> It totally has about 10 different compatibles grouped in five pairs.
> >> Then schema declares for 'clocks' minItems as one and maxItems as two and
> >> later it overrides this boundaries with if statement for particular
> >> compatibles.
> > It's not an override, but an AND. So what's under 'properties' has to
> > be the looser constraints than what is under an if/then schema.
> Hi Rob,
> Thank you for explaining that.
> >> Well, then clearly, the purpose is to declare boundaries for all of
> >> pairs and
> >> not to provide easy-to-find definition for this properties.
> >>
> >> In my schema I directly set boundaries per compatible with single
> >> if-else statement.
> >> I didn't know what to put before then as if statement is already
> >> self-explanatory.
> >>
> >> Best regards,
> >> Maciej Falkowski
> >>
> >>> I am repeating myself... leave the clocks and clock-names.
> >>>
> >>> "I think it is worth to leave the clocks and clock-names here (could be
> >>> empty or with min/max values for number of items). This makes it easy to
> >>> find the properties by humans.
> > I agree.
> >
> > Let me put it another way. You need to add an 'additionalProperties:
> > false' and (I think) to make that work you'll need them listed here.
> >
> > Rob
>
> So when properties are only defined inside if-then scope,
> they are labeled as 'additional' as they are not defined inside
> scope of 'properties'. It is mandatory then to mention 'clock' and
> 'clock-names' there if 'additionalProperties: false' .

Yes, which makes additionalProperties a bit fragile and can't be used
if we include a common schema. There's a fix for that coming in
json-schema draft8 called 'unevaluatedProperties'.

> However I had not set it intentionally as there are additional
> properties in some bindings,
> exactly 'iommu' and 'power-domains' are undocumented.
> Is it a good way to put them in 'properties' just to be able to forbid
> additional properties?

Simply put, they should be documented too.

Rob
