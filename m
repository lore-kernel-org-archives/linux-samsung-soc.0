From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V3 4/5] ARM: dts: Add #dma-cells for generic dma binding
 support
Date: Fri, 08 Feb 2013 07:12:22 -0600
Message-ID: <5114F9B6.2080800@gmail.com>
References: <1360131529-2847-1-git-send-email-padma.v@samsung.com> <1360131529-2847-5-git-send-email-padma.v@samsung.com> <511275AA.1070006@gmail.com> <CAAgF-BeEyXUCUrPcA87bmkHAjUtW0jE7pT0XE6voG4dav2rgSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:53178 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946441Ab3BHNMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 08:12:24 -0500
Received: by mail-ob0-f179.google.com with SMTP id un3so3824148obb.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Feb 2013 05:12:24 -0800 (PST)
In-Reply-To: <CAAgF-BeEyXUCUrPcA87bmkHAjUtW0jE7pT0XE6voG4dav2rgSg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, arnd@arndb.de, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, vinod.koul@intel.com, thomas.abraham@linaro.org, jon-hunter@ti.com

On 02/07/2013 10:20 PM, Padma Venkat wrote:
> Hi Rob,
> 
> On Wed, Feb 6, 2013 at 8:54 PM, Rob Herring <robherring2@gmail.com> wrote:
>> On 02/06/2013 12:18 AM, Padmavathi Venna wrote:
>>> This patch adds #dma-cells property to PL330 DMA controller
>>> nodes for supporting generic dma dt bindings on samsung
>>> exynos5250 platform.
>>
>> The subject doesn't reflect this is for pl330.
> OK. I will fix this.
>>
>>>
>>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>  .../devicetree/bindings/dma/arm-pl330.txt          |   15 +++++++++++----
>>>  arch/arm/boot/dts/exynos5250.dtsi                  |    4 ++++
>>>  2 files changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/arm-pl330.txt b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>>> index 36e27d5..1fdbff6 100644
>>> --- a/Documentation/devicetree/bindings/dma/arm-pl330.txt
>>> +++ b/Documentation/devicetree/bindings/dma/arm-pl330.txt
>>> @@ -8,6 +8,8 @@ Required properties:
>>>    - reg: physical base address of the controller and length of memory mapped
>>>      region.
>>>    - interrupts: interrupt number to the cpu.
>>> +  - #dma-cells: must be <1>. used to represent the number of integer
>>> +    cells in the dmas property of client device.
>>
>> This should be optional in the case of platforms supporting only memory
>> to memory xfers.
> 
> In Exynos we have support for both peripheral to peripheral and memory
> to memory.
> So I made it as required property. Should I make this as optional?

I believe that is what I said. Highbank has the pl330 and only supports
mem to mem transfers.

Rob

> 
>>
>> Rob
>>
>>>
>>>  Optional properties:
>>>  - dma-coherent      : Present if dma operations are coherent
>>> @@ -18,16 +20,21 @@ Example:
>>>               compatible = "arm,pl330", "arm,primecell";
>>>               reg = <0x12680000 0x1000>;
>>>               interrupts = <99>;
>>> +             #dma-cells = <1>;
>>>       };
>>>
>>>  Client drivers (device nodes requiring dma transfers from dev-to-mem or
>>> -mem-to-dev) should specify the DMA channel numbers using a two-value pair
>>> +mem-to-dev) should specify the DMA channel numbers and dma channel names
>>>  as shown below.
>>>
>>>    [property name]  = <[phandle of the dma controller] [dma request id]>;
>>> +  [property name]  = <[dma channel name]>
>>>
>>>        where 'dma request id' is the dma request number which is connected
>>> -      to the client controller. The 'property name' is recommended to be
>>> -      of the form <name>-dma-channel.
>>> +      to the client controller. The 'property name' 'dmas' and 'dma-names'
>>> +      as required by the generic dma device tree binding helpers. The dma
>>> +      names correspond 1:1 with the dma request ids in the dmas property.
>>>
>>> -  Example:  tx-dma-channel = <&pdma0 12>;
>>> +  Example:  dmas = <&pdma0 12
>>> +                 &pdma1 11>;
>>> +         dma-names = "tx", "rx";
>>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>>> index f50b4e8..724f5bd 100644
>>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>>> @@ -312,24 +312,28 @@
>>>                       compatible = "arm,pl330", "arm,primecell";
>>>                       reg = <0x121A0000 0x1000>;
>>>                       interrupts = <0 34 0>;
>>> +                     #dma-cells = <1>;
>>>               };
>>>
>>>               pdma1: pdma@121B0000 {
>>>                       compatible = "arm,pl330", "arm,primecell";
>>>                       reg = <0x121B0000 0x1000>;
>>>                       interrupts = <0 35 0>;
>>> +                     #dma-cells = <1>;
>>>               };
>>>
>>>               mdma0: mdma@10800000 {
>>>                       compatible = "arm,pl330", "arm,primecell";
>>>                       reg = <0x10800000 0x1000>;
>>>                       interrupts = <0 33 0>;
>>> +                     #dma-cells = <1>;
>>>               };
>>>
>>>               mdma1: mdma@11C10000 {
>>>                       compatible = "arm,pl330", "arm,primecell";
>>>                       reg = <0x11C10000 0x1000>;
>>>                       interrupts = <0 124 0>;
>>> +                     #dma-cells = <1>;
>>>               };
>>>       };
>>>
>>>
>>
> 
> Thanks
> Padma
> 
