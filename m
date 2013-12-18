From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RESEND] [PATCH V3] ARM: dts: Add DMA controller node info on
 Exynos5420.
Date: Thu, 19 Dec 2013 02:38:04 +0900
Message-ID: <52B1DD7C.404@samsung.com>
References: <1381137944-30503-1-git-send-email-l.krishna@samsung.com> <086601cedf98$2cb9f310$862dd930$@org> <CAL1wa8d4TebPjfSw1Q3XMzTmUchO=jCbeUbX+STVEq4TG33kzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35857 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754301Ab3LRRiL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 12:38:11 -0500
In-Reply-To: <CAL1wa8d4TebPjfSw1Q3XMzTmUchO=jCbeUbX+STVEq4TG33kzQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Padmavathi Venna <padma.v@samsung.com>, broonie@kernel.org, padma venkat <padma.kvr@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 12/12/13 20:36, Leela Krishna Amudala wrote:
> Hi Kukjin,
>
> Even though you said it is applied, I didn't see this patch in any of
> your trees.
> Can you kindly look into this patch and take necessary action..?
>
Applied, thanks.
Kukjin

> Best Wishes,
> Leela Krishna.
>
> On Tue, Nov 12, 2013 at 8:13 PM, Kukjin Kim<kgene@kernel.org>  wrote:
>> Leela Krishna Amudala wrote:
>>>
>> + dt ml.
>>
>>> From: Padmavathi Venna<padma.v@samsung.com>
>>>
>>> This patch adds dma controller node info on Exynos5420.
>>> Exynos5420 has adma for audio IPs. As adma clk is dependent
>>> on audss clk provider that will be added later.
>>>
>>> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
>>> Signed-off-by: Leela Krishna Amudala<l.krishna@samsung.com>
>>> ---
>>> Change since V2:
>>>        - Removed adma node as adma clock is dependent audss clock provider.
>>>
>>> Changes since V1:
>>>          - In V1, dma node common stuff was added in common exynos5.dtsi
>> file.
>>>            This was removed as per Kukjin comment and added in
>>> exynos5420.dtsi.
>>>
>>>   arch/arm/boot/dts/exynos5420.dtsi |   52
>>> +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 52 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>>> b/arch/arm/boot/dts/exynos5420.dtsi
>>> index d537cd7..15465f8 100644
>>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>>> @@ -186,6 +186,58 @@
>>>                status = "okay";
>>>        };
>>>
>>> +     amba {
>>> +             #address-cells =<1>;
>>> +             #size-cells =<1>;
>>> +             compatible = "arm,amba-bus";
>>> +             interrupt-parent =<&gic>;
>>> +             ranges;
>>> +
>>> +             pdma0: pdma@121A0000 {
>>> +                     compatible = "arm,pl330", "arm,primecell";
>>> +                     reg =<0x121A0000 0x1000>;
>>> +                     interrupts =<0 34 0>;
>>> +                     clocks =<&clock 362>;
>>> +                     clock-names = "apb_pclk";
>>> +                     #dma-cells =<1>;
>>> +                     #dma-channels =<8>;
>>> +                     #dma-requests =<32>;
>>> +             };
>>> +
>>> +             pdma1: pdma@121B0000 {
>>> +                     compatible = "arm,pl330", "arm,primecell";
>>> +                     reg =<0x121B0000 0x1000>;
>>> +                     interrupts =<0 35 0>;
>>> +                     clocks =<&clock 363>;
>>> +                     clock-names = "apb_pclk";
>>> +                     #dma-cells =<1>;
>>> +                     #dma-channels =<8>;
>>> +                     #dma-requests =<32>;
>>> +             };
>>> +
>>> +             mdma0: mdma@10800000 {
>>> +                     compatible = "arm,pl330", "arm,primecell";
>>> +                     reg =<0x10800000 0x1000>;
>>> +                     interrupts =<0 33 0>;
>>> +                     clocks =<&clock 473>;
>>> +                     clock-names = "apb_pclk";
>>> +                     #dma-cells =<1>;
>>> +                     #dma-channels =<8>;
>>> +                     #dma-requests =<1>;
>>> +             };
>>> +
>>> +             mdma1: mdma@11C10000 {
>>> +                     compatible = "arm,pl330", "arm,primecell";
>>> +                     reg =<0x11C10000 0x1000>;
>>> +                     interrupts =<0 124 0>;
>>> +                     clocks =<&clock 442>;
>>> +                     clock-names = "apb_pclk";
>>> +                     #dma-cells =<1>;
>>> +                     #dma-channels =<8>;
>>> +                     #dma-requests =<1>;
>>> +             };
>>> +     };
>>> +
>>>        serial@12C00000 {
>>>                clocks =<&clock 257>,<&clock 128>;
>>>                clock-names = "uart", "clk_uart_baud0";
>>> --
>>> 1.7.10.4
