From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: ddr: Add bindings for Samsung
 LPDDR3 memories
Date: Thu, 19 Sep 2019 09:43:17 +0200
Message-ID: <4e7b0a6d-491f-a764-f038-1aff5534320f@partner.samsung.com>
References: <CGME20190916100719eucas1p206fe95982b774840b5d6e62ba9c42c79@eucas1p2.samsung.com>
        <20190916100704.26692-1-l.luba@partner.samsung.com>
        <20190916100704.26692-4-l.luba@partner.samsung.com>
        <CAJKOXPcxG-mMKy5u-b0+xj_sOmrq5yq5-LYJx0Ds6_+yo_=JbA@mail.gmail.com>
        <4a0d1d2c-cd1d-5df4-d4b1-f2dd1ef3bb72@partner.samsung.com>
        <CAJKOXPfBueaf2UVik8x2L_D_PTxdkvRukuWL3xh_jDiLKtt7pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfBueaf2UVik8x2L_D_PTxdkvRukuWL3xh_jDiLKtt7pQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org



On 9/19/19 9:28 AM, Krzysztof Kozlowski wrote:
> On Thu, 19 Sep 2019 at 08:49, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> Hi Krzysztof,
>>
>> On 9/18/19 8:51 PM, Krzysztof Kozlowski wrote:
>>> On Mon, 16 Sep 2019 at 12:07, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>>>
>>>> Add compatible for Samsung k3qf2f20db LPDDR3 memory bindings.
>>>> Introduce minor fixes in the old documentation.
>>>>
>>>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/ddr/lpddr3.txt | 9 ++++++---
>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
>>>> index 3b2485b84b3f..49afe794daaa 100644
>>>> --- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
>>>> +++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
>>>> @@ -1,7 +1,9 @@
>>>>    * LPDDR3 SDRAM memories compliant to JEDEC JESD209-3C
>>>>
>>>>    Required properties:
>>>> -- compatible : Should be  - "jedec,lpddr3"
>>>> +- compatible : should be one of the following:
>>>> +       Generic default - "jedec,lpddr3".
>>>
>>> The convention is first compatible, then description. I gave you the
>>> example to base on - at25. Why making it different?
>>
>> I have checked at25 that you pointed me to and also checked at24, which
>> has a bit longer "compatible" section.
>>
>> I found that there are many "jedec,spi-nor" compatible devices, which I
>> thought would be a better example for my "jedec,lpddr3".
>> For example, two configurations, where you have a single labels or dual
>> (with specific device)
>> arch/arm/boot/dts/imx6dl-rex-basic.dts:
>> compatible = "sst,sst25vf016b", "jedec,spi-nor";
>> arch/arm/boot/dts/imx6q-ba16.dtsi:
>> compatible = "jedec,spi-nor";
>>
>> The 'compatible' in documentation for the "jedec,spi-nor" is slightly
>> different (similar to at24).
>> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> It has a long explanation, which is also OK. So I thought that it is
>> quite flexible what you put in there.
> 
> It is flexible but I see clear pattern in existing sources:
>    jedec,spi-nor.txt
>    compatible : May include a device-specific ..
>    ...
>    Supported chip names:
>      at25df321a
>      ...
> 
>    at25.txt:
>    - compatible : Should be "<vendor>,<type>", and generic value "atmel,at25".
>      Example "<vendor>,<type>" values:
>        "anvo,anv32e61w"
>        "microchip,25lc040"
> 
> In these cases the doc says that "compatible should be" and then you
> have the list of values. Your example says that the compatible should
> be "Generic default" or "For Samsung 542x SoC"... :) The difference is
> slight but putting the value first is a simple and elegant solution.
> In your case one has to go to the end of sentence to find the most
> important information - the compatible value.
> 
>> I have also checked Cadance QSPI controller.
>> Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>> The controller might be built-in into different vendor SoC's
>> and the "compatible" is ready to reflect it in similar fashion but
>> with a short explanation in this section.
> 
> I see. I do not find this pattern as much readable as jedec-spi-nor or
> at25 therefore I mentioned them as an example to base on ("Exactly the
> same as AT24 or AT25 EEPROM bindings."). We can avoid also this entire
> discussion with YAML (which also follows approach of at25 - value
> first).
> 
>> Therefore, what you see in the patch draw heavily on Cadence's qspi,
>> with a bit of inspiration from jedec,spi-nor usage.
>>
>> Should I change it to at25 "compatible" style and send next patch?
> 
> Yes, please. Or go to YAML and make entire discussion obsolete.

OK I will change it to at25 style.

Regards,
Lukasz
