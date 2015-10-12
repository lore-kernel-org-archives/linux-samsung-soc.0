From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm: dts: Fix audio card detection on peach boards
Date: Mon, 12 Oct 2015 21:56:49 +0900
Message-ID: <561BAE11.4050801@samsung.com>
References: <1444631169-19468-1-git-send-email-alim.akhtar@samsung.com>
 <561B578E.1050308@samsung.com> <561B7AFF.1080707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:35505 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbbJLM4z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 08:56:55 -0400
In-Reply-To: <561B7AFF.1080707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: k.kozlowski.k@gmail.com, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, devicetree@vger.kernel.org, dianders@chromium.org, stable@vger.kernel.org

W dniu 12.10.2015 o 18:18, Sylwester Nawrocki pisze:
> On 12/10/15 08:47, Krzysztof Kozlowski wrote:
>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> index 8f4d76c..525a93a 100644
>>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> @@ -1056,5 +1056,10 @@
>>>>  	timeout-sec = <32>;
>>>>  };
>>>>  
>>>> +&pmu_system_controller {
>>
>> Please put the node in alphabetical order.
>>
>>>> +	assigned-clocks = <&pmu_system_controller 0>;
>>>> +	assigned-clock-parents =  <&clock CLK_FIN_PLL>;
>>
>> I might be missing something here but isn't the first clock of
>> pmu_system_controller already a CLK_FIN_PLL? So you are reparenting the
>> FIN_PLL to FIN_PLL?
> 
> No, it's not, the first PMU consumer clock is indeed CLK_FIN_PLL,
> but pmu_system_controller is also a clock provider. 

Oh yes, indeed it is. Thanks for pointing me in right direction.

Best regards,
Krzysztof

> The first output
> clock of pmu_system_controller is CLKOUT, it's a composite mux and
> gate clock (registered in drivers/clk/samsung /clk-exynos-clkout.c).
> So  the above dts change is selecting an external oscillator input of
> the CLKOUT mux, i.e. it will route 24 MHz clock signal from the external
> oscillator to the CLKOUT output pin, to which audio CODEC is connected
> on peach-pit AFAICS.
