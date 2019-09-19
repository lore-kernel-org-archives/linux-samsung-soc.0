From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: ddr: Add bindings for Samsung
 LPDDR3 memories
Date: Thu, 19 Sep 2019 08:49:07 +0200
Message-ID: <4a0d1d2c-cd1d-5df4-d4b1-f2dd1ef3bb72@partner.samsung.com>
References: <CGME20190916100719eucas1p206fe95982b774840b5d6e62ba9c42c79@eucas1p2.samsung.com>
        <20190916100704.26692-1-l.luba@partner.samsung.com>
        <20190916100704.26692-4-l.luba@partner.samsung.com>
        <CAJKOXPcxG-mMKy5u-b0+xj_sOmrq5yq5-LYJx0Ds6_+yo_=JbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcxG-mMKy5u-b0+xj_sOmrq5yq5-LYJx0Ds6_+yo_=JbA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 9/18/19 8:51 PM, Krzysztof Kozlowski wrote:
> On Mon, 16 Sep 2019 at 12:07, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> Add compatible for Samsung k3qf2f20db LPDDR3 memory bindings.
>> Introduce minor fixes in the old documentation.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   Documentation/devicetree/bindings/ddr/lpddr3.txt | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
>> index 3b2485b84b3f..49afe794daaa 100644
>> --- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
>> +++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
>> @@ -1,7 +1,9 @@
>>   * LPDDR3 SDRAM memories compliant to JEDEC JESD209-3C
>>
>>   Required properties:
>> -- compatible : Should be  - "jedec,lpddr3"
>> +- compatible : should be one of the following:
>> +       Generic default - "jedec,lpddr3".
> 
> The convention is first compatible, then description. I gave you the
> example to base on - at25. Why making it different?

I have checked at25 that you pointed me to and also checked at24, which
has a bit longer "compatible" section.

I found that there are many "jedec,spi-nor" compatible devices, which I
thought would be a better example for my "jedec,lpddr3".
For example, two configurations, where you have a single labels or dual
(with specific device)
arch/arm/boot/dts/imx6dl-rex-basic.dts:
compatible = "sst,sst25vf016b", "jedec,spi-nor";
arch/arm/boot/dts/imx6q-ba16.dtsi:
compatible = "jedec,spi-nor";

The 'compatible' in documentation for the "jedec,spi-nor" is slightly
different (similar to at24).
Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
It has a long explanation, which is also OK. So I thought that it is
quite flexible what you put in there.

I have also checked Cadance QSPI controller.
Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
The controller might be built-in into different vendor SoC's
and the "compatible" is ready to reflect it in similar fashion but
with a short explanation in this section.

Therefore, what you see in the patch draw heavily on Cadence's qspi,
with a bit of inspiration from jedec,spi-nor usage.

Should I change it to at25 "compatible" style and send next patch?

PS. Thank you for taking the other two patches. I will not respond in
their threads to keep the traffic low.

Regards,
Lukasz
